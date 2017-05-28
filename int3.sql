-- Comentários deixados por user premium
SELECT content
FROM Comment
INNER JOIN PremiumUser
ON Comment.idUser = PremiumUser.idUser;
