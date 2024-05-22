-- SHOW TRANSACTION ISOLATION LEVEL;
-- Session1
BEGIN;
-- Session2
BEGIN;
-- Session1
SELECT SUM(rating)
FROM pizzeria;
-- Session2
UPDATE pizzeria
SET rating = 1
WHERE name = 'Pizza Hut';
COMMIT;
-- Session1
SELECT SUM(rating)
FROM pizzeria;
COMMIT;
SELECT SUM(rating)
FROM pizzeria;
-- Session2
SELECT SUM(rating)
FROM pizzeria;