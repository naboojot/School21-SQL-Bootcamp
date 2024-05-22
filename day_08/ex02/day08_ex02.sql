-- Session1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
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