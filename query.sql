-- Listar utilizadores
SELECT username
FROM User;

-- listar series por rating
SELECT name AS Name, rating AS Rating
FROM Show
ORDER BY rating
DESC;

-- Series de animação que dão antes das 8 da manhã
SELECT name
FROM Show
WHERE (Show.usualAirtime < 0800 AND genre LIKE '%animation%');

-- Comentários deixados por user premium
SELECT content
FROM Comment
INNER JOIN PremiumUser
ON Comment.idUser = PremiumUser.idUser;

-- Comentários deixados no mesmo dia em que o episódio foi lançado
SELECT *
FROM Comment
INNER JOIN Episode
ON (Comment.cmtDate = Episode.releaseDate AND Comment.idEpisode = Episode.idEpisode);

-- Países ordenados por numero de utilizadores
SELECT Country.name AS Name, COUNT(User.idCountry) AS NumberOfUsers
FROM Country
INNER JOIN User
ON User.idCountry = Country.idCountry
GROUP BY Country.name
ORDER BY NumberOfUsers
DESC;

-- Utilizadores com mais mensagens enviadas no verão de 2012
SELECT User.username AS user, Count(Message.idUser1) AS NumberOfMessages
FROM User
INNER JOIN Message
ON Message.idUser1 = User.idUser
WHERE strftime('%Y-%m-%d', '2012-06-21') < strftime('%Y-%m-%d', Message.msgDate) AND strftime('%Y-%m-%d', Message.msgDate) < strftime('%Y-%m-%d', '2012-09-22')
GROUP BY User.username
ORDER BY NumberOfMessages
DESC;

-- Numero de personagens interpretadas por cada ator
SELECT Actor.name AS Name, COUNT(Character.idActor)AS NumberOfCharacters
FROM Actor
INNER JOIN Character
ON Actor.idActor = Character.idActor
GROUP BY Actor.name
ORDER BY NumberOfCharacters
DESC;

-- Networks com maior rating
SELECT Show.network AS Name, AVG(rating) AS AverageRating
FROM Show
WHERE Show.network = Show.network
GROUP BY Show.network
ORDER BY AverageRating
DESC;

--Idade média dos utilizadores que seguem Game Of Thrones
SELECT AVG(strftime('%Y-%m-%d', 'now') - strftime('%Y-%m-%d', User.birthday)) AS Age
FROM User
INNER JOIN Watched
ON Watched.idUser = User.idUser
INNER JOIN Episode
ON Episode.idEpisode = Watched.idEpisode
INNER JOIN Season
ON Season.idSeason = Episode.idSeason
INNER JOIN Show
ON Season.idShow = 1;


--Séries recomendadas a quem vê séries de comédia
SELECT Show.name AS Name, Show.rating AS rating
FROM Show
WHERE genre LIKE '%Comedy%'
ORDER BY Show.rating
DESC;

-- Séries vistas pelo User com id 6
SELECT DISTINCT Show.name AS Name, Show.rating AS Rating
FROM Show, User
INNER JOIN Watched
ON Watched.idUser = User.idUser AND User.idUser = 14
INNER JOIN Episode
ON Episode.idEpisode = Watched.idEpisode
INNER JOIN Season
ON Season.idSeason = Episode.idSeason
Where Season.idShow = Show.idShow
ORDER BY Rating
DESC;
