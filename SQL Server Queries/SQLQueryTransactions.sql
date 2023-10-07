
-- playing with transactions
SELECT *
INTO cliente_aux
FROM dCliente

SELECT * FROM cliente_aux

BEGIN TRANSACTION
INSERT INTO cliente_aux(nome_cliente, genero, data_de_nascimento, cpf)
VALUES
	('Maria Julia', 'F', '30/04/1995', '987.654.321-00')

SELECT * FROM cliente_aux

ROLLBACK TRANSACTION

SELECT * FROM cliente_aux

BEGIN TRANSACTION
INSERT INTO cliente_aux(nome_cliente, genero, data_de_nascimento, cpf)
VALUES
	('Maria Julia', 'F', '30/04/1995', '987.654.321-00')

SELECT * FROM cliente_aux

COMMIT TRANSACTION

SELECT * FROM cliente_aux

ROLLBACK TRANSACTION

BEGIN TRANSACTION
UPDATE cliente_aux
SET cpf='999.999.999-99'
WHERE id_cliente=1

SELECT * FROM cliente_aux

ROLLBACK TRANSACTION

SELECT * FROM cliente_aux

BEGIN TRANSACTION
UPDATE cliente_aux
SET cpf='999.999.999-99'
WHERE id_cliente=1

SELECT * FROM cliente_aux

COMMIT TRANSACTION

-- playing with names of transactions
BEGIN TRANSACTION T1
INSERT INTO cliente_aux(nome_cliente, genero, data_de_nascimento, cpf)
VALUES
	('Naldo Reis', 'M', '10/02/1992', '412.889.311-90')

SELECT * FROM cliente_aux

ROLLBACK TRANSACTION T1

SELECT * FROM cliente_aux


-- commit transaction or not depending if the value was already in the table
DECLARE @contador INT

BEGIN TRANSACTION T1
INSERT INTO cliente_aux(nome_cliente, genero, data_de_nascimento, cpf)
VALUES
	('Ruth Campos', 'F', '23/03/1992', '324.731.903-89')

SELECT @contador = COUNT(*) FROM cliente_aux WHERE nome_cliente = 'Ruth Campos'

IF @contador = 1
	BEGIN
		COMMIT TRANSACTION T1
		PRINT 'Ruth Campos cadastrada com sucesso.'
	END
ELSE
	BEGIN
		ROLLBACK TRANSACTION T1
		PRINT 'Ruth Campos já havia sido cadastrada na tabela. INSERT abortado.'
	END

SELECT * FROM cliente_aux

-- try and catch
BEGIN TRY
	BEGIN TRANSACTION T1
		UPDATE cliente_aux
		SET data_de_nascimento='15/03/1992'
		WHERE id_cliente=4
	COMMIT TRANSACTION T1
	PRINT 'Data atualizada com sucesso.'
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION T1
	PRINT 'Data cadastrada inválida.'
END CATCH
	
SELECT * FROM cliente_aux


-- Nested Transactions and count number of open transactions (not commited yet)
BEGIN TRANSACTION T1
	PRINT @@TRANCOUNT	
	
	BEGIN TRANSACTION T2
		PRINT @@TRANCOUNT

	COMMIT TRANSACTION T2
	PRINT @@TRANCOUNT
	
COMMIT TRANSACTION T1
PRINT @@TRANCOUNT

-- exercise
USE AlugaFacil
INSERT INTO Carro(placa, modelo, tipo)
VALUES
	('DAS-1412', 'Hyundai HB20', 'Hatch'),
	('JHG-3902', 'Fiat Cronos', 'Sedan')

SELECT * FROM Carro

BEGIN TRANSACTION
INSERT INTO Carro(placa, modelo, tipo)
VALUES
	('CDR-0090', 'Fiat Argo', 'Hatch')

COMMIT TRANSACTION

SELECT * FROM Carro

BEGIN TRANSACTION
UPDATE Carro
SET tipo='Sedan'
WHERE id_carro=4
COMMIT

SELECT * FROM Carro

BEGIN TRANSACTION
DELETE FROM Carro
WHERE id_carro=6

SELECT * FROM Carro

ROLLBACK TRANSACTION

SELECT * FROM Carro

BEGIN TRANSACTION
DELETE FROM Carro
WHERE id_carro=6

SELECT * FROM Carro

COMMIT TRANSACTION

SELECT * FROM Carro
