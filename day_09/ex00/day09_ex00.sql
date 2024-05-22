CREATE TABLE person_audit
(
    created    timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event char(1)                  DEFAULT 'I' CHECK (type_event IN ('I', 'U', 'D')),
    row_id     bigint                                             NOT NULL,
    name       varchar                                            NOT NULL,
    age        integer                                            NOT NULL DEFAULT 10,
    gender     varchar                  DEFAULT 'female'          NOT NULL,
    address    varchar
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
    RETURNS TRIGGER AS
$trg_person_insert_audit$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (DEFAULT, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;

END;
$trg_person_insert_audit$
    LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

