


CREATE TABLE fabricantes(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	nome VARCHAR(100)NOT NULL,
	pais_origem VARCHAR(100)NOT NULL,
	ano_fundacao INTEGER NOT NULL
);

CREATE TABLE veiculos(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	chassi VARCHAR (25) UNIQUE NOT NULL,
	modelo VARCHAR(30) NOT NULL,
	ano_fabricacao INTEGER NOT NULL,
	cor VARCHAR(15) NOT NULL,
	quilometragem INTEGER NOT NULL,
	preco_venda DECIMAL(11,2) NOT NULL,
	id_fabricante UUID NOT NULL,
	FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
);

CREATE TABLE manutencao(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	data_manutencao DATE NOT NULL,
	descricao_servico VARCHAR (200) NOT NULL,
	custo DECIMAL(11,2) NOT NULL,
	id_veiculos UUID NOT NULL,
	FOREIGN KEY (id_veiculos) REFERENCES veiculos(id)
);

CREATE TABLE vendedores(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	cpf VARCHAR (11) UNIQUE NOT NULL,
	telefone VARCHAR (50) NOT NULL,
	email VARCHAR (100) UNIQUE NOT NULL,
	data_contratacao DATE NOT NULL
);

CREATE TABLE clientes(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	cpf VARCHAR (11) UNIQUE NOT NULL,
	telefone VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	endereco VARCHAR(150) NOT NULL
);

CREATE TABLE vendas(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	data_venda DATE NOT NULL,
	valor_total DECIMAL(11,2) NOT NULL,
	metodo_pagamento VARCHAR(100) NOT NULL,
	vendedores_id UUID NOT NULL,
	clientes_id UUID NOT NULL,
	veiculos_id UUID NOT NULL,
	FOREIGN KEY (vendedores_id) REFERENCES vendedores(id),
	FOREIGN KEY (clientes_id) REFERENCES clientes(id),
	FOREIGN KEY (veiculos_id) REFERENCES veiculos(id)
)
SELECT * FROM veiculos
INSERT INTO fabricantes(nome, pais_origem,ano_fundacao) VALUES ('SUBARU','JAPAO','1953')
INSERT INTO veiculos(chassi,modelo,ano_fabricacao,cor,quilometragem,preco_venda,id_fabricante) VALUES ('4529874012A5C8ABCE5','SKYLINE-R34','1998','AZUL-MARINHO','0','200.950','2b42e816-bf90-4c93-bf36-a39e407c2f7d')
