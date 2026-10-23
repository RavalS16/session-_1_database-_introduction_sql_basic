# 1. Count songs uploaded by each artist (more than 3 songs)
use music_streaming_app;
use mydb1;
use practice;
use foodie_app;
select * from musicplaylist;

SELECT
    artist,
    COUNT(id) AS total_songs
FROM musicplaylist
GROUP BY artist
HAVING COUNT(id) > 3;

# 2. Display each username with their total order amount
SELECT
    u.username,
    SUM(o.amount) AS total_order_amount
FROM users AS u
INNER JOIN orders AS o
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.username;

# 3. Find restaurants rated above the average rating
SELECT
    name,
    rating
FROM restaurants1
WHERE rating > (
    SELECT AVG(rating)
    FROM restaurants1
);

# 4. Calculate each user's running transaction total
SELECT
    user_id,
    transaction_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY user_id
        ORDER BY transaction_date, id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM transactions
ORDER BY user_id, transaction_date, id;

# 5. Two optimizations for a Flipkart product query
 SELECT product_name, category, price
FROM products
WHERE category = 'Electronics'
  AND price BETWEEN 1000 AND 5000;
  
# Optimization 1: Create a composite index
CREATE INDEX idx_category_price
ON products (category, price);