-- show a list of customers first names together with their country in one column. 
-- select first_name,
-- 	country,
--     concat(firs_tname, ' ', country) as name_country
-- from MyDatabase.customers

-- Transform the customer's first name into lowercase
-- select first_name,
-- 	country,
--     concat(first_name, ' ', country) as name_country,
--     upper(first_name) as up_firstname,
--     lower(first_name) as lw_firstname
-- from MyDatabase.customers

-- Find customer whose first name countains leading or trailing spaces
-- SELECT
-- 	first_name,
--     LENGTH(first_name) len_name, 
--     length(trim(first_name)) trim_len_name,
--     LENGTH(first_name)- length(trim(first_name)) flag
-- from MyDatabase.customers
-- where LENGTH(first_name) != length(trim(first_name));
-- where first_name != trim(first_name)

-- Remove dashes (-) from a phone number to white space 
-- select
-- '123-456-7890' as old_phone,
-- replace ('123-456-7890', '-', '/') as new_phone;

-- Replace file extence from txt to csv
-- select 
-- 'report.txt' old_filename,
-- replace ('report.txt', '.txt', '.csv') new_file_name 

-- Calculate the length of each customer's first name.
-- select first_name,
-- length(first_name) as len_name
-- from MyDatabase.customers

-- Retrieve the first two characters of each first name.
-- select 
-- 	first_name,
--     left(trim(first_name), 2) as first_2_char,
--     right(first_name, 2) as last_2_char
-- from MyDatabase.customers;

-- Retrieve a list of customers first name after removing the first character. 
-- select 
-- 	first_name,
--     substring(trim(first_name), 2, length(first_name)) as trim_char
-- from MyDatabase.customers;

-- select 
-- 	3.516,
--     round(3.516, 2) as round_2,
--     round(3.516, 1) as round_1,
--     round(3.516, 0) as round_0

-- select -10,
-- 	abs(-10) ab,
--     abs(10) 

-- select OrderID,
-- OrderDate,
-- ShipDate,
-- CreationTime,
-- '2025-10-16' HardCoded,
-- curdate() Today
-- from salesdb.orders

-- select 
-- 	DAY(curdate()) Today,
--     month(curdate()) Month,
--     year(curdate()) YEAR
-- select OrderID,
-- OrderDate,
-- ShipDate,
-- CreationTime,
-- DAY(OrderDate) OToday,
-- month(OrderDate) OMonth,
-- year(OrderDate) OYEAR,
-- week(CreationTime) WeekOfCreation,
-- hour(CreationTime) HROfCreation,
-- QUARTER(CreationTime) QUOfCreation,
-- dayname(CreationTime) DAYofCreation,
-- monthname(CreationTime) DAYofCreation,
-- year(CreationTime) tearofCreation,
-- DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:00') as sec,
-- DATE_FORMAT(NOW(), '%Y-%m-%d %H:%00:00') as min,
-- DATE_FORMAT(NOW(), '%Y-%m-%d %00:%00:00') as hr,
-- DATE_FORMAT(NOW(), '%Y-%m-%00 %00:%00:00') as day,
-- DATE_FORMAT(NOW(), '%Y-%00-%00 %00:%00:00') as mon,
-- DATE_FORMAT(NOW(), '%Y') as year
-- from salesdb.orders

-- select    
-- DATE_FORMAT(CreationTime, '%Y-%m-%00 %00:%00:00') as mon,
-- count(*)
-- from salesdb.orders
-- group by CreationTime

-- select OrderID,
-- OrderDate,
-- ShipDate,
-- CreationTime,
-- LAST_DAY(CreationTime),
-- LAST_DAY(now()),
-- DATE_FORMAT(CreationTime, '%Y-%m-%01') as mon
-- from salesdb.orders

-- How many orders were placed each year?
-- Select 
-- year(OrderDate)
-- ,count(*) NrOfOrders
-- from salesdb.orders
-- group by year(OrderDate)

-- How many orders were placed each month?
-- Select 
-- monthname(OrderDate)
-- ,count(*) NrOfOrders
-- from salesdb.orders
-- group by monthname(OrderDate)

-- Show all orders that were placed during the month of february
-- select  *
-- from salesdb.orders
-- where month(OrderDate) = 2

-- select 
-- DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s'),
-- DATE_FORMAT(NOW(), '%Y-%m-%d %T')

-- select 
-- 	OrderID,
--     CreationTime,
-- CONCAT(
--     'Day ',
--     DATE_FORMAT(CreationTime, '%W %M'),
--     ' Q',
--     QUARTER(CreationTime),
--     ' ',
--     DATE_FORMAT(CreationTime, '%Y %h:%i:%s %p')
-- ) AS CustomFormat
-- from salesdb.orders

-- select DATE_FORMAT(OrderDate, '%b %y'),
-- count(*)
-- from salesdb.orders
-- group by DATE_FORMAT(OrderDate, '%b %y')

-- select 
-- --     convert('123', DECIMAL),
-- --     convert('2025-09-16',  date),
--     CreationTime,
--     convert(CreationTime, date),
--     convert(CreationTime, time),
--     convert(CreationTime, NCHAR)
-- from salesdb.orders

-- select
-- CreationTime, 
-- cast(CreationTime as date),
-- cast(CreationTime as time)
-- from salesdb.orders

