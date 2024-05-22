CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar DEFAULT 'Dmitriy',
    pprice numeric DEFAULT 500,
    pdate date DEFAULT '2022-01-08'
)
    RETURNS TABLE
            (
                pizzeria_name varchar
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT DISTINCT pizzeria.name AS pizzeria_name
        FROM person_visits
                 JOIN person ON person_visits.person_id = person.id
                 JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                 JOIN menu ON pizzeria.id = menu.pizzeria_id
        WHERE person.name = pperson
          AND menu.price < pprice
          AND visit_date = pdate;
END;
$$
    LANGUAGE plpgsql;
SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
