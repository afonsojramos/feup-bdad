.mode columns
.headers on
.nullvalue NULL
-- listar series por rating
SELECT name AS Name, rating AS Rating
FROM Show
ORDER BY rating
DESC;
