-- procedures: block of codes that has a name and can be stored in the database
-- it includes series of sql commands to execute a task
-- it is used to do repetitive tasks that are not possible to do in sql queries
-- it includes control structures as loop, if, for loop, case, etc
-- it also includes ddl, dml, tcl: to manipulate, create, insert, alter data, commit changes, etc.

-- in VBA it is like a Macro

-- welcome procedure

set serveroutput on;

create or replace procedure welcome
as
begin

    dbms_output.put_line('Welcome friend!');

end welcome;

-- executing procedure

exec welcome;

set serveroutput on;

-- create a procedure to register new product sale (no parameters)
-- name of product, amount sold and client name are the parameters to add to the procedure
-- will need to get the product and client id to add to sales, also need to remove the amount from stock 

-- to start: recreating the vendas_seq
create sequence vendas_seq
start with 11
minvalue 0
increment by 1
nocache
nocycle;

create or replace procedure register_sale
as

    id_product int;
    name_product varchar2(100);
    id_client int;
    name_client varchar2(100);
    qtd_sold int;

begin

    -- since procedure has no parameters, this part below sets parameters values
    name_product := 'iPhone 11';
    name_client := 'Bárbara Campos';
    qtd_sold := 1;
    
    -- getting client id
    select id_cliente
    into id_client
    from clientes
    where nome_cliente = name_client;
    
    -- getting product id
    select id_produto
    into id_product
    from produtos
    where nome_produto = name_product;
    
    -- inserting data into sales table
    -- vendas_seq.nextval takes the next value from the vendas_seq sequence (it was created on the sequence module) 
    insert into vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) values
        (vendas_seq.nextval, sysdate, id_client, id_product, qtd_sold);
        
    -- updating stock from products table
    update produtos
    set estoque = estoque - qtd_sold
    where id_produto = id_product;
    
    commit;
    
    dbms_output.put_line('Sale registered successfully!');
    
end register_sale;

exec register_sale;

-- creating the same procedure with parameter now
create or replace procedure register_sale(name_product varchar2, name_client varchar2, qtd_sold int)
as

    id_product int;
    id_client int;

begin

    -- getting client id
    select id_cliente
    into id_client
    from clientes
    where nome_cliente = name_client;
    
    -- getting product id
    select id_produto
    into id_product
    from produtos
    where nome_produto = name_product;
    
    -- inserting data into sales table
    -- vendas_seq.nextval takes the next value from the vendas_seq sequence (it was created on the sequence module) 
    insert into vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) values
        (vendas_seq.nextval, sysdate, id_client, id_product, qtd_sold);
        
    -- updating stock from products table
    update produtos
    set estoque = estoque - qtd_sold
    where id_produto = id_product;
    
    commit;
    
    dbms_output.put_line('Sale registered successfully!');
    
end register_sale;

exec register_sale('Samsung S22', 'Juliana Pires', 10);


-- creating the same procedure adding control structure to check stock number
create or replace procedure register_sale(name_product varchar2, name_client varchar2, qtd_sold int)
as

    id_product int;
    id_client int;
    stock_amount int;
    
begin

    select estoque
    into stock_amount
    from produtos
    where nome_produto = name_product;
    
    if qtd_sold <= stock_amount then
        -- getting client id
        select id_cliente
        into id_client
        from clientes
        where nome_cliente = name_client;
        
        -- getting product id
        select id_produto
        into id_product
        from produtos
        where nome_produto = name_product;
        
        -- inserting data into sales table
        -- vendas_seq.nextval takes the next value from the vendas_seq sequence (it was created on the sequence module) 
        insert into vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) values
            (vendas_seq.nextval, sysdate, id_client, id_product, qtd_sold);
        
        -- adding the stock amount to a variable called stock_amount to check latter if transaction can happen
        select estoque
        into stock_amount
        from produtos
        where id_produto = id_product;
        
        -- updating stock from products table, if amount asked is less or equal amount in stock
        
        update produtos
        set estoque = estoque - qtd_sold
        where id_produto = id_product;
            
        commit;
        
        dbms_output.put_line('Sale registered successfully!');
    else
        dbms_output.put_line('Sale not registered! Stock only have ' || stock_amount);
        
    end if;

end register_sale;


-- trying to sell more than in stock
exec register_sale('Samsung S22', 'Juliana Pires', 10000);

-- the goal of the procedure is to execute complex codes that we run frequently, so we don't need to be recreating the code again, since it can be stored

-- drop procedure
drop procedure register_sale;

-- difference between function and procedure
-- functions is an anonymous block that are used to compute values: receive parameters and returns values
-- functions we can use inside select commands
-- functions need to return a value

-- procedures is an anonymous block that are used to execute a series of commands and blocks in SQL,
-- it can involves a lot of commands like insert, commit, update, etc
-- procedures can't be called inside a select
-- procedures doesn't need to return a value




