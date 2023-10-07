CREATE SEQUENCE projetos_seq
AS INT 
START WITH 1
INCREMENT BY 1
NO MAXVALUE
NO CYCLE


CREATE TABLE dProjeto(
	id_projeto INT,
	nome_projeto VARCHAR(100) NOT NULL,
	
	CONSTRAINT dProjeto_id_projeto_pk PRIMARY KEY(id_projeto)
)

INSERT INTO dProjeto(id_projeto, nome_projeto)
VALUES
	(NEXT VALUE FOR projetos_seq, 'Planejamento Estratégico'),
	(NEXT VALUE FOR projetos_seq, 'Desenvolvimento de App'),
	(NEXT VALUE FOR projetos_seq, 'Plano de Negócios'),
	(NEXT VALUE FOR projetos_seq, 'Visualização 3D')


INSERT INTO dProjeto(id_projeto, nome_projeto)
VALUES
	(NEXT VALUE FOR projetos_seq, 'Mapeamento de Processos')

SELECT * FROM dProjeto

