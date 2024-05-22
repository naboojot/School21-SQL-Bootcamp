WITH female(pizzeria_name) AS (SELECT pizzeria.name AS pizzeria_name
                               FROM person
                                        JOIN person_order ON person.id = person_order.person_id
                                        JOIN menu ON person_order.menu_id = menu.id
                                        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                               WHERE gender = 'female'),
     male(pizzeria_name) AS (SELECT pizzeria.name AS pizzeria_name
                             FROM person
                                      JOIN person_order ON person.id = person_order.person_id
                                      JOIN menu ON person_order.menu_id = menu.id
                                      JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                             WHERE gender = 'male')
SELECT pizzeria_name
FROM ((SELECT pizzeria_name FROM female EXCEPT (SELECT pizzeria_name FROM male))
      UNION
      (SELECT pizzeria_name FROM male EXCEPT (SELECT pizzeria_name FROM female))) AS pr
ORDER BY pizzeria_name;
