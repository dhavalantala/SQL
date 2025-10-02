-- Step1: Find the total sales per Customer
-- WITH CTE_Total_Sales AS
-- (
-- SELECT	
-- 	CustomerID,
--     sum(Sales) AS TotalSales
-- FROM
-- 	salesdb.orders
-- GROUP BY 
-- 	CustomerID
-- )
-- Step 2: Find the last orderdate for each customers
-- , CTE_Last_Order AS
-- (
-- select 
-- 	CustomerID,
-- 	max(OrderDate) as Last_Order
-- from 
-- 	salesdb.orders
-- group by 
-- 	CustomerID
-- )
-- Step 3: Find the first orderdate for each customers
-- , CTE_First_Order AS
-- (
-- select 
-- 	CustomerID,
-- 	min(OrderDate) as First_Order
-- from 
-- 	salesdb.orders
-- group by 
-- 	CustomerID
-- )
-- Step 4 Rank Customer based on total sales per customer
-- , CTE_Customer_Rank AS 
-- (
-- SELECT
-- 	CustomerID,
--     TotalSales,
-- 	RANK() over(order by TotalSales asc) as CustomerRank 
-- from CTE_Total_Sales
-- )
-- Step 5: Segment Customers based on their total sales (Nested CTE)
-- , CTE_Customer_Segments AS
-- (
-- SELECT 
-- 	CustomerID,
--     CASE WHEN TotalSales > 100 THEN 'High'
-- 		 WHEN TotalSales > 50 THEN 'Medium'
-- 		 ELSE 'Low'
-- 	END CustomerSegements
-- FROM 
-- 	CTE_Total_Sales
-- )
-- Main Query
-- SELECT	
-- 	c.CustomerID,
--     c.FirstName,
--     c.LastName,
--     cts.TotalSales,
--     cfo.First_Order,
--     clo.Last_Order,
--     ccr.CustomerRank,
--     ccs.CustomerSegements
-- FROM
-- 	salesdb.customers as c
-- LEFT JOIN CTE_Total_Sales cts
-- on c.customerid = cts.CustomerID
-- LEFT JOIN CTE_Last_Order clo
-- on c.customerid = clo.CustomerID
-- LEFT JOIN CTE_First_Order cfo
-- on c.customerid = cfo.CustomerID
-- LEFT JOIN CTE_Customer_Rank ccr
-- on c.customerid = ccr.CustomerID
-- LEFT JOIN CTE_Customer_Segments ccs
-- on c.customerid = ccs.CustomerID


--  Generate a Sequence of numbers from 1 to 20.
-- WITH RECURSIVE Series  AS (
-- -- Anchot Query
-- 	select 
-- 	1 AS MyNumber
--     UNION ALL
--     -- Recursive Query
--     SELECT 
-- 		MyNumber + 1 
-- 	From Series
--     Where MyNumber < 5
-- )
-- -- Main Query
-- Select 	*
-- from Series;

-- WITH RECURSIVE factorial (n, fact) AS (
--   -- Anchor (start with 1! = 1)
--   SELECT 1 AS n, 1 AS fact
--   UNION ALL
--   -- Recursive step
--   SELECT n + 1, fact * (n + 1)
--   FROM factorial
--   WHERE n < 10   -- change this number to compute up to N!
-- )
-- SELECT *
-- FROM factorial;

--  Task: Show the employee hierarchy by displaying each employee's level within the Organizaation.
with recursive CTE_Emp_Hierarchy AS (
	-- Anchor Query
	select 
		employeeid,
		firstname,
		managerid,
		1 as Level
	from 
		salesdb.employees
	where ManagerID IS NULL
	UNION ALL
	-- Recursive Query
	Select 
		e.employeeid,
		e.firstname,
		e.managerid,
		ceh.Level + 1
	from 
		salesdb.employees as e
	INNER JOIN CTE_Emp_Hierarchy ceh
	on e.managerid = ceh.employeeid
)
select 
	*
from 
	CTE_Emp_Hierarchy;
    
WITH RECURSIVE CTE_Emp_Hierarchy AS (
    -- Anchor: top-level employees (no manager)
    SELECT 
        employeeid,
        firstname,
        managerid,
        1 AS Level
    FROM salesdb.employees
    WHERE managerid IS NULL

    UNION ALL

    -- Recursive: employees who report to the previous level
    SELECT 
        e.employeeid,
        e.firstname,
        e.managerid,
        ceh.Level + 1
    FROM salesdb.employees AS e
    INNER JOIN CTE_Emp_Hierarchy ceh
        ON e.managerid = ceh.employeeid
)
SELECT *
FROM CTE_Emp_Hierarchy
ORDER BY Level, managerid, employeeid;












