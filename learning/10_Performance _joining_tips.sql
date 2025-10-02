-- Tip 8 : Understand the speed of joins & User INNER JOIN when possible

-- Best performance 
-- select c.FirstName, o.OrderID from salesdb.customers c INNER JOIN salesdb.orders o ON c.CustomerID = o.CustomerID;

-- -- Slightly Slower Performance 
-- select c.FirstName, o.OrderID from salesdb.customers c RIGHT JOIN salesdb.orders o ON c.CustomerID = o.CustomerID;
-- select c.FirstName, o.OrderID from salesdb.customers c LEFT JOIN salesdb.orders o ON c.CustomerID = o.CustomerID;

-- -- Worst Performance 
-- select c.FirstName, o.OrderID from salesdb.customers c FULL OUTER JOIN salesdb.orders o ON c.CustomerID = o.CustomerID;

-- Tip 9:Use Explicit Join(ANSI Join) Insted of Implicit Join (non-ANSI Join)
-- Bad Practice
-- select c.FirstName, o.OrderID from salesdb.customers c, salesdb.orders o WHERE c.CustomerID = o.CustomerID;

-- -- Good Practice
-- select c.FirstName, o.OrderID from salesdb.customers c INNER JOIN salesdb.orders o ON c.CustomerID = o.CustomerID;

/* ==============================================================================
   Tip 10: Make sure to Index the columns used in the ON clause
===============================================================================*/

SELECT c.FirstName, o.OrderID
FROM salesdb.Orders AS o
INNER JOIN salesdb.Customers AS c
    ON c.CustomerID = o.CustomerID;

CREATE INDEX IX_Orders_CustomerID ON salesdb.Orders(CustomerID);

/* ==============================================================================
   Tip 11: Filter Before Joining (Big Tables)
===============================================================================*/

-- Best Practice For Small-Medium Tables
-- Filter After Join (WHERE)
SELECT c.FirstName, o.OrderID
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderStatus = 'Delivered';

-- Filter During Join (ON)
SELECT c.FirstName, o.OrderID
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
   AND o.OrderStatus = 'Delivered';

-- Best Practice For Big Tables
-- Filter Before Join (SUBQUERY)
SELECT c.FirstName, o.OrderID
FROM Sales.Customers AS c
INNER JOIN (
    SELECT OrderID, CustomerID
    FROM Sales.Orders
    WHERE OrderStatus = 'Delivered'
) AS o
    ON c.CustomerID = o.CustomerID;
    
/* ==============================================================================
   Tip 12: Aggregate Before Joining (Big Tables)
===============================================================================*/

-- Best Practice For Small-Medium Tables
-- Grouping and Joining
SELECT c.CustomerID, c.FirstName, COUNT(o.OrderID) AS OrderCount
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName;

-- Best Practice For Big Tables
-- Pre-aggregated Subquery
SELECT c.CustomerID, c.FirstName, o.OrderCount
FROM Sales.Customers AS c
INNER JOIN (
    SELECT CustomerID, COUNT(OrderID) AS OrderCount
    FROM Sales.Orders
    GROUP BY CustomerID
) AS o
    ON c.CustomerID = o.CustomerID;

-- Bad Practice
-- Correlated Subquery
SELECT 
    c.CustomerID, 
    c.FirstName,
    (SELECT COUNT(o.OrderID)
     FROM Sales.Orders AS o
     WHERE o.CustomerID = c.CustomerID) AS OrderCount
FROM Sales.Customers AS c;

/* ==============================================================================
   Tip 13: Use Union Instead of OR in Joins
===============================================================================*/

-- Bad Practice
SELECT o.OrderID, c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
    OR c.CustomerID = o.SalesPersonID;   -- Or Operators AVoid index and generate loop

-- Best Practice
SELECT o.OrderID, c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
UNION
SELECT o.OrderID, c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.SalesPersonID;

/* ==============================================================================
   Tip 14: Check for Nested Loops and Use SQL HINTS
===============================================================================*/

SELECT o.OrderID, c.FirstName
FROM Sales.Customers c
INNER JOIN Sales.Orders o 
ON c.CustomerID = o.CustomerID;

-- Good Practice for Having Big Table & Small Table
SELECT o.OrderID, c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
OPTION (HASH JOIN);

-- ################################################################
-- #                           UNION                              #
-- ################################################################

/* ==============================================================================
   Tip 15: Use UNION ALL instead of using UNION | duplicates are acceptable
===============================================================================*/

-- Bad Practice
SELECT CustomerID FROM Sales.Orders
UNION
SELECT CustomerID FROM Sales.OrdersArchive;

-- Best Practice
SELECT CustomerID FROM Sales.Orders
UNION ALL
SELECT CustomerID FROM Sales.OrdersArchive;

/* =======================================================================================
   Tip 16: Use UNION ALL + Distinct instead of using UNION | duplicates are not acceptable
========================================================================================*/

-- Bad Practice
SELECT CustomerID FROM Sales.Orders
UNION
SELECT CustomerID FROM Sales.OrdersArchive ;

-- Best Practice
SELECT DISTINCT CustomerID
FROM (
    SELECT CustomerID FROM Sales.Orders
    UNION ALL
    SELECT CustomerID FROM Sales.OrdersArchive
) AS CombinedData


