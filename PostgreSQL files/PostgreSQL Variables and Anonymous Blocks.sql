-- VARIABLES and Anonymous Blocks

-- variables are easy, as any other programming language. They are associated with data type as NUMERIC, DATE, VARCHAR, etc

-- Anonymous Blocks: they are block of codes that will have a serie of commands that will execute an action. It is an introduction to Functions and Procedures

do $$ -- this will set the begin and end part of the block of code
declare -- optional to declare variables inside the block of code
	nome varchar(100); -- declaring name that will be of type varchar
	salario decimal(10,2); -- salary will be of type decimal
	data_contratacao date; -- hire date will be of type date
begin
	nome := 'Igor'; -- set the name as Igor
	salario := 3500; -- set the salary as 3500 BRL
	data_contratacao := '2021-11-25'; -- set hire date
	raise notice 'I, %, was hired in %, with a salary of R$%.', nome, data_contratacao, salario; -- text to output with variables
end $$;


-- example 1: create simple calculator of sold value using variables: quantidade, preco, valor_vendido and vendedor

do $$
declare
	quantidade int := 50;
	preco decimal := 100;
	valor_vendido int;
	vendedor varchar(100) := 'Igor';
begin
	valor_vendido := quantidade * preco;
	raise notice '% sold % amount each costing R$%. Total sold was R$%.', vendedor, quantidade, preco, valor_vendido;
end $$

-- example 2: number of products above average

do $$
declare
	media_preco decimal;
	qtd_produtos_acima_media int;
begin
	media_preco := (select avg(unit_price) from products);
	qtd_produtos_acima_media := (select count(*) from products where unit_price >= media_preco);
	raise notice 'The average price is R$% and the number of products above the average is %.', media_preco, qtd_produtos_acima_media;
end $$


-- Functions
-- functions examples can be text functions round, date functions, truncate number, age, etc
-- with functions we can create personalized functions. They are named User-Defined-Functions. They are similar to anonymous blocks but they have a name

-- example: function that return the total number of products that have stock total between a minimum and a maximum, both user defined

create or replace function stock_analysis(minimum int, maximum int) -- creates function named stock_analysis, with user defined parameters minimum and maximum, both integers
returns int -- returns an integer too
language plpgsql -- language used, in some SQL like MySQL and SQL Server it is not necessary to define the language
as
$$ -- from here to the bottom of the function is the same thing of the anonymous block
declare
	count_stock int; -- declare variables here
begin
	count_stock = (select count(*) from products where units_in_stock between minimum and maximum); -- programming logic to be computed
	
	return count_stock; -- a function returns something :)
	
end $$; --end block of code
	
-- using function

select stock_analysis(10, 50); -- products with okay stock

select count(*) - stock_analysis(10, 50) as "products outside stock interval" from products; -- products with stock not okay


-- how to call a function: 

select stock_analysis(20, 50);

select stock_analysis(minimum := 20, maximum := 50);

select stock_analysis(20, maximum := 50); -- not recommended, in this case we cannot passed the first parameter explicitly

select stock_analysis(minimum := 20, 50); -- error, positional argument can't follow named argument

-- delete a function
drop function if exists stock_analysis 

-- if exists can be used to return a warning if the function doesn't exists. If not using "if exists" the command returns an error if the function does not exists


-- Functions that Return a Table
-- almost same sintaxe as previous function

create or replace function find_clients(title_selected varchar)
returns table
	(
		id customers.customer_id%type, -- take same type of data from column customer_id from table customers
		name customers.contact_name%type, -- same thing, take type of column contact_name from table customers
		phone_number customers.phone%type, -- gets type of phone column of customers table
		title customers.contact_title%type -- same thing
	) -- columns identified types automatically from the table  
language plpgsql
as
$$
declare
begin
	return query
		select
			customer_id,
			contact_name,
			phone,
			contact_title
		from customers
		where contact_title = title_selected;
end $$;


select * from find_clients(title_selected := 'Owner');

drop function if exists find_clients;


