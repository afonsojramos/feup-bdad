.mode columns
.headers on
.nullvalue NULL
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
