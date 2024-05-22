CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
(
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
         JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
         JOIN menu ON pizzeria.id = menu.pizzeria_id
         JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Dmitriy'
  AND price < 800
  AND visit_date = '2022-01-08'
ORDER BY pizzeria_name);