COMMENT ON TABLE person_discounts IS 'This table stores discount information for each person and pizzeria.';
COMMENT ON COLUMN person_discounts.id IS 'Unique identifier';
COMMENT ON COLUMN person_discounts.person_id IS 'Unique person identifier';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Unique pizzeria identifier';
COMMENT ON COLUMN person_discounts.discount IS 'Percentage value of the applied discount';

