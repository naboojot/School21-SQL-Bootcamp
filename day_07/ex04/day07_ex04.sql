SELECT name, COUNT(*) AS count_of_visits
FROM person
         JOIN person_visits ON person.id = person_visits.person_id
GROUP BY name
HAVING COUNT(*) > 3;