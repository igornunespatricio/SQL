
-- first query
SELECT * FROM employees;

-- DESCRIBE: show structure of the tables, columns type and if it is null or not

DESCRIBE employees;

DESC department;

desc jobs;

-- SELECT

select * from locations;

select * from employees;

select
    department_id,
    department_name
from departments; -- it is not case-sensitive

-- fast select of columns: click and drop from connections
SELECT
    employee_id,
    start_date,
    end_date,
    job_id,
    department_id
FROM
    job_history;

-- alias for columns and tables: give a more intuitive name for them. Below the ways to create alias for columns
select
    first_name as "First Name",
    email as "Email",
    salary salario
from employees;

-- generally better to avoid space between words in column names

-- it seems that alias for tables doesnt accept the command "as", it should pass the alias just after the table name'
select
    *
from jobs j;

select
    j.job_id,
    j.job_title
from jobs j;

-- alias for columns and tables are good for organization

-- || -> concatenate texts

select
    first_name,
    last_name,
    first_name || ' ' || last_name name
from employees;

select
    first_name,
    last_name,
    salary,
    first_name || ' ' || last_name || ' - Salary: R$' || salary information
from employees;

-- ' inside string, how to solve this problem

select
    first_name || q'[. Employee's manager id: ]' || manager_id "Employee-Manager"
from employees;

-- add 100 R$ bonus into employee salary
select
    first_name,
    salary,
    salary + 100 "newSalary"
from employees;

-- add 25% bonus for all employees
select
    first_name,
    salary,
    salary*0.25 "bonus",
    salary*1.25 "newSalary"
from employees;

-- multiplication between values
-- in oracle, for every select the code expects the "from table".
-- to work around that, the DUAL table is used as "from DUAL".
-- the DUAL table is just a resource to use the select without needing to specify a real table
select 2*2 multiplication from dual;

select sysdate "dateNow" from dual;

-- DISTINCT: return distinct values from a column
select distinct department_id from employees;

-- distinct first names
select distinct first_name from employees;

-- distinct considering first and last names together
select distinct first_name, last_name from employees;

-- ORDER BY: order query table based on specified columns
-- ASC: ascending order and DESC: descending order

-- ordering by salary; ascending
select * from employees order by salary asc;

-- ordering by salary; descending
select * from employees order by salary desc;

-- can use two or more columns to order the query table
-- order of sorting follows the order specified in the query
select * from employees 
order by salary desc, first_name asc;

-- sorting by date: date is just a number that starter someday in the past and increments until now
select * from employees order by hire_date asc;
select * from employees order by hire_date desc;

-- NULLS FIRST and NULLS LAST: sort nulls on top or end of the table
-- defaults sorts nulls on top
describe departments;
select * from departments order by manager_id asc nulls first;
select * from departments order by manager_id desc nulls first;
select * from departments order by manager_id desc nulls last;

-- FETCH NEXT: take top n rows, similar to LIMIT in MySQL and Postgre and TOP in SQL Server
-- fetch top 11 top rows: don't care about ties
select * 
from employees 
order by salary desc
fetch next 11 rows only;


-- fetch top 11 rows including ties
select * 
from employees 
order by salary desc
fetch next 11 rows with ties;


-- fecthing percentage of rows
select *
from employees
order by salary desc
fetch next 10 percent rows only;

-- offsetting 5 rows in the beginning and fecth 10 first rows after the first 5
select *
from employees
order by employee_id
offset 5 rows
fetch next 10 rows only;


-- WHERE: filter data by column or columns
select *
from employees
where department_id = 100;

-- filter only employees min salary bigger than 6000
select *
from jobs
where min_salary > 6000;

-- employees with job_id = ST_MAN. 
-- BE CAREFUL Oracle SQL is case-sensitive!!!

select *
from employees
where job_id = 'ST_MAN';

-- won't find anything
select *
from employees
where job_id = 'st_man';

-- filter only employees hired after day 01-01-2000. Format of fata can also be 01/01/2000
select *
from employees
where hire_date > '01-01-2000';

-- filter with two or more columns
-- filter employees where salary is greater than 5000 AND job_id is IT_PROG
select *
from employees
where job_id = 'IT_PROG' and salary >= 5000;

-- -- filter employees where salary is greater than 5000 OR job_id is IT_PROG
select *
from employees
where job_id = 'IT_PROG' OR salary >= 5000;


