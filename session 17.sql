# 1. Create the Restaurant table and insert 5 sample rows
CREATE DATABASE IF NOT EXISTS zomato_app;
USE zomato_app;

CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    location VARCHAR(100),
    average_rating DECIMAL(3,2)
);

INSERT INTO Restaurant
(id, name, cuisine, location, average_rating)
VALUES
(1, 'La Pinoz Pizza', 'Italian', 'Ahmedabad', 4.3),
(2, 'Dominos Pizza', 'Italian', 'Surat', 4.1),
(3, 'Honest Restaurant', 'Indian', 'Ahmedabad', 4.5),
(4, 'Haldirams', 'Indian', 'Delhi', 4.2),
(5, 'Mainland China', 'Chinese', 'Mumbai', 4.4);

SELECT * FROM Restaurant;

# 2. Count restaurants for each cuisine
SELECT
    cuisine,
    COUNT(*) AS total_restaurants
FROM Restaurant
GROUP BY cuisine
ORDER BY total_restaurants DESC;

# 3. Create the Review table and insert 10 reviews
CREATE TABLE Review (
    id INT PRIMARY KEY,
    restaurant_id INT,
    user_name VARCHAR(100),
    rating DECIMAL(2,1),
    review_date DATE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(id)
);

INSERT INTO Review
(id, restaurant_id, user_name, rating, review_date)
VALUES
(1, 1, 'Rahul', 4.5, '2026-10-01'),
(2, 1, 'Priya', 4.0, '2026-10-02'),
(3, 2, 'Amit', 4.0, '2026-10-03'),
(4, 2, 'Neha', 4.5, '2026-10-04'),
(5, 3, 'Riya', 5.0, '2026-10-05'),
(6, 3, 'Karan', 4.5, '2026-10-06'),
(7, 4, 'Pooja', 4.0, '2026-10-07'),
(8, 4, 'Mehul', 4.5, '2026-10-08'),
(9, 5, 'Anjali', 4.5, '2026-10-09'),
(10, 5, 'Vikas', 5.0, '2026-10-10');

SELECT * FROM Review;

# 4. Display each restaurant's average review rating using JOIN
SELECT
    r.name AS restaurant_name,
    r.cuisine,
    ROUND(AVG(rv.rating), 2) AS avg_review_rating
FROM Restaurant AS r
INNER JOIN Review AS rv
    ON r.id = rv.restaurant_id
GROUP BY r.id, r.name, r.cuisine
ORDER BY avg_review_rating DESC;

# 5. Rank restaurants within each cuisine using RANK()
SELECT
    restaurant_name,
    cuisine,
    avg_review_rating,
    RANK() OVER (
        PARTITION BY cuisine
        ORDER BY avg_review_rating DESC
    ) AS restaurant_rank
FROM (
    SELECT
        r.id,
        r.name AS restaurant_name,
        r.cuisine,
        ROUND(AVG(rv.rating), 2) AS avg_review_rating
    FROM Restaurant AS r
    INNER JOIN Review AS rv
        ON r.id = rv.restaurant_id
    GROUP BY r.id, r.name, r.cuisine
) AS restaurant_summary
ORDER BY cuisine, restaurant_rank; 