.mode columns
.headers on
.nullvalue NULL
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
