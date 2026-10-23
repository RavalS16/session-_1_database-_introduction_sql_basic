# 1. Create the Playlists table and insert 8 records
use music_streaming_app;

ALTER TABLE Playlists2
ADD COLUMN total_likes INT;

DESCRIBE Playlists2;

UPDATE Playlists2
SET total_likes = CASE
    WHEN id = 1 THEN 500
    WHEN id = 2 THEN 800
    WHEN id = 3 THEN 300
    WHEN id = 4 THEN 800
    WHEN id = 5 THEN 450
    WHEN id = 6 THEN 600
    WHEN id = 7 THEN 900
    WHEN id = 8 THEN 400
    ELSE 0
END;

select * from playlists2;

# 2. ROW_NUMBER() — Unique row number for each playlist
SELECT
    playlist_name,
    user_id,
    total_likes,
    ROW_NUMBER() OVER (
        ORDER BY total_likes DESC
    ) AS row_num
FROM Playlists2;

# 3. RANK() — Rank all playlists by total likes
SELECT
    playlist_name,
    user_id,
    total_likes,
    RANK() OVER (
        ORDER BY total_likes DESC
    ) AS playlist_rank
FROM Playlists2;

# 4. DENSE_RANK() — Rank playlists within each user
SELECT
    playlist_name,
    user_id,
    total_likes,
    DENSE_RANK() OVER (
        PARTITION BY user_id
        ORDER BY total_likes DESC
    ) AS denserank
FROM Playlists2;

# 5. Top 2 playlists per user
WITH RankedPlaylists AS (
    SELECT
        playlist_name,
        user_id,
        total_likes,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY total_likes DESC, id
        ) AS rn
    FROM Playlists2
)
SELECT
    playlist_name,
    user_id,
    total_likes,
    rn AS playlist_rank
FROM RankedPlaylists
WHERE rn <= 2
ORDER BY user_id, rn;