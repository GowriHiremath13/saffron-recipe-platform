

-- 1. USERS
INSERT INTO Users (username, email, password_hash) VALUES
('admin',       'admin@cookdb.com',   'hashed_admin123'),
('priya_cooks', 'priya@gmail.com',    'hashed_pass1'),
('rahul_chef',  'rahul@gmail.com',    'hashed_pass2'),
('ananya_k',    'ananya@gmail.com',   'hashed_pass3'),
('vikram_r',    'vikram@gmail.com',   'hashed_pass4');

-- 2. CATEGORIES
INSERT INTO Categories (name, description) VALUES
('Breakfast',    'Morning meals and quick bites'),
('Lunch',        'Midday meals'),
('Dinner',       'Evening and main course meals'),
('Snacks',       'Light bites and appetizers'),
('Desserts',     'Sweets and desserts'),
('Beverages',    'Drinks and juices');

-- 3. INGREDIENTS
INSERT INTO Ingredients (name, unit) VALUES
('mushroom',        'grams'),
('paneer',          'grams'),
('onion',           'pieces'),
('tomato',          'pieces'),
('garlic',          'cloves'),
('ginger',          'grams'),
('rice',            'grams'),
('wheat flour',     'grams'),
('milk',            'ml'),
('butter',          'grams'),
('oil',             'ml'),
('salt',            'teaspoon'),
('cumin seeds',     'teaspoon'),
('turmeric',        'teaspoon'),
('red chili powder','teaspoon'),
('garam masala',    'teaspoon'),
('coriander powder','teaspoon'),
('spinach',         'grams'),
('potato',          'pieces'),
('chicken',         'grams'),
('egg',             'pieces'),
('yogurt',          'grams'),
('lemon',           'pieces'),
('green chili',     'pieces'),
('coriander leaves','grams'),
('dal (lentils)',   'grams'),
('coconut milk',    'ml'),
('pasta',           'grams'),
('cheese',          'grams'),
('bell pepper',     'pieces');

-- 4. RECIPES
INSERT INTO Recipes (title, instructions, cuisine, cook_time_mins, difficulty, category_id, submitted_by, status) VALUES
(
  'Mushroom Paneer Masala',
  '1. Heat oil in a pan. Add cumin seeds.\n2. Saute onion, garlic, ginger till golden.\n3. Add tomatoes and cook till soft.\n4. Add turmeric, chili powder, coriander powder, garam masala.\n5. Add mushrooms, cook 5 mins.\n6. Add paneer cubes, mix gently.\n7. Simmer 5 mins. Garnish with coriander.',
  'Indian', 30, 'medium', 3, 1, 'approved'
),
(
  'Aloo Paratha',
  '1. Boil and mash potatoes. Mix with spices.\n2. Knead wheat flour into dough.\n3. Stuff potato mix into dough balls.\n4. Roll flat and cook on tawa with butter.',
  'Indian', 40, 'medium', 1, 2, 'approved'
),
(
  'Palak Paneer',
  '1. Blanch spinach, blend smooth.\n2. Fry paneer cubes till golden.\n3. Saute onion, garlic, spices.\n4. Add spinach puree and paneer.\n5. Simmer 10 mins.',
  'Indian', 35, 'medium', 3, 1, 'approved'
),
(
  'Mushroom Fried Rice',
  '1. Cook rice and cool.\n2. Saute garlic, mushrooms, bell pepper in oil.\n3. Add rice, soy sauce, salt, pepper.\n4. Toss well on high heat.',
  'Chinese', 25, 'easy', 2, 3, 'approved'
),
(
  'Masala Omelette',
  '1. Beat eggs with salt, chili, onion, tomato.\n2. Pour into hot oiled pan.\n3. Fold and cook till done.',
  'Indian', 10, 'easy', 1, 4, 'approved'
),
(
  'Dal Tadka',
  '1. Pressure cook lentils with turmeric.\n2. Prepare tadka: heat oil, add cumin, garlic, dried chili.\n3. Add onion, tomato, spices.\n4. Mix into dal. Simmer 5 mins.',
  'Indian', 30, 'easy', 3, 1, 'approved'
),
(
  'Chicken Curry',
  '1. Marinate chicken in yogurt and spices.\n2. Fry onions till golden.\n3. Add ginger-garlic paste, tomatoes.\n4. Add chicken, cook covered 20 mins.\n5. Add garam masala, garnish.',
  'Indian', 50, 'hard', 3, 2, 'approved'
),
(
  'Pasta Arrabiata',
  '1. Boil pasta al dente.\n2. Saute garlic in olive oil.\n3. Add tomatoes, chili flakes, salt.\n4. Mix in pasta. Top with cheese.',
  'Italian', 25, 'easy', 2, 5, 'approved'
),
(
  'Coconut Mushroom Curry',
  '1. Saute onion, garlic, ginger.\n2. Add mushrooms, cook 5 mins.\n3. Add coconut milk and spices.\n4. Simmer 15 mins on low heat.',
  'South Indian', 30, 'easy', 3, 3, 'approved'
),
(
  'Paneer Bhurji',
  '1. Crumble paneer.\n2. Saute onion, tomato, green chili.\n3. Add spices and crumbled paneer.\n4. Mix well, cook 5 mins. Garnish.',
  'Indian', 20, 'easy', 1, 4, 'approved'
);

