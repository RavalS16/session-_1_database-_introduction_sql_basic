use foodie_app;
use music_streaming_app;
select * from restaurants1;

CREATE TABLE dishes (
    id INT PRIMARY KEY,
    restaurant_id INT,
    dish_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO dishes (id, restaurant_id, dish_name, price)
VALUES
(1, 1, 'Masala Dosa', 120.00),
(2, 1, 'Paneer Thali', 220.00),
(3, 1, 'Idli Sambar', 80.00),
(4, 2, 'Veg Manchurian', 180.00),
(5, 2, 'Hakka Noodles', 160.00),
(6, 3, 'Margherita Pizza', 250.00),
(7, 3, 'Farmhouse Pizza', 350.00);

SELECT * FROM restaurants1;
SELECT * FROM dishes;

# 2. INNER JOIN — Show dishes with restaurant name and city
SELECT
    d.dish_name,
    d.price,
    r.name AS restaurant_name,
    r.city
FROM restaurants1 AS r
INNER JOIN dishes AS d
    ON r.id = d.restaurant_id;
    
# 3. LEFT JOIN — Show all restaurants, even without dishes
SELECT
    r.name AS restaurant_name,
    r.city,
    d.dish_name,
    d.price
FROM restaurants1 AS r
LEFT JOIN dishes AS d
    ON r.id = d.restaurant_id;
    
# 4. RIGHT JOIN — Show all dishes, including dishes without a restaurant
SELECT
    d.dish_name,
    d.price,
    r.name AS restaurant_name,
    r.city
FROM restaurants1 AS r
RIGHT JOIN dishes AS d
    ON r.id = d.restaurant_id;

# 5. Spotify-style playlists and songs
CREATE TABLE playlist_songs (
    id INT PRIMARY KEY,
    playlist_id INT,
    song_name VARCHAR(100)
);

INSERT INTO playlist_songs (id, playlist_id, song_name)
VALUES
(1, 1, 'Song A'),
(2, 1, 'Song B'),
(3, 2, 'Song C');

SELECT
    p.playlist_name,
    ps.song_name
FROM playlist1 AS p
LEFT JOIN playlist_songs AS ps
    ON p.id = ps.playlist_id;