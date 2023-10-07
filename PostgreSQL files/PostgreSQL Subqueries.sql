-- SUBQUERIES: subqueries are queries inside other queries. They can be used as columns of a new table, inside filters WHERE and HAVING and as a new table for a new query too.

select avg(unit_price) from products;



-- products above average
select 
	product_id,
	product_name,
	unit_price,
	(select avg(unit_price) from products) AS "Average" -- SUBQUERY on SELECT command, creates a column
from products
where unit_price >= (
	select 
		avg(unit_price) 
	from products
	); -- SUBQUERY as filter WHERE
	
	
	
	
-- SUBQUERIES inside FROM command: craetes a query from a table that is also another query
select
	avg(total_customers) as "Average"
from (
	select
		contact_title,
		count(*) as "total_customers"
	from customers
	group by contact_title
) as newTable;




-- requests with more than the averagenumber of products requested not sure how to describe this metric. More specifically, it groups the requests by resquest id, summing the quantity sold, takes the average of that and check which request had sum of quantity bigger than this average
select
	order_id,
	sum(quantity)
from order_details
group by order_id
having sum(quantity) >= (
	select
		avg(quantity)
	from (
		select 
			order_id,
			sum(quantity) as quantity
		from order_details
		group by order_id
		)
	);
	
	
	
	
	
	


