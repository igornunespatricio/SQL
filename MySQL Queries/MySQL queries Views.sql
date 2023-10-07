# VIEW: is like a table in SQL, but can gather multiple tables, and just the necessary information of each table, their transformation and etc.

# CREATE VIEW: creating a view
CREATE VIEW vwclientes AS
SELECT
	ID_Cliente,
    Nome,
    Data_Nascimento,
    Email,
    Telefone
FROM clientes;

SELECT
	ID_Cliente,
    Nome
FROM vwclientes
WHERE ID_Cliente <= 4;

# ALTER VIEW: change an exiting view in the database
ALTER VIEW vwclientes AS
SELECT
	ID_Cliente,
    Nome,
    Email,
    Telefone,
    Escolaridade
FROM
	clientes
WHERE Escolaridade = 'Parcial';

SELECT * FROM vwclientes;

# DROP VIEW: delete view from database
DROP VIEW vwclientes;

# Example: creating VIEW with WHERE
CREATE VIEW vwReceitaAcima4000 AS
SELECT
	*
FROM pedidos
WHERE Receita_Venda > 4000;

ALTER VIEW vwReceitaAcima4000 AS
SELECT
	*
FROM pedidos
WHERE Receita_Venda > 4000 AND ID_Loja IN (1,2,3,4);

SELECT * FROM vwReceitaAcima4000;

# Example 2:  creating VIEW with WHERE again :)
CREATE VIEW vwProdutosAtualizada AS
SELECT
	*
FROM produtos
WHERE Marca_Produto in ('DELL', 'SAMSUNG', 'SONY');

SELECT DISTINCT Marca_Produto FROM vwProdutosAtualizada;


# Example with GROUP BY
CREATE VIEW vwReceitaECustoTotal AS
SELECT 
	ID_Produto,
    SUM(Receita_Venda) AS 'Total Receita',
    SUM(Custo_Venda) AS 'Custo Total'
FROM pedidos
GROUP BY ID_Produto
ORDER BY 'Total Receita';

ALTER VIEW vwReceitaECustoTotal AS
SELECT
	ID_Produto,
    SUM(Receita_Venda) AS 'Total Receita',
    SUM(Custo_Venda) AS 'Total Custo'
FROM pedidos
WHERE ID_Loja = 2
GROUP BY ID_Produto;

SELECT * FROM vwReceitaECustoTotal;

ALTER VIEW vwReceitaECustoTotal AS
SELECT
	ID_Produto,
    SUM(Receita_Venda) AS 'Total Receita',
    SUM(Custo_Venda) AS 'Total Custo'
FROM pedidos
WHERE ID_Loja = 2
GROUP BY ID_Produto
HAVING `Total Receita` > 1000000;

SELECT * FROM vwReceitaECustoTotal;

# CREATING VIEW with INNER JOIN and GROUP BY

CREATE VIEW vwPedidosCompleta AS
SELECT
	pe.*,
    pr.Nome_Produto,
    pr.Marca_Produto,
    pr.Num_Serie
FROM pedidos AS pe
INNER JOIN produtos AS pr
	ON pe.ID_Produto = pr.ID_Produto;
    
SELECT * FROM vwPedidosCompleta;

CREATE VIEW vwResultadoFinal AS
SELECT
	pr.ID_Produto,
	pr.Nome_Produto,
    SUM(pe.Receita_Venda) AS 'ReceitaTotal',
    SUM(pe.Custo_Venda) AS 'CustoTotal'
FROM pedidos as pe
INNER JOIN produtos AS pr
	ON pe.ID_Produto = pr.ID_Produto
GROUP BY pr.ID_Produto, pr.Nome_Produto;

SELECT * FROM vwResultadoFinal;









