/*
cursor: a cursor points to the result of a query
together with the for loop, the cursor goes to each line of the select query to perform operations
there are two types of cursors: implicit and explicit
implicit: they are automatically defined when an insert, update, delete and select into is executed
explicit: used when the cursor is explicitly declared. 
            For this type of cursor we need to open it, fetch the data(row) and close it.
*/

-- example: access the employees table using a loop

set serveroutput on;

declare
    -- declaring the cursor
    cursor cursor_employees is
    select * from employees;
    -- the employees_record will store each row in the loop
    -- each type of each value of the employees_record will be the same type of the matching value of the employees table
    employees_record cursor_employees%rowtype;

begin
    
    open cursor_employees; -- opening cursor
    loop -- begin loop
        
        -- fetching the row (it seems the cursor changes to the next row automatically)
        fetch cursor_employees
        into employees_record;
        
    exit when cursor_employees%notfound; -- exit loop when cursor doesn't find a record
    
    dbms_output.put_line(employees_record.employee_id || ' ' || employees_record.first_name);
    
    end loop;
    
    close cursor_employees;
    
end;


-- same example as above but with while loop

declare

    cursor c_employees is
    select * from employees;
    
    employees_record c_employees%rowtype;

begin

    open c_employees;

    -- need to fetch first so the cursor finds a record to enter the while loop
    fetch c_employees
    into employees_record;
    
    while c_employees%found loop
        
        dbms_output.put_line(employees_record.employee_id || ' ' || employees_record.first_name);
        
        fetch c_employees
        into employees_record;
        
    end loop;
    
    close c_employees;
    
end;


-- same example with for loop
-- the sintax is easier 

declare
    
    cursor c_employees is
    select * from employees;

begin
    
    -- no need to open, fetch and close cursor as the for loop does it automatically
    for employees_record in c_employees loop
        
        dbms_output.put_line(employees_record.employee_id || ' ' || employees_record.first_name);

    end loop;
    
end;


-- explicit cursor with parameter
declare
    
    -- vjob_id is a parameter that can be passed to the cursor to for example filter the select or for another purpose
    -- more than one parameter can be passed to the cursor
    cursor c_employees(vjob_id varchar2) is
    select * from employees
    where job_id = vjob_id;

begin
    
    for employees_record in c_employees('ST_MAN') loop
        
        dbms_output.put_line(employees_record.employee_id || ' ' 
                            || employees_record.first_name || ' ' 
                            || employees_record.job_id);

    end loop;
    
end;
