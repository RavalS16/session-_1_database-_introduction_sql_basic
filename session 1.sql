CREATE DATABASE music_streaming_app;

USE music_streaming_app;

CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    name VARCHAR(100),
    created_by VARCHAR(100)
);

INSERT INTO playlists (playlist_id, name, created_by)
VALUES
(1, 'Bollywood Hits', 'Amit'),
(2, 'Chill Vibes', 'Priya'),
(3, 'Workout Mix', 'Rahul');

SELECT * FROM playlists;

SELECT *
FROM playlists
WHERE created_by = 'Amit';


/* Difference Between a Table, a Row, and a Column in SQL

Consider a food delivery application like Zomato that stores information about customer orders in a database.

**1. Table:** A table is a collection of related data organized into rows and columns. For example, an `orders` table stores information about customer orders, including order ID, customer name, and food item.

**2. Row:** A row is a single record in a table. For example, one row might contain Order ID 101, Customer Name Amit, and Food Item Pizza. It represents one particular order.

**3. Column:** A column represents a specific type of information stored in a table. For example, `order_id`, `customer_name`, and `food_item` are columns in the `orders` table.

**Example:**

| order_id | customer_name | food_item |
|---:|---|---|
| 101 | Amit | Pizza |
| 102 | Priya | Burger |
| 103 | Rahul | Pasta |

In this example:
- **Table:** The entire `orders` table.
- **Row:** The first record (101, Amit, Pizza).
- **Column:** The `customer_name` column, which contains Amit, Priya, and Rahul.

**Conclusion:** A table stores related data, a row represents one complete record, and a column represents one particular attribute of that data.
*/