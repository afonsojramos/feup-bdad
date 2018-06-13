.mode columns
.header on
.nullvalue NULL

Create Trigger Default_Rating
AFTER INSERT On Show
FOR EACH ROW
    WHEN (NEW.rating ISNULL)
        BEGIN
            UPDATE Show SET rating = 0.0 WHERE NEW.idShow = Show.idShow;
End;