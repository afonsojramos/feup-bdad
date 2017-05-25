.mode columns
.header on
.nullvalue NULL

.print ''
.print 'Default Rating'
.print ''

SELECT Show.idShow, Show.name as "Name", Show.usualAirtime as "Usual Airtime", Show.network as "Network", Show.rating as "Rating", Show.genre as "Genre"
FROM Show;

INSERT INTO Show (idShow, name, usualAirtime, network, rating, genre) 
VALUES (21, 'Game of Thrones', '9:00 PM', 'HBO', NULL, 'Drama');

SELECT Show.idShow, Show.name as "Name", Show.usualAirtime as "Usual Airtime", Show.network as "Network", Show.rating as "Rating", Show.genre as "Genre"
FROM Show;