-- ##########################################################
-- #                     AGGREGATIONS                       #
-- ##########################################################

/* ==============================================================================
   Tip 17: Use Columnstore Index for Aggregations on Large Table
===============================================================================*/

SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Sales.Orders 
GROUP BY CustomerID;

CREATE CLUSTERED COLUMNSTORE INDEX Idx_Orders_Columnstore ON Sales.Orders;

/* ==============================================================================
   Tip 18: Pre-Aggregate Data and store it in new Table for Reporting
===============================================================================*/

SELECT MONTH(OrderDate) OrderYear, SUM(Sales) AS TotalSales
INTO Sales.SalesSummary
FROM Sales.Orders
GROUP BY MONTH(OrderDate);

SELECT OrderYear, TotalSales FROM Sales.SalesSummary;

-- ##############################################################
-- #                       SUBQUERIES, CTE                      #
-- ##############################################################

/* ==============================================================================
   Tip 19: JOIN vs EXISTS vs IN (Avoid using IN)
===============================================================================*/

-- JOIN (Best Practice: If the Performance equals to EXISTS)
SELECT o.OrderID, o.Sales
FROM Sales.Orders AS o
INNER JOIN Sales.Customers AS c
    ON o.CustomerID = c.CustomerID
WHERE c.Country = 'USA';

-- EXISTS (Best Practice: Use it for Large Tables) -- It stops at first match and avoid data duplication 
SELECT o.OrderID, o.Sales
FROM Sales.Orders AS o
WHERE EXISTS (
    SELECT 1
    FROM Sales.Customers AS c
    WHERE c.CustomerID = o.CustomerID
      AND c.Country = 'USA'
);

-- IN (Bad Practice) -- It lacks an early exit mechanism
SELECT o.OrderID, o.Sales
FROM Sales.Orders AS o
WHERE o.CustomerID IN (
    SELECT CustomerID
    FROM Sales.Customers
    WHERE Country = 'USA'
);

/* ==============================================================================
   Tip 20: Avoid Redundant Logic in Your Query
===============================================================================*/

-- Bad Practice
SELECT EmployeeID, FirstName, 'Above Average' AS Status
FROM salesdb.Employees
WHERE Salary > (SELECT AVG(Salary) FROM salesdb.Employees)
UNION ALL
SELECT EmployeeID, FirstName, 'Below Average' AS Status
FROM salesdb.Employees
WHERE Salary < (SELECT AVG(Salary) FROM salesdb.Employees);

-- Good Practice
SELECT 
    EmployeeID, 
    FirstName, 
    CASE 
        WHEN Salary > AVG(Salary) OVER () THEN 'Above Average'
        WHEN Salary < AVG(Salary) OVER () THEN 'Below Average'
        ELSE 'Average'
    END AS Status
FROM salesdb.Employees;

-- ##############################################################
-- #                             DDL                            #
-- ##############################################################
/*
=============================================================================
Tip 21: Avoid VARCHAR Data Type If Possible										Because it consuming lot of resources wharever do. And carchar is better than TEXT. 
=============================================================================	
Tip 22: Avoid Using MAX or Overly Large Lengths									
=============================================================================	
Tip 23: Use NOT NULL If possible 												
=============================================================================	
Tip 24: Make sure all tables have a CLUSTERED PRIMARY KEY						becuase it improves a performance. 
=============================================================================	
Tip 25: Creeate Nonclustered Index on Foreign Key if they are frequently used
=============================================================================
*/
-- Bad Practice 
CREATE TABLE CustomersInfo (
    CustomerID INT,
    FirstName VARCHAR(MAX),		-- We dont need MAX here because name always short name				/-- This must be not null 
    LastName TEXT,				-- varchar is better than text										/-- This must be not null
    Country VARCHAR(255),		-- We dont need big value here because cpuntry always short name	/-- This must be not null
    TotalPurchases FLOAT, 
    Score VARCHAR(255),
    BirthDate VARCHAR(255),		-- Date is better than varchar
    EmployeeID INT,
    CONSTRAINT FK_Bad_Customers_EmployeeID FOREIGN KEY (EmployeeID)
        REFERENCES salesdb.Employees(EmployeeID)
);

-- Good Practice Practice 
CREATE TABLE CustomersInfo (
    CustomerID INT PRIMARY KEY CLUSTERED,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    TotalPurchases FLOAT,
    Score INT,
    BirthDate DATE,
    EmployeeID INT,
    CONSTRAINT FK_CustomersInfo_EmployeeID FOREIGN KEY (EmployeeID)
        REFERENCES salesdb.Employees(EmployeeID)
);
CREATE NONCLUSTERED INDEX IX_CustomersInfo_EmployeeID
ON CustomersInfo(EmployeeID);

-- ##############################################################
-- #                        INDEXING                            #
-- ##############################################################
/*
=================================================================================================================================
Tip 26: Avoid Over Indexing, as it can slow down insert, update, and delete operations												-- CRUD
=================================================================================================================================
Tip 27: Regularly review and drop unused indexes to save space and improve write performance										-- 
=================================================================================================================================
Tip 28: Update table statistics weekly to ensure the query optimizer has the most up-to-date information							-- Weekly Update
=================================================================================================================================
Tip 29: Reorganize and rebuild fragmented indexes weekly to maintain query performance.												-- 
=================================================================================================================================
Tip 30: For large tables (e.g., fact tables), partition the data and then apply a columnstore index for best performance results	--
=================================================================================================================================
*/