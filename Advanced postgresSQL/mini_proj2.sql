SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM books LIMIT 10;

-- Examine indexes
SELECT * FROM pg_Indexes WHERE tablename = 'customers';
SELECT * FROM pg_Indexes WHERE tablename = 'orders';
SELECT * FROM pg_Indexes WHERE tablename = 'books';

-- Examine looking speed
EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions FROM books WHERE original_language = 'French';

-- Get size of table
SELECT pg_size_pretty (pg_total_relation_size('books'));

-- Creating an index
CREATE INDEX original_language_title_sales_in_millions_idx ON books (original_language, title, sales_in_millions);

-- Examine looking speed
EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions FROM books WHERE original_language = 'French';

-- Deleting index
DROP INDEX IF EXISTS original_language_title_sales_in_millions_idx;

-- Bulk insert
SELECT NOW();

\COPY orders FROM 'orders_add.txt' DELIMITER ',' CSV HEADER;

SELECT NOW();
