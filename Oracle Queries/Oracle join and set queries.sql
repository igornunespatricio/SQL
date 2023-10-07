-- joins: create relationship between tables based on primary and foreign keys.
-- inner join: bring rows that both tables have in common.
-- left join: bring rows from the left table and matching rows from the right table.
-- right join: bring rows from the right table and matching rows from the left table.
-- full join: bring all rows from both left and right tables, even if they match or not.

-- set: concatenate tables one above the other.
-- union all: concatenate tables one above the other. Column names must be equal. returns all rows from tables
-- union: concatenate tables one above the other, but remove duplicates (based on what? primary key? id?)
-- intersect: intersection between both tables (based on what? primary key? id?)
-- minus: everything from one table that is not on the other table (not very good explanation in the course)


-- inner join

-- joining employees and departments tables
select
    e.employee_id,
    e.first_name,
    e.email,
    e.salary,
    e.department_id,
    d.department_name
from employees e
inner join departments d
    on e.department_id = d.department_id;

-- joining departments and locations
select
    d.department_id,
    d.department_name,
    l.city,
    l.country_id
from departments d
inner join locations l
    on d.location_id = l.location_id;

-- to select all columns from the table departments do d.* or locations do l.*

-- relationship between 4 tables at once: employees, departments, jobs and locations

select
    e.employee_id,
    e.first_name,
    d.department_name,
    j.job_title,
    l.city,
    l.country_id
from employees e
inner join departments d
    on e.department_id = d.department_id
    inner join locations l
        on d.location_id = l.location_id
inner join jobs j
    on e.job_id = j.job_id;


-- self join: join of a table with itself

-- in the employees table, the manager_id is also the employee_id
-- in this case, we have to imagine as the employees table being two different tables
-- one table with employees information and another table with manager information
-- use alias for table names to help organize thoughts and code

select
    e.employee_id employee_id_from_employee_table,
    e.first_name name_from_employee_table,
    e.manager_id manager_id_from_employee_table,
    m.employee_id employee_id_from_manager_table,
    m.first_name name_from_manager_table
from employees e
inner join employees m
    on e.manager_id = m.employee_id;


-- left join: returns rows from the left table and matching rows from the right table
select
    e.employee_id,
    e.first_name,
    e.email,
    e.salary,
    e.department_id,
    d.department_name
from employees e
inner join departments d
    on e.department_id = d.department_id;
-- the select above has 106 employees with department, but there are 107 employees actually
-- this happens because inner join only returns what matches in both tables. In this case, it is skipping one employee
-- solution is to use left join with the employees table on the left
select
    e.employee_id,
    e.first_name,
    e.email,
    e.salary,
    e.department_id,
    d.department_name
from employees e
left join departments d
    on e.department_id = d.department_id;
-- in this case, left join returns all 107 employees, even if the employee has no department_id

-- right join is the opposite: keeps all rows from the right table, and matching ones from left table
select
    e.employee_id,
    e.first_name,
    e.email,
    e.salary,
    e.department_id,
    d.department_name
from employees e
right join departments d
    on e.department_id = d.department_id;
-- bottom of the select above shows a lot of departments with no employee

-- full join: considers all rows from left and right
select
    e.employee_id,
    e.first_name,
    e.email,
    e.salary,
    e.department_id,
    d.department_name
from employees e
full join departments d
    on e.department_id = d.department_id;


-- cross join: all possible combinations (cartesian product) between columns
select
    d.department_name,
    j.job_title
from departments d
cross join jobs j;


-- union all: concatenate both tables, duplicate rows (based on all fields) are kepts
select
    employee_id, job_id, salary
from employees
where department_id in (50, 80, 100)

union all

select
    employee_id, job_id, salary
from employees
where job_id = 'ST_MAN'
order by employee_id;
-- gives us 90 rows: keep duplicate rows

-- union: concatenate both tables but exclude duplicate rows
select
    employee_id, job_id, salary
from employees
where department_id in (50, 80, 100)

union

select
    employee_id, job_id, salary
from employees
where job_id = 'ST_MAN'
order by employee_id;
-- since there are 85 rows now, it tells us that there are 5 duplicated rows in the table


-- intersect: 
select
    employee_id, department_id, job_id, salary
from employees
where department_id in (30, 50, 100)

intersect

select
    employee_id, department_id, job_id, salary
from employees
where department_id in (30, 60, 90)
order by employee_id;
-- the only intersection between both queries (before intersect command and after intersect command) are the ones where department_id is 30. And only this is returned.


-- minus: substract (or remove) rows from the table after the minus command
select
    employee_id, department_id, job_id, salary
from employees
where department_id in (30, 50, 100)

minus

select
    employee_id, department_id, job_id, salary
from employees
where department_id in (30, 60, 90)
order by employee_id;
-- in this case, the rows returned are only from department_id 50 and 100, because department_id 30 is subtracted



