-- anonymous blocks: block of code nameless

-- anonymous blocks have 3 parts: 
-- 1 for declaring variables
-- 1 for block of code
-- 1 for handling exceptions


-- printing welcome (hello world of sql)

set serveroutput on;

begin

    dbms_output.put_line('Hey, welcome to SQL');
    
end;

-- printing welcome with a declared variable

set serveroutput on;

declare
    name varchar2(50);
begin

    name := 'Igor';
    dbms_output.put_line(name || ', welcome my friend!');

end;


-- using exception block

declare
    var1 int;
    var2 int;
begin
    
    var1 := 100;
    var2 := 'A';
    dbms_output.put_line(var1 + var2);
    exception
        when others then
            dbms_output.put_line('Fatal error!');
            
end;



-- example

declare
    -- declaring variables
    amount int;
    price number(10,2);
    revenue number(10,2);
begin

    /*
    
    Analyzing revenue
    
    */
    amount := 10;
    price := 1500;
    revenue := amount * price;
    dbms_output.put_line('Amount Sold: ' || amount);
    dbms_output.put_line('Unit Price: ' || price);
    dbms_output.put_line('Revenue: ' || revenue);
end;


-- single row functions in anonymous blocks

declare
    -- declaring variables
    amount int;
    price number(10,2);
    revenue number(10,2);
begin

    /*
    
    Analyzing revenue
    
    */
    amount := 10;
    price := 1500;
    revenue := amount * price;
    dbms_output.put_line('Amount Sold: ' || amount);
    dbms_output.put_line('Unit Price: ' || trim(to_char(price, 'L999G999D99')));
    dbms_output.put_line('Revenue: ' || trim(to_char(revenue, 'L999G999D99')));
end;


-- nested anonymous blocks

declare
    block1 int;
    
begin
    block1 := 1;
    dbms_output.put_line('Variable block 1 in block 1: ' || block1);
    
    declare
        block2 int;
    
    begin
        block2 := 2;
        dbms_output.put_line('Variable block 1 in block 2: ' || block1);
        dbms_output.put_line('Variable block 2 in block 2: ' || block1);
    end;
    -- dbms_output.put_line('Variable block 2 in block 1: ' || block1); -- this will raise an error because the variable block2 is only defined in the scope of the nested anonymous block

end;



