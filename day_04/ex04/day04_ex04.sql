CREATE VIEW v_r AS
SELECT person_id FROM person_visits WHERE visit_date = '2022-01-02'
CREATE VIEW v_s AS
SELECT person_id FROM person_visits WHERE visit_date = '2022-01-06'

CREATE VIEW v_symmetric_union AS
SELECT * FROM v_r
UNION
SELECT * FROM v_s
ORDER BY person_id;