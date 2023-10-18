-- control strcutures: if, case, while and for loop

-- if example

-- NPS - Net Promoter Score: indicate if client is promoter, neutral or detractor
-- analyze if client is promoter, neutral or detractor based on nps score

set serveroutput on;

accept user_answer prompt 'Client NPS: '; -- allows user to interact with the command 

-- if inside anonymous block
declare
    nps number(10,2) := &user_answer;

begin
    
    if nps >= 9 then dbms_output.put_line('He is a promoter client. NPS = ' || nps);
    else
        if nps >= 7 then dbms_output.put_line('He is a neutral client. NPS = ' || nps);
        else dbms_output.put_line('He is a detractor client. NPS = ' || nps);
        end if;
    end if;
end;


-- alter product price of produtos table from database IGOR
-- user insert a category and it should update the price with a specific discount


set serveroutput on;

accept answer prompt 'Insert the category that will receive the discount';

declare
    
    cat varchar2(100) := '&answer';
    percentDiscount number(10,2);
    
begin
    
    if cat = 'Celular' then percentDiscount := 10;
    else
        if cat = 'Notebook' then percentDiscount := 20;
        else percentDiscount := 50;
        end if;
    end if;
    
    update produtos
    set preco_unit = preco_unit * (1 - percentDiscount/100)
    where categoria = cat;
    
    dbms_output.put_line('Discount applied!');
end;

select * from produtos;

rollback;

select * from produtos;

-- case: it's like a lot of ifs one after the other
-- nps score example using case

set serveroutput on;

accept answer prompt 'nps of the client' -- receives value from the user

declare
    nps number(10,2) := &answer; -- declare nps variable
begin
    -- starting the case conditions
    case
        when nps >= 9 then dbms_output.put_line('He is promoter: ' || nps);
        when nps >= 7 then dbms_output.put_line('He is neutral: ' || nps);
        else dbms_output.put_line('He is detractor: ' || nps);
    end case;
end;

-- runs the conditons from top to bottom: if the case command returns true in the first condition, it doesn't run the other conditions below.


--loop: control repetition structure

-- print in the screen values from an intial and end value

set serveroutput on;

accept finalValue prompt 'Last value from sequence is';

declare
    counter int := 1;
    endValue int := &finalValue;
begin

    loop
        dbms_output.put_line('Counter is: ' || counter);
        exit when counter = endValue;
        counter := counter + 1;
    end loop;
    
    dbms_output.put_line('Leaving the loop successfully!');
    
end;



-- using for loop instead of loop only

set serveroutput on;

accept finalValue prompt 'Last value from sequence is';

declare
    initValue int := 1;
    endValue int := &finalValue;
begin

    for i in initValue..endValue loop
            dbms_output.put_line('Counter is: '|| i);
    end loop;
    
    dbms_output.put_line('Leaving the for loop successfully!');
    
end;

-- for loop is better then loop sometimes because we don't need to increment the variable everytime, it increment itself automatically


-- while loop

set serveroutput on;

accept finalValue prompt 'Last value from sequence is';

declare
    counter int := 1;
    endValue int := &finalValue;
begin
    
    while counter < endValue loop
        dbms_output.put_line('Counter value is: ' || counter);
        counter := counter + 1;
    end loop;
    
    dbms_output.put_line('Leaving the while loop successfully!');
    
end;









