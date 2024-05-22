SELECT m1.pizza_name,
       (SELECT name FROM pizzeria WHERE id = m1.pizzeria_id) AS pizzeria_name_1,
       (SELECT name FROM pizzeria WHERE id = m2.pizzeria_id) AS pizzeria_name_2,
       m1.price

FROM menu m1,
     menu m2
WHERE m1.price = m2.price
  AND m1.pizza_name = m2.pizza_name
  AND m1.id > m2.id
ORDER BY pizza_name;