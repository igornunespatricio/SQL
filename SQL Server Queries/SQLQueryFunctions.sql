-- Recreating the database Exercicios to practice Functions

--CREATE DATABASE Exercicios

USE Exercicios

CREATE TABLE dCliente(
id_cliente INT IDENTITY(1, 1),
nome_cliente VARCHAR(100) NOT NULL,
genero VARCHAR(100) NOT NULL,
data_de_nascimento DATE NOT NULL,
cpf VARCHAR(100) NOT NULL,
CONSTRAINT dcliente_id_cliente_pk PRIMARY KEY(id_cliente),
CONSTRAINT dcliente_genero CHECK(Genero IN ('M', 'F', 'O', 'PND')),
CONSTRAINT dcliente_cpf_un UNIQUE(cpf)
)

INSERT INTO dCliente(Nome_Cliente, Genero, Data_de_Nascimento, CPF)
VALUES
('André Martins', 'M', '12/02/1989', '839.283.190-00'),
('Bárbara Campos', 'F', '07/05/1992', '351.391.410-02'),
('Carol Freitas', 'F', '23/04/1985', '139.274.921-12'),
('Diego Cardoso',  'M', '11/10/1994', '192.371.081-17'),
('Eduardo Pereira', 'M', '09/11/1988', '193.174.192-82'),
('Fabiana Silva', 'F', '02/09/1989', '231.298.471-98'),
('Gustavo Barbosa', 'M', '27/06/1993', '240.174.171-76'),
('Helen Viana',  'F', '11/02/1990', '193.129.183-01'),
('Igor Castro',  'M', '21/08/1989', '184.148.102-29'),
('Juliana Pires',  'F', '13/01/1991', '416.209.192-47')

SELECT * FROM dCliente

CREATE TABLE dGerente(
id_gerente INT IDENTITY(1, 1),
nome_gerente VARCHAR(100) NOT NULL,
data_contratacao VARCHAR(100) NOT NULL,
salario FLOAT NOT NULL,
CONSTRAINT dgerente_id_gerente_pk PRIMARY KEY(id_gerente),
CONSTRAINT dgerente_salario_ck CHECK(salario > 0)
)

INSERT INTO dGerente(Nome_Gerente, Data_Contratacao, Salario)
VALUES
('Lucas Sampaio',  '21/03/2015', 6700),
('Mariana Padilha', '10/01/2011', 9900),
('Nathália Santos', '03/10/2018', 7200),
('Otávio Costa',  '18/04/2017', 11000)


SELECT * FROM dGerente

CREATE TABLE fContratos(
id_contrato INT IDENTITY(1, 1),
data_assinatura DATE DEFAULT GETDATE(),
id_cliente INT,
id_gerente INT,
valor_contrato FLOAT,
CONSTRAINT fcontratos_id_contrato_pk PRIMARY KEY(id_contrato),
CONSTRAINT fcontratos_id_cliente_fk FOREIGN KEY(id_cliente) REFERENCES dCliente(id_cliente),
CONSTRAINT fcontratos_id_gerente_fk FOREIGN KEY(id_gerente) REFERENCES dGerente(id_gerente),
CONSTRAINT fcontratos_valor_contrato_ck CHECK(valor_contrato > 0)
)

INSERT INTO fContratos(Data_Assinatura, ID_Cliente, ID_Gerente, Valor_Contrato)
VALUES
('12/01/2019', 8, 1, 23000),
('10/02/2019', 3, 2, 15500),
('07/03/2019', 7, 2, 6500),
('15/03/2019', 1, 3, 33000),
('21/03/2019', 5, 4, 11100),
('23/03/2019', 4, 2, 5500),
('28/03/2019', 9, 3, 55000),
('04/04/2019', 2, 1, 31000),
('05/04/2019', 10, 4, 3400),
('05/04/2019', 6, 2, 9200)


SELECT * FROM fContratos

-- Practicing Functions

SELECT
	nome_cliente,
	data_de_nascimento,
	DATENAME(DW, data_de_nascimento) + ', ' +
	DATENAME(D, data_de_nascimento) + ' de ' +
	DATENAME(M, data_de_nascimento) + ' de ' +
	DATENAME(YY, data_de_nascimento)
