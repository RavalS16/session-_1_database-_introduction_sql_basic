use practice;

ALTER TABLE Orders
ADD COLUMN total_decimal DECIMAL(10,2);

DESCRIBE Orders;

SELECT * FROM Orders;

UPDATE Orders
SET total_decimal = 250.00
WHERE id = 101;

UPDATE Orders
SET total_decimal = 400.00
WHERE id = 102;

UPDATE Orders
SET total_decimal = 300.00
WHERE id = 103;

# 2. LAG() — Previous order amount for each user
SELECT
    user_id,
    id,
    order_date,
    total_decimal,
    LAG(total_decimal) OVER (
        PARTITION BY user_id
        ORDER BY order_date, id
    ) AS previous_order_amount
FROM Orders
ORDER BY user_id, order_date,id;

# 3. LEAD() — Next order amount for each user
SELECT
    user_id,
    id,
    order_date,
    total_decimal,
    LEAD(total_decimal) OVER (
        PARTITION BY user_id
        ORDER BY order_date, id
    ) AS next_order_amount
FROM Orders
ORDER BY user_id, order_date, id;

# 4. Running total — Cumulative order amount per user
SELECT
    user_id,
    id,
    order_date,
    total_decimal,
    SUM(total_decimal) OVER (
        PARTITION BY user_id
        ORDER BY order_date, id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total
FROM Orders
ORDER BY user_id, order_date,id;

# 5. Three-order moving average per user
SELECT
    user_id,
    id,
    order_date,
    total_decimal,
    ROUND(
        SUM(total_decimal) OVER (
            PARTITION BY user_id
            ORDER BY order_date, id
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        )
        /
        COUNT(*) OVER (
            PARTITION BY user_id
            ORDER BY order_date, id
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_avg
FROM Orders
ORDER BY user_id, order_date, id;