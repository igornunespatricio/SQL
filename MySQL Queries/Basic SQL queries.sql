# Limiting results (EQUAL to TOP command in SQL)
SELECT * FROM base.pedidos LIMIT 100;

# Select lines limited to LIMIT and OFFSET by 5
SELECT * FROM base.pedidos LIMIT 100 OFFSET 3;

# DISTINCT - select distinct values of a column of a table
SELECT DISTINCT base.produtos.Marca_Produto FROM produtos;

# ORDER BY - order a table using columns
SELECT * FROM base.clientes ORDER BY base.clientes.Nome;
SELECT * FROM base.clientes ORDER BY base.clientes.Nome DESC;
SELECT * FROM base.clientes ORDER BY base.clientes.Renda_Anual ASC;
SELECT * FROM base.clientes ORDER BY base.clientes.Renda_Anual DESC;
SELECT * FROM base.clientes ORDER BY base.clientes.Data_Nascimento ASC;
SELECT * FROM base.clientes ORDER BY base.clientes.Data_Nascimento DESC;
# ORDER BY - two or more columns
SELECT * FROM base.clientes ORDER BY base.clientes.Renda_Anual DESC, base.clientes.Data_Nascimento DESC;

# WHERE - filter rows by column
SELECT * FROM base.clientes;
SELECT * FROM base.clientes WHERE base.clientes.Renda_Anual > 80000;
SELECT * FROM base.clientes WHERE Sexo = 'M';
SELECT * FROM base.clientes WHERE Escolaridade = 'parcial';
SELECT * FROM base.clientes WHERE Data_Nascimento > '2000-01-01';

# WHERE with Logic Operators AND, OR and NOT
SELECT * FROM base.clientes WHERE Estado_Civil = 'C' AND Sexo = 'F';
SELECT * FROM clientes WHERE Estado_Civil = 'S' OR Renda_Anual >= 10000;
SELECT * FROM clientes WHERE NOT Escolaridade = 'Pós-graduado';
SELECT * FROM produtos WHERE Marca_Produto = 'DELL' AND Preco_Unit > 2000;
SELECT * FROM produtos WHERE Marca_Produto = 'Dell' OR Marca_Produto = 'ALTURA';
SELECT * FROM produtos WHERE NOT Marca_Produto = 'Samsung';

# WHERE with IS NULL and IS NOT NULL
SELECT * FROM clientes WHERE Telefone IS NULL;
SELECT * FROM lojas WHERE Telefone IS NOT NULL;

# NULL is different from empty ''
SELECT * FROM clientes WHERE Telefone='';

# LIKE - special filters with WHERE. LIKE is used with regex expressions
SELECT * FROM clientes WHERE Email LIKE '%gmail%'; -- must have gmail, can have text before or after
SELECT * FROM clientes WHERE Email LIKE '%br'; -- must have br in the end

# WHERE + IN, WHERE + NOT IN
SELECT * FROM produtos WHERE Marca_Produto IN ('dell', 'sony', 'altura');
SELECT * FROM produtos WHERE Marca_Produto NOT IN ('dell', 'sony', 'altura');

# SELECT + BETWEEN
SELECT * FROM produtos WHERE Preco_Unit BETWEEN 1000 AND 2500;
SELECT * FROM clientes WHERE Data_Nascimento BETWEEN '1995-01-01' AND '1999-12-31';

# Aggregation functions: COUNT ignores null values, COUNT DISTINCT counts distinct values of a column
SELECT COUNT(ID_Cliente) FROM clientes;
SELECT COUNT(telefone) FROM clientes; -- COUNT does not consider null values in a column
SELECT COUNT(*) FROM clientes; -- count every row of the table, including null values
SELECT COUNT(Marca_Produto) FROM produtos;
SELECT COUNT(DISTINCT Marca_Produto) FROM produtos; -- count distinct number of brands

# Aggregation functions: SUM, AVG, MIN, MAX
SELECT SUM(Receita_Venda), AVG(Receita_Venda), MIN(Receita_Venda), MAX(Receita_Venda) FROM pedidos;

# GROUP BY: summary statistics or group information in a table
SELECT Marca_Produto, COUNT(*) AS 'count' FROM produtos GROUP BY Marca_Produto ORDER BY count DESC;
SELECT Sexo, COUNT(*) AS 'count' FROM clientes GROUP BY Sexo ORDER BY count DESC;
SELECT ID_Produto, SUM(Receita_Venda) 'Revenue' FROM pedidos GROUP BY ID_Produto ORDER BY Revenue DESC;

# GROUP BY: grouping with 2 or more columns
SELECT Escolaridade, Sexo, COUNT(*) AS 'count' FROM clientes GROUP BY Escolaridade, Sexo ORDER BY count DESC;
SELECT ID_Loja, ID_Produto, SUM(Receita_Venda) 'Revenue' FROM pedidos GROUP BY ID_Loja, ID_Produto ORDER BY Revenue DESC;

# GROUP BY + WHERE:  filter before the group command
SELECT Escolaridade, Sexo, COUNT(*) AS 'count' FROM clientes GROUP BY Escolaridade, Sexo ORDER BY count DESC;
SELECT Escolaridade, Sexo, COUNT(*) AS 'count' FROM clientes WHERE Sexo = 'F' GROUP BY Escolaridade, Sexo ORDER BY count DESC;

# GROUP BY + HAVING: filter after the group command
SELECT Escolaridade, Sexo, COUNT(*) AS 'count' FROM clientes GROUP BY Escolaridade, Sexo HAVING Sexo = 'F' ORDER BY count DESC;
SELECT Escolaridade, Sexo, COUNT(*) AS 'count' FROM clientes GROUP BY Escolaridade, Sexo HAVING count > 10 ORDER BY count DESC;
SELECT ID_Produto, SUM(Receita_Venda) AS 'Revenue' FROM pedidos GROUP BY ID_Produto HAVING Revenue > 5e6 ORDER BY Revenue;

#