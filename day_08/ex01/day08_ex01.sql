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
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session1
UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';
-- Session2
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
-- Session1
COMMIT;
-- Session2
COMMIT;
-- Session1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';