-- select 
-- 	OrderID,
--     OrderDate,
--     date_add(OrderDate, INTERVAL -10 day) DAYS,
--     date_add(OrderDate, INTERVAL 3 month) three,
--     date_add(OrderDate, INTERVAL 2 year) TWO
-- from salesdb.orders
-- select 
-- 	employeeid,
--     birthdate,
--     TIMESTAMPDIFF(year, birthdate, now()),
--     TIMESTAMPDIFF(month, birthdate, now())
-- from salesdb.employees

-- select 
--     month(OrderDate),
--     avg(TIMESTAMPDIFF(day, OrderDate, ShipDate))
-- from salesdb.orders
-- group by month(OrderDate)
	
-- select 
-- OrderID,
-- OrderDate CurrentOrderDate,
-- LAG(OrderDate) over (Order by orderdate) PreviousOrderDate,
-- TIMESTAMPDIFF(day, LAG(OrderDate) over (Order by orderdate), OrderDate)
-- from salesdb.orders

-- SELECT 
--   CASE 
--     WHEN STR_TO_DATE('2025-07-24', '%Y-%m-%d') IS NOT NULL THEN 'Valid Date'
--     ELSE 'Invalid Date'
--   END AS check_date;
--   
-- SELECT 
-- OrderDate,
--  case
--     WHEN CAST(OrderDate AS DATE) IS NOT NULL THEN 'Valid Date'
--     ELSE 'Invalid Date'
--   END
-- from salesdb.orders


-- Null function
-- find the average score of the customers
-- select 
-- 	customerID,
--     score,
--     avg(score) over() AvgScore,
--     coalesce(score, 0),
--     avg(coalesce(score, 0)) over() AvgScore2
-- from salesdb.customers;

-- Display the full name of customers in a single field by merging their first and last naems and add 10 nouns points to each customers score.
-- select 
-- 	firstname,
-- 	lastname,
--     coalesce(lastname, ' ') LastName2,
--     concat(firstname, ' ', coalesce(lastname, ' ')) as FullName,
--     score,
--     coalesce(score, 0) + 10 as ScoreWithBouns
-- from 
-- 	salesdb.customers

-- Sort the customers from lowest to highest scores, with nulls appearing last
-- select
-- 	customerid,
--     score
--     -- case when score is null then 1 else 0 end Flag
-- from 
-- 	salesdb.customers
-- order by case when score is null then 1 else 0 end, score

-- find the sales price for each order by dividing sales by quantity
-- select 
-- 	orderid,
--     sales,
--     quantity,
--     sales / nullif(quantity, 0) as Price
-- from 
-- 	salesdb.orders

-- Identify the customers who have no scores
-- select 
-- 	*
-- from 
-- 	salesdb.customers
-- where score is not null

-- list all details for customers who have not placed any orders
-- select
-- 	c.*,
--     o.orderid
-- from 
-- 	salesdb.customers as c
-- left join salesdb.orders as o
-- on c.customerid = o.customerid
-- -- where o.orderid is null
-- where o.customerid is null

-- Generate a report showing the total slaes for each categories:
-- select 
-- 	category,
-- 	sum(sales) as TotalSales
-- 	from (
-- 		select 
-- 			Orderid,
-- 			Sales,
-- 			case 
-- 				when sales > 50 then 'High'
-- 				when sales > 20 then 'Medium'
-- 				else 'low'
-- 			end Category
-- 		from salesdb.orders) t
-- group by Category
-- order by TotalSales desc 

-- Retrive empleyee details with geneder as full text
-- select 
-- 	EmployeeID,
--     FirstNAme,
--     LastName,
--     Gender,
-- 	case 
-- 		when Gender = 'F' then 'Female'
--         when Gender = 'M' then 'Male'
--         else 'Not Avaiable'
-- 	end GenderFullText
-- from
-- 	salesdb.employees

-- Retrive customers details with abbreviated country code
-- select 
-- 	CustomerID,
--     FirstName,
--     LastName,
--     Country,
--     case
-- 		when Country = 'Germany' then 'DE'
--         when Country = 'USA' then 'US'
--         else 'n/a'
-- 	end CountryAbbr
-- from 
-- 	salesdb.customers

-- Quick Form but limitation
-- select 
-- 	CustomerID,
--     FirstName,
--     LastName,
--     Country,
--     case Country
-- 		when 'Germany' then 'DE'
--         when 'USA' then 'US'
--         else 'n/a'
-- 	end CountryAbbr
-- from 
-- 	salesdb.customers

-- Find the avg scores of customers and treat nulls as 0, additionally provide details such CustomerID and LastName
-- select 
-- 	CustomerID,
--     LastName,
--     Score,
--     case
-- 		when score is null then 0
--         else Score
-- 	end ScoreClean,
--     avg(score) over() AvgCustomer,
--     
--     Score,
--     avg(case
-- 		when score is null then 0
--         else Score
-- 	end) over() AvgCustomerClean
-- from 
-- 	salesdb.customers

-- Count how many times each customer has made an order with sales greater than 30
-- select 
-- 	CustomerID,
--     sum(case
-- 		when Sales > 30 then 1
--         else 0
-- 	end) SalesFlag,
--     count(*) TotalOrder
-- from 
-- 	salesdb.orders
-- group by 
-- 	CustomerID


























