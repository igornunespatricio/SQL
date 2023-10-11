-- Subqueries


-- employees with salary higher than average
select *
from hr.employees
where salary > (select avg(salary) from hr.employees);

-- employees from specific location_id
select *
from employees
where department_id in (
                            select department_id from departments where location_id = 1700
                        );
                        

-- employees where salary is equal to the average of one of the departments
select *
from employees
where salary in (
                    select avg(salary) from employees
                    group by department_id
                );
                
-- employees where salary is less than at least one average salary of any department
select *
from employees
where salary < any (
                        select avg(salary) from employees
                        group by department_id
                    );
                    
-- employees where salary is bigger than at least one of the average salary of any department
select *
from employees
where salary > any (
                        select avg(salary) from employees
                        group by department_id
                    )
order by salary;

-- employees where salary is smaller than all average salary of departments
select *
from employees
where salary < all (
                        select avg(salary) from employees
                        group by department_id
                    )
order by salary;

-- employees where salary is bigger than all average salary of departments
select *
from employees
where salary > all (
                        select avg(salary) from employees
                        group by department_id
                    )
order by salary;


-- employees with biggest salary for each department
select department_id, max(salary)
from employees
group by department_id;

-- it can filter by tuple. in this case, (department_id, salary)
select * 
from employees
where (department_id, salary) in (
                                    select department_id, max(salary)
                                    from employees
                                    group by department_id
                                )
order by department_id;


-- exists and not exists

-- list departments that contains at least one employee
select *
from departments
where department_id in (select distinct department_id from employees);

-- also list departments with no employees
select *
from departments
where department_id not in (select distinct department_id from employees);
-- not in DOES NOT work with null values in the list!!!

-- treating the null value before passing the departments as subqueries
select *
from departments
where department_id not in (select distinct department_id from employees where department_id is not null);

-- using exists and not exists, finally  :)
select * from departments d
where exists (
                select * from employees e
                where e.department_id = d.department_id
            );
-- checks each d.department_id that exists in employees table

-- opposite of above
select * from departments d
where not exists (
                select * from employees e
                where e.department_id = d.department_id
            );


-- return employees which are also managers (table with relationship to itself)
select *
from employees em
where exists (
                select * from employees ee
                where ee.manager_id = em.employee_id
            )
order by employee_id;
-- what this query does basically is: from the employees table (Manager one, "em"), filter rows where exists employees (now Employees table, "ee") where the manager id (in this case ee.manager_id) is equal to the employee_id of the managers table (in this case em.employee_id).
-- confusing but understandable :)

-- employees not managers 
select *
from employees em
where not exists (
                select * from employees ee
                where ee.manager_id = em.employee_id
            )
order by employee_id;


-- correlated subqueries

-- employees where salary is bigger than average of their department
select *
from employees e1
where e1.salary > (
                select avg(e2.salary)
                from employees e2
                where e2.department_id = e1.department_id
                );

-- employees where salary is the biggest of their department
select *
from employees e1
where e1.salary = (
                    select max(e2.salary)
                    from employees e2
                    where e2.department_id = e1.department_id
                )
order by e1.department_id;
                

-- subquery in the select clause

select
    employee_id,
    first_name,
    last_name,
    job_id,
    salary,
    round((select avg(salary) from employees), 2) avg_salary,
    round(salary,2) - round((select avg(salary) from employees), 2) avg_salary
from employees;


-- subquery from clause

-- return number of employees by job_id, take biggest amount, average amount and less amount of employees (analysis by job_id)


select
    max(employeesAmount),
    min(employeesAmount),
    avg(employeesAmount)
from (
        select
            job_id,
            count(*) employeesAmount
        from employees
        group by job_id
    ) t;





