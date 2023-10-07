-- Example of changing the database. This will create the chain modifications below: It will modify the View, which will modify the table in the Sales sheet in the excel file, which will modify the pivot tables in the Analysis, which will modify the charts in the Report sheet.
USE AdventureWorksDW2014

BEGIN TRANSACTION T1
	UPDATE FactInternetSales
	SET OrderQuantity = 20
	WHERE ProductKey = 361  -- Bike category
COMMIT TRANSACTION T1

SELECT * FROM FactInternetSales
WHERE ProductKey IN (361)