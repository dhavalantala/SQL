-- drop view v_Monthly_summary; 			-- -- SQL Server
-- IF OBJECT_ID('v_Monthly_summary', 'V') IS NOT NULL
-- 	DROP VIEW v_Monthly_summary;

CREATE or replace VIEW v_Monthly_summary AS
(
	SELECT
		date_format(OrderDate, '%Y-%m-01')  AS OrderMonth,
		sum(Sales) TotalSales,
		count(OrderID) TotalOrders,
		SUM(Quantity) TotalQuantities
	from 
		salesdb.orders
	group by 
		date_format(OrderDate, '%Y-%m-01')
);


CREATE or replace VIEW V_Order_details AS 
(
select 
	o.Orderid,
    o.OrderDate,
    p.Product,
    p.Category,
    CONCAT(COALESCE(c.FirstName, ''), ' ', COALESCE(c.LastName, '') ) AS CustomerName,
    c.Country CustomerCountry,
    CONCAT(COALESCE(e.firstname, ''), ' ', COALESCE(e.lastname, '') ) AS SalesPersonName,
    e.Department,
--     o.productid,
--     o.customerid,
--     o.salespersonid,
	o.Sales,
    o.Quantity
From 
	salesdb.orders o
left join salesdb.products p
on p.Productid = o.Productid
left join salesdb.customers c
on c.Customerid = o.Customerid
left join salesdb.employees as e
on e.employeeid = o.salespersonid
);

-- Provide a view for EU sales Teeam that combines details from all tables and excludes data related to the USA
-- Role based Security
CREATE VIEW	salesdb.V_Order_Details_EU AS 
(
	select 
		o.Orderid,
		o.OrderDate,
		p.Product,
		p.Category,
		CONCAT(COALESCE(c.FirstName, ''), ' ', COALESCE(c.LastName, '') ) AS CustomerName,
		c.Country CustomerCountry,
		CONCAT(COALESCE(e.firstname, ''), ' ', COALESCE(e.lastname, '') ) AS SalesPersonName,
		e.Department,
	--     o.productid,
	--     o.customerid,
	--     o.salespersonid,
		o.Sales,
		o.Quantity
	From 
		salesdb.orders o
	left join salesdb.products p
	on p.Productid = o.Productid
	left join salesdb.customers c
	on c.Customerid = o.Customerid
	left join salesdb.employees as e
	on e.employeeid = o.salespersonid
	where c.Country <> 'USA'
);


















