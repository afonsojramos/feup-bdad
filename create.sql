.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

drop table if exists Show;
drop table if exists Season;
drop table if exists Episode;
drop table if exists Actor;
drop table if exists Character;
drop table if exists Message;
drop table if exists Comment;
drop table if exists Watched;
drop table if exists User;
drop table if exists FreeUser;
drop table if exists PremiumUser;
drop table if exists Country;

create table Show(
    idShow INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    usualAirtime TIME NOT NULL,
    network TEXT NOT NULL,
    rating REAL CHECK (rating>=0.0 and rating<=5.0),
    genre TEXT NOT NULL
);

create table Season(
    idSeason INTEGER NOT NULL PRIMARY KEY,
    nSeason INTEGER NOT NULL,
    idShow INTEGER NOT NULL REFERENCES Show(idShow)
);

create table Episode(
    idEpisode INTEGER NOT NULL PRIMARY KEY,
    epNumber INTEGER NOT NULL,
    releaseDate DATE NOT NULL,
    idSeason INTEGER NOT NULL REFERENCES Season(idSeason),
    idShow TEXT NOT NULL REFERENCES Show(idShow)
);

create table Actor(
    idActor INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

create table Character(
    idCharacter INTEGER NOT NULL PRIMARY KEY,
    characterName TEXT NOT NULL,
    idActor INTEGER NOT NULL REFERENCES Actor(idActor),
    idShow INTEGER NOT NULL REFERENCES Show(idShow)
);

create table Message(
   idMessage INTEGER NOT NULL PRIMARY KEY,
   content TEXT NOT NULL,
   msgDate DATE NOT NULL,
   idUser1 INTEGER NOT NULL REFERENCES User(idUser), 
   idUser2 INTEGER NOT NULL REFERENCES User(idUser)
);

create table Comment(
   idComment INTEGER NOT NULL PRIMARY KEY,
   content TEXT NOT NULL, 
   cmtDate DATE NOT NULL,
   idUser INTEGER NOT NULL REFERENCES User(idUser), 
   idEpisode INTEGER NOT NULL REFERENCES Episode(idEpisode)
);

create table Watched(
    toWatch INTEGER CHECK (toWatch=1 OR toWatch=0),
    upcoming INTEGER CHECK (upcoming=1 or upcoming=0),
    idEpisode INTEGER NOT NULL REFERENCES Episode(idEpisode),
    idUser INTEGER NOT NULL REFERENCES User(idUser),
    CONSTRAINT Watched_pk PRIMARY KEY (idEpisode,idUser)
);

create table User(
    idUser INTEGER PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    birthday DATE NOT NULL,
    gender varchar(6) CHECK (gender="Male" or gender="Female"),
    userType INTEGER CHECK (userType=0 or userType=1)
);

create table FreeUser(
    idUser INTEGER NOT NULL REFERENCES User(idUser) PRIMARY KEY
);

create table PremiumUser(
    idUser INTEGER NOT NULL REFERENCES User(idUser) PRIMARY KEY,
    subscriptionFee INTEGER CHECK (subscriptionFee=1),
    noAds INTEGER CHECK (noAds=1),
    rewatchEpisodes INTEGER CHECK (rewatchEpisodes=1)
);

create table Country(
    name TEXT PRIMARY KEY 
);