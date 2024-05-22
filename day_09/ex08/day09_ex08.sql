CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
    RETURNS TABLE
            (
                value integer
            )
AS
$$
WITH RECURSIVE F AS (SELECT 0 AS a, 1 AS b
                     UNION ALL
                     SELECT F.b AS a, F.b + F.a AS b
                     FROM F
                     WHERE b < pstop)
SELECT a
FROM F;
$$
    LANGUAGE sql;

SELECT *
FROM fnc_fibonacci(100);
SELECT *
FROM fnc_fibonacci();
