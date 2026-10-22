USE music_streaming_app;

# 1. Create the Playlist table
CREATE TABLE Playlist1 (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    duration INT
);

# 2. Insert 4 songs into the Playlist
INSERT INTO Playlist1 (id, song_name, artist, duration)
VALUES
(1, 'With You', 'AP Dhillon', 210),
(2, 'Excuses', 'AP Dhillon', 176),
(3, 'Kesariya', 'Arijit Singh', 268),
(4, 'Heeriye', 'Arijit Singh', 194);

SELECT * FROM Playlist1;

# 3. Update an artist's name to fix a typo
UPDATE Playlist1
SET artist = 'Arijit Singh'
WHERE artist = 'Arjit Singh';

UPDATE Playlist1
SET artist = 'Arjit Singh'
WHERE id = 3;

UPDATE Playlist1
SET artist = 'Arijit Singh'
WHERE id = 3;

# 4. Delete songs with duration less than 120 seconds
DELETE FROM Playlist1
WHERE duration < 120;

SELECT * FROM Playlist1;

# 5. Add '(Remix)' to AP Dhillon songs longer than 180 seco
UPDATE Playlist1
SET song_name = CONCAT(song_name, ' (Remix)')
WHERE artist = 'AP Dhillon'
AND duration > 180;