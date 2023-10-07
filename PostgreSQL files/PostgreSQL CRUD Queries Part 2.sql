-- CREATE TABLE: intuitive too, creates a table inside te database
CREATE TABLE alunos(
	ID_Aluno INT,
	Nome_Aluno VARCHAR(100),
	Email VARCHAR(100)
);

CREATE TABLE cursos(
	ID_curso INT,
	Nome_Curso VARCHAR(100),
	Preco_curso NUMERIC(10,2)
);

CREATE TABLE matriculas(
	ID_Matricula INT,
	ID_Aluno INT,
	ID_Curso INT,
	Data_Cadastro DATE
);

SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matriculas;

DROP TABLE alunos;
DROP TABLE cursos;
DROP TABLE matriculas;

-- CONSTRAINS: rules applied to columns of a table. Like not null, primary key, foreign key, etc. They limit the values tat can be added in a column.

CREATE TABLE alunos(
	ID_Aluno INT,
	Nome_Aluno VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	PRIMARY KEY(ID_Aluno)
);

CREATE TABLE cursos(
	ID_Curso INT,
	Nome_curso VARCHAR(100) NOT NULL,
	Preco_Curso NUMERIC(10,2) NOT NULL,
	PRIMARY KEY(ID_Curso)
);

CREATE TABLE matriculas(
	ID_Matricula INT,
	ID_Aluno INT,
	ID_Curso INT,
	Data_Cadastro DATE NOT NULL,
	PRIMARY KEY(ID_Matricula),
	FOREIGN KEY(ID_Aluno) REFERENCES alunos(ID_Aluno),
	FOREIGN KEY(ID_Curso) REFERENCES cursos(ID_Curso)
);

-- INSERT INTO: intuitive, insert data in tables. Needs to add the values in the same order as specified in the INSERT INTO command
INSERT INTO alunos(ID_Aluno, Nome_Aluno, Email)
VALUES
	(1, 'Ana', 'ana123@gmail.com'),
	(2, 'Bruno', 'bruno_vargas@outlook.com'),
	(3, 'Carla', 'carlinha1999@gmail.com'),
	(4, 'Diego', 'diicastroneves@gmail.com');

SELECT * FROM alunos;

INSERT INTO cursos
VALUES
	(1, 'Excel', 100),
	(2, 'VBA', 200),
	(3, 'Power BI', 150);
	
SELECT * FROM cursos;

INSERT INTO matriculas
VALUES
	(1, 1, 1, '2021/03/11'),
	(2, 1, 2, '2021/06/21'),
	(3, 2, 3, '2021/01/08'),
	(4, 3, 1, '2021/04/03'),
	(5, 4, 1, '2021/05/10'),
	(6, 4, 3, '2021/05/10');

SELECT * FROM matriculas;

-- UPDATE: update a row of a table

-- update Preco_Curso column from row where ID_Curso is 1 to 300 
UPDATE cursos
SET Preco_Curso = 300
WHERE ID_Curso = 1;

SELECT * FROM cursos;

-- DELETE: intuitive. Delete records/rows from a table
DELETE FROM matriculas
WHERE ID_Matricula = 6

SELECT * FROM matriculas;

-- TRUNCATE TABLE: delete all rows from a table, but keeps the table

TRUNCATE TABLE matriculas;

SELECT * FROM matriculas;

-- DROP TABLE: delete tables. Includes records and tables. BE CAREFUL, returns error when trying to delete tables with constrains like primary key, foreign key and etc.
DROP TABLE alunos;
DROP TABLE cursos;
DROP TABLE matriculas;

-- delete tables from the database. Deletes data and table. CASCADE allows to delete tables even if they depend on other tables (if they have relationship).
DROP TABLE alunos CASCADE;
DROP TABLE cursos CASCADE;
DROP TABLE matriculas CASCADE;


