-- Single Row Functions: number, string and date

-- lower: make all characters lower case
-- upper: make all characters upper case
-- initcap: make the first characters of all words in a text upper case

select 
    first_name,
    lower(first_name),
    upper(first_name),
    job_id,
    initcap(job_id)
from employees;

-- because oracle sql is case sensitive, using lower or upper function is crucial to guarantee filters in where conditions for example

select *
from employees
where lower(job_id) = 'st_man'; -- lower in the where filter doesnt change the column, just internally when passing the column to the filter


-- concat: concatenate texts, same as using operator ||, but concat only allow two arguments
select
    first_name,
    last_name,
    first_name || ' ' || last_name,
    concat(first_name, concat(' ', last_name))
from employees;

-- substr: extract part of a text
select
    job_id,
    -- extract text from character in position 4 until 100
    substr(job_id, 4, 100)
from employees;

-- instr: return the position of a character in a text
select
    job_id,
    -- position of character _
    instr(job_id, '_'),
    -- text after position of character _
    substr(job_id, instr(job_id, '_'), 100)
from employees;

--length: returns size of the text
select
    first_name,
    length(first_name)
from employees;

-- lpad: create new text of size n, aligning the old text to the right and complete the text with the specified character in case there aren't n characters
select
    job_id,
    lpad(job_id, 15, '*')
from employees;

-- rpad: same as lpad, but aligns the text to the left
select
    job_id,
    rpad(job_id, 15, '*')
from employees;

-- replace: intuitive, replace an old text with a new one
select
    job_id,
    -- replace PROG with PR
    replace(job_id, 'PROG', 'PR')
from employees;

-- numerical functions

-- round: round a value to specified decimal mathematically
-- trunc: truncate a value in the specified position
-- mod: returns the rest of a division
select
    round(30.552, 2),
    round(30.556, 2),
    trunc(30.556, 2),
    mod(30, 4)
from dual;

-- date functions

select
    first_name,
    hire_date,
    sysdate,
    -- months_between: return number of months between two dates
    months_between(hire_date, sysdate),
    trunc(months_between(hire_date, sysdate), 0),
    -- addmonths: add months in a date
    add_months(sysdate, 3)
from employees;

-- next_day: returns next day from specified date
select
    sysdate,
    next_day(sysdate, 'domingo'),
    next_day(sysdate, ' sexta')
from dual;


-- last_day: extracts last day of the month
select
    sysdate,
    last_day(sysdate)
from dual;
    

-- extract: extract year, month and day from date
select
    sysdate,
    extract(year from sysdate),
    extract(month from sysdate),
    extract(day from sysdate)
from dual;


-- conversion and null functions
-- to_chart: convert from number and date to numbers using specified format
select
    sysdate hoje,
    to_char(sysdate, 'yyyy') ANO,
    to_char(sysdate, 'mm') NUM_MES,
    to_char(sysdate, 'month') MONTH_NAME,
    -- abbr month name
    to_char(sysdate, 'MON') month_abrev,
    -- add month day
    to_char(sysdate, 'day') day_name,
    to_char(sysdate, 'dd'), -- number of the day,
    to_char(sysdate, 'DY') abrev_day,
    to_char(sysdate, 'hh12') hour_in_12,
    to_char(sysdate, 'hh24') hour_in_24,
    to_char(sysdate, 'mi') minutes,
    to_char(sysdate, 'ss') ss,
    to_char(sysdate, 'day') day_name,
    to_char(sysdate, 'DAY, DD "de" MONTH "de" YYYY') hora_24    
from dual;

-- g: milhar and d: decimals
-- sequence of 9's: doesnt increase
-- sequence with 0's: includes zeros

select
    first_name,
    salary,
    to_char(salary, '999g999d99'), -- g: milhar and d: decimals
    to_char(salary, '000g000g00'),
    to_char(salary, 'l999g999d99') -- convert to currency
from employees;

-- to_number: convert from text to number when possible
select to_number('123,44') from dual;

-- to_date: converts text to date
select 
    to_date('10-05-2011', 'dd-mm-yyyy'),
    to_date('10/05/2011', 'dd-mm-yyyy')
from dual;



-- functions to operate on null values

-- nvl: change null to another value
select
    first_name,
    commission_pct,
    nvl(commission_pct,0)
from employees;


-- coalesce: receives list of arguments and return first one not null
select
    coalesce(null, null, 'sql', null, 'abc', null)
from dual;

-- nvl2: variation of nvl. allows to change null to another value and also other values to other value
-- if first parameter is not null, change to second parameter, if first parameter is null, change to third parameter
select
    first_name,
    commission_pct,
    nvl2(commission_pct, 0.5, 0) -- if commission_pct is not null, change to 0.5, if it is null change to 0
from employees;


-- nlv(column, 0) is the same as nlv2(column, column, 0)

-- nullif: returns null if two arguments are equal, if the two arguments are different it returns the first one
select
    nullif(10, 10),
    nullif(5, 2)
from dual;









