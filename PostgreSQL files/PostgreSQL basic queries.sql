-- basic queries northwind

-- LIMIT: intuitive, limit number of rows of the query
SELECT
	*
FROM orders
LIMIT 100;

-- DISTINCT: select distinct values from a column
SELECT
	DISTINCT employees.title
FROM employees;

-- WHERE: filter rows of the table. BE CAREFUL because PostgreSQL is CASE-SENSITIVE
-- filtering string/text
SELECT * FROM customers WHERE contact_title = 'owner';

SELECT * FROM customers WHERE contact_title = 'Owner';

SELECT * FROM customers WHERE country='France';

-- filtering numbers
SELECT * FROM products WHERE units_in_stock = 0;

SELECT * FROM products 
WHERE unit_price >= 50
ORDER BY unit_price DESC;

-- filtering date
SELECT * FROM orders WHERE order_date > '1998-01-01' ORDER BY order_id;

-- WHERE with AND/OR: allows to create filters with more than one column
SELECT * FROM customers WHERE contact_title = 'Owner' AND country = 'France';

SELECT * FROM customers WHERE country = 'France' OR country = 'Mexico';
SELECT * FROM customers WHERE country IN ('France', 'Mexico'); -- alternative to multiple OR
SELECT * FROM customers WHERE country IN ('Mexico', 'UK', 'Canada');


-- WHERE + LIKE: special filter with text
SELECT * FROM products WHERE quantity_per_unit LIKE '%boxes%'; -- check if text 'boxes' is inside text, can have text before or after

SELECT * FROM products WHERE quantity_per_unit LIKE '%ml%';

-- WHERE + BETWEEN: filter intervals
SELECT * FROM products WHERE unit_price BETWEEN 50 AND 100; -- filtering numbers between interval [50,100]

SELECT * FROM orders WHERE order_date BETWEEN '1997-01-01' AND '1997-12-31';

-- AGGREGATION FUNCTIONS

-- COUNT: count lines. Does not count blank values!!!
SELECT COUNT(*) FROM customers;

SELECT COUNT(region) FROM customers;

SELECT COUNT(*) FROM products;

-- SUM: intuitive :)
SELECT SUM(units_in_stock) AS "StockTotal" FROM products;

SELECT SUM(quantity) FROM order_details;


-- AVG, MAX, MIN: also very intuitive.
SELECT
	MIN(unit_price) AS "MIN",
	AVG(unit_price) AS "AVG",
	MAX(unit_price) AS "MAX"
FROM products;

-- GROUP BY: also intuitive. Group rows by categories :)
-- customers per country
SELECT
	country,
	COUNT(*) AS "NumberCustomers"
FROM customers
GROUP BY country
ORDER BY "NumberCustomers" DESC;

-- customers per title
SELECT
	contact_title,
	COUNT(*) AS "NumberCustomers"
FROM customers
GROUP BY contact_title
ORDER BY "NumberCustomers" DESC;

-- sum stock by supplier
SELECT
	supplier_id,
	SUM(units_in_stock) AS "NumberUnitsStock"
FROM products
GROUP BY supplier_id;

-- AVG stock by supplier
SELECT
	supplier_id,
	AVG(unit_price) AS "AVGPrice"
FROM products
GROUP BY supplier_id;

-- GROUP BY + WHERE: filter before the group by command

-- grouping by country, but filtering only customer that are Owner. Notice that this filter happens before the GROUP BY command.
SELECT
	country,
	COUNT(*) AS "NumberCustomers"
FROM customers
WHERE contact_title = 'Owner'
GROUP BY country
ORDER BY "NumberCustomers" DESC;

-- count customers per country and filter only countries with more than 10 customers. Notice that this filter should happen only after the GROUP BY command.
SELECT
	country,
	COUNT(*) AS "NumberCustomers"
FROM customers
GROUP BY country
HAVING COUNT(*) > 10;











