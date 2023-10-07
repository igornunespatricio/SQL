-- Number, text and data functions

-- Number Functions

-- CEILING: first integer bigger than number
-- FLOOR: previous integer smaller than number
-- ROUND: mathematically round number with specified decimals
-- TRUNC: truncate number with specified decimals

SELECT
	AVG(unit_price),
	CEILING(AVG(unit_price)),
	FLOOR(AVG(unit_price)),
	ROUND(CAST(AVG(unit_price) AS NUMERIC), 3),
	TRUNC(CAST(AVG(unit_price) AS NUMERIC), 3)
FROM
	products;
	

-- Text Functions

-- UPPER: caps lock all characters of text
-- LOWER: lower all characters of text
-- LENGTH: takes the size of the text
-- INITCAP: capitalize each word of text

SELECT
	first_name,
	UPPER(first_name),
	LOWER(first_name),
	length(first_name),
	INITCAP('hello word')
FROM employees;

-- REPLACE: replaces a text with other text in a string
SELECT
	contact_title,
	REPLACE(contact_title, 'Owner', 'CEO')
FROM customers;

-- SUBSTRING: extracts parts of a text.
-- STRPOS: extract position of a text in a text.

-- RIGHT and LEFT: take characters from RIGHT and LEFT, specify number of characters.

-- more control with SUBSTRING than with LEFT and RIGHT

SELECT
	contact_name,
	LEFT(contact_name, 5),
	RIGHT(contact_name, 5),
	SUBSTRING(contact_name, 1, 5), -- from contact_name, after the first position, take 5 characters (same as LEFT)
	STRPOS(contact_name, ' '), -- position of space string ' '
	SUBSTRING(contact_name, 1, STRPOS(contact_name, ' ') - 1), -- every character before the space ' '
	SUBSTRING(contact_name, STRPOS(contact_name, ' ') + 1, 1000) -- every character after the space ' '
FROM customers;

-- Date Functions

SELECT
	first_name,
	birth_date,
	CURRENT_DATE, -- returns the current date, very intuitive
	AGE(birth_date), -- return the age based on the date passed
	hire_date,
	DATE_PART('year', hire_date) AS "YEAR", -- return year from date object
	DATE_PART('month', hire_date) AS "MONTH", -- return month from date object
	DATE_PART('day', hire_date) AS "DAY" -- return day from date object
FROM employees;












