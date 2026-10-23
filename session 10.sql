# 1. FULL JOIN — Influencers and Collaborations
use mydb1;
use music_streaming_app;
create database practice;
use practice;
use foodie_app;

CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Collaborations (
    id INT PRIMARY KEY,
    influencer1_id INT,
    influencer2_id INT,
    collab_date DATE
);

INSERT INTO Influencers VALUES
(1, 'Aarav'),
(2, 'Priya'),
(3, 'Rahul'),
(4, 'Neha'),
(5, 'Karan');

INSERT INTO Collaborations VALUES
(1, 1, 2, '2026-01-10'),
(2, 2, 3, '2026-02-15'),
(3, 1, 4, '2026-03-20');


SELECT
    i1.name AS influencer1,
    i2.name AS influencer2,
    c.collab_date
FROM Influencers i1
LEFT JOIN Collaborations c
    ON i1.id = c.influencer1_id
LEFT JOIN Influencers i2
    ON c.influencer2_id = i2.id

UNION

SELECT
    i1.name AS influencer1,
    i2.name AS influencer2,
    c.collab_date
FROM Influencers i1
RIGHT JOIN Collaborations c
    ON i1.id = c.influencer1_id
LEFT JOIN Influencers i2
    ON c.influencer2_id = i2.id;
    
# 2. SELF JOIN — Playlists
CREATE TABLE Playlists2 (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);

INSERT INTO Playlists2 VALUES
(1, 101, 'My Music', NULL),
(2, 101, 'Bollywood Songs', 1),
(3, 101, 'Romantic Songs', 2),
(4, 102, 'Workout Music', NULL),
(5, 102, 'Gym Songs', 4);

SELECT
    p.playlist_name AS playlist,
    parent.playlist_name AS parent_playlist
FROM Playlists2 p
LEFT JOIN Playlists2 parent
    ON p.parent_playlist_id = parent.id;
    
# 3. Multiple JOINs — Users, Orders, and Payments
CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE
);

CREATE TABLE Payments (
    id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO Users VALUES
(1, 'Amit'),
(2, 'Priya'),
(3, 'Rahul'),
(4, 'Neha');

INSERT INTO Orders VALUES
(101, 1, '2026-01-10'),
(102, 1, '2026-02-15'),
(103, 2, '2026-03-20');

INSERT INTO Payments VALUES
(1, 101, 1500.00),
(2, 102, 2500.00);

SELECT
    u.username,
    o.order_date,
    p.amount AS payment_amount
FROM Users u
LEFT JOIN Orders o
    ON u.id = o.user_id
LEFT JOIN Payments p
    ON o.id = p.order_id;
    
# 4. Remove duplicate restaurants using DISTINCT
select * from restaurants1;

CREATE TABLE Reviews (
    id INT PRIMARY KEY,
    restaurant_id INT,
    rating DECIMAL(2,1)
);

INSERT INTO Reviews VALUES
(1, 1, 4.5),
(2, 1, 4.0),
(3, 2, 3.5),
(4, 2, 4.5);

SELECT DISTINCT
    r.id,
    r.name,
    r.city
FROM restaurants1 r
INNER JOIN Reviews rev
    ON r.id = rev.restaurant_id;
    
# 5. Products and Categories — Two JOIN queries
CREATE TABLE Categories (
    id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT
);

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances');

INSERT INTO Products VALUES
(101, 'Laptop', 1),
(102, 'Mobile', 1),
(103, 'T-Shirt', 2),
(104, 'Washing Machine', 3);

SELECT
    p.product_name,
    c.category_name
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.id;
    
SELECT
    p.product_name,
    c.category_name
FROM Products p
INNER JOIN Categories c
    ON p.category_id = c.id
WHERE c.category_name = 'Electronics';