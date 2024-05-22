SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu
         LEFT JOIN person_order ON menu.id = person_order.menu_id
         LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE menu_id IS NULL
ORDER BY pizza_name, price;