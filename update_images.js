const mysql = require('mysql2/promise');
const https = require('https');

const UNSPLASH_KEY = 'your_access_key_here'; // paste your Unsplash key

const db = mysql.createPool({
  host: 'localhost',
  user: 'Gowri',
  password: 'Gowri',
  database: 'recipe'
});

function getMealDBImage(title) {
  return new Promise((resolve) => {
    // Clean special characters before searching
    const cleaned = title.replace(/[^\x00-\x7F]/g, '').replace(/[–—]/g, '').trim();
    const q = encodeURIComponent(cleaned);
    https.get({
      hostname: 'www.themealdb.com',
      path: `/api/json/v1/1/search.php?s=${q}`,
    }, res => {
      let data = '';
      res.on('data', c => data += c);
      res.on('end', () => {
        try { resolve(JSON.parse(data).meals?.[0]?.strMealThumb || null); }
        catch { resolve(null); }
      });
    }).on('error', () => resolve(null));
  });
}

function getUnsplashImage(title) {
  return new Promise((resolve) => {
    const q = encodeURIComponent(title + ' food dish');
    https.get({
      hostname: 'api.unsplash.com',
      path: `/search/photos?query=${q}&per_page=1&orientation=landscape`,
      headers: { Authorization: `Client-ID ${UNSPLASH_KEY}` }
    }, res => {
      let data = '';
      res.on('data', c => data += c);
      res.on('end', () => {
        try { resolve(JSON.parse(data).results?.[0]?.urls?.regular || null); }
        catch { resolve(null); }
      });
    }).on('error', () => resolve(null));
  });
}

async function updateMissingImages() {
  const [recipes] = await db.query(
    `SELECT recipe_id, title FROM Recipes WHERE image_url IS NULL OR image_url = '' ORDER BY recipe_id`
  );

  console.log(`Found ${recipes.length} recipes without images...\n`);
  let success = 0, failed = 0;

  for (const r of recipes) {
    // Try MealDB first, fall back to Unsplash
    let url = await getMealDBImage(r.title);
    let source = 'MealDB';

    if (!url) {
      url = await getUnsplashImage(r.title);
      source = 'Unsplash';
    }

    if (url) {
      await db.query(`UPDATE Recipes SET image_url = ? WHERE recipe_id = ?`, [url, r.recipe_id]);
      console.log(`✓ [${r.recipe_id}] ${r.title} (${source})`);
      success++;
    } else {
      console.log(`✗ [${r.recipe_id}] ${r.title} — not found anywhere`);
      failed++;
    }

    await new Promise(res => setTimeout(res, 300));
  }

  console.log(`\nDone! ✓ ${success} updated  ✗ ${failed} not found`);
  process.exit(0);
}

updateMissingImages().catch(console.error);