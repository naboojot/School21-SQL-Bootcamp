SELECT menu.id AS object_id, pizza_name AS object_name
FROM menu
UNION ALL
SELECT person.id AS object_id, person.name AS object_name
FROM person
ORDER BY object_id, object_name;