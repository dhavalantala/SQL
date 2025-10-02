-- FIND THE LOWEST SALES OF ALL ORDERS
-- SELECT 
-- 	customerid,
--     count(*) as total_nr_orders, -- -- count a total records
--     sum(sales) as total_sales,
--     avg(sales) as avg_sales,
--     max(sales) as highest_sales,
--     min(sales) as lowest_sales
-- from salesdb.orders
-- group by customerid

-- Analyze the scores in customers table:
-- select 
-- 	country,
-- 	count(*) as TotalRecords,
--     sum(score) TotalSales,
--     avg(score) as AvgSales,
--     max(score) as HighestSales,
-- 	min(score) as LowestSales
-- from salesdb.customers
-- group by country;

-- select *
-- from salesdb.customers

-- find the total sales across all orders
-- select 
-- 	ProductID,
-- 	sum(Sales) TotalSales
-- from 
-- 	salesdb.orders
-- group by 
-- 	ProductID;
    
-- find the total sales each product Additionally provide details such order ID, Order Date
-- select
-- 	OrderID,
--     OrderDate,
--     ProductID,
-- 	sum(Sales) over(partition by ProductID) TotalSales
-- from 
-- 	salesdb.orders;

-- Find the total sales across all orders 
-- Find the total sales across each products
-- Aditioanlly provide details such order ID, order Date.
-- select 
-- 	OrderID, 
-- 	OrderDate,
--     ProductID,
--     OrderStatus,
--     sales,
--     sum(Sales) over() TotalSales,
--     sum(Sales) over(partition by ProductID) TotalSalesByProducts,
--     sum(Sales) over(partition by ProductID, OrderStatus) TotalSalesByProductsandStatus
-- from 
-- 	salesdb.orders

-- Rank each order based on their sales from highest to lowest Additionally provide deatils such order ID, Order Date
-- select 
-- 	OrderID, 
--     OrderDate,
--     Sales,
--     sum(sales) over(order by Sales) TotalSales,
--     rank() over(order by Sales asc) RankSales
-- from 
-- 	salesdb.orders

-- select 
-- 	OrderID,
--     OrderDate,
--     OrderStatus,
--     Sales,
--     sum(Sales) over (partition by OrderStatus order by OrderDate
-- 		rows between 2 preceding and current row) TotalSales
-- from 
-- 	salesdb.orders;
    

-- select 
-- 	OrderID,
--     OrderDate,
--     OrderStatus,
--     Sales,
--     sum(Sales) over (partition by OrderStatus order by OrderDate) TotalSales
-- from 
-- 	salesdb.orders

-- select 
-- 	CustomerID,
--     sum(Sales) TotalSales,
--     rank() over(order by sum(Sales) desc) RankCustomers
-- from 
-- 	salesdb.orders
-- group by 
-- 	CustomerID

-- Find the number of orders
--  Additionally provide deatils such order ID, order date
-- select 
-- 	OrderID,
--     orderdate,
--     count(*) over() TotalOrders,
--     CustomerID,
-- 	count(*) over(partition by customerid) OrderByCustomers 
-- from 
-- 	salesdb.orders

-- select 
-- 	*,
-- 	count(*) over () TotalCustomers,
--     Score,
--     count(Score) over() TotalScore
-- from 
-- 	salesdb.customers
-- limit 1

-- select 
-- 	OrderID,
--     count(*) over (partition by OrderID) CheckPK
-- from 
-- 	salesdb.orders;
--     
-- select 
-- 	*
-- from( 
-- 	select 
-- 		OrderID,
-- 		count(*) over (partition by OrderID) CheckPK
-- 	from
-- 		salesdb.orders_archive) t
-- where 
-- 	CheckPK > 1

-- select 
-- -- 	OrderID,
-- --     OrderDate,
--     Sales,
--     ProductID,
--     Sum(sales) over () TotalSales,
--     Sum(sales) over (partition by ProductID) TotalSales
-- from 
-- 	salesdb.orders

-- Find the percentage contribution of each product's sales to the total sales
-- select 
-- 	OrderID,
--     ProductID,
--     Sales,
--     SUM(Sales) over() TotalSales,
--     round(Sales / SUM(Sales) over() *100, 2) PercentageOfTotal
-- from 
-- 	salesdb.orders

-- find the average sales across all orders
-- And Find the average sales for each product Additionally provide details such OrderID, OrderDate
-- select 
-- 	OrderID,
--     OrderDate,
--     Sales,
--     ProductID,
--     round(avg(Sales) over())AvgSales,
--     round(avg(coalesce(sales, 0)) over (partition by ProductID), 0) TotalSales
-- from 
-- 	salesdb.orders;

