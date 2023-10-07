# FUNCTIONS AND STORED PROCEDURES

# FUNCTIONS: routine or set of codes that can be stored and executed always when we want. Create a block of codes to be more practical (called routine). This can be stored in the database whenever whe need it.

# changes the default delimiter ";" to "$$" to allow the function to run until the end and don't stop in the first command inside the BEGIN

# EXAMPLE 1
DELIMITER $$
CREATE FUNCTION fn_BoasVindas(nome VARCHAR(100))
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	RETURN CONCAT('Olá ', nome, ', tudo bem?');
END;
$$

DELIMITER ;  # changing the delimiter back to ;

SELECT fn_BoasVindas(Nome) FROM clientes;

# EXAMPLE 2
DELIMITER $$
CREATE FUNCTION fn_Faturamento(preco DECIMAL(10, 2), quantidade INT)
RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
	RETURN preco * quantidade;
END;
$$

DELIMITER ;

SELECT fn_Faturamento(10.99, 100);

# EXAMPLE 3
DELIMITER $$
CREATE FUNCTION fn_RemoveAcentos(texto VARCHAR(1000))
RETURNS VARCHAR(1000) DETERMINISTIC
BEGIN
	SET 
		texto = REPLACE(texto, 'á', 'a'),
        texto = REPLACE(texto, 'é', 'e'),
        texto = REPLACE(texto, 'í', 'i'),
        texto = REPLACE(texto, 'ó', 'o'),
        texto = REPLACE(texto, 'ú', 'u'),
        texto = REPLACE(texto, 'à', 'a'),
        texto = REPLACE(texto, 'è', 'e'),
        texto = REPLACE(texto, 'ì', 'i'),
        texto = REPLACE(texto, 'ò', 'o'),
        texto = REPLACE(texto, 'ù', 'u');
        # other combinations can be added here, I won't do that because I am lazy :)
		RETURN texto;
END;
$$

DELIMITER ;

SELECT Endereco, fn_RemoveAcentos(Endereco) FROM lojas;

# ALTER FUNCTION: changes a function. Can right click on the function on the Navigator panel and click on Alter Function, change the function, click on apply and then finish and use the function again :). In the case below, I changed the "-" to ";"
SELECT Endereco, fn_RemoveAcentos(Endereco) FROM lojas;

# DETERMINISTIC: it's used to prevent unespected things from happening with the data? not sure. You can use the following global statement to create functions without needing the DETERMINISTIC command after every RETURNS

SET GLOBAL log_bin_trust_function_creators = 1;


# STORED PROCEDURES: programs or scripts that can alter globally the database. Can use INSERT , UPDATE, DELETE, etc with procedures. Sintaxe is similar to functions, but doesn't need to RETURN anything.
USE db_Exemplo;

DELIMITER $$

CREATE PROCEDURE sp_AtualizaPreco(NovoPreco DECIMAL(10, 2), ID INT)
BEGIN
	# updating the price of the course
	UPDATE dCursos
    SET Preco_Curso = NovoPreco
    WHERE ID_Curso = ID;
    # printing a message saying the price was updated successfully
    SELECT "Price Updated successfully!";
END;
$$

DELIMITER ;

SELECT * FROM dCursos;

# CALL: used to run the procedure
CALL sp_AtualizaPreco(400, 1);

SELECT * FROM dCursos;

CALL sp_AtualizaPreco(700, 2);

SELECT * FROM dCursos;

# LOCAL VARIABLES: used inside functions and stored procedures. Scope of this variables is the function or procedure, meaning that after executing the function or stored procedure, the variable will not exist anymore.alter

# stored procedure to apply discount to a course based on course ID. It prints messages on the screen and updates the database dCursos.
DELIMITER $$
CREATE PROCEDURE sp_AplicaDesconto(ID INT, Desconto DECIMAL(10, 2))
BEGIN
	DECLARE PrecoComDesconto DECIMAL(10, 2);
	DECLARE NomeCurso VARCHAR(100);
    DECLARE PrecoAntigo DECIMAL(10, 2);
    
    # using subqueries to get the olf price of the course
    SET PrecoAntigo = (SELECT Preco_Curso FROM dCursos WHERE ID_Curso = ID);
    SET NomeCurso = (SELECT Nome_Curso FROM dCursos WHERE ID_Curso = ID);
    SET PrecoComDesconto = PrecoAntigo * (1 - Desconto);
    
    UPDATE dCursos
    SET Preco_Curso = PrecoComDesconto
    WHERE ID_Curso = ID;
    
    SELECT CONCAT("Desconto de ", Desconto * 100, "% aplicado com sucesso!");
    SELECT CONCAT("Curso: ", NomeCurso, "; Preco Antigo: R$", PrecoAntigo, "; Preco Novo: R$", PrecoComDesconto);
    SELECT "Código executado com sucesso!";
END;
$$

DELIMITER ;

SELECT * FROM dCursos;

CALL sp_AplicaDesconto(2, 0.1);

SELECT * FROM dCursos;

# ALTER procedure: same steps as the steps to ALTER the functions. Go to the stored procedure, right click, click ALTER Stored Procedure, make the modifications and Apply and Finish. 
# I changed the message title of each of the selects.
CALL sp_AplicaDesconto(3, 0.01);

SELECT * FROM dCursos;

# FUNCTIONS vs STORED PROCEDURES: 
# - Functions are used to compute a value based in inputs while stored procedures can return a result but not necessarily.
# - Functions don't allow CRUD operations in databases, while Stored Procedures can.
# - Functions are allowed to use SELECT, WHERE, HAVING, etc.
# - Function can be used inside a Stored Procedure, but a Stored Procedure can't be used inside a Function.
# In summary, Functions are used to compute values and Stored Procedures are used to modify the database.
