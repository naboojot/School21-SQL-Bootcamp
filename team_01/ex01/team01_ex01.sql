INSERT INTO currency
VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency
VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION fnc_get_currency_in_usd(p_id INT, p_update TIMESTAMP)
    RETURNS DECIMAL AS
$$
SELECT COALESCE((SELECT rate_to_usd
                 FROM currency
                 WHERE updated <= p_update
                   AND id = p_id
                 ORDER BY updated DESC
                 LIMIT 1),
                (SELECT rate_to_usd
                 FROM currency
                 WHERE updated > p_update
                   AND id = p_id
                 ORDER BY updated
                 LIMIT 1));
$$ LANGUAGE SQL;

SELECT DISTINCT COALESCE(u.name, 'not defined')     AS name,
                COALESCE(u.lastname, 'not defined') AS lastname,
                currency.name                       AS currency_name,
                fnc_get_currency_in_usd(currency_id, balance.updated) *
                money                               AS currency_in_usd
FROM balance
         LEFT JOIN "user" AS u ON u.id = balance.user_id
         JOIN currency ON balance.currency_id = currency.id
ORDER BY name DESC, lastname ASC, currency_name ASC;