--Se um episódio ainda não foi lançado, o utilizador não o pode marcar como visto

create TRIGGER markAsWatched
  AFTER INSERT ON Episode
  FOR EACH ROW
  WHEN (NEW.releaseDate < strftime('%Y-%m-%d'))
  BEGIN
    	SELECT raise(rollback,	'This episode has not aired yet. You cannot mark it as watched');
  END;
