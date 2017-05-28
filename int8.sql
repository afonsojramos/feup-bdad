.mode columns
.headers on
.nullvalue NULL
-- Networks com maior rating
SELECT Show.network AS Name, AVG(rating) AS AverageRating
FROM Show
WHERE Show.network = Show.network
GROUP BY Show.network
ORDER BY AverageRating
DESC;
