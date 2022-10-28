queries_projeto_logico_BD

USE ecommerce;

# Recuperando algumas informações dos clientes que fizeram os pedidos 
SELECT c.nome, e.municipio, e.UF, p.nomeProduto, sp.descricaoStatusPedido, ROUND(pe.valorFrete + p.valorProduto, 2) AS Valor_Total FROM pedido AS pe
	JOIN cliente AS c USING (idCliente)
	JOIN produto AS p USING (idProduto)
	JOIN endereco AS e USING (idEndereco)
	JOIN statusPedido AS sp USING (idStatusPedido)
	ORDER BY (pe.idStatusPedido);

# Verificar os produtos que estão estocados em SP
SELECT p.nomeProduto AS Produto, e.quantidadeProduto AS Quantidade, f.razaoSocial AS Fornecedor, en.UF AS "Local Estocado" FROM estoque AS e
	JOIN produto AS p USING (idProduto)
    JOIN fornecedor AS f USING (idFornecedor)
	JOIN endereco AS en ON  en.idEndereco = e.idEndereco
	WHERE en.UF = "SP";

# Retornar apenas os estoque que tenham mais de 10 produtos, trazendo a quantidade de produtos diferentes e a quantidade total de produtos no estoque 
SELECT COUNT(es.idProduto) AS "Produtos Diferentes", SUM(es.quantidadeProduto) AS "Quantidade de Produtos", e.municipio, e.UF FROM estoque as es
	JOIN endereco as e USING (idEndereco)
	GROUP BY es.idEndereco
	HAVING SUM(quantidadeProduto) > 10;

	