SELECT address,
       ROUND((MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))), 2) AS formula,
       ROUND(AVG(age), 2)                                                      AS average,
       (CASE
            WHEN (ROUND((MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))), 2) > ROUND(AVG(age), 2))
                THEN TRUE
            ELSE FALSE
           END)                                                                AS comparison
FROM person
GROUP BY address
ORDER BY address;
