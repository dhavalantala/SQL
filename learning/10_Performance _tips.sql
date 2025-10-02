-- Tip 1: Select Only what you need
-- Bad Practice --
-- select * from salesdb.customers;

-- -- Good Practice
-- select	
-- 	CustomerID, 
--     FirstName,
--     LastName
-- from salesdb.customers

-- Tip 2: Avoid Unnecessary DISTINCT & ORDER BY
-- select distinct
-- 	FirstName
-- from salesdb.customers
-- order by FirstName;

-- select
-- 	FirstName
-- from salesdb.customers

-- Tip 3: For Exploration Purpose, Limit Rows!

-- Bad Practice
-- select 
-- 	OrderID,
-- 	Sales 
-- from 
-- 	salesdb.orders;

-- -- Good Practice    
-- select 
-- 	OrderID,
-- 	Sales 
-- from 
-- 	salesdb.orders
-- limit 2

-- Tip 4: Filtering Data |Create non clustred Index on frequently used Columns in WHERE clause|

-- select * from salesdb.orders where OrderStatus = 'Delivered'

-- Tip 5: Avoid Appying function to columns in WHERE clause

-- Bad Practice Because using function like LOWER is not using index.....
-- select * 
-- from salesdb.orders 
-- where Lower(OrderStatus) = 'delivered';

-- -- Good Practice
-- select * 
-- from salesdb.orders 
-- where OrderStatus = 'Delivered';

-- Bad Practice
-- select * 
-- from salesdb.orders 
-- where year(OrderDate) = 2025;

-- -- Good Practice
-- select * 
-- from salesdb.orders 
-- where OrderDate between '2025-01-01' and '2025-12-31';

-- Tip 6: Avoid leading woldcars as they prevent index usage
-- Bad Practice
-- select 
-- 	*
-- FROM 
-- 	salesdb.customers
-- where 
-- 	LastName like '%Gold%';

-- -- Good Practice
-- select 
-- 	*
-- FROM 
-- 	salesdb.customers
-- where 
-- 	LastName like 'Gold%'

-- Tips 7: Use IN insted of multiple OR

-- Bad Practice
select 
	*
from 
	salesdb.orders
where 
	CustomerID = 1 or CustomerID = 2 or CustomerID = 3;
    
-- Good Practice
select 
	*
from 
	salesdb.orders
where 
	CustomerID in (1, 2)
    



























