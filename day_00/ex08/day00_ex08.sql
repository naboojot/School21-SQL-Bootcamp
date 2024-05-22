SELECT *
FROM person_order
WHERE person_id % 2 = 0
ORDER BY person_id;