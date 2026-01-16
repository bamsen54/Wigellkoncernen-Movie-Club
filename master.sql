
-- create

DROP TABLE IF EXISTS utlaning;
DROP TABLE IF EXISTS recensioner;
DROP TABLE IF EXISTS filmer;
DROP TABLE IF EXISTS medlemmar;
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
    betyg INT CHECK ( betyg >= 1 AND betyg <= 5 ) NOT NULL ,
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

# DESCRIBE utlaning;
# DESCRIBE filmer;
#

-- insert

INSERT INTO medlemmar ( medlem_namn, medlem_epost, medlemsdatum ) VALUES
( 'Simon Toivola', 'simon.toivola@mail.com', '2025-09-01' ),
( 'Sleven Spielberg', 'sleven.spielberg@hollywood.biz', '1998-07-24' ),
( 'Herner Werzog', 'herner.werzog@hollywood.biz', '1972-12-29' ),
( 'Soe Zaldaña', 'soe.zaldana@hollywood.biz', '2009-12-18'),
( 'Billie Mobby Grey', 'billie.mobby.grey@hollywood.biz', '2016-07-15'),
( 'Hom Tardy', 'hom.tardy@hollywood.biz', '2012-07-20'),
( 'Kristoffer Nålan', 'kristoffer.nalan@hollywood.biz', '2020-09-3');


INSERT INTO filmer( film_titel, film_genre, film_slappar ) VALUES
( 'Saving Private Ryan', 'Krig', 1998 ),
( 'Aguirre, the Wrath of God', 'Äventyr', 1972 ),
( 'Avatar', 'Science Fiction', 2009 ),
( 'The Dark Knight Rises', 'Action', 2012 ),
( 'Tenet', 'Science Fiction', 2020 ),
( 'Titanic', 'Drama', 1997 ),
( 'Eyes Without a Face', 'Skräck', 1960 ),
( 'The Wizard of Oz', 'Musikal', 1939 );


-- 1. Simon Toivola hyr Saving Private Ryan
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
        ( SELECT film_id FROM filmer WHERE film_titel = 'Saving Private Ryan' ),
        ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Simon Toivola' ),
        '2015-07-14',
        '2015-07-14'
);

-- 2. Simon Toivola hyr Tenet
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
    ( SELECT film_id FROM filmer WHERE film_titel = 'Tenet' ),
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Simon Toivola' ),
    '2012-11-28',
    '2012-11-28'
);

-- 3. Kristoffer Nålan hyr Saving Private Ryan
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
    ( SELECT film_id FROM filmer WHERE film_titel = 'Saving Private Ryan' ),
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Kristoffer Nålan' ),
    '2025-07-16',
    NULL
);

-- 4. Sleven Spielberg hyr Tenet
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
    ( SELECT film_id FROM filmer WHERE film_titel = 'Tenet' ),
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Sleven Spielberg' ),
    '2025-07-16',
    '2025-07-18'
);

-- 5. Herner Werzog hyr Avatar
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
    ( SELECT film_id FROM filmer WHERE film_titel = 'Avatar' ),
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Herner Werzog' ),
    '2025-07-19',
    '2025-07-19'
);

-- 6. Soe Zaldaña hyr Titanic
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
    ( SELECT film_id FROM filmer WHERE film_titel = 'Titanic' ),
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Soe Zaldaña' ),
    '1997-12-25',
    '1997-12-27'
);

-- 7. Hom Tardy hyr Eyes Without a Face
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
    ( SELECT film_id FROM filmer WHERE film_titel = 'Eyes Without a Face' ),
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Hom Tardy' ),
    '2025-07-21',
    '2025-07-21'
);

-- 8. Billie Mobby Grey hyr The Wizard of Oz
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
    ( SELECT film_id FROM filmer WHERE film_titel = 'The Wizard of Oz' ),
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Billie Mobby Grey' ),
    '2025-07-22',
    '2025-07-22'
);

-- 9. Kristoffer Nålan hyr Aguirre, the Wrath of God
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
    ( SELECT film_id FROM filmer WHERE film_titel = 'Aguirre, the Wrath of God' ),
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Kristoffer Nålan' ),
    '2025-07-26',
    '2025-07-26'
);

-- 10. Sleven Spielberg hyr Avatar
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
    ( SELECT film_id FROM filmer WHERE film_titel = 'Avatar' ),
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Sleven Spielberg' ),
    '2025-07-27',
    '2025-07-28'
);

-- recensioner
-- 1. Simon Toivola om Saving Private Ryan
INSERT INTO recensioner ( medlem_id, film_id, betyg, kommentar ) VALUES (
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Simon Toivola' ),
    ( SELECT film_id FROM filmer WHERE film_titel = 'Saving Private Ryan' ),
    3,
    'Lite väl lång epilog på drygt 2 timmar.'
);

-- 2. Simon Toivola om Tenet
INSERT INTO recensioner ( medlem_id, film_id, betyg, kommentar ) VALUES (
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Simon Toivola' ),
    ( SELECT film_id FROM filmer WHERE film_titel = 'Tenet' ),
    2,
    'Tack Kristoffer Nålan. Biografer i USA har undertexter på grund av Tenet.'
);

