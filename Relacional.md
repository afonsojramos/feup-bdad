### Relational Model

- Show (idShow, name, usualAirtime, network, rating, genre)

{idShow} -> {name, usualAirtime, network, rating, genre}

- Season (idSeason, nSeason, idShow->Show)

{idSeason}-> {nSeason, idShow}

- Episode (idEpisode, epNumber, releaseDate, idSeason->Season)

{idEpisode} -> {epNumber, releaseDate, idSeason}

- Actor (idActor, name)

{idActor} -> {name}

- Character (idCharacter, characterName, idActor->Actor, idShow->Show)

{idCharacter} -> {characterName, idActor, idShow}

- Message (idMessage, content, msgDate, idUser1->User, idUser2->User)

{idMessage} -> {content, msgDate, idUser1, idUser2}

- Comment (idComment, content, cmtDate, idUser->User, idEpisode->Episode)

{idComment} -> {content, cmtDate, idUser, idEpisode}

- Watched (toWatch, upcoming, idEpisode->Episode, idUser->User)

{idEpisode, idUser} -> {toWatch, upcoming}

- User (idUser, username, birthday, gender, subscriptionFee, noAds, rewatchEpisodes)

{idUser} -> {username, birthday, gender, subscriptionFee, noAds, rewatchEpisodes)

- FreeUser (idUser)

- PremiumUser (idUser, subscriptionFee, noAds, rewatchEpisodes)

{idUser} -> {subscriptionFee, noAds, rewatchEpisodes}

- Country (idCountry, name)

{idCountry} -> {name}