FROM
	dCliente

CREATE FUNCTION fnDataCompleta(@data AS DATE)
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN DATENAME(DW, @data) + ', ' + 
			DATENAME(D, @data) + ' de ' + 
			DATENAME(M, @data) + ' de ' + 
			DATENAME(YY, @data)
END

SELECT
	nome_cliente,
	data_de_nascimento,
	[dbo].[fnDataCompleta](data_de_nascimento)
FROM
	dCliente

DROP FUNCTION fnDataCompleta

CREATE OR ALTER FUNCTION fnDataCompleta(@data AS DATE)
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN DATENAME(DW, @data) + ', ' + 
			DATENAME(D, @data) + ' de ' + 
			DATENAME(M, @data) + ' de ' + 
			DATENAME(YY, @data) + ' - ' +
			CASE
				WHEN MONTH(@data) <= 6 THEN '1° Semestre'
				ELSE '2° Semestre'
			END
END

SELECT
	nome_cliente,
	data_de_nascimento,
	[dbo].[fnDataCompleta](data_de_nascimento)
FROM
	dCliente

INSERT INTO dGerente(nome_gerente, data_contratacao, salario) 
VALUES
	('Joao', '10/01/2019', 3100)

--problem with the function below that the charindex can't find the space and then it raises an error with the LEFT function
SELECT
	nome_gerente,
	LEFT(nome_gerente, CHARINDEX(' ',nome_gerente)-1) AS primeiro_nome
FROM
	dGerente

CREATE OR ALTER FUNCTION fnPrimeiroNome(@nomeCompleto AS VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @posicaoEspaco AS INT
	DECLARE @resposta AS VARCHAR(MAX)

	SET @posicaoEspaco = CHARINDEX(' ', @nomeCompleto) --position of space character, if not found it is 0
	
	IF @posicaoEspaco=0
		SET @resposta = @nomeCompleto
	ELSE
		SET @resposta = LEFT(@nomeCompleto, @posicaoEspaco-1) --take the first name before the space
	
	RETURN @resposta
END

SELECT
	nome_gerente,
	dbo.fnPrimeiroNome(nome_gerente)
FROM
	dGerente

-- Exercises

CREATE OR ALTER FUNCTION fnCalculateTime(@initial_date AS DATE, @final_date AS DATE)
RETURNS INT
AS
BEGIN
	IF @final_date IS NULL SET @final_date = GETDATE()
	RETURN DATEDIFF(YEAR, @initial_date, @final_date)
END

USE ContosoRetailDW

SELECT
	FirstName,
	HireDate,
	EndDate,
	Exercicios.dbo.fnCalculateTime(HireDate, EndDate)
FROM
	DimEmployee

USE Exercicios
CREATE OR ALTER FUNCTION fnIncreaseRate(@rate FLOAT, @employeeStatus VARCHAR(MAX), @rateBonus FLOAT)
RETURNS FLOAT
AS
BEGIN
	IF @employeeStatus <> 'Current' SET @rateBonus = 0
	RETURN @rate * @rateBonus
END

USE ContosoRetailDW

SELECT
	FirstName,
	BaseRate,
	DimEmployee.Status,
	Exercicios.dbo.fnIncreaseRate(BaseRate, DimEmployee.Status, 0.5)
FROM
	DimEmployee

CREATE OR ALTER FUNCTION select_genero(@genero VARCHAR(100))
RETURNS TABLE
AS
RETURN (SELECT * FROM DimCustomer WHERE Gender = @genero)

SELECT * FROM select_genero('F')

CREATE OR ALTER FUNCTION colors_analize(@brand VARCHAR(MAX))
RETURNS TABLE
AS
RETURN (SELECT ColorName, COUNT(*) AS 'NumberProducts' FROM DimProduct WHERE BrandName=@brand GROUP BY ColorName)

SELECT * FROM colors_analize('Litware') ORDER BY 'NumberProducts' DESC
