-- constraints

-- not null: does not accept null values in a column
-- unique: only accepts unique values in a column
-- check if a specified condition is met in a column
-- default: stablish a default value in case none is passed to a column
-- primary key: sets the primary key of a table (will be the column to create relationship with other columns) it is also unique and not null
-- foreign key: a column that will be used as a key to create a relationship with the primary key of another table (can be null and duplicate)

drop table clientes;
drop table produtos;
drop table vendas;

-- creating clients table with constrains
create table clientes(
    id_cliente int,
    nome_cliente varchar2(100) not null,
    sexo varchar2(100) not null,
    email varchar2(100) not null,
    data_nascimento date,
    cpf varchar(100) not null,
    constraint clientes_id_cliente_pk primary key(id_cliente),
    constraint clientes_cpf_un unique(cpf)
);

-- creating products table with constraints
create table produtos(
    id_produto int,
    nome_produto varchar2(100) not null,
    marca varchar2(100) not null,
    categoria varchar2(100) not null,
    preco_unit number(10,2) not null,
    custo_unit number(10,2) not null,
    estoque int not null,
    constraint produtos_id_produto_pk primary key(id_produto),
    constraint produtos_preco_unit_ck check(preco_unit >= 0),
    constraint produtos_custo_unit_ck check(custo_unit >= 0),
    constraint produtos_estoque_ck check(estoque >= 0)
);

-- creating the sales table with constraints
create table vendas(
    id_venda int,
    data_venda date default sysdate,
    id_cliente int,
    id_produto int,
    quantidade number(10,2) not null,
    constraint vendas_id_venda_pk primary key(id_venda),
    constraint vendas_id_cliente_fk foreign key(id_cliente) references clientes(id_cliente),
    constraint vendas_id_produto_fk foreign key(id_produto) references produtos(id_produto)
);

-- inserting data into the tables

-- insert into CLIENTES

INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
    (1,  'André Martins',   'M', 'andre.m@gmail.com', '12/02/1989', '839.283.190-00');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
    (2,  'Bárbara Campos',  'F', 'barb_campos@hotmail.com', '07/05/1992', '351.391.410-02');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
    (3,  'Carol Freitas',   'F', 'carol@gmail.com', '23/04/1985', '139.274.921-12');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(4,  'Diego Cardoso', 'M', 'dcardoso@gmail.com', '11/10/1994', '192.371.081-17');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(5,  'Eduardo Pereira', 'M', 'edupe@yahoo.com.br', '09/11/1988', '193.174.192-82');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(6,  'Fabiana Silva', 'F', 'fabiisilva@gmail.com', '02/09/1989', '231.298.471-98');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(7,  'Gustavo Barbosa', 'M', 'guto.barbosa@hotmail.com', '27/06/1993', '240.174.171-76');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(8,  'Helen Viana', 'F', 'helenvianaa@gmail.com', '11/02/1990', '193.129.183-01');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(9,  'Irene Castro', 'F', 'castroirene@yahoo.com.br', '21/08/1989', '184.148.102-29');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(10, 'Juliana Pires', 'F', 'jupires@gmail.com', '13/01/1991', '416.209.192-47');

-- insert into PRODUTOS

INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
	(1,  'iPhone 11',   'Apple', 'Celular', 3500, 2200, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (2,  'iPhone 12',   'Apple', 'Celular', 4100, 3000, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (3,  'Moto G60',   'Motorola', 'Celular', 1600, 800, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (4,  'Samsung S22',   'Samsung', 'Celular', 5000, 2800, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (5,  'Aspire 5',   'Acer', 'Notebook', 3300, 1800, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (6,  'Inspiron 15 3000',   'Dell', 'Notebook', 2800, 1100, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (7,  'Smart TV 4K',   'LG', 'Televisão', 1800, 700, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (8,  'Smart TV Crystal UHD 4K', 'Samsung', 'Televisão', 3000, 1200, 100);

-- insert into VENDAS

INSERT INTO vendas(id_venda, id_cliente, id_produto, quantidade) VALUES
	(1,   5, 1, 2);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (2,  '10/01/2022',   2, 3, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (3,  '13/01/2022',   1, 7, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (4,  '02/02/2022',   7, 1, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (5,  '17/02/2022',   4, 1, 3);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (6,  '21/02/2022',   6, 5, 3);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (7,  '05/03/2022',   7, 5, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (8,  '07/03/2022',   10, 2, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (9,  '09/03/2022',   9, 1, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (10,  '12/03/2022',   4, 3, 3);
    

select * from clientes;
select * from produtos;
select * from vendas;


-- violations of constraints

-- not inserting the column estoque not null
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit) VALUES
	(11,  'iPhone 13', 'Apple', 'Celular', 1000, 2200);

-- violation column preco_unit check
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
	(12,  'iPhone 13', 'Apple', 'Celular', -1000, 2200, 10);

-- violation column cpf unique value
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(11, 'Karine Dias', 'F', 'kdias@gmail.com', '15/06/1993', '416.209.192-47');


-- violation of foreign key and primary key
-- only allows to add foreign key value that exists in its respective table primary key column
-- example below tries to add a sale of a product with id 50, but that product id doesn't exist in the products table primary key
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (11,  '12/03/2022',   4, 50, 3);


-- managing constraints


-- remove primary key from sales table
alter table vendas
drop constraint vendas_id_venda_pk;

-- remove foreign key id_cliente from sales
alter table vendas
drop constraint vendas_id_cliente_fk;

-- add primary key constraint id_venda in sales table
alter table vendas
add constraint vendas_id_venda_pk primary key(id_venda);

-- add foreign key id_cliente in sales
alter table vendas
add constraint vendas_id_cliente_fk foreign key(id_cliente) references clientes(id_cliente);


-- removing a primary key that is reference from a foreign key returns an error
-- it asks to remove all references to the primary key you want to remove
alter table produtos
drop constraint produtos_id_produto_pk;

-- to solve that you can remove by using cascade command
alter table produtos
drop constraint produtos_id_produto_pk cascade;


-- rename constraint
alter table clientes
rename constraint clientes_cpf_un to clientes_document_un;

-- BE CAREFUL: to remove tables with constraints

-- command below will return an error saying that tables with primary key referenced by a foreign key cannot be deleted
drop table clientes;

-- even if you want to remove the table with its constraints references in cascade
drop table clientes cascade constraints;



-- sequences

-- a sequence is an object used to create sequential numbers automatically to the primary key columns of a table
-- this is used so we don't need to hard insert the primary key value

-- creating a sequence named vendas_seq that starts with 1, increments by 1, does not end and has no cycle
create sequence vendas_seq
start with 1
increment by 1
nomaxvalue
nocycle;

-- next value of the sequence
select vendas_seq.nextval
from dual;

-- current value of the sequence
select vendas_seq.currval
from dual;

-- changing sequence
alter sequence vendas_seq
increment by 10
nomaxvalue
nocycle;

select vendas_seq.nextval
from dual;

select vendas_seq.currval
from dual;

-- delete a sequence
drop sequence vendas_seq;

-- deleting all tables
drop table produtos;
drop table vendas;
drop table clientes;


-- applying sequences to add records to a table without needing to manually specify a primary key value
create sequence vendas_seq
start with 1
increment by 1
nomaxvalue
nocycle;

create sequence clientes_seq
start with 1
increment by 1
nomaxvalue
nocycle;

create sequence produtos_seq
start with 1
increment by 1
nomaxvalue
nocycle;


-- inserting values into the tables using the created sequences

-- filling CLIENTES table using sequence: better than manually adding id 1, 2, 3, etc. it is automatically

INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
    (clientes_seq.NEXTVAL,  'André Martins',   'M', 'andre.m@gmail.com', '12/02/1989', '839.283.190-00');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
    (clientes_seq.NEXTVAL,  'Bárbara Campos',  'F', 'barb_campos@hotmail.com', '07/05/1992', '351.391.410-02');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
    (clientes_seq.NEXTVAL,  'Carol Freitas',   'F', 'carol@gmail.com', '23/04/1985', '139.274.921-12');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(clientes_seq.NEXTVAL,  'Diego Cardoso', 'M', 'dcardoso@gmail.com', '11/10/1994', '192.371.081-17');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(clientes_seq.NEXTVAL,  'Eduardo Pereira', 'M', 'edupe@yahoo.com.br', '09/11/1988', '193.174.192-82');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(clientes_seq.NEXTVAL,  'Fabiana Silva', 'F', 'fabiisilva@gmail.com', '02/09/1989', '231.298.471-98');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(clientes_seq.NEXTVAL,  'Gustavo Barbosa', 'M', 'guto.barbosa@hotmail.com', '27/06/1993', '240.174.171-76');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(clientes_seq.NEXTVAL,  'Helen Viana', 'F', 'helenvianaa@gmail.com', '11/02/1990', '193.129.183-01');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(clientes_seq.NEXTVAL,  'Irene Castro', 'F', 'castroirene@yahoo.com.br', '21/08/1989', '184.148.102-29');
INSERT INTO clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf) VALUES
	(clientes_seq.NEXTVAL, 'Juliana Pires', 'F', 'jupires@gmail.com', '13/01/1991', '416.209.192-47');

-- fill PRODUTOS table: same ideia, makes easier to add id, we dont have to manually add an id

INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
	(produtos_seq.NEXTVAL,  'iPhone 11',   'Apple', 'Celular', 3500, 2200, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (produtos_seq.NEXTVAL,  'iPhone 12',   'Apple', 'Celular', 4100, 3000, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (produtos_seq.NEXTVAL,  'Moto G60',   'Motorola', 'Celular', 1600, 800, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (produtos_seq.NEXTVAL,  'Samsung S22',   'Samsung', 'Celular', 5000, 2800, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (produtos_seq.NEXTVAL,  'Aspire 5',   'Acer', 'Notebook', 3300, 1800, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (produtos_seq.NEXTVAL,  'Inspiron 15 3000',   'Dell', 'Notebook', 2800, 1100, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (produtos_seq.NEXTVAL,  'Smart TV 4K',   'LG', 'Televisão', 1800, 700, 100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) VALUES
    (produtos_seq.NEXTVAL,  'Smart TV Crystal UHD 4K', 'Samsung', 'Televisão', 3000, 1200, 100);

-- complete VENDAS table: same idea too

INSERT INTO vendas(id_venda, id_cliente, id_produto, quantidade) VALUES
	(vendas_seq.NEXTVAL,   5, 1, 2);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (vendas_seq.NEXTVAL,  '10/01/2022',   2, 3, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (vendas_seq.NEXTVAL,  '13/01/2022',   1, 7, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (vendas_seq.NEXTVAL,  '02/02/2022',   7, 1, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (vendas_seq.NEXTVAL,  '17/02/2022',   4, 1, 3);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (vendas_seq.NEXTVAL,  '21/02/2022',   6, 5, 3);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (vendas_seq.NEXTVAL,  '05/03/2022',   7, 5, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (vendas_seq.NEXTVAL,  '07/03/2022',   10, 2, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (vendas_seq.NEXTVAL,  '09/03/2022',   9, 1, 1);
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (vendas_seq.NEXTVAL,  '12/03/2022',   4, 3, 3);


SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM vendas;

-- adding a new sales to the sales table: not necessary to be careful with an sales id anymore
INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
    (vendas_seq.NEXTVAL,  '13/03/2022',   2, 1, 1);

SELECT * FROM vendas;

COMMIT; -- commiting to add it permanently to the table in the database

-- BE CAREFUL: if rollback is executed, transactions will be lost, but nextval will stay in the same number
-- ALSO: do not use the same sequence in more than one table. Using a sequence in two different tables does not make sense anyway


-- indexes: allows a query to return faster
-- run the query below with F10 to run with execution plan and check the cost of running this query
select * from produtos
where marca = 'Apple';

-- create index
create index prod_marca_ix
on produtos(marca);

-- running the same query (above the creation of the index) with F10 to see the execution plan, the cost is diminished because of the index
select * from produtos
where marca = 'Apple';

-- indexes helps to optimize queries
-- we can create indexes for each column to optimize the queries

-- delete index
drop index prod_marca_ix;







