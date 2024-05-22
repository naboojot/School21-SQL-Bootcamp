SELECT name, SUM(count) AS total_count
FROM (SELECT pizzeria.name AS name, COUNT(*) AS count, 'order' AS action_type
      FROM person_order
               JOIN menu ON person_order.menu_id = menu.id
               JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
      GROUP BY pizzeria.name
      UNION
      SELECT pizzeria.name AS name, COUNT(*) AS count, 'visit' AS action_type
      FROM pizzeria
               JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
      GROUP BY pizzeria.name) AS p
GROUP BY name
ORDER BY total_count DESC, name ASC;
