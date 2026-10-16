# 1. Create MusicPlaylist table and insert 5 songs
CREATE TABLE MusicPlaylist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    genre VARCHAR(50),
    duration INT
);

CREATE TABLE FoodOrders (
    id INT PRIMARY KEY,
    restaurant VARCHAR(100),
    food_item VARCHAR(100),
    order_date DATE
);

INSERT INTO MusicPlaylist (id, song_name, artist, genre, duration)
VALUES
(1, 'Kesariya', 'Arijit Singh', 'Romantic', 268),
(2, 'Tum Hi Ho', 'Arijit Singh', 'Romantic', 262),
(3, 'Apna Bana Le', 'Arijit Singh', 'Romantic', 261),
(4, 'Ilahi', 'Arijit Singh', 'Travel', 230),
(5, 'Heeriye', 'Jasleen Royal', 'Pop', 194);

INSERT INTO FoodOrders (id, restaurant, food_item, order_date)
VALUES
(1, 'Dominos', 'Pizza', '2026-10-01'),
(2, 'Zomato Kitchen', 'Burger', '2026-10-02'),
(3, 'Dominos', 'Garlic Bread', '2026-10-03'),
(4, 'McDonalds', 'Burger', '2026-10-04'),
(5, 'Pizza Hut', 'Pizza', '2026-10-05');

SELECT * FROM FoodOrders;

SELECT * FROM MusicPlaylist;

# 2. Display only the first 3 songs
SELECT song_name, artist
FROM MusicPlaylist
LIMIT 3;

# 3. Display unique restaurant names
SELECT DISTINCT restaurant
FROM FoodOrders;

# 4. Use column aliases
SELECT food_item AS 'Dish',
       order_date AS 'Date Ordered'
FROM FoodOrders;

# 5. Fix the DISTINCT and LIMIT query
SELECT DISTINCT food_item, restaurant
FROM FoodOrders
LIMIT 2;
