.mode columns
.header on
.nullvalue NULL

.print ''
.print 'Default Rating'
.print ''

SELECT * FROM Comment;

INSERT INTO Comment (idComment, content, cmtDate, idUser, idEpisode) VALUES (21, 'Fuck you you fucking twat', '25-05-2017', 2, 3);

SELECT * FROM Comment;