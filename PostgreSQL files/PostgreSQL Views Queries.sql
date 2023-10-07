-- VIEWS

-- ways of storing query results as a table inside the database. Fast way of reusing queries, they keep stored and there is no need to create the SQL query everytime, because the

CREATE OR REPLACE VIEW viewProducts AS
SELECT
	product_id,
	product_name,
	unit_price
FROM products;

SELECT * FROM viewProducts;

-- including in the viewProducts the units_in_stock column. Alter the view.
CREATE OR REPLACE VIEW viewProducts AS
SELECT
	product_id,
	product_name,
	unit_price,
	units_in_stock
FROM products;

SELECT * FROM viewProducts;

-- ALTER name of a view:  BE CAREFUL with altering the name of the view if you already created other codes with the previous view name, this will broke the connection.
ALTER VIEW viewProducts RENAME TO viewProd;
SELECT * FROM viewProducts;
SELECT * FROM viewProd;

-- DROP VIEW: using IF EXISTS gives us a warning, if the command IF EXISTS does not exists, there will be an error and not a warning
DROP VIEW IF EXISTS viewProd;
DROP VIEW viewProd; -- also works, but if there is no viewProd view, an error will be returned and not a warning as in the code above.


