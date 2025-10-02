-- Result types sub querys 
-- select 
-- 	-- avg(Sales) -- scalar types
--     -- CustomerID -- Row Subquery
-- --     OrderID,
-- --     OrderDate -- Table query
-- from 
-- 	salesdb.orders

-- Find the products that have a price higher than the average pricee of all products 
-- -- Main query
-- select
-- 	*
-- from (
-- 	--  Subquery
-- 	select 
-- 		ProductID,
-- 		Price,
-- 		round(AVG(Price)  over(), 2) AvgPrice
-- 	from 
-- 		salesdb.products) t
-- where AvgPrice < Price

-- --  Rank customers based on their total amount of sales
-- -- Main Query
-- select 
-- 	*,
--     RANK() over (order by TotalSales desc) CustomerRank
-- from 
-- 	(
-- 	-- Sub Query
-- 	select 
-- 		CustomerID,
-- 		SUM(Sales) TotalSales
-- 	from 
-- 		salesdb.orders
-- 	group by 
-- 		CustomerID) t

-- -- Show the ProductIDs, product naems, price and the total number of orders.
-- -- Main Query
-- select 
-- 	ProductId,
--     Product,
--     Price,
--     -- Sub Query
-- 	(select count(*) from salesdb.orders) as TotalOrders
-- from 
-- 	salesdb.products;

-- Show all customer details and find the total orders of each customers
-- select
-- 	c.*,
--     o.TotalOrders
-- From 
-- 	salesdb.customers c
-- left join (
-- 		select 
-- 			CustomerID,
-- 			count(*) as TotalOrders
-- 		from 
-- 			salesdb.orders
-- 		group by 
-- 			CustomerID) o
-- on c.CustomerID = o.CustomerID
-- where TotalOrders is not null

-- Find the products that have a price  higher than the average price of all products.
-- select 
-- 	ProductId,
--     Price,
--     round((select avg(Price) from salesdb.products), 0) AvgPrice
-- from 
-- 	salesdb.products
-- where Price > 
-- 		(select avg(Price) from salesdb.products)

-- Show the details of orders made by customers in Germany
-- select 
-- 	*
-- from salesdb.orders
-- where CustomerID in (
-- 					select 
-- 						CustomerID
-- 					from 
-- 						salesdb.customers
-- 					where Country = 'Germany');
                    
-- Show the details of orders made by customers not from Germany
-- select 
-- 	*
-- from salesdb.orders
-- where CustomerID in (
-- 					select 
-- 						CustomerID
-- 					from 
-- 						salesdb.customers
-- 					where Country != 'Germany');

-- Show the details of orders made by customers not from Germany
-- select 
-- 	*
-- from salesdb.orders
-- where CustomerID not in (
-- 					select 
-- 						CustomerID
-- 					from 
-- 						salesdb.customers
-- 					where Country = 'Germany');

-- Find the empleyees whose salaries are greater than the salaries of any male employees.
-- select 
-- 	EmployeeID,
--     FirstName,
--     LastName,
--     Salary
-- from
-- 	salesdb.employees
-- where Gender = 'F' 
-- 	and Salary > any (select Salary from salesdb.employees where Gender = 'M');

-- Find the empleyees whose salaries are greater than the salaries of all male employees.
-- select 
-- 	EmployeeID,
--     FirstName,
--     LastName,
--     Salary
-- from
-- 	salesdb.employees
-- where Gender = 'F' 
-- 	and Salary > all (select Salary from salesdb.employees where Gender = 'M');

-- Show the customers detils and find the total orders of each customer
-- select
-- 	*,
--     (select count(*) from salesdb.orders AS o where o.customerid = c.customerid )TotalSales
-- from
-- 	salesdb.customers AS c;

-- Show the details of orders made by customers in germany
select 	
	*
from 
	salesdb.orders o 
where exists(
			select 
				*
			from 
				salesdb.customers c 
			where
				Country = 'Germany' and o.customerid = c.customerid);

-- select 	
-- 	*
-- from 
-- 	salesdb.orders o 
-- where o.customerid in (
-- 			select 
-- 				c.customerid
-- 			from 
-- 				salesdb.customers c 
-- 			where
-- 				Country = 'Germany')

-- Show the details of orders made by customers not in germnay
-- select 	
-- 	*
-- from 
-- 	salesdb.orders o 
-- where not exists(
-- 			select 
-- 				*
-- 			from 
-- 				salesdb.customers c 
-- 			where
-- 				Country = 'Germany' and o.customerid = c.customerid);
























































