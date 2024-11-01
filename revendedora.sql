CREATE TABLE veiculos (
	id UUID PRIMARY KEY,
	modelo VARCHAR(50) NOT NULL,
	cor VARCHAR(20) NOT NULL,
	ano INTEGER NOT NULL,
	valor DECIMAL(8,2) NOT NULL,
	placa VARCHAR(8) NOT NULL,
	imagem VARCHAR NOT NULL
);

SELECT * FROM veiculos