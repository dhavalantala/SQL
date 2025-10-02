-- insert into customers (id, first_name, country, score)
-- values
-- 	(6, 'Anna', 'USA', Null),
--  (7, 'Sam', Null, 100);

--  Always list columns explicitly for clarity and maintainbility
-- insert into customers
-- values
-- 	(8, 'MAX', 'USA', null),
-- 	(9, 'Andreas', 'Germany', null);

-- Wecan only skip the nullable columns ** Columns not included in insert become NULL (unless a default or constraint exists)
-- insert into customers (id, first_name)
-- values
-- 	(11, 'MAXI');
    
-- SELECT * FROM MyDatabase.customers;

-- Insert data from 'customers' into 'persons'
-- INSERT INTO persons (id, person_name, birth_date, phone)
-- select 
-- 	id,
--     first_name,
--     null, 
--     'Unknown'
-- from customers;

-- SELECT * FROM persons;

-- Change the score of customer 6 to 0
-- update customers
-- SET score = 0
-- where id = 6;

-- select * from customers
-- update customers
-- set score = 0, country = 'UK'
-- where id = 11;

-- select * from customers
-- update customers
-- set score = 0
-- where score is null;

-- select * from customers where score is null

-- Delete all customers with an ID greater than 5. 
-- delete from customers
-- where id > 5;

-- select * from customers

-- delete a data from persons table 
-- fro small table 
-- DELETE FROM persons

-- for big data 
truncate table persons









