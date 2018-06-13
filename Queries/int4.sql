.mode columns
.headers on
.nullvalue NULL
-- Comentários deixados no mesmo dia em que o episódio foi lançado
SELECT *
FROM Comment
INNER JOIN Episode
ON (Comment.cmtDate = Episode.releaseDate AND Comment.idEpisode = Episode.idEpisode);