-- select 
-- 	CustomerID,
-- 	LastName,
-- 	Score,
-- 	avg(Score) over() AvgScore
-- from 
-- 	salesdb.customers

-- Find all orders where sales are higher than the average sales across all orders
-- select
-- 	*
-- from (
-- 	select
-- 		OrderID,
-- 		ProductID,
-- 		Sales,
-- 		AVG(Sales) over() AvgSales
-- 	from 
-- 		salesdb.orders) t 
-- where sales > AvgSales

--  find the highest and lowest sales of all orders,
-- Find the highest and lowest sales for each products, Additionally provide details such OrderID, OrderDate
-- select
-- 	OrderID, 
-- 	OrderDate,
--     ProductID,
--     Sales,
--     max(Sales) over() HighestSales,
--     min(Sales) over() LowestSales,
--     max(Sales) over(partition by ProductID) HighestSalesByProduct,
--     min(Sales) over(partition by ProductID) LowestSalesByProduct
-- from 
-- 	salesdb.orders

-- Show the employees who have the highest salaries
-- select
-- 	*
-- from
-- 	(
-- 		select
-- 			*,
-- 			MAX(Salary) over() HighestSalary
-- 		from 
-- 			salesdb.employees) t
-- where Salary = HighestSalary;

-- select 
-- 	*
-- from salesdb.employees
-- where salary = (
-- 	select
-- 		max(salary)
-- 	from 
-- 		salesdb.employees
-- 	where salary < (select 
-- 						max(salary) 
-- 					from 
-- 						salesdb.employees) 
-- );

-- select 
-- 	*
-- from 
-- 	salesdb.employees 
-- order by  salary desc 
-- limit 2,1;

-- Find the deviation of each sales from the minimum and maximum sales amounts
-- select
-- 	OrderID,
--     OrderDate,
--     ProductID,
--     Sales,
--     max(Sales) over() HighestSales,
--     min(Sales) over() LowestSales,
--     Sales - min(Sales) over() DeviationFromMin,
--     max(Sales) over() - Sales DeviationFromMax
-- from 
-- 	salesdb.orders

-- Calculate moving average of sales for product over time 
-- select
-- 	OrderID,
-- 	ProductID,
-- 	OrderDate,
--     Sales,
--     AVG(Sales) over (partition by ProductID) AvgByProduct,
--     round(AVG(Sales) over (partition by ProductID order by OrderDate)) MovingAvg,
--     round(avg(Sales) over (partition by ProductID order by OrderDate ROWS between current row and 1 following)) RollingAvg
-- from
-- 	salesdb.orders

-- ROW_NUMBER	
-- RANK
-- 
-- select 
-- 	OrderID,
--     ProductID,
--     Sales,
--     row_number() over(order by Sales desc) SalesRank_Row,
--     rank() 		 over(order by Sales desc) SalesRank,
--     dense_rank() over(order by Sales desc) SalesDenseRank
-- from 
-- 	salesdb.orders

-- Find the top highest sales for each products
-- select 
-- 	*
-- from (    
-- select 
-- 	OrderID,
--     ProductID,
--     Sales,
--     row_number() over (partition by ProductID order by sales desc) RankByProduct
-- from 
-- 	salesdb.orders) t 
-- where RankByProduct = 1

-- Find the lowest 2 customers based on their total sales
-- select 
--     *
-- from (
-- 	select 
-- 		CustomerID,
--         SalesPersonID,
-- 		sum(sales),
-- 		row_number() over(order by sum(sales)) RankOfSales
-- 	from 
-- 		salesdb.orders
-- 	group by 
-- 		CustomerID,
--         SalesPersonID) t 
-- where RankOfSales<= 2;

-- select
-- 	row_number() over(order by OrderID, OrderDate) UniqueID,
-- 	o.*
-- from 
-- 	salesdb.orders_archive o

-- Identify duplicate rows in the table 'Orders Archive'
-- and return a clean without any duplicates
-- select 
-- 	*
-- from (
-- select 
-- 	row_number() over(partition by OrderID order by CreationTime desc) rn,
-- 	o.*
-- from 
-- 	salesdb.orders_archive as o)t
-- where rn = 1;

-- select * from salesdb.orders_archive

