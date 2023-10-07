# SUBQUERIES

# They are select commands inside other selects. They can be used for example when filtering tables with WHERE command, as a new column of the query or as a data source for other SELECTS.

# Using as filters for new queries

# filtering managers with name in variable NomeGerente
SET @NomeGerente = "Marcelo Castro";
SELECT
	*
FROM pedidos
WHERE pedidos.ID_Loja = (
					SELECT 
						DISTINCT lojas.ID_Loja 
					FROM lojas 
                    WHERE lojas.Gerente = @NomeGerente
                    );

# filtering products with price above average
SELECT
	*
FROM produtos
WHERE Preco_Unit > (
					SELECT 
						AVG(Preco_Unit) 
					FROM produtos
                    );

# filtering products from a specific category
SET @categoria = "Notebook";
SELECT
	*
FROM produtos
WHERE produtos.ID_Categoria = (
								SELECT 
									ID_Categoria
								FROM categorias
                                WHERE categorias.Categoria = @categoria
                                );

# get info from client that generate the biggest revenue
SELECT
	*
FROM clientes
WHERE clientes.ID_Cliente = (
							SELECT
								ID_Cliente
							FROM pedidos
							GROUP BY ID_Cliente
							ORDER BY SUM(Receita_Venda) DESC
							LIMIT 1
                            );

# sum of revenue of products from the brand DELL
SET @brand = "DELL";
SELECT
	SUM(Receita_Venda) AS 'Receita'
FROM pedidos
WHERE ID_Produto IN (
					SELECT
						produtos.ID_Produto
					FROM produtos
                    WHERE produtos.Marca_Produto = @brand
                    );

# requests in the Sudeste region
SELECT
	*
FROM pedidos
WHERE ID_Loja IN (
				SELECT
					ID_Loja
				FROM lojas
                WHERE lojas.Loja IN (
									SELECT
										Cidade
									FROM locais
                                    WHERE locais.Região = "Sudeste"
                                    )
				);
                
# select as subquery to create another column from a query

# create a column in a query with the average of the of the unit price
SELECT
	*,
    (SELECT AVG(Preco_Unit) FROM produtos) AS 'PrecoMedio'
FROM produtos;

# subquery as a table to get data from

# from the total sales by produtos, what was the maximum, minimum and mean
SELECT
	MAX(Vendas) AS 'max',
    MIN(Vendas) AS 'min',
    AVG(Vendas) AS 'avg'
FROM (
		SELECT
			ID_Produto,
            COUNT(*) AS 'Vendas'
		FROM pedidos
        GROUP BY ID_Produto
        ) AS tabela;


# EXISTS and NOT EXISTS: test existence of records in a query. Test if values present in a table are present in another table.

# example: checking categories that have a product
SELECT
	ID_Categoria
FROM categorias
WHERE EXISTS (
				SELECT
					ID_categoria
				FROM produtos
                WHERE categorias.ID_Categoria = produtos.ID_Categoria
			);

# example with categories that does not have any products
SELECT
	*
FROM categorias
WHERE NOT EXISTS (
				SELECT
					*
				FROM produtos
                WHERE categorias.ID_Categoria = produtos.ID_Categoria
			);
