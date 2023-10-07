-- Triggers

-- Triggers are activated when an event happens. Can be activated when DDL events (CREATE, ALTER, DROP) and/or DML events (INSERT, UPDATE, DELETE) happens

-- DDL is Data Definition Language: it defines and manages the database structure.
-- DML is Data Manipulation Language: manipulates data stored in databases.

-- Using the command AFTER, the Trigger happens after the code is completed
-- Using the command INSTEAD OF, the Trigger happens before the code is completed, blocking it from running

-- TRIGGERS DML
-- Using command AFTER
USE Exercicios
CREATE OR ALTER TRIGGER tgClientAlter
ON dCLiente
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	PRINT 'Dados da tabela dCliente foram alterados'
END

SELECT * FROM dCliente

BEGIN TRANSACTION t1
INSERT INTO dCliente(nome_cliente, genero, data_de_nascimento, cpf)
VALUES ('Zacarias Neto', 'M', '13/02/1999', '139.543.189-00')

SELECT * FROM dCliente

ROLLBACK TRANSACTION t1
COMMIT TRANSACTION t1

UPDATE dCLiente
SET cpf = '130.451.892-10'
WHERE id_cliente = 12

DELETE FROM dCliente
WHERE id_cliente = 12

-- identify ig the trigger was from the DELETED table
CREATE OR ALTER TRIGGER tgClientAlter
ON dCLiente
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	--PRINT 'Dados da tabela dCliente foram alterados'
	SELECT * FROM DELETED
END

INSERT INTO dCliente(nome_cliente, genero, data_de_nascimento, cpf)
VALUES ('Zacarias Neto', 'M', '13/02/1999', '139.543.189-00')

SELECT * FROM dCliente

DELETE FROM dCliente
WHERE id_cliente = 13

UPDATE dCLiente
SET cpf = '130.451.892-10'
WHERE id_cliente = 14

-- identifying the Trigger event and printing it
CREATE OR ALTER TRIGGER tgClientAlter
ON dCLiente
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	IF EXISTS (SELECT * FROM INSERTED) AND EXISTS (SELECT * FROM DELETED)
		PRINT 'Dados foram atualizados na tabela'
	ELSE IF EXISTS (SELECT * FROM INSERTED)
		PRINT 'Dados foram inseridos na tabela'
	ELSE IF EXISTS (SELECT * FROM DELETED)
		PRINT 'Dados foram deletados da tabela'
END

INSERT INTO dCliente(nome_cliente, genero, data_de_nascimento, cpf)
VALUES ('Zacarias Neto', 'M', '13/02/1999', '139.543.189-00')

SELECT * FROM dCliente

DELETE FROM dCliente
WHERE id_cliente = 14

UPDATE dCLiente
SET cpf = '130.451.892-10'
WHERE id_cliente = 15

--Using command INSTEAD OF (be aware that INSTEAD OF runs the Trigger before the command that caused the trigger. So it you run the Trigger for every insert delete or update in dCliente, you have to make sure the command runs if passes the text, for example if it was run between 5h and 24h, you should use ELSE to be sure the command runs, otherwise it will run nothing.
CREATE OR ALTER TRIGGER triggerBlockIfNotWorkHour
ON dCliente
INSTEAD OF INSERT, DELETE, UPDATE
AS
BEGIN
	DECLARE 
		@hourNow INT = DATEPART(HOUR, GETDATE()),
		@minuteNow INT = FORMAT(DATEPART(MINUTE, GETDATE()), '00')
	IF @hourNow >= 24 OR @hourNow <= 5
		BEGIN
			RAISERROR('O cadastro de clientes só pode ser feito entre 5 horas e 22 horas. Porém foi feito às %d hora(s) e %d minuto(s). Alteração não concluída!',1 ,1, @hourNow, @minuteNow)
			ROLLBACK
		END
	ELSE
		BEGIN
			INSERT INTO dCliente(nome_cliente, genero, data_de_nascimento, cpf)
			SELECT nome_cliente, genero, data_de_nascimento, cpf FROM INSERTED
		END
END

INSERT INTO dCliente(nome_cliente, genero, data_de_nascimento, cpf)
VALUES ('Julio Albuquerqe', 'M', '13/02/1999', '111.222.189-00')

SELECT * FROM dCliente

-- how to enable, disable and delete Triggers

DISABLE TRIGGER ALL ON dCliente

ENABLE TRIGGER triggerBlockIfNotWorkHour ON dCliente

DISABLE TRIGGER triggerBlockIfNotWorkHour ON dCliente

DROP TRIGGER triggerBlockIfNotWorkHour

--TRIGGERS DDL

-- Triggers related to creating, altering and deleting tables. It is similiar to Triggers DDL, but is more related to the database in use. Examples follows below.

USE Exercicios
CREATE OR ALTER TRIGGER refuseTables
ON DATABASE -- will be applied to the used database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	PRINT 'Not allowed to create, alter or delete tables.'
	ROLLBACK
END

CREATE TABLE test(ID INT)

DISABLE TRIGGER ALL ON DATABASE

ENABLE TRIGGER refuseTables ON DATABASE
