-- Aggregation functions

-- count: count number of rows, if a column is specified, count number of non null items, 
-- if * is specified, count number of rows based on entire rows

-- in the example below, employee_id is not null so the count is equal to count(*), but commission_pct has null values, that is why count differs
select
    count(*) total_rows,
    count(employee_id) total_employee_ids,
    count(commission_pct) total_commission
from employees;


-- sum, avg, min and max works similarly, all of them skip null values
select
    avg(commission_pct) average_function,
    sum(commission_pct) sum_function,
    count(*) count_function,
    sum(commission_pct)/count(*) average_all_rows
from employees;


-- group by: group information to summarize a column by another column

select
    job_id,
    count(*) as number_employees
from employees
group by job_id;



select
    job_id,
    sum(salary) as total_earnings
from employees
group by job_id
order by total_earnings desc;

select
    department_id,
    job_id,
    sum(salary) as total_earnings,
    count(*) as total_employees
from employees
group by department_id, job_id
order by department_id asc;


-- nested aggregation functions
-- average of salary per department
select
    avg(salary)
from employees
group by department_id;
-- maximum of average of salary per department
select
    max(avg(salary))
from employees
group by department_id;

-- IMPORTANT: putting the name of the grouped column inside of the select is just for visualization, it is not necessary for groupping


-- group by + where:  filtering before groupping a table

select
    job_id,
    count(*)
from employees
where department_id in (80, 90, 100)
group by job_id;

select
    job_id,
    count(*)
from employees
where extract(year from hire_date) = 1998 -- could also use the function to_char(hire_date, 'YYYY')
group by job_id;

-- group by + having: filter after groupping

select
    job_id,
    count(*) as total_employee
from employees
group by job_id
having count(*) > 1;

-- CAN'T use the alias of the summarized column inside the having function, needs to specify the summarization function


