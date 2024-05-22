SELECT name,
       CASE
           WHEN name = 'Denis' THEN TRUE
           ELSE FALSE
           END AS check_name
FROM person;