use mydb1;

# 1. Create the database and Orders table
select * from orders;
select * from orderdetails;

# 2. Count orders placed by each user
SELECT orderNumber, COUNT(*) AS order_count
FROM orders
GROUP BY orderNumber;

# 3. Calculate the average order amount
SELECT AVG(priceEach) AS average_amount
FROM orderdetails;

# 4. Find the highest and lowest order amounts
SELECT
    MAX(priceEach) AS highest_amount,
    MIN(priceEach) AS lowest_amount
FROM orderdetails;

# 5. Calculate total sales, excluding NULL amounts
SELECT SUM(priceEach) AS total_sales
FROM orderdetails
WHERE priceEach IS NOT NULL;