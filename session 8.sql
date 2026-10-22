use mydb1;

# 1. Create the database and table
CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY,
    user_id INT,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2)
);

INSERT INTO Orders1 (order_id, user_id, payment_method, amount)
VALUES
(1, 101, 'UPI', 250.00),
(2, 102, 'Card', 450.00),
(3, 101, 'Wallet', 350.00),
(4, 103, 'COD', 200.00),
(5, 102, 'UPI', 500.00),
(6, 104, 'Card', 600.00),
(7, 103, 'Wallet', 400.00),
(8, 101, 'UPI', 300.00);

SELECT * FROM Orders;

# 2. Count orders by payment method
SELECT payment_method,
       COUNT(*) AS order_count
FROM Orders1
GROUP BY payment_method;

# 3. Calculate total spending by each user
SELECT user_id,
       SUM(amount) AS total_spend
FROM Orders1
GROUP BY user_id;

# 4. Payment methods with average order amount greater than 300
SELECT payment_method,
       AVG(amount) AS average_amount
FROM Orders1
GROUP BY payment_method
HAVING AVG(amount) > 300;

# Example A: Using WHERE
SELECT *
FROM Orders1
WHERE amount > 300;

# Example B: Using HAVING
SELECT payment_method,
       AVG(amount) AS average_amount
FROM Orders1
GROUP BY payment_method
HAVING AVG(amount) > 300;