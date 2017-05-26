.mode columns
.header on
.nullvalue NULL

--Se um episódio ainda não foi lançado, o utilizador não o pode marcar como visto
Create Trigger markAsWatched
  BEFORE INSERT On Watched
  FOR EACH ROW
  WHEN (NEW.toWatch = 1 and ((SELECT releaseDate FROM episode WHERE New.idEpisode = Episode.idEpisode) > date('now')))
  BEGIN
    	SELECT raise(rollback,	'This episode has not aired yet. You cannot mark it as watched');
  END;
