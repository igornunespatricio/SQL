CREATE OR ALTER VIEW InternetSales AS
SELECT
	sales.SalesOrderNumber 'Order',
	sales.OrderDate AS 'Date',
	category.EnglishProductCategoryName AS 'Category',
	CONCAT(customer.FirstName, ' ', customer.LastName) AS 'Client Name',
	customer.Gender AS 'Gender',
	territory.SalesTerritoryCountry AS 'Country',
	sales.OrderQuantity AS 'Quantity Sales',
	sales.TotalProductCost AS 'Cost Sales',
	sales.SalesAmount AS 'Revenue Sales'
FROM
	FactInternetSales AS sales
INNER JOIN DimProduct AS product
	ON sales.ProductKey = product.ProductKey
	INNER JOIN DimProductSubcategory AS subcategory
		ON product.ProductSubcategoryKey = subcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory AS category
			ON subcategory.ProductCategoryKey = category.ProductCategoryKey
INNER JOIN DimCustomer as customer
	ON sales.CustomerKey = customer.CustomerKey
INNER JOIN DimSalesTerritory AS territory
	ON sales.SalesTerritoryKey = territory.SalesTerritoryKey
WHERE YEAR(sales.OrderDate) = 2013