-- CREATE TABLE salesdb.DBCustomers AS
-- SELECT 
-- 	*
-- FROM salesdb.DBCustomers
-- WHERE CustomerId = 1;

-- CREATE INDEX idx_DBCustomers_CustomerID
-- on salesdb.DBCustomers(customerid);

-- DROP INDEX idx_DBCustomers_CustomerID on salesdb.DBCustomers;


-- SELECT 
-- 	*
-- FROM 
-- 	salesdb.DBCustomers
-- WHERE 
-- 	LastName = "Brown";
--     
-- CREATE INDEX idx_lastname
-- ON salesdb.DBCustomers (LastName);

-- CREATE INDEX idx_firstname
-- ON salesdb.DBCustomers (FirstName);

-- CREATE INDEX idx_DBCustomers
-- ON salesdb.DBCustomers (Country, Score);

-- show index from salesdb.DBCustomers;




--  STORAGE
-- Not supported by MySQL

-- Functions
-- select 
-- 	*
-- from salesdb.products;

-- CREATE UNIQUE INDEX idx_Products_Product
-- ON salesdb.products (Product);

-- INSERT INTO salesdb.products (ProductID, Product) values (107, 'Caps');

-- drop index idx_Products_Product on salesdb.products;

-- select 
-- 	*
-- from salesdb.customers
-- WHERE Country = 'Germany';

-- CREATE INDEX idx_Customers_Country
-- ON salesdb.Customers (Country);

-- SELECT *
-- FROM salesdb.Customers
-- WHERE Country = 'Germany';

-- drop index idx_Customers_Country on salesdb.Customers;

-- Monitoring Index Usage
-- SELECT 
-- --     TABLE_NAME,
-- --     INDEX_NAME,
-- --     NON_UNIQUE,
-- --     SEQ_IN_INDEX,
-- --     COLUMN_NAME,
-- --     COLLATION,
-- --     CARDINALITY
-- 	*
-- FROM information_schema.STATISTICS
-- -- WHERE TABLE_SCHEMA = 'salesdb';



-- SELECT 
--     s1.TABLE_SCHEMA,
--     s1.TABLE_NAME,
--     s1.INDEX_NAME AS index1,
--     s2.INDEX_NAME AS index2,
--     GROUP_CONCAT(s1.COLUMN_NAME ORDER BY s1.SEQ_IN_INDEX) AS columns
-- FROM information_schema.STATISTICS s1
-- JOIN information_schema.STATISTICS s2
--   ON s1.TABLE_SCHEMA = s2.TABLE_SCHEMA
--  AND s1.TABLE_NAME = s2.TABLE_NAME
--  AND s1.INDEX_NAME < s2.INDEX_NAME
-- GROUP BY s1.TABLE_SCHEMA, s1.TABLE_NAME, s1.INDEX_NAME, s2.INDEX_NAME
-- HAVING columns = (
--     SELECT GROUP_CONCAT(s2.COLUMN_NAME ORDER BY s2.SEQ_IN_INDEX)
-- );


-- EXPLAIN SELECT * 
-- FROM salesdb.DBCustomers
-- WHERE LastName = 'Brown'; 

-- EXPLAIN ANALYZE SELECT * 
-- FROM salesdb.DBCustomers
-- WHERE LastName = 'Brown';



















