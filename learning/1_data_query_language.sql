use MyDatabase;
-- select *
-- from customers;

-- select 
-- 	first_name, 
-- 	country, 
-- 	score
-- from customers;

--  Where means condition
-- select *
-- 	from 
-- 		customers
-- 	where 
-- 		-- score >0;
--         score != 0;

-- select 
-- 	first_name, 
-- 	country, 
-- 	score
-- from customers
-- where
-- 	score != 0;

-- select *
-- from customers
-- where country ='Germany' AND score >= 500;

-- select * 
-- from customers;

-- select * 
-- from customers 
-- order by country asc, score desc;

--  group by with countrys unique values
-- select country, sum(score) AS total_score
-- from customers group by country;

-- select country, first_name, sum(score) AS total_score
-- from customers group by country, first_name;

-- select 
-- country, 
-- sum(score) AS total_score, 
-- count(id) total_customers
-- from customers group by country;


-- select
-- 	country,
--     avg(score) AS avg_score
-- from customers
-- where score != 0
-- group by country
-- having avg(score) > 430

-- Return Unique list of all countries
-- select distinct
-- 	country
-- from customers

-- Retrieve only 3 customers
-- select *
-- from customers 
-- limit 3;

-- Retrieve only 3 customers and top 3 customer.
-- select *
-- from customers
-- order by score desc
-- limit 3;

-- Retrieve only 3 customers and lowest 2 customer.
-- select *
-- from customers
-- order by score asc
-- limit 2;


-- Get the two most recent orders
-- select *
-- from orders
-- order by order_date DESC
-- limit 2;



-- select *
-- from customers
-- where country = 'Germany';

-- select *
-- 	from orders
    