-- 3. Kristoffer Nålan om Saving Private Ryan
INSERT INTO recensioner ( medlem_id, film_id, betyg, kommentar ) VALUES (
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Kristoffer Nålan' ),
    ( SELECT film_id FROM filmer WHERE film_titel = 'Saving Private Ryan' ),
    4,
    'Snyggt foto, men jag hade personligen velat ha mer brus i ljudbilden.'
);

-- 4. Sleven Spielberg om Tenet
INSERT INTO recensioner ( medlem_id, film_id, betyg, kommentar ) VALUES (
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Sleven Spielberg' ),
    ( SELECT film_id FROM filmer WHERE film_titel = 'Tenet' ),
    3,
    'Väldigt ambitiöst, men jag förstod inte varför båten åkte baklänges?'
);

-- 5. Herner Werzog om Avatar
INSERT INTO recensioner ( medlem_id, film_id, betyg, kommentar ) VALUES (
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Herner Werzog' ),
    ( SELECT film_id FROM filmer WHERE film_titel = 'Avatar' ),
    1,
    'Pandora är en digital lögn. Det finns inget svett, inget riktigt lidande, bara pixlar.'
);

-- 6. Soe Zaldaña om Titanic
INSERT INTO recensioner ( medlem_id, film_id, betyg, kommentar ) VALUES (
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Soe Zaldaña' ),
    ( SELECT film_id FROM filmer WHERE film_titel = 'Titanic' ),
    5,
    'Episkt! Men jag undrar fortfarande varför Jack inte fick plats på dörren.'
);

-- 7. Hom Tardy om Eyes Without a Face
INSERT INTO recensioner ( medlem_id, film_id, betyg, kommentar ) VALUES (
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Hom Tardy' ),
    ( SELECT film_id FROM filmer WHERE film_titel = 'Eyes Without a Face' ),
    5,
    'Inspirerande maskarbete. Väldigt stämningsfull.'
);

-- 8. Billie Mobby Grey om The Wizard of Oz
INSERT INTO recensioner ( medlem_id, film_id, betyg, kommentar ) VALUES (
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Billie Mobby Grey' ),
    ( SELECT film_id FROM filmer WHERE film_titel = 'The Wizard of Oz' ),
    5,
    'Övergången från sepia till Technicolor är fortfarande filmhistoriens mäktigaste ögonblick. En visuell fest som slår allt modernt CGI!'
);

-- 9. Kristoffer Nålan om Aguirre, the Wrath of God
INSERT INTO recensioner ( medlem_id, film_id, betyg, kommentar ) VALUES (
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Kristoffer Nålan' ),
    ( SELECT film_id FROM filmer WHERE film_titel = 'Aguirre, the Wrath of God' ),
    4,
    'Bra intensitet, men saknar IMAX-formatet.'
);

-- 10. Sleven Spielberg om Avatar
INSERT INTO recensioner ( medlem_id, film_id, betyg, kommentar ) VALUES (
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Sleven Spielberg' ),
    ( SELECT film_id FROM filmer WHERE film_titel = 'Avatar' ),
    4,
    'Tekniskt mästerverk. Jag önskar att jag hade haft dessa verktyg för hajen i Jaws.'
);

-- queries

# Fråga 1 – Lista alla utlåningar
# Visa:
#  filmens titel
#  medlemmens namn
#  utlåningsdatum
#  återlämningsdatum
# Sortera så att de senaste utlåningarna visas först.
SELECT film_titel, medlem_namn, utlaningsdatum, aterlamningsdatum FROM utlaning
JOIN filmer ON utlaning.film_id = filmer.film_id
JOIN medlemmar ON utlaning.medlem_id = medlemmar.medlem_id
ORDER BY utlaningsdatum DESC;

# Fråga 2 – Filmer som inte är återlämnade
# Visa:
#  filmens titel
#  vem som har lånat filmen
#  utlåningsdatum
# Endast filmer som ännu inte är återlämnade ska visas.
SELECT filmer.film_titel, medlemmar.medlem_namn, utlaningsdatum FROM utlaning
JOIN filmer ON utlaning.film_id = filmer.film_id
JOIN medlemmar ON utlaning.medlem_id = medlemmar.medlem_id
WHERE aterlamningsdatum IS NULL;

SELECT filmer.film_titel, COUNT( medlem_id ) AS antal_recensioner, AVG( betyg ) AS snitt_betyg
FROM recensioner
JOIN filmer ON recensioner.film_id = filmer.film_id
GROUP BY filmer.film_titel;

# Fråga 4 – Mest aktiva medlem
# Visa:
#  namn på medlem
#  antal utlåningar
# Den eller de medlemmar som lånat flest filmer ska visas.
SELECT medlemmar.medlem_namn, COUNT(utlaning.medlem_id) AS antal_hyrningar FROM utlaning
JOIN medlemmar ON utlaning.medlem_id = medlemmar.medlem_id
GROUP BY utlaning.medlem_id
HAVING antal_hyrningar >= ALL (
    SELECT COUNT(utlaning.medlem_id)
    FROM utlaning
    GROUP BY medlem_id
);

# Fråga 5 – GROUP BY + HAVING
# Visa:
#  genre
#  antal filmer
# Endast genrer som har minst två filmer ska visas.
SELECT  film_genre, COUNT( film_id ) AS antal_i_genren FROM filmer
GROUP BY film_genre
HAVING antal_i_genren >= 2;

