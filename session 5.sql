USE foodie_app;

# 1. Create the Restaurants table
CREATE TABLE restaurants1 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    city VARCHAR(50)
);

# 2. Insert 5 sample records
INSERT INTO restaurants1 (id, name, cuisine, rating, city)
VALUES
(1, 'Swagat', 'South Indian', 4.5, 'Ahmedabad'),
(2, 'Dragon House', 'Chinese', 4.2, 'Surat'),
(3, 'Pizza Palace', 'Italian', 3.8, 'Ahmedabad'),
(4, 'Swadisht', 'Gujarati', 4.6, 'Surat'),
(5, 'Spice Garden', 'Chinese', 3.4, 'Vadodara');


SELECT * FROM restaurants1;

# 3. Rating greater than 4.0 in Ahmedabad or Surat
SELECT *
FROM restaurants1
WHERE rating > 4.0
AND city IN ('Ahmedabad', 'Surat');

# 4. Find restaurant names starting with 'Swa'
SELECT *
FROM restaurants1
WHERE name LIKE 'Swa%';

# 5. Rating between 3.5 and 4.5 (inclusive)
SELECT *
FROM restaurants1
WHERE rating BETWEEN 3.5 AND 4.5;

# 6. Find restaurants serving Chinese, Italian, or South Indian cuisine
SELECT *
FROM restaurants1
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');