.mode columns
.headers on
.nullvalue NULL
-- Comentários deixados por user premium
SELECT content
FROM Comment
INNER JOIN PremiumUser
ON Comment.idUser = PremiumUser.idUser;
