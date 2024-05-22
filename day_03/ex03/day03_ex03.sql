WITH female(pizzeria_name) AS (SELECT pizzeria.name AS pizzeria_name
                               FROM person
                                        JOIN person_visits ON person.id = person_visits.person_id
                                        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                               WHERE gender = 'female'),
     male(pizzeria_name) AS (SELECT pizzeria.name AS pizzeria_name
                             FROM person
                                      JOIN person_visits ON person.id = person_visits.person_id
                                      JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                             WHERE gender = 'male')
    (SELECT pizzeria_name FROM female EXCEPT ALL SELECT pizzeria_name FROM male)
UNION ALL
(SELECT pizzeria_name FROM male EXCEPT ALL SELECT pizzeria_name FROM female)
ORDER BY pizzeria_name;