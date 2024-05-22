SELECT id
FROM menu
WHERE NOT EXISTS(SELECT 1
                 FROM person_order
                 WHERE person_order.menu_id = menu.id)
ORDER BY id;