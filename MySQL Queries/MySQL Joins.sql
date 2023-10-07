# JOIN: merge two tables selecting columns from both of them.
# INNER JOIN: take the table from the left and complete with the information from the right, only intersection (what have in both tables).
SELECT 
	ped.ID_Pedido,
    ped.Data_Venda,
    ped.ID_Produto,
    ped.Qtd_Vendida,
    ped.Receita_Venda,
    prod.Nome_Produto,
    prod.Marca_Produto
FROM pedidos AS ped
INNER JOIN produtos AS prod
	ON ped.ID_Produto = prod.ID_Produto;
    
SELECT
	ID_Pedido,
    Data_Venda,
    Receita_Venda, 
    Custo_Venda,
    clientes.Nome,
    clientes.Email
FROM pedidos
INNER JOIN clientes
	ON pedidos.ID_Cliente = clientes.ID_Cliente;
 
 # LEFT JOIN: take table from the left and complete with information from the right table. All items from the left and only matching rows from the right
SELECT
	ID_Pedido,
    Data_Venda,
    Receita_Venda, 
    Custo_Venda,
    clientes.Nome,
    clientes.Email
FROM pedidos
LEFT JOIN clientes
	ON pedidos.ID_Cliente = clientes.ID_Cliente;

# LEFT JOIN: take table from the right and complete with information from the left table.
SELECT
	p.ID_Pedido,
    p.Data_Venda,
    p.Receita_Venda, 
    p.Custo_Venda,
    c.Nome,
    c.Email,
    c.ID_Cliente
FROM pedidos AS p
RIGHT JOIN clientes AS c
	ON p.ID_Cliente = c.ID_Cliente;
    
# JOIN + WHERE: WHERE should come after the JOIN.
SELECT
	p.ID_Pedido,
    p.Data_Venda,
    p.Receita_Venda, 
    p.Custo_Venda,
    c.Nome,
    c.Sexo,
    c.Email,
    c.ID_Cliente
FROM pedidos AS p
RIGHT JOIN clientes AS c
	ON p.ID_Cliente = c.ID_Cliente
WHERE Sexo = "M";

# JOIN + GROUP BY
SELECT
	produtos.ID_Produto,
    produtos.Nome_Produto,
	SUM(Receita_Venda) AS 'Receita'
FROM pedidos
INNER JOIN produtos
	ON pedidos.ID_Produto = produtos.ID_Produto
GROUP BY ID_Produto, produtos.Nome_Produto;

# Exercise JOIN + GROUP BY
# group by revenue and cost per Store ID
# add store name instead of the ID
SELECT
	pedidos.ID_Loja,
    lojas.Loja,
    SUM(pedidos.Receita_Venda) AS 'Receita',
    SUM(pedidos.Custo_Venda) AS 'Custo'
FROM
	pedidos
INNER JOIN lojas
	ON pedidos.ID_Loja = lojas.ID_Loja
GROUP BY ID_Loja, lojas.Loja;









