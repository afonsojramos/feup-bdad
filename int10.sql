.mode columns
.headers on
.nullvalue NULL
--Séries recomendadas a quem vê séries de comédia
SELECT Show.name AS Name, Show.rating AS rating
FROM Show
WHERE genre LIKE '%Comedy%'
ORDER BY Show.rating
DESC;
