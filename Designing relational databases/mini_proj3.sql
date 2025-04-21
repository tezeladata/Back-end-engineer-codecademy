SELECT * FROM customers ORDER BY customer_id;
SELECT * FROM customers_log;

-- update triggers
CREATE TRIGGER logs_trigger1
BEFORE UPDATE ON customers
FOR EACH ROW
EXECUTE PROCEDURE log_customers_change();

UPDATE customers SET first_name = 'Hamilton' WHERE last_name = 'Lewis';
UPDATE customers SET email_address = 'example@domain.com' WHERE first_name = 'Hamilton';

-- Checking update triggers
SELECT * FROM customers_log;

CREATE TRIGGER logs_trigger2
AFTER INSERT ON customers
FOR EACH STATEMENT
EXECUTE PROCEDURE log_customers_change();

INSERT INTO customers (first_name,	last_name, email_address,	home_phone,	city,	state_name,	years_old)
VALUES ('Jeffrey','Cook','Jeffrey.Cook@example.com','202-555-0398','Jersey city','New Jersey',66);
INSERT INTO customers (first_name,	last_name, email_address,	home_phone,	city,	state_name,	years_old)
VALUES ('Jeffrey','Cook','Jeffrey.Cook@example.com','202-555-0398','Jersey city','New Jersey',66);
INSERT INTO customers (first_name,	last_name, email_address,	home_phone,	city,	state_name,	years_old)
VALUES ('Jeffrey','Cook','Jeffrey.Cook@example.com','202-555-0398','Jersey city','New Jersey',66);

SELECT * FROM customers ORDER BY customer_id;
SELECT * FROM customers_log; --checking this table to see if insert trigger worked

-- Conditional on trigger
CREATE TRIGGER logs_trigger3
BEFORE UPDATE ON customers
FOR EACH ROW
WHEN (NEW.years_old < 13) EXECUTE PROCEDURE override_with_min_age();

-- Testing new trigger
UPDATE customers SET years_old = 10 WHERE customer_id = 3;
UPDATE customers SET years_old = 20 WHERE customer_id = 1;
SELECT * FROM customers ORDER BY customer_id;
SELECT * FROM customers_log;

-- Testing triggers
UPDATE customers SET years_old = 9, first_name = 'Dennis' WHERE last_name = 'Hall';
SELECT * FROM customers ORDER BY customer_id;
SELECT * FROM customers_log;

-- Remove trigger
DROP TRIGGER logs_trigger3 ON customers;

-- See triggers
SELECT * FROM information_schema.triggers;