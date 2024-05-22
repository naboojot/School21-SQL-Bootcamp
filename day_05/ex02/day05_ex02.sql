CREATE INDEX IF NOT EXISTS idx_person_name ON person (UPPER(name));
EXPLAIN ANALYSE
SELECT *
FROM person
WHERE UPPER(name) = 'KATE';