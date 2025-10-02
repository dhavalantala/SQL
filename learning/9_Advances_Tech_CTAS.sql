-- DROP TABLE IF EXISTS salesdb.MonthlyOrders;
-- create table salesdb.MonthlyOrders(
-- select 
-- 	monthname(OrderDate) OrderMonth,
--     count(OrderID) TotalOrders
-- from 
-- 	salesdb.orders
-- group by monthname(OrderDate)
-- );

-- CREATE TEMPORARY TABLE salesdb.temp_orders AS
-- SELECT * FROM salesdb.orders;
-- SHOW TABLES;

-- select * from salesdb.temp_orders; 		-- You can't see this table physically 
-- SET SQL_SAFE_UPDATES = 0;
-- delete FROM salesdb.temp_orders
-- where OrderStatus = 'Delivered';
-- select * from salesdb.temp_orders;
-- SET SQL_SAFE_UPDATES = 1;
-- select * into salesdb.OrderTest from salesdb.temp_orders; -- -- In MySQL, SELECT … INTO is only for writing results to variables or files (not creating tables).
-- DROP TABLE IF EXISTS salesdb.OrderTest;

-- CREATE TABLE salesdb.OrderTest AS
-- SELECT *
-- FROM salesdb.temp_orders;

