.mode columns
.headers on
.nullvalue NULL
-- Utilizadores com mais mensagens enviadas no verão de 2012
SELECT User.username AS user, Count(Message.idUser1) AS NumberOfMessages
FROM User
INNER JOIN Message
ON Message.idUser1 = User.idUser
WHERE strftime('%Y-%m-%d', '2012-06-21') < strftime('%Y-%m-%d', Message.msgDate) AND strftime('%Y-%m-%d', Message.msgDate) < strftime('%Y-%m-%d', '2012-09-22')
GROUP BY User.username
ORDER BY NumberOfMessages
DESC;
