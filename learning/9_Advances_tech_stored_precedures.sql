-- STEP:1 - write a query for US customers find the total number of customers and the average Score 

-- select
-- 	count(*) TotalCustomers,
--     round(AVG(Score) ,2)AvgScore
-- from
-- 	salesdb.customers
-- where 
-- 	country = 'USA';
--     
-- Step:2 - Turning the query Into a Stored Procedure
-- USE salesdb;

-- DELIMITER //

-- CREATE PROCEDURE GetCustomerSummary()
-- BEGIN
--     SELECT
--         COUNT(*) AS TotalCustomers,
--         ROUND(AVG(Score), 2) AS AvgScore
--     FROM customers
--     WHERE country = 'USA';
-- END //

-- DELIMITER ;

-- Step 3 Execute the stored procedure and store and update the store procedure
-- USE salesdb;

-- DROP PROCEDURE IF EXISTS GetCustomerSummaryGermany;

-- DELIMITER //

-- CREATE PROCEDURE GetCustomerSummaryGermany(IN p_country VARCHAR(50))
-- BEGIN
--     SELECT
--         COUNT(*) AS TotalCustomers,
--         ROUND(AVG(Score), 2) AS AvgScore
--     FROM customers
--     WHERE country = p_country COLLATE utf8mb4_0900_ai_ci;
-- END //

-- DELIMITER ;

-- call GetCustomerSummaryGermany('USA');

-- call GetCustomerSummaryGermany('Germany');
-- DROP PROCEDURE GetCustomerSummarybyCountry;





-- USE salesdb;

-- DROP PROCEDURE IF EXISTS GetCustomerSummaryByCountry;

-- DELIMITER //

-- CREATE PROCEDURE GetCustomerSummaryByCountry(IN p_country VARCHAR(50))
-- BEGIN
--     -- Handle default value
--     IF p_country IS NULL OR p_country = '' THEN
--         SET p_country = 'USA';
--     END IF;

--     SELECT
--         COUNT(*) AS TotalCustomers,
--         ROUND(AVG(Score), 2) AS AvgScore
--     FROM customers
--     WHERE country = p_country COLLATE utf8mb4_0900_ai_ci;
-- END //

-- DELIMITER ;
-- CALL GetCustomerSummaryByCountry(NULL);

-- call GetCustomerSummaryByCountry('Germany');


-- USE salesdb;

-- DROP PROCEDURE IF EXISTS GetCustomerSummaryByCountry;

-- DELIMITER //

-- CREATE PROCEDURE GetCustomerSummaryByCountry(IN p_country VARCHAR(50))
-- BEGIN
--     -- Handle default value
--     IF p_country IS NULL OR p_country = '' THEN
--         SET p_country = 'USA';
--     END IF;

--     SELECT
--         COUNT(*) AS TotalCustomers,
--         ROUND(AVG(Score), 2) AS AvgScore
--     FROM customers
--     WHERE country = p_country COLLATE utf8mb4_0900_ai_ci;
--     
-- 	select 
-- 		count(OrderID) TotalOrders,
--         SUM(Sales) TotalSales
-- 	from salesdb.orders o
--     join salesdb.customers c
--     on c.customerid = o.customerid
--     where c.country = p_country COLLATE utf8mb4_0900_ai_ci;
-- END //

-- DELIMITER ;

-- CALL GetCustomerSummaryByCountry(NULL);

-- call GetCustomerSummaryByCountry('Germany');


USE salesdb;

DROP PROCEDURE IF EXISTS GetCustomerSummaryByCountry;

DELIMITER //

CREATE PROCEDURE GetCustomerSummaryByCountry(IN p_country VARCHAR(50))
BEGIN
    -- Declare variables first
    DECLARE TotalCustomers INT DEFAULT 0;
    DECLARE AvgScore FLOAT DEFAULT 0;

    -- Handle default value
    IF p_country IS NULL OR p_country = '' THEN
        SET p_country = 'USA';
    END IF;

    -- Prepare & Cleanup Data
    IF EXISTS (
			SELECT 1 
			FROM salesdb.customers 
            WHERE score IS NULL AND country = p_country COLLATE utf8mb4_0900_ai_ci) THEN
        SELECT 'Updating NULL Scores to 0' AS Msg;
        UPDATE salesdb.customers
        SET Score = 0
        WHERE score IS NULL AND country = p_country COLLATE utf8mb4_0900_ai_ci;
    ELSE
        SELECT 'No NULL Scores found' AS Msg;
    END IF;

    -- Assign values to variables
    SELECT COUNT(*), ROUND(AVG(Score), 2)
    INTO TotalCustomers, AvgScore
    FROM salesdb.customers
    WHERE country = p_country COLLATE utf8mb4_0900_ai_ci;

    -- Print message
    SELECT CONCAT('Total Customers from ', p_country, ': ', TotalCustomers, ', Avg Score: ', AvgScore) AS Message;

    -- Optional: Orders summary
    SELECT 
        COUNT(o.OrderID) AS TotalOrders,
        SUM(o.Sales) AS TotalSales
    FROM salesdb.orders o
    JOIN salesdb.customers c 
        ON c.customerid = o.customerid
    WHERE c.country = p_country COLLATE utf8mb4_0900_ai_ci;
END //

DELIMITER ;


CALL GetCustomerSummaryByCountry(NULL);

call GetCustomerSummaryByCountry('Germany');















