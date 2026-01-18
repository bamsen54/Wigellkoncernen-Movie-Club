-- Fråga 1 – Lista alla utlåningar
-- Visa:
--  filmens titel
--  medlemmens namn
--  utlåningsdatum
--  återlämningsdatum
-- Sortera så att de senaste utlåningarna visas först.
SELECT film_titel AS 'filmtitel',
    medlem_namn AS 'namn',
    utlaningsdatum AS 'utlåningsdatum',
    aterlamningsdatum AS 'återlämningsdatum'
FROM utlaning
         JOIN filmer ON utlaning.film_id = filmer.film_id
         JOIN medlemmar ON utlaning.medlem_id = medlemmar.medlem_id
ORDER BY utlaningsdatum DESC;

-- Fråga 2 – Filmer som inte är återlämnade
-- Visa:
--  filmens titel
--  vem som har lånat filmen
--  utlåningsdatum
-- Endast filmer som ännu inte är återlämnade ska visas.
SELECT filmer.film_titel AS 'titel',
    medlemmar.medlem_namn AS 'namn',
    utlaningsdatum AS 'utlåningsdatum'
FROM utlaning
         JOIN filmer ON utlaning.film_id = filmer.film_id
         JOIN medlemmar ON utlaning.medlem_id = medlemmar.medlem_id
WHERE aterlamningsdatum IS NULL;

-- Fråga 3 – Snittbetyg per film
-- Visa:
--  filmens titel
--  antal recensioner
--  snittbetyg
-- Endast filmer som har minst en recension ska visas.
-- Sortera efter högst snittbetyg först.
SELECT filmer.film_titel AS 'titel',
    COUNT( medlem_id ) AS 'antal recensioner',
    AVG( betyg ) AS 'snittbetyg'
FROM recensioner
         JOIN filmer ON recensioner.film_id = filmer.film_id
GROUP BY filmer.film_titel
ORDER BY snittbetyg DESC;

-- Fråga 4 – Mest aktiva medlem
-- Visa:
--  namn på medlem
--  antal utlåningar
SELECT medlemmar.medlem_namn AS 'namn',
    COUNT(utlaning.medlem_id) AS 'antal hyrningar'  FROM utlaning
                                                             JOIN medlemmar ON utlaning.medlem_id = medlemmar.medlem_id
GROUP BY utlaning.medlem_id
HAVING `antal hyrningar` >= ALL (
    SELECT COUNT(utlaning.medlem_id)
    FROM utlaning
    GROUP BY medlem_id
);

-- Fråga 5 – GROUP BY + HAVING
-- Visa:
--  genre
--  antal filmer
-- Endast genrer som har minst två filmer ska visas.
SELECT  film_genre AS 'genre',
    COUNT( film_id ) AS 'filmer i genren'
FROM filmer
GROUP BY film_genre
HAVING `filmer i genren` >= 2;
