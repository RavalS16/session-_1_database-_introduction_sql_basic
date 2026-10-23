# 1. CTE — Products with a rating above 4.5
use practice;

CREATE TABLE Products_1 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO Products_1 VALUES
(1, 'Laptop', 4.8),
(2, 'Mobile', 4.2),
(3, 'Headphones', 4.7),
(4, 'Smart Watch', 4.5),
(5, 'Keyboard', 4.9);

WITH TopRatedProducts AS (
    SELECT *
    FROM Products_1
    WHERE rating > 4.5
)
SELECT *
FROM TopRatedProducts;

# 2. Subquery vs CTE — Restaurants in Ahmedabad with delivery charges under 50
SELECT *
FROM (
    SELECT *
    FROM Restaurants
    WHERE city = 'Ahmedabad'
) AS AhmedabadRestaurants
WHERE delivery_charge < 50;

# 3. Two CTEs — Top 3 followed users and top 3 liked posts
ALTER TABLE Users
ADD COLUMN followers INT;

DESCRIBE Users;
UPDATE Users
SET followers = CASE
    WHEN id = 1 THEN 1200
    WHEN id = 2 THEN 5000
    WHEN id = 3 THEN 800
    WHEN id = 4 THEN 8000
    WHEN id = 5 THEN 2100
END;

SELECT * FROM Users;

CREATE TABLE Posts (
    id INT PRIMARY KEY,
    post_content VARCHAR(200),
    likes INT
);

INSERT INTO Posts VALUES
(1, 'Travel Photo', 450),
(2, 'Food Photo', 900),
(3, 'Fashion Post', 1200),
(4, 'Dance Reel', 2000),
(5, 'Nature Photo', 750);

WITH TopUsers AS (
    SELECT username AS name, followers AS total
    FROM Users
    ORDER BY followers DESC
    LIMIT 3
),
TopPosts AS (
    SELECT post_content AS name, likes AS total
    FROM Posts
    ORDER BY likes DESC
    LIMIT 3
)
SELECT 'Top Users' AS category, name, total
FROM TopUsers

UNION ALL

SELECT 'Top Posts' AS category, name, total
FROM TopPosts;

# 4. Recursive CTE — Generate dates for the next 7 days
WITH RECURSIVE Next7Days AS (
    SELECT CURDATE() AS booking_date

    UNION ALL

    SELECT DATE_ADD(booking_date, INTERVAL 1 DAY)
    FROM Next7Days
    WHERE booking_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
)
SELECT booking_date
FROM Next7Days;

# 5. Refactor a query using a CTE — Users with more than 1,000 followers
SELECT username, followers
FROM Users
WHERE followers > 1000
ORDER BY followers DESC;

WITH PopularUsers AS (
    SELECT username, followers
    FROM Users
    WHERE followers > 1000
)
SELECT username, followers
FROM PopularUsers
ORDER BY followers DESC;