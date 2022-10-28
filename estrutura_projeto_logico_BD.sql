CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

CREATE TABLE endereco(
	idEndereco INT AUTO_INCREMENT PRIMARY KEY,
    CEP INT NOT NULL,
    logradouro VARCHAR(120) NOT NULL,
    complemento VARCHAR(40),
    numero VARCHAR(10),
    municipio VARCHAR(20),
    UF CHAR(2)
);

CREATE TABLE formaPagamento(
	idFormaPagamento INT AUTO_INCREMENT,
    idCliente INT, #FK CLIENTE
	tipoPamento ENUM('PIX', 'Boleto', 'Cartão', 'Dois cartões') NOT NULL,
    numeroCartao CHAR(16),
    nomeCartao VARCHAR(40),
    validadeCartao DATETIME,
    PRIMARY KEY(idFormaPagamento, idCliente)
);

CREATE TABLE cliente(
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60),
    identificacao VARCHAR(45),
    idEndereco INT, # FK ENDERECO
    email VARCHAR(45),
    telefone INT(11),
	tipocliente ENUM('Física', 'Jurídica')
);

CREATE TABLE statusPedido(
	idStatusPedido INT PRIMARY KEY,
    descricaoStatusPedido VARCHAR(120)
);

CREATE TABLE pedido(
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idStatusPedido INT,
    descricao VARCHAR(120),
    idCliente INT, # FK CLIENTE
    valorFrete FLOAT DEFAULT 0,
    idProduto INT,
    quantidadeProduto INT
);

CREATE TABLE statusEntrega(
	idStatusEntrega INT PRIMARY KEY,
    descricaoStatusEntrega VARCHAR(120)
);

CREATE TABLE entrega(
	idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT, # FK Pedido
    idStatusEntrega INT, #FK statusEntrega
    codigoRastreio VARCHAR(20)
);


CREATE TABLE produto(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
     nomeProduto VARCHAR(120) NOT NULL,
    descricaoProduto VARCHAR(240) NOT NULL,
    valorProduto FLOAT NOT NULL,
    quantidade INT DEFAULT 0,
    idFornecedor INT # FK fornecedor
);

CREATE TABLE fornecedor(
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR(60) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    idEndereco INT # FK endereco
);

CREATE TABLE estoque(
	idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    idProduto INT, # FK produto
    quantidadeProduto INT DEFAULT 0,
    idEndereco INT # FK endereco
);


# Inserindo as FKs
ALTER TABLE formaPagamento
	ADD CONSTRAINT fk_formaPagamento_idCliente
    FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
    ON UPDATE CASCADE;

ALTER TABLE cliente
	ADD CONSTRAINT fk_cliente_idEndereco
    FOREIGN KEY(idEndereco) REFERENCES endereco(idEndereco)
    ON UPDATE CASCADE;

ALTER TABLE pedido
	ADD CONSTRAINT fk_pedido_idCliente
    FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
    ON UPDATE CASCADE;

ALTER TABLE pedido
	ADD CONSTRAINT fk_pedido_idProduto
    FOREIGN KEY(idProduto) REFERENCES produto(idProduto)
    ON UPDATE CASCADE;

ALTER TABLE entrega
	ADD CONSTRAINT fk_entrega_idPedido
    FOREIGN KEY(idPedido) REFERENCES pedido(idPedido)
    ON UPDATE CASCADE;

ALTER TABLE produto
	ADD CONSTRAINT fk_produto_idFornecedor
    FOREIGN KEY(idFornecedor) REFERENCES fornecedor(idFornecedor)
    ON UPDATE CASCADE;

ALTER TABLE fornecedor
	ADD CONSTRAINT fk_fornecedor_idEndereco
    FOREIGN KEY(idEndereco) REFERENCES endereco(idEndereco)
    ON UPDATE CASCADE;

ALTER TABLE estoque
	ADD CONSTRAINT fk_estoque_idProduto
    FOREIGN KEY(idProduto) REFERENCES produto(idProduto)
    ON UPDATE CASCADE;
    
ALTER TABLE estoque
	ADD CONSTRAINT fk_estoque_idEndereco
    FOREIGN KEY(idEndereco) REFERENCES endereco(idEndereco)
    ON UPDATE CASCADE;
    
ALTER TABLE pedido
	ADD CONSTRAINT fk_pedido_idStatusPedido
    FOREIGN KEY (idStatusPedido) REFERENCES statusPedido(idStatusPedido)
    ON UPDATE CASCADE;

ALTER TABLE entrega
	ADD CONSTRAINT fk_entrega_idStatusEntrega
    FOREIGN KEY (idStatusEntrega) REFERENCES statusEntrega(idStatusEntrega)
    ON UPDATE CASCADE;