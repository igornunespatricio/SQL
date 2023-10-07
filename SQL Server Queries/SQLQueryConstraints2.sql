CREATE DATABASE AlugaFacil

CREATE TABLE Cliente (
	id_cliente INT IDENTITY(1,1),
	nome_cliente VARCHAR(100) NOT NULL,
	cnh VARCHAR(100) NOT NULL,
	cartao VARCHAR(100) NOT NULL

	CONSTRAINT Cliente_id_cliente_primarykey PRIMARY KEY(id_cliente),
	CONSTRAINT Cliente_cnh_unique UNIQUE(cnh)
)

CREATE TABLE Carro (
	id_carro INT IDENTITY(1,1),
	placa VARCHAR(100) NOT NULL,
	modelo VARCHAR(100) NOT NULL,
	tipo VARCHAR(100) NOT NULL

	CONSTRAINT Carro_id_carro_primarykey PRIMARY KEY(id_carro),
	CONSTRAINT Carro_placa_unique UNIQUE(placa),
	CONSTRAINT Carro_tipo_check CHECK(tipo IN ('Hatch', 'Sedan', 'SUV'))
)

CREATE TABLE Locacoes(
	id_locacao INT IDENTITY(1,1),
	data_locacao DATE NOT NULL,
	data_devolucao DATE NOT NULL,
	id_carro INT NOT NULL,
	id_cliente INT NOT NULL,

	CONSTRAINT Locacoes_id_locacao_primarykey PRIMARY KEY(id_locacao),
	CONSTRAINT Locacoes_id_carro_foreignkey FOREIGN KEY(id_carro) REFERENCES Carro(id_carro),
	CONSTRAINT Locacoes_id_cliente_foreignkey FOREIGN KEY(id_cliente) REFERENCES Cliente(id_cliente)
)

SELECT * FROM Cliente
SELECT * FROM Carro
SELECT * FROM Locacoes

