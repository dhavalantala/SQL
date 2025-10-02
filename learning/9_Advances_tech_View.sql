/*
Please follow 9_1view_creation.sql
*/

-- Find the running total of sales for each month
-- with CTE_Monthly_Summary AS(
-- SELECT
-- 	date_format(OrderDate, '%Y-%m-01')  AS OrderMonth,
--     sum(Sales) TotalSales,
--     count(OrderID) TotalOrders,
--     SUM(Quantity) TotalQuantities
-- from 
-- 	salesdb.orders
-- group by 
-- 	date_format(OrderDate, '%Y-%m-01')
-- )
-- select
-- 	OrderMonth,
-- 	OrderMonth,
--     TotalSales,
--     sum(TotalSales) over (Order by OrderMonth) AS RunningTotal
-- from 
-- 	CTE_Monthly_Summary;
--     
-- select
-- 	OrderMonth,
-- 	OrderMonth,
--     TotalSales,
--     sum(TotalSales) over (Order by OrderMonth) AS RunningTotal
-- from v_monthly_summary

-- select * from salesdb.v_order_details

-- select * from salesdb.v_order_details_eu
























