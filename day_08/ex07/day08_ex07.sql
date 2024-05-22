-- Session1
BEGIN;
-- Session2
BEGIN;
-- Session1
UPDATE pizzeria
SET rating = 4.5
WHERE id = 1;
-- Session2
UPDATE pizzeria
SET rating = 4
WHERE id = 2;
-- Session1
UPDATE pizzeria
SET rating = 3.5
WHERE id = 2;
-- Session2
UPDATE pizzeria
SET rating = 2.5
WHERE id = 1;
-- Session1
COMMIT;
-- Session2
COMMIT;
