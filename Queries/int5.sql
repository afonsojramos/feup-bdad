.mode columns
.headers on
.nullvalue NULL
-- Países ordenados por numero de utilizadores
SELECT Country.name AS Name, COUNT(User.idCountry) AS NumberOfUsers
FROM Country
INNER JOIN User
ON User.idCountry = Country.idCountry
GROUP BY Country.name
ORDER BY NumberOfUsers
DESC;
