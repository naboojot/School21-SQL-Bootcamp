SELECT COALESCE(person.name, '-')   AS person_name,
       person_visits.visit_date     AS visit_date,
       COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS person_visits
         FULL JOIN person ON person.id = person_visits.person_id
         FULL JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
ORDER BY person_name, person_visits.visit_date, pizzeria_name;