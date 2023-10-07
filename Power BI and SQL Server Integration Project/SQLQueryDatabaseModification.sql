-- updating the database to visualize changes in the Power BI report

USE AdventureWorksDW2014

BEGIN TRANSACTION T1

	UPDATE FactInternetSales
	SET OrderQuantity = 1

COMMIT TRANSACTION T1

SELECT * FROM FactInternetSales WHERE OrderQuantity > 1

SELECT * FROM FactInternetSales