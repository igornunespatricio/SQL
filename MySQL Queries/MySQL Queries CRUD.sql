# CRUD operations: CRUD stand for Create, Read, Update and Delete information on the database

# CREATE: create the database if it doesn' exist, if the database already exists it raises an error
CREATE DATABASE nome_db;

# create database if it does not exists, raises a warning and not an error if the database already exists
CREATE DATABASE IF NOT EXISTS nome_db;

CREATE DATABASE db_Exemplo;

# SHOW DATABASES: easy to guess :)
SHOW DATABASES;

# USE: change the focus to the database, makes the database the default one
USE db_Exemplo;

# SELECT DATABASE: show the focused database
SELECT DATABASE();

# DROP DATABASE: delete the database from the system, if database does not exists, raises an error
DROP DATABASE db_Exemplo;

# drops the database if it exists, if the database does not exists, raises a warning an not an error
DROP DATABASE IF EXISTS db_Exemplo;

# creating and manipulating database, tables and rows
CREATE DATABASE IF NOT EXISTS db_Exemplo;
USE db_Exemplo;

CREATE TABLE IF NOT EXISTS dAlunos(
	ID_Aluno INT,
	Nome_Aluno VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS dCursos(
	ID_Curso INT,
    Nome_Curso VARCHAR(100),
    Preco_Curso DECIMAL(10,2) # decimal with 10 digits (including the decimal digits and with 2 decimal digits)
);

CREATE TABLE IF NOT EXISTS fMatriculas(
	ID_Matricula INT,
    ID_Aluno INT,
    ID_Curso INT,
    Data_Cadastro DATE
);

# SHOW TABLES: very intuitive :)
SHOW TABLES;
    
DROP TABLE dAlunos;

SELECT * FROM dAlunos;
SELECT * FROM dCursos;
SELECT * FROM fMatriculas;


# CONSTRAINS: limits the values that can be inputed into the columns. For example: only integers, only not nulls, primary key, foreign key, unique, etc.
DROP DATABASE IF EXISTS db_Exemplo;
CREATE DATABASE db_Exemplo;
USE db_Exemplo;
DROP TABLE IF EXISTS dAlunos;
DROP TABLE IF EXISTS dCursos;
DROP TABLE IF EXISTS fMatriculas;

 # creating tables with constrains
 CREATE TABLE dAlunos(
	ID_Aluno INT,
    Nome_Aluno VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PRIMARY KEY(ID_Aluno)
);

CREATE TABLE dCursos(
	ID_Curso INT,
    Nome_Curso VARCHAR(100) NOT NULL,
    Preco_Curso INT NOT NULL,
    PRIMARY KEY(ID_Curso)
);

CREATE TABLE fMatriculas(
	ID_Matricula INT,
    ID_Aluno INT NOT NULL,
    ID_Curso INT NOT NULL,
    Data_Cadastro DATE NOT NULL,
    PRIMARY KEY(ID_Matricula),
    FOREIGN KEY(ID_Aluno) REFERENCES dAlunos(ID_Aluno),
    FOREIGN KEY(ID_Curso) REFERENCES dCursos(ID_Curso)
);


# INSERT INTO: insert rows into the tables. 

# columns specified after dAlunos and rows specified after VALUES must follow the same order
INSERT INTO dAlunos(ID_Aluno, Nome_Aluno, Email)
VALUES
	(1, 'Ana', 'ana123@gmail.com'),
    (2, 'Bruno', 'Bruno_vargas@outlook.com'),
    (3, 'Carla', 'carlinha1999@gmail.com'),
	(4, 'Diego', 'diicastroneves@gmail.com');

INSERT INTO dCursos(ID_Curso, Nome_Curso, Preco_Curso)
VALUES
	(1, 'Excel', 100),
    (2, 'VBA', 200),
    (3, 'Power BI',  150);

INSERT INTO fMatriculas(ID_Matricula, ID_Aluno, ID_Curso, Data_Cadastro)
VALUES
	(1, 1, 1, '2021/03/11'),
    (2, 1, 2, '2021/06/21'),
    (3, 2, 3, '2021/01/08'),
    (4, 3, 1, '2021/04/03'),
    (5, 4, 1, '2021/05/10'),
    (6, 4, 3, '2021/05/10');
    
SELECT * FROM dAlunos;
SELECT * FROM dCursos;
SELECT * FROM fMatriculas;

# UPDATE: update record in a table (don't forget to use the WHERE command, otherwise the whole table are gonna be updated)
UPDATE dCursos
SET Preco_curso = 300
WHERE ID_Curso = 1;

SELECT * FROM dCursos;

# DELETE: delete record from a table (also need to specify the WHERE command to delete the row you want)
DELETE FROM fMatriculas
WHERE ID_Matricula = 6;

SELECT * FROM fMatriculas;

# TRUNCATE TABLE: erase all data (rows and columns) from a table, but keeps the table.
TRUNCATE TABLE fMatriculas;

SELECT * FROM fMatriculas;

# DROP TABLE: erase the data (rows and columns) and also the table.
DROP TABLE fMatriculas;

SELECT * FROM fMatriculas;

