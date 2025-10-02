
-- select * 
-- from MyDatabase.customers
-- where country = 'USA'and score >= 500;

-- select * 
-- from MyDatabase.customers
-- where country = 'USA' or score > 500;

-- select *
-- from MyDatabase.customers
-- where not country = 'USA';

-- select *
-- from MyDatabase.customers
-- where not score < 500;

-- select * 
-- from MyDatabase.customers
-- where score between 100 and 500; 

-- select * 
-- from MyDatabase.customers
-- where score >= 100 and score <= 500; 

-- select * 
-- from MyDatabase.customers
-- where country = 'Germany' or country = 'USA';

-- select * 
-- from MyDatabase.customers
-- where country in ('Germany', 'USA');

-- select * 
-- from MyDatabase.customers
-- where country not in ('Germany', 'USA');

-- select * 
-- from MyDatabase.customers
-- where first_name like 'M%';

-- select * 
-- from MyDatabase.customers
-- where first_name like '%n';

-- select * 
-- from MyDatabase.customers
-- where first_name like '%r%'

select * 
from MyDatabase.customers
where first_name like '__r%'