-- filter employees from department_id 90 or 100
select *
from employees
where department_id = 90 or department_id = 100;


-- filter only employees that are not from department_id 90
select *
from employees 
where NOT department_id = 90;

-- LIKE, NOT LIKE and wildcards
-- filter rows that matches specified patterns

-- filter employees with job_id beginning with 'ST'
select *
from employees
where job_id like 'ST%';

-- 'ST%' is a wildcard that can be interpreted as "can have any or no character AFTER ST"
-- '%ST' is a wildcard that can be interpreted as "can have any or no character BEFORE ST"
-- 'ST_' is a wildcard that can be interpreted as "must have exactly one character AFTER ST"
-- '_ST' is a wildcard that can be interpreted as "must have exactly one character BEFORE ST"
-- '__ST' is interpreted as "must have two characters BEFORE ST"
-- 'ST__' is interpreted as "must have two characters AFTER ST"

-- rows where column job_id begins with ST
select *
from employees
where job_id like 'ST%';

-- no row has ST after one character in the job_id column
select *
from employees
where job_id like '_ST%';

-- rows where column job_id ends with MAN
select *
from employees
where job_id like '%MAN';

-- select phone numbers with 123 in the middle (between)
select *
from employees
where phone_number like '____123_____';

-- operators EBTWEEN and NOT BETWEEN: filter interval of values

-- employees with salary between 10k and 30k. BETWEEN is inclusive
select *
from employees
where salary between 10000 and 30000
order by salary desc;

-- filter employees with names begining between A and D.
-- gets everyone that starts with letters in the interval [A, D)
select *
from employees
where first_name between 'A' and 'D'
order by first_name;

-- the values doesn't necessary need to be a letter, they can be a set of characters or a name for example
-- in this case, bigger or smaller means iterating each letter and checking which one is bigger
-- for example: between 'ABC' and 'CD', I think the set of characters 'CA' wouldn't fit because A is 'smaller' than D in some sense


-- employees hired between 01-01-1999 and 31-12-2000
select *
from employees
where hire_date between '01-01-1999' and '31-12-2000';

-- negating some of the examples above

select * from employees where salary not between 10000 and 30000;

select * from employees where hire_date not between '01-01-1999' and '31-12-2000';

-- IN and NOT IN: allows to specify multiple values in the filter
-- basically a faster way to write OR operator

-- employees from department 30, 50 and 80
select *
from employees
where department_id in (30, 50, 80);

-- employees from other departments not in 30, 50, 80
select *
from employees
where department_id not in (30, 50, 80);


select *
from employees
where job_id in ('ST_MAN', 'PU_CLERK');


-- IS NULL and IS NOT NULL: filter null or not nul values

-- employees with no commission
select *
from employees
where commission_pct is null;

-- employees with commission
select *
from employees
where commission_pct is not null;

-- precedence rules:
-- many opearators together can cause doubts about which is executed first
-- if no parenthesis is used, the order will be

/*
1) comparision
2) IS NULL, LIKE, IN
3) BETWEEN
4) NOT
5) AND
6) OR
*/


select *
from employees
where job_id = 'IT_PROG' OR job_id = 'ST_MAN' AND salary > 5000;

-- in the query above, the first filter to be executed is (step by step)
/*
first executed operators: 
    - job_id = 'IT_PROG'
    - job_id = 'ST_MAN'
    - salary > 5000
after that, the AND clause is executed: 
    - (job_id = 'ST_MAN') AND (salary > 5000)
and then in the end, the OR clause is executed:
    - (job_id = 'IT_PROG') OR ((job_id = 'ST_MAN') AND (salary > 5000))

Precedence can be changed with the use of parentheses, as with other programming languages
I have explained the example above with parenthesis to understand the rules of precedence
*/

-- SUBSTITUTION VARIABLES
-- allows the user to interact with the query in a dynamic way
-- shows an input box to the user and the query will use this inputed value in the query

select * from employees
where employee_id = 100;

-- letting the user choose the employee_id
-- the code below will output a box where the user can choose the value to be used in the where filter
select * from employees
where employee_id = &employee_id;


-- asking a text to the user: variable to be returned need to be between ''
select * from departments
where department_name = '&department_name';

-- all employees between salary 10k and 30k
select * from employees
where salary between &salary and &salary;