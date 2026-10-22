# 1. Display all products sorted by price (lowest to highest)
use mydb1;
use foodie_app;

CREATE TABLE movies (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    release_year INT,
    rating DECIMAL(3,1)
);

CREATE TABLE songs (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    play_count INT,
    added_date DATE
);

INSERT INTO songs (id, title, play_count, added_date)
VALUES
(1, 'Song A', 1000, '2026-10-10'),
(2, 'Song B', 1500, '2026-10-15'),
(3, 'Song C', 1500, '2026-10-20'),
(4, 'Song D', 1200, '2026-10-18'),
(5, 'Song E', 900, '2026-10-21');

INSERT INTO movies (id, title, release_year, rating)
VALUES
(1, 'Movie A', 2023, 8.5),
(2, 'Movie B', 2025, 7.8),
(3, 'Movie C', 2025, 9.1),
(4, 'Movie D', 2022, 8.9),
(5, 'Movie E', 2024, 8.2),
(6, 'Movie F', 2023, 9.0);

select * from products;

# 1. Display all products sorted by price (lowest to highest)
SELECT *
FROM products
ORDER BY buyPrice ASC;

# 2. Display the top 5 most expensive products
select productName,buyPrice from products order by buyPrice desc limit 5;

# 3. Sort movies by release year and rating
SELECT title, release_year, rating
FROM movies
ORDER BY release_year DESC, rating DESC;

# 4. Display the first 10 restaurants alphabetically
SELECT *
FROM restaurants1
ORDER BY name ASC
LIMIT 10;

# 5. Display the top 3 trending songs
SELECT *
FROM songs
ORDER BY play_count DESC, added_date DESC
LIMIT 3;

