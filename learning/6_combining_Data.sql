-- use `MyDatabase`
--  get all customers along with their orders but only for customers who have placed on order

-- select 
-- 	c.id,
--     c.first_name,
--     o.order_id,
--     o.sales
-- from customers as c
-- inner join orders as o
-- on c.id = o.customer_id;

-- -- Get all customers along with their orders including those without orders.
-- select 
-- 	c.id,
--     c.first_name,
--     o.order_id,
--     o.sales
-- from customers as c
-- left join orders as o
-- on c.id = o.customer_id;

-- -- Get all customers along with their orders including orders without matching customers.
-- -- Using RIGHT
-- select 
-- 	c.id,
--     c.first_name,
--     o.order_id,
--     o.sales
-- from customers as c
-- right join orders as o
-- on c.id = o.customer_id;

--  -- USING LEFT
-- select 
-- 	c.id,
--     c.first_name,
--     o.order_id,
--     o.sales
-- from orders as o
-- left join customers as c
-- on c.id = o.customer_id;

--  Get all customers and all order, even if there's no match.
-- select 
-- 	c.id,
--     c.first_name,
--     o.order_id,
--     o.sales
-- from customers as c
-- cross JOIN orders as o
-- on c.id = o.customer_id;

-- Get all customer who haven't place any order
-- select *
-- from customers as c
-- left join orders as o
-- on c.id = o.customer_id
-- where o.customer_id is null;

-- Get all orders without matching customers
-- select *
-- from customers as c
-- right join orders as o
-- on c.id = o.customer_id
-- where c.id is null;

-- select *
-- from orders as o 
-- left join customers as c
-- on c.id = o.customer_id
-- where c.id is null

-- Find customers without orders and without customers

-- Get all customers along with their orders, but only for customers who have placed an order(without using INNER JOIN)
-- select *
-- from customers as c 
-- left join orders as o 
-- on c.id = o.customer_id
-- where o.customer_id is not null;

-- Generate all possible combinations of custmers and orders. 
-- select *
-- from customers 
-- cross join orders

-- USE salesdb
--  Multi-join
-- Task Using salesDB, Retrieve a list of all orders, along with the related customer, product, and employee details 
--  For each order, display : Order ID, Customer's name, product name, Price, sales Person's name

-- select 
-- 	o.orderid,
--     o.sales,
--     c.firstname as CustomerFirstName,
--     c.lastname as CustomerLastName,
--     p.product as ProductName,
--     p.price as Price,
--     e.firstname as EmployeeFirstName, 
--     e.lastname as EmployeeLastName
-- from salesdb.orders as o
-- left join salesdb.customers as c
-- on o.customerid = c.customerid
-- left join salesdb.products as p
-- on o.productid = p.productid
-- left join salesdb.employees as e
-- on o.salespersonid = e.employeeid


--  Combine the data from employees and customers into one table 
-- select 
-- 	firstname,
--     lastname
-- from salesdb.customers
-- UNION
-- select 
-- 	firstname,
--     lastname
-- from salesdb.employees;
-- select 
-- 	firstname,
--     lastname
-- from salesdb.customers
-- UNION ALL
-- select 
-- 	firstname,
--     lastname
-- from salesdb.employees;

-- MySQL Equivalent of the EXCEPT Operator
-- Finding the employees who are not customers at the same time
-- Using LEFT JOIN
-- SELECT 
--     e.firstname,
--     e.lastname
-- FROM salesdb.employees AS e
-- LEFT JOIN salesdb.customers AS c
--     ON e.firstname = c.firstname 
--    AND e.lastname = c.lastname
-- WHERE c.customerid IS NULL AND e.firstname IS NOT NULL AND e.lastname IS NOT NULL;
    
-- SELECT 
--     e.firstname,
--     e.lastname
-- FROM salesdb.employees AS e
-- LEFT JOIN salesdb.customers AS c
--     ON (e.firstname <=> c.firstname)
--    AND (e.lastname <=> c.lastname)
-- WHERE c.customerid IS NOT NULL;

-- SELECT 
-- 	'Orders' as SourceTable,
--     `orders`.`orderid`,
--     `orders`.`productid`,
--     `orders`.`customerid`,
--     `orders`.`salespersonid`,
--     `orders`.`orderdate`,
--     `orders`.`shipdate`,
--     `orders`.`orderstatus`,
--     `orders`.`shipaddress`,
--     `orders`.`billaddress`,
--     `orders`.`quantity`,
--     `orders`.`sales`,
--     `orders`.`creationtime`
-- FROM `salesdb`.`orders`
-- union
-- SELECT
-- 	'OrdersArchive' as SourceTable,
-- 	`orders_archive`.`orderid`,
--     `orders_archive`.`productid`,
--     `orders_archive`.`customerid`,
--     `orders_archive`.`salespersonid`,
--     `orders_archive`.`orderdate`,
--     `orders_archive`.`shipdate`,
--     `orders_archive`.`orderstatus`,
--     `orders_archive`.`shipaddress`,
--     `orders_archive`.`billaddress`,
--     `orders_archive`.`quantity`,
--     `orders_archive`.`sales`,
--     `orders_archive`.`creationtime`
-- FROM `salesdb`.`orders_archive`
-- order by orderid;
































