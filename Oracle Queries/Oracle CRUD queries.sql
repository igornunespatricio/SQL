-- CRUD: Create, Read, Update and Delete information from databases

-- CRUD operations can be separated in various groups of commands

-- DDL: data definition language: manipulate objects in a database
-- example: create table, procedure, view, 

-- DML: data manipulation language: manipulate data in a database
-- example: insert, update and delete

-- TCL: transaction control language: control DML transactions in a database
-- example: commit, rollback and savepoint

-- creating new connection:
-- go to the admin connection -> other users folder -> right click -> create new user ->
-- write user name and password -> apply -> search user in the folder again -> right click ->
-- grant permitions -> apply -> plus button on top left for new connection ->
-- name of new connection -> name of user -> password -> host name, port, service name... ->
-- test connection -> connect

-- creating client table

create table clientes(
    id_cliente int,
    nome_cliente varchar2(100),
    sexo varchar2(100),
    email varchar2(100),
    data_nascimento date,
    cpf varchar2(100)
);

create table produtos(
    id_produto int,
    nome_produto varchar2(100),
    marca varchar2(100),
    categoria varchar2(100),
    preco_unit number(10,2),
    custo_unit number(10,2)
);

create table vendas(
    id_venda int,
    data_venda date,
    id_cliente int,
    id_produto int,
    quantidade number(10,2)
);



select * from clientes;
select * from produtos;
select * from vendas;

-- filling clients table
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

-- filling products table

INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit) VALUES
	(1,  'iPhone 11',   'Apple', 'Celular', 3500, 2200);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit) VALUES
    (2,  'iPhone 12',   'Apple', 'Celular', 4100, 3000);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit) VALUES
    (3,  'Moto G60',   'Motorola', 'Celular', 1600, 800);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit) VALUES
    (4,  'Samsung S22',   'Samsung', 'Celular', 5000, 2800);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit) VALUES
    (5,  'Aspire 5',   'Acer', 'Notebook', 3300, 1800);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit) VALUES
    (6,  'Inspiron 15 3000',   'Dell', 'Notebook', 2800, 1100);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit) VALUES
    (7,  'Smart TV 4K',   'LG', 'Televisão', 1800, 700);
INSERT INTO produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit) VALUES
    (8,  'Smart TV Crystal UHD 4K', 'Samsung', 'Televisão', 3000, 1200);

-- filling sales table

INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
	(1,  '09/01/2022',   5, 1, 2);
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

-- update: update column of rows
update produtos
set preco_unit = 3900
where id_produto = 1;

select * from produtos;

-- delete: delete row from table
delete from clientes
where id_cliente = 1;

select * from clientes;

-- truncate: delete all data from a table, but keeps the table in the database
truncate table vendas;

select * from vendas;

-- drop: delete table from database, also delete the table itself together with the data
drop table vendas;

select * from vendas; -- returns error because vendas table doesn't exist anymore

-- comment: create comment in tables and column in a database

-- creating a comment to the products table
comment on table produtos
is 'Product Information';

-- bring all comments in tables
select * from user_tab_comments;

-- delete comment from table
comment on table produtos
is '';

-- create comment in a column
comment on column produtos.categoria
is 'Describe product category';

-- check all columns comments
select * from user_col_comments -- returns a table with all comments from all columns
where table_name = 'PRODUTOS'; -- filter this table above to see just the produtos table

-- REMEMBER! Oracle sql is case sensitive

-- tcl: control transactions 

-- commit

select * from clientes;

insert into clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf)
values
    (20, 'Leonardo', 'M', 'leo@hotmail.com', '07/05/1992', '928.285.129-12');

select * from clientes;

-- undo the inserted row above
rollback;

select * from clientes;

-- when we insert data, it won't be necesarily added to the database
-- other users won't be able to access it.
-- we need to commit the change, to effectively add the data

insert into clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf)
values
    (20, 'Leonardo', 'M', 'leo@hotmail.com', '07/05/1992', '928.285.129-12');

commit;

rollback; -- here rollback doesn't remove the above inserted data becasue it was already commited to the database

select * from clientes;
-- after inserting the data and doing the commit, the data was effectively added to the database
-- because of that, the rollback command didn't remove the inserted data


-- savepoint: used to rollback until a saved point in the history

insert into clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf)
values
    (40, 'Mariana Braga', 'F', 'mari@hotmail.com', '07/05/1992', '928.285.129-12');

savepoint p1;

insert into clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf)
values
    (50, 'Sandra Pires', 'F', 'sandra@hotmail.com', '23/04/1985', '928.285.129-12');

savepoint p2;

insert into clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf)
values
    (60, 'Zacarias Macedo', 'M', 'zmacedo@hotmail.com', '11/10/1994', '928.285.129-12');

savepoint p3;


select * from clientes;

-- we can rollback to the savepoint we want

rollback to savepoint p1; -- goes back until the savepoint p1 in history

select * from clientes;

rollback;

select * from clientes;

-- alter table: very intuitive :)
-- add column, modify existing column, delete column and rename column

select * from clientes;

-- adding a new column
alter table clientes
add telefone varchar2(100);

select * from clientes;

-- updating someones phone number
update clientes
set telefone = '(22)99425-8319'
where id_cliente = 2;

select * from clientes;


-- add stock column in products table
alter table produtos
add estoque int;

select * from produtos;

-- updating stock column of all products
update produtos
set estoque = 100;

select * from produtos;

-- add more than one column at once
alter table clientes
add (
        endereco varchar2(100),
        salario number(10,2),
        qtd_filho int
    );

select * from clientes;

-- change a column in a table
--changing type of the table
alter table clientes
modify salario int;

-- changing more than a column
alter table clientes
modify (
        salario int,
        endereco int,
        qtd_filho date
        );

-- delete a column
alter table clientes
drop column endereco;

select * from clientes;

-- rename column of a table
alter table clientes
rename column sexo to genero;

select * from clientes;





