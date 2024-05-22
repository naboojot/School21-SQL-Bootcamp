-- SHOW TRANSACTION ISOLATION LEVEL;
-- Session1
BEGIN;
-- Session2
BEGIN;
-- Session1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session2
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
COMMIT;
-- Session1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
COMMIT;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';