WITH LastRateCTE AS (SELECT c.id,
                            c.name,
                            c.rate_to_usd
                     FROM currency c
                              RIGHT JOIN (SELECT name,
                                                 MAX(updated) AS max_updated
                                          FROM currency
                                          GROUP BY 1) l ON c.updated = l.max_updated
                         AND c.name = l.name),
     VolumeCTE AS (SELECT COALESCE(u.name, 'not defined')     AS name,
                          COALESCE(u.lastname, 'not defined') AS lastname,
                          b.type,
                          SUM(money)                          AS volume,
                          COALESCE(l.name, 'not defined')     AS currency_name,
                          COALESCE(l.rate_to_usd, 1)          AS last_rate_to_usd
                   FROM LastRateCTE l
                            RIGHT JOIN balance b ON l.id = b.currency_id
                            LEFT JOIN "user" u ON b.user_id = u.id
                   GROUP by 1,
                            2,
                            3,
                            5,
                            6)
SELECT v.name,
       v.lastname,
       v.type,
       v.volume,
       v.currency_name,
       v.last_rate_to_usd,
       v.volume * v.last_rate_to_usd AS total_volume_in_usd
FROM VolumeCTE v
ORDER BY name DESC,
         lastname,
         type;