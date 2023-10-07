-- Pivot Tables

USE ContosoRetailDW

-- very manual inside the IN clause/command. There is a more automatic way below
SELECT * FROM
(SELECT
	ProductKey,
	BrandName
FROM DimProduct) AS Dados
PIVOT(
	COUNT(ProductKey)
	FOR BrandName
	IN (
		[Contoso],
		[Litware]
	)
) AS PivotTable

-- also manual, but how to also use group in rows (just add one row that will not be in the PIVOT command part, this will craete a one level group)
-- also add group by in the end to group by year
SELECT * FROM
	(SELECT	
		EmployeeKey,
		YEAR(HireDate) AS Year,
		DepartmentName
	FROM DimEmployee) AS Dados
PIVOT(
	COUNT(EmployeeKey)
	FOR DepartmentName
	IN(
		[Document Control],
		[Engineering],
		[Executive],
		[Facilities and Maintenance],
		[Finance]
	)
) AS PivotTable
ORDER BY Year DESC

-- adding more group levels (2)
SELECT * FROM
	(SELECT	
		EmployeeKey,
		YEAR(HireDate) AS Year,
		MONTH(HireDate) AS Month,
		DepartmentName
	FROM DimEmployee) AS Dados
PIVOT(
	COUNT(EmployeeKey)
	FOR DepartmentName
	IN(
		[Document Control],
		[Engineering],
		[Executive],
		[Facilities and Maintenance],
		[Finance]
	)
) AS PivotTable
ORDER BY Year, Month

-- adding columns automatically in the IN command
DECLARE @columnNames NVARCHAR(MAX) = ''			-- [column1], [column2],...,[column11], [column12],
SELECT	@columnNames += QUOTENAME(TRIM(DepartmentName)) + ',' FROM (SELECT DISTINCT DepartmentName FROM DimEmployee) AS aux
SET @columnNames = LEFT(@columnNames, LEN(@columnNames)-1)
--PRINT @columnNames
-- adding only the @columnName variable into the IN() command does not work. To solve that, it is necessary to convert the whole query to text using the variable @columnName with a placeholder. After that is necessary to convert the text back to a query.

DECLARE @SQL NVARCHAR(MAX) = ''
SET @SQL = 
'SELECT * FROM
	(SELECT	
		EmployeeKey,
		YEAR(HireDate) AS Year,
		MONTH(HireDate) AS Month,
		DepartmentName
	FROM DimEmployee) AS Data
PIVOT(
	COUNT(EmployeeKey)
	FOR DepartmentName
	IN(' + @columnNames + ')
) AS PivotTable
ORDER BY Year, Month'

PRINT @SQL

EXECUTE sp_executesql @SQL