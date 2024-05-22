SELECT order_date, CONCAT(person_inf.name, '(age:', person_inf.age, ')') AS information
FROM person_order
         NATURAL JOIN (select id as person_id, name, age from person) as person_inf
ORDER BY order_date, information;