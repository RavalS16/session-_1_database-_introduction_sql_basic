# 1. Subquery in WHERE — Restaurants with above-average ratings
use foodie_app;
use practice;

select * from restaurants1;

CREATE TABLE Restaurant_Reviews (
    id INT PRIMARY KEY,
    restaurant_id INT,
    rating DECIMAL(2,1)
);

INSERT INTO Restaurant_Reviews VALUES
(1, 1, 4.5),
(2, 1, 4.0),
(3, 2, 3.0),
(4, 2, 3.5),
(5, 3, 5.0),
(6, 4, 4.0);

# Query
# This query finds restaurants whose average rating is higher than the average rating of all restaurants.
SELECT
    r.name,
    r.city,
    AVG(rv.rating) AS average_rating
FROM Restaurants1 r
JOIN Restaurant_Reviews rv
    ON r.id = rv.restaurant_id
GROUP BY r.id, r.name, r.city
HAVING AVG(rv.rating) > (
    SELECT AVG(rating)
    FROM Restaurant_Reviews
);

# 2. Subquery in SELECT — Total orders per user
SELECT
    u.username,
    (
        SELECT COUNT(*)
        FROM Orders o
        WHERE o.user_id = u.id
    ) AS total_orders
FROM Users u;

# 3. IN with subquery — Movies with a 5-star review
CREATE TABLE Movies (
    id INT PRIMARY KEY,
    movie_name VARCHAR(100)
);

CREATE TABLE Reviews (
    id INT PRIMARY KEY,
    movie_id INT,
    rating INT
);

INSERT INTO Movies VALUES
(1, 'Movie A'),
(2, 'Movie B'),
(3, 'Movie C'),
(4, 'Movie D');

INSERT INTO Reviews VALUES
(1, 1, 5),
(2, 1, 4),
(3, 2, 3),
(4, 3, 5),
(5, 4, 2);

SELECT *
FROM Movies
WHERE id IN (
    SELECT movie_id
    FROM Reviews
    WHERE rating = 5
);

# 4. Nested subquery — Sellers who sold products in every category
CREATE TABLE Categories1 (
    id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Sellers (
    id INT PRIMARY KEY,
    seller_name VARCHAR(100)
);

CREATE TABLE Products1 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    seller_id INT
);

INSERT INTO Categories1 VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances');

INSERT INTO Sellers VALUES
(1, 'Tech Store'),
(2, 'Super Seller'),
(3, 'Fashion Hub');

INSERT INTO Products1 VALUES
(101, 'Laptop', 1, 2),
(102, 'T-Shirt', 2, 2),
(103, 'Washing Machine', 3, 2),
(104, 'Mobile', 1, 1),
(105, 'Jeans', 2, 3);

SELECT s.seller_name
FROM Sellers s
WHERE NOT EXISTS (
    SELECT c.id
    FROM Categories1 c
    WHERE NOT EXISTS (
        SELECT p.id
        FROM Products1 p
        WHERE p.seller_id = s.id
          AND p.category_id = c.id
    )
);