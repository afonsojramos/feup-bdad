.mode columns
.header on
.nullvalue NULL

.print ''
.print 'Mark As Watched'
.print ''

--Adiciona valores à classe Episode
SELECT Episode.idEpisode, Episode.epNumber as "Episode Number", Episode.releaseDate as "Release Date", Episode.idSeason
FROM Episode;

INSERT INTO Episode (idEpisode, epNumber, releaseDate, idSeason)
VALUES (21, 7, '2017-05-30', 10);

SELECT Episode.idEpisode, Episode.epNumber as "Episode Number", Episode.releaseDate as "Release Date", Episode.idSeason
FROM Episode;

--Adiciona valores à classe Watched
SELECT Watched.toWatch as "To Watch", Watched.upcoming as "Upcoming", Watched.idEpisode, Watched.idUser
FROM Watched;

INSERT INTO Watched (toWatch, upcoming, idEpisode, idUser)
VALUES (1, 0, 21, 12);
