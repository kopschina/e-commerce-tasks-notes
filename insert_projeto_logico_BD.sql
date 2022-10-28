insert_projeto_logico_BD

USE ecommerce;

INSERT INTO endereco(CEP, logradouro, complemento, numero, municipio, UF)
	VALUES(08181808, 'Rua do Salgueiro',null, '01', 'São Paulo', 'SP'),
		  (01235887, 'Rua Quinze', 'apt 01 bloco a', '1551', 'Guarulhos', 'SP'),
          (02701980, 'Av. Bela Vista', 'apt 55 bloco Primavera', '510', 'São Paulo', 'SP'),
          (8500000, 'Avenida Brasil', 'bloco Red, apto 170', '243', 'Rio de Janeiro', 'RJ'),
          (350000, 'Rua Dr. José Batista', null, '980', 'Rio de Janeiro', 'RJ'),
          (70000, 'Rua Americo Gaspar', null, '98', 'Belo Horizonte', 'MG'),
          (1350000, 'Rua Santa Efigênia', null, '2700', 'São Paulo', 'SP'),
          (1234589, 'Avenida Farropilhas', null, '1964', 'Porto Alegre', 'RS'),
          (20202020, 'Avenida dos Jacares', null, '202020', 'Jacareí', 'SP'),
          (21234500, 'Rua José João Grande', null, '123', 'Bangu', 'RJ'),
          (0100000, 'Avenida Perimetral', null, '189', 'Belo Horizonte', 'MG');

INSERT INTO cliente(nome, identificacao, idEndereco, email, telefone, tipocliente)
	VALUES('Margarita Conceição da Silva', null, 1, 'margaritacsilva1982@gmail.com', 1198333333, 'Física'),
		  ('José Maria de Jesus', null, 2, 'pequenojosejesus@gmail.com', 1122334455, 'Física'),
          ('Willian Vangot Betwovi', null, 3, 'regentemenor@gmail.com', 1176568978, 'Física'),
          ('Paulo Enrique de Almeida Americo', null, 4, 'paulo.enrique.almeida@globo.com', 2135999999, 'Física'),
          ('Patricia Poeta', null, 5, 'reportepatricia@globo.com', 2122335869, 'Física');

INSERT INTO formaPagamento(idCliente, tipoPamento, numeroCartao, nomeCartao, validadeCartao)
	VALUES(1, 'PIX', null, null, null),
          (2, 'Boleto', null, null, null),
          (3, 'Cartão', '1234567890123456', 'Willian V Betwovi', '2025-08-01'),
          (4, 'Cartão', '444455556666777','Paula Pequeno', '2030-12-01'),
          (5, 'Cartão', '1234123412341234', 'Patricia Poeta', '2031-01-01');
 
 INSERT INTO fornecedor(razaoSocial, CNPJ, idEndereco)
	VALUES('Casa de Brinquedo','00123488000114',6),
		  ('Eletronica Mil','78123488000114',7),
          ('Maria Limão','77123488000222',8);
 
 INSERT INTO produto(nomeProduto, descricaoProduto, valorProduto, quantidade, idFornecedor)
	VALUES("Monitor Samsung 34", "Monitor Samgung 34 LCD modelo XCV20354", 1399.99, 3, 2),
		  ("Monitor LG Ultrawide 39", "Monitor LG com tecnologia ultrawide, muito mais visão para seus jogos", 1399.99, 4, 2),
          ("Cabo HDMI 2mt", "Cabo HDMI 02 metros, ótima qualidade", 10.00, 20, 2),
          ("Cabo HDMI 5 mt", "Cabo HDMI 05 metros, com ótima transmissão" , 39.99, 6, 2),
          ("Sapatilha Fash Red", "Sapatilha vermelha, tamanho 38, linda!! Combina com tudo", 47.99, 6, 3),
          ("Biquini Asa Delta", "Lindo biquini Asa Delta para você arrasar na praia", 129.99, 3, 3),
          ("Boneca Papinha", "A boneca perfeita para brincar por muito mais tempo, come e faz xixi", 139.99, 6, 1),
          ("Carrinho de Controle Remoto Transformers", "Além de carrinho também pode virar um robô", 87.99, 3, 3);

 INSERT INTO estoque(idProduto, quantidadeProduto, idEndereco)
	VALUES(1, 2, 9),
          (1, 1, 10),
          (2, 2, 9),
          (2, 2, 11),
          (3, 20, 11),
          (4, 6, 11),
          (5, 6, 11),
          (6, 3, 10),
          (7, 6, 9),
          (8, 3, 9);
          
  INSERT INTO statusPedido(idStatusPedido, descricaoStatusPedido)
	VALUES(1, 'Em processamento'),
          (2, 'Cancelado'),
          (3, 'Confirmado'),
          (4, 'Em separação'),
          (5, 'Encaminhado para Transportadora'),
          (6, 'Entregue');

INSERT INTO statusEntrega(idStatusEntrega, descricaoStatusEntrega)
	VALUES(1, '-'),
          (2, 'Pedido entregue a transportadora'),
          (3, 'Pedido em trânsito'),
          (4, 'Pedido saiu para entrega'),
          (5, 'Pedido entregue');
 
 INSERT INTO pedido(idStatusPedido, descricao, idCliente, valorFrete, idProduto, quantidadeProduto)
	VALUES(1, null, 1, 20.57, 5, 1),
          (3, null, 2, 10.57, 2, 1),
          (5, null, 3, 0, 7, 1),
          (6, null, 3, 0, 1, 1),
          (4, null, 4, 19.99, 2, 1);
    
 INSERT INTO entrega(IdPedido, idStatusEntrega, codigoRastreio)
	VALUES(1, 1, null),
		  (2, 1, null),
          (3, 3, 'BR25654565CVD'),
          (4, 5, 'BR2655816657861VC'),
          (5, 4, 'BR98798695596791WQ');

