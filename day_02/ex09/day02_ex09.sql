SELECT person.name
FROM person_order
         JOIN person ON person_order.person_id = person.id
         JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'female'
GROUP BY person.name
HAVING SUM(CASE WHEN menu.pizza_name = 'pepperoni pizza' THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN menu.pizza_name = 'cheese pizza' THEN 1 ELSE 0 END) > 0
ORDER BY name;