-- 5. RECIPE_INGREDIENTS
-- Recipe 1: Mushroom Paneer Masala
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(1, 1, 200),   -- mushroom 200g
(1, 2, 150),   -- paneer 150g
(1, 3, 2),     -- onion 2pcs
(1, 4, 2),     -- tomato 2pcs
(1, 5, 4),     -- garlic 4 cloves
(1, 6, 10),    -- ginger 10g
(1, 11, 30),   -- oil 30ml
(1, 13, 1),    -- cumin seeds 1tsp
(1, 14, 0.5),  -- turmeric 0.5tsp
(1, 15, 1),    -- red chili 1tsp
(1, 16, 1),    -- garam masala 1tsp
(1, 17, 1),    -- coriander powder 1tsp
(1, 12, 1),    -- salt 1tsp
(1, 25, 10);   -- coriander leaves 10g

-- Recipe 2: Aloo Paratha
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(2, 19, 3),    -- potato 3pcs
(2, 8, 300),   -- wheat flour 300g
(2, 10, 20),   -- butter 20g
(2, 3, 1),     -- onion 1pc
(2, 24, 2),    -- green chili 2pcs
(2, 12, 1),    -- salt 1tsp
(2, 14, 0.5);  -- turmeric 0.5tsp

-- Recipe 3: Palak Paneer
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(3, 18, 300),  -- spinach 300g
(3, 2, 200),   -- paneer 200g
(3, 3, 1),     -- onion 1pc
(3, 5, 3),     -- garlic 3 cloves
(3, 11, 30),   -- oil 30ml
(3, 14, 0.5),  -- turmeric
(3, 15, 1),    -- red chili 1tsp
(3, 12, 1);    -- salt

-- Recipe 4: Mushroom Fried Rice
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(4, 7, 200),   -- rice 200g
(4, 1, 150),   -- mushroom 150g
(4, 30, 1),    -- bell pepper 1pc
(4, 5, 3),     -- garlic 3 cloves
(4, 11, 20),   -- oil 20ml
(4, 12, 1);    -- salt

-- Recipe 5: Masala Omelette
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(5, 21, 3),    -- egg 3pcs
(5, 3, 1),     -- onion 1pc
(5, 4, 1),     -- tomato 1pc
(5, 24, 1),    -- green chili 1pc
(5, 12, 0.5),  -- salt
(5, 11, 10);   -- oil 10ml

-- Recipe 6: Dal Tadka
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(6, 26, 200),  -- dal 200g
(6, 3, 1),     -- onion 1pc
(6, 4, 2),     -- tomato 2pcs
(6, 5, 4),     -- garlic 4 cloves
(6, 14, 0.5),  -- turmeric
(6, 13, 1),    -- cumin seeds 1tsp
(6, 15, 1),    -- red chili 1tsp
(6, 11, 20),   -- oil 20ml
(6, 12, 1);    -- salt

-- Recipe 7: Chicken Curry
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(7, 20, 500),  -- chicken 500g
(7, 22, 100),  -- yogurt 100g
(7, 3, 2),     -- onion 2pcs
(7, 4, 3),     -- tomato 3pcs
(7, 5, 5),     -- garlic 5 cloves
(7, 6, 20),    -- ginger 20g
(7, 14, 1),    -- turmeric 1tsp
(7, 15, 2),    -- red chili 2tsp
(7, 16, 1),    -- garam masala 1tsp
(7, 11, 40),   -- oil 40ml
(7, 12, 1.5);  -- salt

-- Recipe 8: Pasta Arrabiata
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(8, 28, 200),  -- pasta 200g
(8, 4, 3),     -- tomato 3pcs
(8, 5, 4),     -- garlic 4 cloves
(8, 29, 50),   -- cheese 50g
(8, 11, 20),   -- oil 20ml
(8, 12, 1);    -- salt

-- Recipe 9: Coconut Mushroom Curry
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(9, 1, 250),   -- mushroom 250g
(9, 27, 200),  -- coconut milk 200ml
(9, 3, 1),     -- onion 1pc
(9, 5, 3),     -- garlic 3 cloves
(9, 6, 10),    -- ginger 10g
(9, 14, 0.5),  -- turmeric
(9, 12, 1),    -- salt
(9, 11, 20);   -- oil

-- Recipe 10: Paneer Bhurji
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(10, 2, 200),  -- paneer 200g
(10, 3, 1),    -- onion 1pc
(10, 4, 2),    -- tomato 2pcs
(10, 24, 2),   -- green chili 2pcs
(10, 14, 0.5), -- turmeric
(10, 15, 0.5), -- red chili
(10, 11, 15),  -- oil
(10, 12, 1),   -- salt
(10, 25, 10);  -- coriander leaves

-- 6. NUTRITION
INSERT INTO Nutrition (recipe_id, calories, protein_g, fat_g, carbs_g) VALUES
(1, 320, 18.5, 14.0, 28.0),
(2, 410, 9.0,  16.5, 58.0),
(3, 290, 20.0, 15.0, 18.0),
(4, 350, 8.0,  10.0, 58.0),
(5, 210, 14.0, 14.0,  5.0),
(6, 260, 14.0,  7.0, 38.0),
(7, 480, 35.0, 22.0, 15.0),
(8, 390, 12.0, 11.0, 60.0),
(9, 310, 6.0,  20.0, 22.0),
(10, 280, 17.0, 16.0, 12.0);

-- 7. RATINGS
INSERT INTO Ratings (user_id, recipe_id, score, comment) VALUES
(2, 1, 5, 'Amazing! The mushroom and paneer combo is perfect.'),
(3, 1, 4, 'Really good, I added extra garam masala.'),
(4, 2, 5, 'Best paratha recipe I have tried!'),
(2, 3, 5, 'Classic palak paneer, loved it.'),
(5, 4, 4, 'Simple and tasty fried rice.'),
(3, 6, 5, 'Dal tadka just like the dhaba.'),
(4, 7, 4, 'Rich and flavourful chicken curry.'),
(2, 9, 5, 'Coconut mushroom curry is so unique and delicious!'),
(5, 10, 4, 'Quick paneer bhurji, great for breakfast.');