-- select 
-- 	*
-- from (
-- select 
-- 	row_number() over(partition by OrderID order by CreationTime desc) rn,
-- 	o.*
-- from 
-- 	salesdb.orders_archive as o)t
-- where rn > 1

-- select 
-- 	OrderID,
--     Sales,
--     ntile(4) over (Order by Sales desc) FourBucket,
--     ntile(3) over (Order by Sales desc) ThreeBucket,
--     ntile(2) over (Order by Sales desc) TwoBucket,
--     ntile(1) over (Order by Sales desc) OneBucket
-- from 
-- 	salesdb.orders

-- Segment all orders into 3 categories: High, medium and low Sales.
-- select 
-- 	*,
--     case when Buckets = 1 then 'High'
-- 		 when Buckets = 2 then 'Medium'
-- 		 when Buckets = 3 then 'Low'
-- 	end SalesSegmentations
-- from (
-- 	select 
-- 		OrderID,
-- 		Sales,
-- 		ntile(3) over (order by Sales DESC) Buckets
-- 	from 
-- 		salesdb.orders) t

-- In order to export the data, divide the orders into 2 group 
-- select
-- 	ntile(2) over( order by OrderID) Bucket,
-- 	o.*
-- from 
-- 	salesdb.orders as o

-- Find the products that fall within the highest 40% of the prices.
-- select 	
-- 	*,
--     concat(DistRank *100, '%')
-- from 
-- 	(
-- 	select 
-- 		Product,
-- 		Price,
-- 		cume_dist() OVER(order by Price desc) DistRank
-- 	from 
-- 		salesdb.products) t
-- where DistRank <= 0.3;

-- SELECT *
-- FROM (
--     SELECT 
--         Product,
--         Price,
--         ROW_NUMBER() OVER (ORDER BY Price DESC) AS rn,
--         COUNT(*) OVER () AS total_count
--     FROM salesdb.products
-- ) t
-- WHERE rn <= total_count * 0.4; -- memory-intensive for millions of rows.


-- Rule of thumb:
-- Use CUME_DIST() → if you want percentile thresholds.
-- Use ROW_NUMBER() or NTILE() → if you want exact percentages of rows

-- select 	
-- 	*,
--     concat(DistRank *100, '%') 
-- from 
-- 	(
-- 	select 
-- 		Product,
-- 		Price,
-- 		percent_rank() OVER(order by Price desc) DistRank
-- 	from 
-- 		salesdb.products) t
-- where DistRank <= 0.4

-- Ana;yze the month-over-month performance by finding the percentage change in sales between the current and previous months.
-- select 
-- 	*,
-- 	CurrentMonthSales - PreviousMonthSales as MoM_change,
--     round((CurrentMonthSales - PreviousMonthSales) / PreviousMonthSales * 100, 1) as MoM_Change_Perc 
-- from (
-- select
-- 	month(OrderDate) OrderMonth,
--     sum(sales) CurrentMonthSales,
--     lag(sum(sales)) over(order by month(OrderDate)) PreviousMonthSales
-- from 
-- 	salesdb.orders
-- group by
-- 	month(OrderDate)) t

-- Customer Retention Analysis
-- Analyze customers loyalty rank customers based on the average days between their orders.
-- select 
-- 	CustomerID,
--     avg(DayUnitNextOrder) AvgDays,
--     rank() over(order by coalesce(avg(DayUnitNextOrder), 999999)) RankAvg
-- from 
-- 	(
-- 	select 
-- 		OrderID,
-- 		CustomerID,
-- 		OrderDate CurrentDate,
-- 		lead(OrderDate) over (partition by CustomerID order by OrderDate) NextOrderDate,
-- 		datediff(lead(OrderDate) over (partition by CustomerID order by OrderDate), OrderDate) DayUnitNextOrder
-- 	from 
-- 		salesdb.orders ) t
-- group by 
-- 	CustomerID;

-- Find the lowest and highest Sales for each product
-- select 
-- 	OrderDate,
--     ProductID,
--     Sales,
--     first_value(Sales) over (partition by ProductID order by Sales) LowestPrice,
--     last_value(Sales)  over (partition by ProductID order by Sales rows between current row and unbounded following) HighetPrice,
-- --     first_value(Sales) over (partition by ProductID order by Sales desc) HighetPrice2,
-- --     min(Sales) over (partition by ProductID) LowestPrice3,
-- --     max(Sales) over (partition by ProductID) LowestPrice4
-- 	Sales - first_value(Sales) over (partition by ProductID order by Sales) SalesDifference
-- from 
-- 	salesdb.orders












    