-- triggers: block of code that is triggered before or after a dml command is executed (insert, update and delete)

-- create a trigger that will be triggered before a product is inserted in the products table
-- following the rule: the product can only be inserted into the system if the event happens between Monday to Friday and between 9h and 18h.


set serveroutput on;

-- trigger that happpens before insert
create or replace trigger tg_produtos_before_insert
before insert
on produtos

begin

    if 
        (trim(to_char(sysdate, 'DAY')) in ('S핦ADO', 'DOMINGO'))
            or
        (trim(to_char(sysdate, 'DAY')) not in ('S핦ADO', 'DOMINGO') and to_char(sysdate, 'HH24') not between 9 and 18)
        then
            raise_application_error(-20001, 'Registering can only happen Monday to Friday between 9:00 to 18:00!');
    end if;

end;


-- creating the sequence to the products id index
create sequence produtos_seq
minvalue 1
start with 9
increment by 1;

-- inserting a product
insert into produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) values
    (produtos_seq.nextval, 'Notebook da Xuxa', 'Dell', 'Notebook', 1000, 200, 50);
    
    
-- trigger to happen before any insert, update or delete dml command is executed.
create or replace trigger tg_produtos_before_insert_update_delete
before insert or update or delete
on produtos

begin

    if 
        (trim(to_char(sysdate, 'DAY')) in ('S핦ADO', 'DOMINGO'))
            or
        (trim(to_char(sysdate, 'DAY')) not in ('S핦ADO', 'DOMINGO') and to_char(sysdate, 'HH24') not between 9 and 18)
        then
        
        case
            when inserting then
                raise_application_error(-20001, 'Inserting can only happen Monday to Friday between 9:00 to 18:00!');
            when updating then
                raise_application_error(-20001, 'Updating can only happen Monday to Friday between 9:00 to 18:00!');
            else
                raise_application_error(-20001, 'Deleting can only happen Monday to Friday between 9:00 to 18:00!');
        end case;
    end if;

end;

-- trying to update a product
update produtos
set nome_produto = 'Notebook Xuxa'
where id_produto = 5;

-- trying to delete a product
delete from produtos
where id_produto = 5;

-- inserting into produtos (there are two triggers enabled for inserting into produtos table, which one will superimpose?)
insert into produtos(id_produto, nome_produto, marca, categoria, preco_unit, custo_unit, estoque) values
    (produtos_seq.nextval, 'Notebook da Xuxa', 'Dell', 'Notebook', 1000, 200, 50);
    
-- it seems that the last created trigger will superimpose


-- enabling and desabling triggers
alter trigger tg_produtos_before_insert disable;
alter trigger tg_produtos_before_insert_update_delete disable;

-- enabling and desabling all triggers from a table
alter table produtos disable all triggers;
alter table produtos enable all triggers;

-- drop trigger
drop trigger tg_produtos_before_insert;
drop trigger tg_produtos_before_insert_update_delete;






