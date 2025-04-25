-- Task 2
ALTER TABLE parts ALTER COLUMN code SET NOT NULL;
ALTER TABLE parts ADD UNIQUE (code);

-- Task 3
UPDATE parts
SET description = 'None Available'
WHERE description = '';

-- Task 4
ALTER TABLE parts ALTER COLUMN description SET NOT NULL;

-- Task 5
-- INSERT INTO parts (id, description, code, manufacturer_id) VALUES (54, NULL, 'v1-009', 9);
-- Error because of constraint

-- Task 6
ALTER TABLE reorder_options ALTER COLUMN price_usd SET NOT NULL;
ALTER TABLE reorder_options ALTER COLUMN quantity SET NOT NULL;

-- Task 7
ALTER TABLE reorder_options ADD CHECK (price_usd > 0 AND quantity > 0);

-- Task 8
ALTER TABLE reorder_options
ADD CHECK (price_usd / quantity > 0.02 AND price_usd / quantity < 25.00);

-- Task 9
ALTER TABLE parts ADD PRIMARY KEY (id);
ALTER TABLE reorder_options ADD FOREIGN KEY (part_id) REFERENCES parts(id);

SELECT * FROM reorder_options LIMIT 10;