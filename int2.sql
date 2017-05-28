.mode columns
.headers on
.nullvalue NULL
-- Series de animação que dão antes das 8 da manhã
SELECT name
FROM Show
WHERE (Show.usualAirtime < 0800 AND genre LIKE '%animation%');
