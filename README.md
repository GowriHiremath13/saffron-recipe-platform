# 🌿 Saffron — Community Recipe Database & Search Platform

> A full-stack web application built as a DBMS mini project, demonstrating real-world database design concepts including normalization, complex joins, aggregate functions, and REST APIs.

---

## 📌 Project Overview

**Saffron** is a community-driven recipe platform where users can search recipes by ingredients, discover what they can cook with what they already have, submit their own recipes, bookmark favourites, and translate instructions into 16 languages.

Built with **MySQL 8.0**, **Node.js + Express**, and a pure **HTML/CSS/JS** frontend — no frontend framework, just clean vanilla code.

---

## ✨ Features

| Feature | Description |
|---|---|
| 🔍 Ingredient Search | Search recipes by one or more ingredients using multi-table JOINs |
| 🧩 Missing Ingredient Finder | Find recipes missing exactly 1, 2, or 3 ingredients using `HAVING` clause |
| 📅 Today's Recipes | Dashboard showing recipes added today via `CURDATE()` |
| 🔥 Trending Searches | Tracked in `SearchLog` table using `ON DUPLICATE KEY UPDATE` |
| ⭐ Ratings & Reviews | Star rating system with average calculated using `AVG()` |
| 👤 User Auth | Register/login via email or phone, session persisted in localStorage |
| 🔖 Bookmarks | Save favourite recipes, stored in dedicated `Bookmarks` table |
| ⏱ Recipe Timer | In-modal cook timer that auto-detects time steps in instructions |
| 🌐 Translation | Translate recipe instructions into 16 languages via MyMemory API |
| 📊 Admin Dashboard | Live stats using `COUNT`, `AVG`, `GROUP BY` across all tables |
| 👤 User Profile | Shows submitted recipes, ratings received, last sign-in time |
| ➕ Add Recipe | Community recipe submission with ingredients and nutrition info |

---

## 🗄️ Database Design

### Tables (8 — fully normalized to 3NF)

```
Users           → user_id, username, email, phone, password_hash
Categories      → category_id, name
Recipes         → recipe_id, title, cuisine, difficulty, image_url, ...
Ingredients     → ingredient_id, name, unit
Recipe_Ingredients → (junction) recipe_id, ingredient_id, quantity
Nutrition       → recipe_id, calories, protein_g, fat_g, carbs_g
Ratings         → rating_id, user_id, recipe_id, score, comment
SearchLog       → search_term, search_count, last_searched
Bookmarks       → bookmark_id, user_id, recipe_id
```

### Relationships

```
Users ──< Recipes          (One to Many)
Users ──< Ratings          (One to Many)
Users ──< Bookmarks        (One to Many)
Categories ──< Recipes     (One to Many)
Recipes ──< Recipe_Ingredients >── Ingredients  (Many to Many)
Recipes ──── Nutrition     (One to One)
Recipes ──< Ratings        (One to Many)
Recipes ──< Bookmarks      (One to Many)
```

### Key DBMS Concepts Used

- **DDL** — `CREATE TABLE`, `ALTER TABLE`, `CREATE INDEX`
- **DML** — `INSERT`, `SELECT`, `UPDATE`, `DELETE`
- **Joins** — `INNER JOIN`, `LEFT JOIN` across 4–5 tables
- **Aggregates** — `COUNT`, `AVG`, `SUM`, `ROUND`, `GROUP_CONCAT`
- **Clauses** — `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`
- **Constraints** — `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`, `NOT NULL`
- **Cascade** — `ON DELETE CASCADE`, `ON DELETE SET NULL`
- **Subqueries** — correlated and non-correlated
- **Date functions** — `CURDATE()`, `DATE()`, `TIMESTAMP`
- **ENUM** — for difficulty (`easy`, `medium`, `hard`) and status

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Database | MySQL 8.0 |
| Backend | Node.js + Express.js |
| Frontend | HTML5, CSS3, Vanilla JavaScript |
| API Style | REST — 15 endpoints |
| Images | MealDB API + Unsplash fallback |
| Translation | MyMemory Translation API (free) |

---

## 🚀 Getting Started

### Prerequisites
- Node.js v18+
- MySQL 8.0
- Git

### Installation

```bash
# 1. Clone the repo
git clone https://github.com/YOUR_USERNAME/saffron-recipe-platform.git
cd saffron-recipe-platform

# 2. Install dependencies
npm install

# 3. Set up MySQL database
mysql -u root -p
CREATE DATABASE recipe;
USE recipe;
SOURCE seed_data.sql;
SOURCE bulk_recipes.sql;

# 4. Update DB credentials in server.js
# Change host, user, password to match your MySQL setup

# 5. Start the server
node server.js

# 6. Open in browser
# Open index.html directly in your browser
# OR serve it with VS Code Live Server
```

---

## 📡 API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/recipes` | All recipes with optional filters |
| GET | `/api/recipes/:id` | Single recipe with full details |
| POST | `/api/recipes` | Submit a new recipe |
| GET | `/api/search?ingredients=` | Search by ingredients |
| GET | `/api/almost?ingredients=` | Missing ingredient finder |
| GET | `/api/today` | Today's / this week's recipes |
| GET | `/api/trending` | Trending search terms |
| GET | `/api/top` | Top rated recipes |
| GET | `/api/admin/stats` | Admin dashboard stats |
| POST | `/api/recipes/:id/rate` | Rate a recipe |
| GET | `/api/categories` | All categories |
| GET | `/api/ingredients` | Ingredients autocomplete |
| POST | `/api/users/register` | Register new user |
| POST | `/api/users/login` | Login |
| GET | `/api/users/:id/profile` | User profile + recipes |
| POST | `/api/bookmarks` | Bookmark a recipe |
| DELETE | `/api/bookmarks` | Remove bookmark |
| GET | `/api/bookmarks/:user_id` | Get user's bookmarks |

---

## 📸 Screenshots

> Add screenshots of your app here after pushing!

```
Home Page → Explore → Recipe Modal → Profile → Dashboard
```

---

## 👩‍💻 Developed By

**Gowri** — DBMS Mini Project  
Database Management Systems — 2025–26

---

## 📄 License

This project is for educational purposes only.