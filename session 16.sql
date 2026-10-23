CREATE DATABASE food_delivery;
USE food_delivery;

CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    customer_name VARCHAR(100),
    order_amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO FoodOrders
(order_id, restaurant_name, customer_name, order_amount, order_date)
VALUES
(1, 'Pizza Hut', 'Rahul', 450.00, '2026-10-01'),
(2, 'Domino''s', 'Priya', 650.00, '2026-10-02'),
(3, 'Pizza Hut', 'Rahul', 300.00, '2026-10-03'),
(4, 'Subway', 'Amit', 250.00, '2026-10-04'),
(5, 'Domino''s', 'Priya', 400.00, '2026-10-05'),
(6, 'Subway', 'Rahul', 350.00, '2026-10-06'),
(7, 'Pizza Hut', 'Neha', 550.00, '2026-10-07');

SELECT * FROM FoodOrders;

# 2. Create the TopSongs table and insert 5 records
CREATE TABLE TopSongs (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(150),
    artist VARCHAR(100),
    streams BIGINT,
    release_date DATE
);

INSERT INTO TopSongs
(song_id, song_title, artist, streams, release_date)
VALUES
(1, 'Blinding Lights', 'The Weeknd', 4500000000, '2019-11-29'),
(2, 'Shape of You', 'Ed Sheeran', 4000000000, '2017-01-06'),
(3, 'Starboy', 'The Weeknd', 3500000000, '2016-09-22'),
(4, 'As It Was', 'Harry Styles', 3000000000, '2022-04-01'),
(5, 'One Dance', 'Drake', 2800000000, '2016-04-05');

SELECT * FROM TopSongs;

# 3. Find the top 3 customers by total spending
SELECT
    customer_name,
    SUM(order_amount) AS total_spent
FROM FoodOrders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;

# 4. Generate a restaurant performance report
SELECT
    restaurant_name,
    COUNT(order_id) AS number_of_orders,
    SUM(order_amount) AS total_order_amount
FROM FoodOrders
GROUP BY restaurant_name
ORDER BY total_order_amount DESC;

# 5. Calculate two KPIs for a dashboard
/* The required KPIs are:
1. Average order amount.
2. Number of unique customers.*/

SELECT
    'Average Order Amount' AS kpi_name,
    ROUND(AVG(order_amount), 2) AS kpi_value
FROM FoodOrders

UNION ALL

SELECT
    'Unique Customers' AS kpi_name,
    COUNT(DISTINCT customer_name) AS kpi_value
FROM FoodOrders;