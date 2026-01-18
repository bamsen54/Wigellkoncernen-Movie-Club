DROP DATABASE IF EXISTS wigell_movie_club;

CREATE DATABASE IF NOT EXISTS wigell_movie_club;

USE wigell_movie_club;

CREATE TABLE IF NOT EXISTS medlemmar (
    medlem_id INT PRIMARY KEY AUTO_INCREMENT,
    medlem_namn VARCHAR( 64 ) NOT NULL UNIQUE,
    medlem_epost VARCHAR( 64 ) NOT NULL UNIQUE,
    medlemsdatum DATE
);

CREATE TABLE IF NOT EXISTS filmer (
    film_id INT PRIMARY KEY AUTO_INCREMENT,
    film_titel VARCHAR( 64 ) NOT NULL UNIQUE,
    film_genre VARCHAR( 64 ),
    film_slappar INT
);

CREATE TABLE IF NOT EXISTS recensioner (
    film_id INT,
    medlem_id INT,
    betyg TINYINT CHECK ( betyg >= 1 AND betyg <= 5 ) NOT NULL ,
    kommentar VARCHAR( 280 ),
    PRIMARY KEY ( film_id, medlem_id ), -- varje medlem kan bara skriva en recension för varje film
    FOREIGN KEY ( film_id )   REFERENCES filmer( film_id ),
    FOREIGN KEY ( medlem_id ) REFERENCES medlemmar( medlem_id )
);

CREATE TABLE  IF NOT EXISTS utlaning (
    utlaning_id INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT,
    medlem_id INT,
    FOREIGN KEY ( film_id ) REFERENCES filmer( film_id ),
    FOREIGN KEY ( medlem_id) REFERENCES  medlemmar( medlem_id ),
    utlaningsdatum DATE NOT NULL,
    aterlamningsdatum DATE,
    CHECK ( utlaningsdatum <= aterlamningsdatum )
);