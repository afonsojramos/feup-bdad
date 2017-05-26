-- Listar utilizadores
Select username
From User;

-- listar series por rating
Select name
From Show
order by rating
ASC;

-- Series de animação que dão antes das 8 da manhã
Select name
From Show
where (airtime < 0800 AND genre like '%animation%');

-- Comentários deixados por user premium
Select content
From Comment
INNER JOIN PremiumUser
ON Comment.idUser = PremiumUser.idUser;

-- Comentários deixados no mesmo dia em que o episódio foi lançado
Select *
From Comment
INNER JOIN Episode
ON (Comment.cmtDate = Episode.releaseDate AND Comment.idEpisode = Episode.idEpisode);

-- Países ordenados por numero de utilizadores
Select Country.name AS Name, COUNT(User.idCountry) AS NumberOfUsers
From Country
INNER JOIN User
ON User.idCountry = Country.idCountry
GROUP BY Country.name
ORDER BY NumberOfUsers
DESC;

-- Utilizadores com mais mensagens enviadas no verão de 2012
Select User.username AS user, Count(Message.idUser1) AS NumberOfMessages
FROM User
INNER JOIN Message
ON Message.idUser1 = User.idUser
Where strftime('%Y-%m-%d', '2012-06-21') < strftime('%Y-%m-%d', Message.msgDate) AND strftime('%Y-%m-%d', Message.msgDate) < strftime('%Y-%m-%d', '2012-09-22')
GROUP BY User.username
ORDER BY NumberOfMessages
DESC;

-- Atores que interpretam mais que uma personagem
Select Actor.name AS Name, COUNT(Character.idActor) AS NumberOfCharacters
From Actor
INNER JOIN Character
ON Actor.idActor = Character.idActor
Where NumberOfCharacters > 1
GROUP BY Actor.name
ORDER BY NumberOfCharacters
DESC;

-- Networks com maior rating
Select Show.network AS Name, AVG(rating) AS AverageRating
From Show
Where Show.network = Show.network
GROUP BY Show.network
ORDER BY AverageRating
DESC;

--Idade média dos utilizadores que seguem Game Of Thrones
Select AVG(strftime('%Y-%m-%d', 'now') - strftime('%Y-%m-%d', User.birthday)) AS Age
From User
INNER JOIN Watched
ON Watched.idUser = User.idUser
INNER JOIN Episode
ON Episode.idEpisode = Watched.idEpisode
INNER JOIN Season
ON Season.idSeason = Episode.idSeason
INNER JOIN Show
ON Season.idShow = 1;
