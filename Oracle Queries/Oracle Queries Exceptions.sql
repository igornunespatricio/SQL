-- exceptions and errors

-- it is a good practice to treat errors

-- example 1: create a function to compute percent of increase/decrease between two years
-- treat exception when the first year is 0

set serveroutput on;

create or replace function fn_compute_percent(year_1 number, year_2 number)
return varchar2
is
    percent_variable number(10,2);

begin

  percent_variable := year_2 / year_1 - 1;
  
  return 'The percentage between years was ' || percent_variable * 100 ||'%.';

end;


select fn_compute_percent(10, 5) from dual;
select fn_compute_percent(0, 5) from dual;


-- treating the divisor equal to zero error, from the system
create or replace function fn_compute_percent(year_1 number, year_2 number)
return varchar2
is
    percent_variable number(10,2);

begin

  percent_variable := year_2 / year_1 - 1;
  
  return 'The percentage between years was ' || percent_variable * 100 ||'%.';

exception
    when zero_divide then return 'Year 1 should be bigger than 0.';
    -- any code can be added here in the exception part
end;


select fn_compute_percent(0, 5) from dual;




-- example 2: create a procedure to register clients in the clientes table
-- if a cpf was already registered, treat the error

create sequence clientes_seq
start with 11
increment by 1
minvalue 1;

create or replace procedure pr_cadastra_cliente(
    vnome_cliente clientes.nome_cliente%type,
    vsexo clientes.sexo%type,
    vemail clientes.email%type,
    vdata_nascimento clientes.data_nascimento%type,
    vcpf clientes.cpf%type
    )
as

begin

    insert into clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf)
    values
            (clientes_seq.nextval, vnome_cliente, vsexo, vemail, vdata_nascimento, vcpf);
        
    dbms_output.put_line('Registered Successfully!');

end;


-- executing the procedure
exec pr_cadastra_cliente('Katia Melo', 'F', 'katia@hotmail.com', '01/01/2000', '123.456.789-10');

-- executing the procedure again with the same cpf
exec pr_cadastra_cliente('Lucas Silva', 'M', 'lucas@hotmail.com', '12/09/2000', '123.456.789-10');
-- since the cpf column of the table clientes allows only unique values, the system will raise an error

-- treating this error
create or replace procedure pr_cadastra_cliente(
    vnome_cliente clientes.nome_cliente%type,
    vsexo clientes.sexo%type,
    vemail clientes.email%type,
    vdata_nascimento clientes.data_nascimento%type,
    vcpf clientes.cpf%type
    )
as

begin

    insert into clientes(id_cliente, nome_cliente, sexo, email, data_nascimento, cpf)
    values
            (clientes_seq.nextval, vnome_cliente, vsexo, vemail, vdata_nascimento, vcpf);
        
    dbms_output.put_line('Registered Successfully!');

exception 
    when dup_val_on_index then
        dbms_output.put_line('The cpf already exists in the database!');
    
end;

-- tryint to insert a client with a cpf that already exists in the database
exec pr_cadastra_cliente('Lucas Silva', 'M', 'lucas@hotmail.com', '12/09/2000', '123.456.789-99');


-- raise_application_error: allow the user/developer to treat an exception and associate a number and message with it
-- nuimbers can go in the range 20000 to 20999

-- example 1: function to compute percentage variation, if value of year 1 is smaller than 0, treat it with raise_application_error

create or replace function fn_compute_percent_variation(year1 number, year2 number)
return varchar2
is

    percent_variation number(10,2);

begin

    if year1 <= 0 then raise_application_error(-20300, 'Year1 value should be bigger than 0!');
    end if;
    
    percent_variation := year2 / year1 - 1;
    
    return 'The variation is ' || percent_variation * 100 || '%.';
    
end;


select fn_compute_percent_variation(-10,20) from dual;
-- raise_application_error creates an error


-- personalized errors: erros not treated by oracle

-- example 1: create a procedure to register a sale. 
-- treat the error in case the amount sold is not bigger than 0

create or replace procedure pr_cadastra_venda(
    vid_cliente vendas.id_cliente%type,
    vid_produto vendas.id_produto%type, 
    vquantidade vendas.quantidade%type)
as  

notBiggerZero exception;

begin

    if vquantidade <=0 then 
        raise notBiggerZero;
    else
        insert into vendas(id_venda, data_venda, id_cliente, id_produto, quantidade)
        values (vendas_seq.nextval, sysdate, vid_cliente, vid_produto, vquantidade);
        
    end if;    
    
    dbms_output.put_line('Sale registered successfully!');

exception
    when notBiggerZero then 
        dbms_output.put_line('Sale not registered, amount sold was zero!');

end;


-- executing the procedure: correct values
exec pr_cadastra_venda(1, 1, 13);

-- executing procedure: incorrect value, zero units sold, message is printed out to the system, other commands could be executed
exec pr_cadastra_venda(1, 1, 0);


-- when others: when you want to treat any other exception that remains
-- be carefull, it is good to know what are the possible errors that can happen, using when others you won't be able to know that
create or replace function fn_compute_percent(year1 number, year2 number)
return varchar2
is

    percent_variation number(10,2);

begin
    
    percent_variation := year2 / year1 - 1;
    
    return 'The variation is ' || percent_variation * 100 || '%.';

exception
    when zero_divide then
        return 'Year 1 value was 0, not possible!';
    when others then
        return 'Other error associated, please check values';

end;

-- using the function with zero division
select fn_compute_percent(0,10) from dual;


-- separating the error code and the error string from the error
-- use sqlcode and sqlerrm

create or replace function fn_compute_percent(year1 number, year2 number)
return varchar2
is

    percent_variation number(10,2);

begin
    
    percent_variation := year2 / year1 - 1;
    
    return 'The variation is ' || percent_variation * 100 || '%.';

exception
    when zero_divide then
        return 'Code was ' || sqlcode || ' and text was ' || sqlerrm;

end;

-- using function with error
select fn_compute_percent(0,20) from dual;