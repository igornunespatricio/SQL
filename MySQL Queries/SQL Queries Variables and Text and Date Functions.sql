# User Defined Variables: stores data that can be used within the code.
# Different from SQL Server, there is no need to DECLARE the variable if it is a User Defined Variable. DECLARE is only used in MySQL with Local Variables.

SET @quantidade = 10;
SET @preco = 10.90;
SET @receita = @quantidade * @preco;
SELECT @receita AS 'Revenue';

# SELECT + User Defined Variable
SET @marca = 'dell';
SELECT * FROM produtos WHERE Marca_Produto = 'dell';
SELECT * FROM produtos WHERE Marca_Produto = @marca;

# CAST: convert type of values specified inside CAST
# different from SQL Server: for Positive INT we use UNSIGNED and for INT negative or positive use SIGNED
SET @numero = 10.92000;
SET @data = '2021-01-24';
SELECT 
	@numero, 
    CAST(@numero AS SIGNED) AS 'SIGNED', 
    CAST(@numero AS UNSIGNED) AS 'UNSIGNED', 
    CAST(@numero AS DECIMAL(10,2)) AS 'DECIMAL (10,2)', 
    CAST(@numero AS CHAR(3)) AS 'CHAR(3)',
    @data,
    CAST(@data AS DATE),
    CAST(@data AS DATETIME);
    
    
# LENGTH: count characters from a text
SET @variable = 'hello';
SELECT LENGTH(@variable);
SELECT Nome, LENGTH(Nome) AS 'Length' FROM clientes;

# CONCAT: concatenate texts
# CONCAT_WS: allow to specify a separator once only: first parameter of the function
SET @nome = 'Igor';
SET @sobrenome = 'Nunes';
SET @fullName = CONCAT(@nome, @sobrenome);
SELECT @fullName;
SET @fullName = CONCAT(@nome, ' ', @sobrenome);
SELECT @fullName;
SET @ultimoNome = 'Patricio';
SET @nowFullName = CONCAT_WS(' ', @nome, @sobrenome, @ultimoNome);
SELECT @nowFullName;

SELECT CONCAT_WS(' ', Nome, Sobrenome) AS 'FullName' FROM clientes;

# LCASE and UCASE: lower case and upper case, respectively
SET @text2Lower = "Hello";
SET @full2Lower = "HELLO";
SELECT LCASE(@text2Lower), LCASE(@full2Lower);

SET @text2Upper = "Hello";
SET @full2Upper = "hello";
SELECT UCASE(@text2Lower), UCASE(@full2Lower);

SELECT LCASE(CONCAT(Nome, ' ', Sobrenome)), UCASE(CONCAT(Nome, ' ', Sobrenome)) FROM clientes;

# LEFT and RIGHT: extract part of a text from left or right
SELECT Nome, LEFT(Nome,3), RIGHT(Nome, 3) FROM clientes;
SELECT Num_Serie, LEFT(Num_Serie,6) AS 'First Code', RIGHT(Num_Serie,6) AS 'Last Code' FROM produtos;

# REPLACE: changes part of the text to another
SET @variable = 'The best comedy tv series is HIMYM';
SET @correct = REPLACE(@variable, 'HIMYM', 'Friends');
SELECT @correct;
SELECT Nome, Estado_Civil, REPLACE(REPLACE(Estado_Civil, 'S', 'Single'), 'C', 'Married') FROM clientes;

# INSTR: character position in a text
# MID: personalized tet extraction based on initial position
SELECT
	CONCAT_WS(' ', Nome, Sobrenome) AS 'Nome' ,
    Email,
    INSTR(Email, '@') 'index of @',
    LEFT(Email, INSTR(Email, '@')-1) AS 'Before @',
    MID(Email, 2, 5),  -- on second character, take the 5 following
    INSTR(Email, '.') 'index of .',
    MID(Email, INSTR(Email, '@'), INSTR(Email, '.') - INSTR(Email, '@'))  -- after @ character, take the amount of characters between . and @. This is the email domain
FROM clientes;

# DAY: return day of the date
# MONTH: return month of the date
# YEAR: return year of the date

SELECT 
	Data_Nascimento, 
    DAY(Data_Nascimento) 'Day', 
    MONTH(Data_Nascimento)  'Month',
    YEAR(Data_Nascimento) 'Year'
FROM clientes;

# NOW: return current date and hour
# CURDATE: current date
# CURTIME: current time
SELECT NOW(), CURDATE(), CURTIME();

# DATEDIFF: difference between dates
# DATEADD: add month, year day, etc to date
# DATE_SUB: remove days, month, year etc from date
SET @dateInit = '2022-01-01';
SET @endDate = '2023-01-01';

SELECT 
	DATEDIFF(@endDate, @dateInit) AS 'DATEDIFF', 
    DATE_ADD(@dateInit, INTERVAL 10 DAY) AS 'DATE_ADD 10 days',
    DATE_ADD(@dateInit, INTERVAL 10 MONTH) AS 'DATE_ADD 10 months',
    DATE_ADD(@dateInit, INTERVAL 10 YEAR) AS 'DATE_ADD 10 years',
    DATE_SUB(@dateInit, INTERVAL 10 DAY) AS 'DATE_SUB 10 days',
    DATE_SUB(@dateInit, INTERVAL 10 MONTH) AS 'DATE_SUB 10 months',
    DATE_SUB(@dateInit, INTERVAL 10 YEAR) AS 'DATE_SUB 10 years'
    
