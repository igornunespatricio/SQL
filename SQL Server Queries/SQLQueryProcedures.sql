-- PROCEDURES

-- Block of code that can be stored in a script so we can run whenever we want.
USE Exercicios
CREATE PROCEDURE prOrderManagers
AS
BEGIN
	SELECT
		id_gerente,
		nome_gerente,
		salario
	FROM dGerente
	ORDER BY salario DESC
END

EXECUTE prOrderManagers

--procedure with parameter
CREATE OR ALTER PROCEDURE prListClients(@gender VARCHAR(MAX))
AS
BEGIN
	SELECT
		nome_cliente,
		genero,
		data_de_nascimento,
		cpf
	FROM dCliente
	WHERE genero=@gender
END

EXECUTE prListClients 'M'

-- more than 1 parameter
CREATE OR ALTER PROCEDURE prListClients(@gender VARCHAR(MAX), @birthYear INT)
AS
BEGIN
	SELECT
		nome_cliente,
		genero,
		data_de_nascimento,
		cpf
	FROM dCliente
	WHERE genero=@gender AND YEAR(data_de_nascimento) = @birthYear
END

EXECUTE prListClients 'M', 1989

-- with default parameter. similar to python :)
CREATE OR ALTER PROCEDURE prListClients(@gender VARCHAR(MAX)='M', @birthYear INT)
AS
BEGIN
	SELECT
		nome_cliente,
		genero,
		data_de_nascimento,
		cpf
	FROM dCliente
	WHERE genero=@gender AND YEAR(data_de_nascimento) = @birthYear
END

EXECUTE prListClients @birthYear=1989


CREATE OR ALTER PROCEDURE prRegistraContrato(@gerente VARCHAR(MAX), @cliente VARCHAR(MAX), @valor FLOAT)
AS
BEGIN
	DECLARE
		@idGerente INT,
		@idCliente INT
	SELECT @idGerente = id_gerente FROM dGerente WHERE nome_gerente=@gerente
	SELECT @idCliente = id_cliente FROM dCliente WHERE nome_cliente=@cliente
	INSERT INTO fContratos(data_assinatura, id_cliente, id_gerente, valor_contrato)
	VALUES (GETDATE(), @idCliente, @idGerente, @valor)
	PRINT 'Contrato registrado com sucesso!'
END

EXECUTE prRegistraContrato @gerente='Lucas Sampaio', @cliente='Gustavo Barbosa', @valor=5000

SELECT 
	data_assinatura, nome_gerente, nome_cliente, valor_contrato
FROM fContratos
INNER JOIN dCliente
	ON fContratos.id_cliente = dCliente.id_cliente
INNER JOIN dGerente
	ON fContratos.id_gerente = dGerente.id_gerente

DROP PROCEDURE prRegistraContrato

-- exercises
USE ContosoRetailDW

CREATE OR ALTER PROCEDURE summaryProducts(@brand VARCHAR(MAX) = 'Contoso')
AS
BEGIN
	SELECT
		c.ProductCategoryName,
		COUNT(*) AS 'Number of Products'
	FROM
		DimProduct AS p
	LEFT JOIN DimProductSubcategory AS s
		ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
		LEFT JOIN DimProductCategory AS c
			ON s.ProductCategoryKey = c.ProductCategoryKey
	WHERE p.BrandName = @brand
	GROUP BY c.ProductCategoryName
END

EXECUTE summaryProducts 'Litware'

CREATE OR ALTER PROCEDURE topNClients(@topN INT)
AS
BEGIN
	SELECT TOP(@topN)
		CONCAT(c.FirstName, '  ', c.LastName) AS 'Name',
		c.EmailAddress,
		c.DateFirstPurchase
	FROM
		DimCustomer AS c
	WHERE c.CustomerType = 'Person'
	ORDER BY c.DateFirstPurchase ASC
END

EXECUTE topNClients 50

CREATE OR ALTER PROCEDURE listStaff(@month VARCHAR(MAX), @year INT)
AS
BEGIN
	SELECT 
		* 
	FROM DimEmployee AS e 
	WHERE YEAR(e.HireDate) = @year AND DATENAME(MONTH, e.HireDate) = @month
	ORDER BY e.HireDate
END

EXECUTE listStaff @year = 2000, @month = 'Janeiro'

USE AlugaFacil
CREATE OR ALTER PROCEDURE insertCar(@plate VARCHAR(100), @model VARCHAR(100), @type VARCHAR(100), @value FLOAT)
AS
BEGIN
	INSERT INTO Carro(placa, modelo, tipo, valor)
	VALUES (@plate, @model, @type, @value)
END

EXECUTE insertCar @plate='BMW-5555', @model = 'BMW', @type = 'SUV', @value=250000

SELECT * FROM Carro

CREATE OR ALTER PROCEDURE alterCarValue(@id INT, @value FLOAT)
AS
BEGIN
	UPDATE Carro
	SET valor = @value
	WHERE id_carro = @id
END

EXECUTE alterCarValue @id = 4, @value = 120000

CREATE OR ALTER PROCEDURE deleteCar(@id INT)
AS
BEGIN
	DELETE FROM Carro
	WHERE id_carro = @id
END

EXECUTE deleteCar @id = 8

SELECT * FROM Carro