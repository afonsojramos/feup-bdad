-- Numero de personagens interpretadas por cada ator
SELECT Actor.name AS Name, COUNT(Character.idActor)AS NumberOfCharacters
FROM Actor
INNER JOIN Character
ON Actor.idActor = Character.idActor
GROUP BY Actor.name
ORDER BY NumberOfCharacters
DESC;
