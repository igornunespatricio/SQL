-- JOINS: create relationship between tables to get information from two or more columns
-- the columns we want to create the relationship must have one column in common at least.

-- INNER JOIN: returns the intersection rows between two tables
-- LEFT JOIN: returns the LEFT table with the intersection from the right table
-- RIGHT JOIN: returns the RIGHT table with the intersection from the left table
-- FULL JOIN: returns all rows from both tables

-- Example 1: return orders with the products information
SELECT
	od.*,
	p.*
FROM order_details AS od
LEFT JOIN products AS p
	ON od.product_id = p.product_id;
	
-- Example 2: return products with their categories
SELECT
	p.product_id,
	p.product_name,
	p.category_id,
	p.unit_price,
	c.category_name
FROM products AS p
LEFT JOIN categories AS c
	ON p.category_id = c.category_id;

-- Example 3: return orders with customer names
SELECT
	o.order_id,
	o.customer_id,
	o.order_date,
	c.contact_name
FROM orders AS o
LEFT JOIN customers AS c
	ON o.customer_id = c.customer_id;



-- selecting customers that didn't ordered anything

-- first way: doing a right join to return info from customer table (RIGHT) that had NULL order (means no order done)
SELECT
	o.order_id,
	o.customer_id,
	o.order_date,
	c.contact_name
FROM orders AS o
RIGHT JOIN customers AS c
	ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

--second way: return rows (customers) from the customers table that don't exists in the orders table
SELECT
	DISTINCT c.contact_name
FROM customers AS c
WHERE NOT EXISTS (
	SELECT
		*
	FROM orders AS o
	WHERE o.customer_id = c.customer_id
);

-- JOIN + GROUP BY + ORDER BY

-- group quantity of orders by product name. Needs to join order_details table with products table to do the grouping
SELECT
	p.product_id,
	p.product_name,
	SUM(quantity) AS "Quantity"
FROM order_details AS od
LEFT JOIN products as p
	ON od.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY "Quantity" DESC;

-- JOIN + WHERE + HAVING

-- from last query, filter only products with unit_prices bigger than 80 money units (this filter happens before grouping, therefore WHERE is the answer)
SELECT
	p.product_id,
	p.product_name,
	SUM(quantity) AS "Quantity"
FROM order_details AS od
LEFT JOIN products as p
	ON od.product_id = p.product_id
WHERE p.unit_price >= 80
GROUP BY p.product_id, p.product_name
ORDER BY "Quantity" DESC;


-- now, return only products that sold more than 1000 units (this should be filtered only after grouping, therefore HAVING is the answer)
SELECT
	p.product_id,
	p.product_name,
	SUM(quantity) AS "Quantity"
FROM order_details AS od
LEFT JOIN products as p
	ON od.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(Quantity)> 1000
ORDER BY "Quantity" DESC;



