USE AdventureWorksDW2014

CREATE OR ALTER VIEW Results_ADW AS
SELECT
	sales.SalesOrderNumber AS 'Order Number',
	sales.OrderDate AS 'Date Order',
	category.EnglishProductCategoryName AS 'Product Category',
	sales.CustomerKey AS 'Client ID',
	CONCAT(customer.FirstName, ' ', customer.LastName) AS 'Client Name',
	CASE
		WHEN customer.Gender = 'F' THEN 'Female'
		WHEN customer.Gender = 'M' THEN 'Male'
	END AS 'Gender',
	geo.EnglishCountryRegionName AS 'Country',
	sales.SalesAmount AS 'Revenue',
	sales.OrderQuantity AS 'Quantity',
	sales.TotalProductCost AS 'Cost',
	sales.SalesAmount - sales.TotalProductCost AS 'Sales Profit'
FROM FactInternetSales AS sales
INNER JOIN DimProduct AS product
	ON sales.ProductKey = product.ProductKey
	INNER JOIN DimProductSubcategory AS subcategory
		ON product.ProductSubcategoryKey = subcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory AS category
			ON subcategory.ProductCategoryKey = category.ProductCategoryKey
INNER JOIN DimCustomer AS customer
	ON sales.CustomerKey = customer.CustomerKey
	INNER JOIN DimGeography AS geo
		ON customer.GeographyKey = geo.GeographyKey

SELECT * FROM Results_ADW

/*
SELECT * FROM DimProduct AS product

SELECT * FROM DimProductSubcategory AS subcategory

SELECT * FROM DimProductCategory as category

SELECT * FROM DimCustomer

SELECT * FROM DimGeography

SELECT * FROM FactInternetSales
*/