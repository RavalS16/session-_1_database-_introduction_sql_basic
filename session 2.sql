# 2. Create the foodie_app database
CREATE DATABASE foodie_app;

USE foodie_app;

SELECT DATABASE();

# 3. Create the restaurants table
CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);

INSERT INTO restaurants
(id, name, cuisine, rating, location)
VALUES
(1, 'Dominos', 'Italian', 4.2, 'Ahmedabad'),
(2, 'Honest', 'Indian', 4.5, 'Surat'),
(3, 'Pizza Hut', 'Italian', 4.1, 'Mumbai');

SELECT * FROM restaurants;

# 4. Create the users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20) UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users
(user_id, username, email, phone_number)
VALUES
(1, 'Amit', 'amit@example.com', '+919876543210'),
(2, 'Priya', 'priya@example.com', '+919876543211');

SELECT * FROM users;

# 5. Intentionally create and fix a SQL error
CREATE TABLE test_restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50)
);

DESCRIBE test_restaurants;