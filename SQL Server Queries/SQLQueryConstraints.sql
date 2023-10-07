CREATE TABLE dCliente (
	id_cliente INT IDENTITY(1,1), --come�a em 1 e incrementa de 1 em 1
	nome_cliente VARCHAR(100) NOT NULL,
	genero VARCHAR(100) NOT NULL,
	data_nascimento DATE NOT NULL,
	cpf VARCHAR(100) NOT NULL,

	CONSTRAINT dclientes_id_cliente_pk PRIMARY KEY(id_cliente),
	CONSTRAINT dclientes_id_clientes_ck CHECK(genero IN ('M', 'F', 'O', 'PND')),
	CONSTRAINT dclientes_cpf_un UNIQUE(cpf)
)

INSERT INTO dCliente(nome_cliente, genero, data_nascimento, cpf)
VALUES
	('Andr� Martins', 'M', '12/02/1989', '839.283.190-00'),
	('B�rbara Campos', 'F', '07/05/1992', '351.391.410-02'),
	('Carol Freitas', 'F', '23/04/1985', '139.274.921-02'),
	('Diego Cardoso', 'M', '11/10/1994', '192.371.081-17'),
	('Eduardo Pereira', 'M', '09/11/1988', '193.174.192-82'),
	('Fabiana Silva', 'F', '02/09/1989', '231.298.471-98'),
	('Gustavo Barbosa', 'M', '27/06/1993', '240.174.171-76'),
	('Helen Viana', 'F', '11/02/1990', '193.129.183-01'),
	('Igor Castro', 'M', '21/08/1989', '184.148.102.29'),
	('Juliana Pires', 'F', '13/01/1991', '416.209.192-47')


SELECT * FROM dCliente


CREATE TABLE dGerente (
	id_gerente INT IDENTITY(1,1),
	nome_gerente VARCHAR(100) NOT NULL,
	data_contratacao VARCHAR(100) NOT NULL,
	salario FLOAT NOT NULL,

	CONSTRAINT dGerente_id_gerente_pk PRIMARY KEY(id_gerente),
	CONSTRAINT dGerente_salario_ck CHECK(salario > 0)
)

INSERT INTO dGerente (nome_gerente, data_contratacao, salario)
VALUES
	('Lucas Sampaio', '21/03/2015', 6700),
	('Mariana Padilha', '10/01/2011', 9900),
	('Nath�lia Santos', '03/10/2018', 7200),
	('Ot�vio Costa', '18/04/2017', 11000)

SELECT * FROM dGerente


CREATE TABLE fContratos(
	id_contrato INT IDENTITY(1,1),
	data_assinatura DATE DEFAULT GETDATE(),
	id_cliente INT,
	id_gerente INT,
	valor_contrato FLOAT,

	CONSTRAINT fContratos_id_contrato_pk PRIMARY KEY(id_contrato),
	CONSTRAINT fContratos_id_cliente_fk FOREIGN KEY(id_cliente) REFERENCES dCliente(id_cliente),
	CONSTRAINT fContratos_id_gerente_fk FOREIGN KEY(id_gerente) REFERENCES dGerente(id_gerente),
	CONSTRAINT fContratos_valor_contrato_ck CHECK(valor_contrato > 0)
)

INSERT INTO fContratos(data_assinatura, id_cliente, id_gerente, valor_contrato)
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