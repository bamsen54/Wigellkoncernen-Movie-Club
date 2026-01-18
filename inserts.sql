INSERT INTO medlemmar ( medlem_namn, medlem_epost, medlemsdatum ) VALUES
    ( 'Simon Toivola', 'simon.toivola@mail.com', '2025-09-01' ),
    ( 'Sleven Spielberg', 'sleven.spielberg@hollywood.biz', '1998-07-24' ),
    ( 'Herner Werzog', 'herner.werzog@hollywood.biz', '1972-12-29' ),
    ( 'Soe Zaldaña', 'soe.zaldana@hollywood.biz', '2009-12-18'),
    ( 'Billie Mobby Grey', 'billie.mobby.grey@hollywood.biz', '2016-07-15'),
    ( 'Hom Tardy', 'hom.tardy@hollywood.biz', '2012-07-20'),
    ( 'Kristoffer Nålan', 'kristoffer.nalan@hollywood.biz', '2020-09-3'),
    ( 'David Lynch-Mob', 'david.lynch-mob@hollywood.biz', '2001-10-19' ),
    ( 'Sara N', 'no-reply@ihaveaboyfriend.com', '2026-01-18');


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
    NULL
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

-- 10. Sleven Spielberg hyr Avatar
INSERT INTO utlaning ( film_id, medlem_id, utlaningsdatum, aterlamningsdatum ) VALUES (
    ( SELECT film_id FROM filmer WHERE film_titel = 'Titanic' ),
    ( SELECT medlem_id FROM medlemmar WHERE medlem_namn = 'Sara N' ),
    '2025-07-27',
    NULL
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