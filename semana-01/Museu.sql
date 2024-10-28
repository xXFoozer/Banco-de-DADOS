 CREATE TABLE artista (id SERIAL PRIMARY KEY,
					   nome VARCHAR(100) NOT NULL,
					   email VARCHAR(150),
					   data_nascimento DATE NOT NULL,
					   descricao_biografica VARCHAR(200),
					   nacionalidade VARCHAR(60) NOT NULL );

CREATE TYPE tipo_obra AS ENUM('PINTURA','ESCULTURA');

CREATE TABLE obra_de_arte (id SERIAL PRIMARY KEY,
						   titulo VARCHAR(100) NOT NULL,
						   descrcao VARCHAR(200) NOT NULL,
						   ano_criacao INTEGER NOT NULL,
						   tipo tipo_obra NOT NULL
						  );

CREATE TABLE exposicao (id SERIAL PRIMARY KEY,
					    titulo VARCHAR(100)NOT NULL,
						data_inicio DATE NOT NULL,
						data_termino DATE NOT NULL,
						local VARCHAR(50) NOT NULL
					    );
					
					
					
CREATE TABLE visitantes (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100)NOT NULL,
	email VARCHAR(100)UNIQUE NOT NULL
);					
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE visita (
	id SERIAL PRIMARY KEY,
	data_visita DATE NOT NULL,
	exposicao_id INTEGER NOT NULL,
	visitante_id INTEGER NOT NULL,
	FOREIGN KEY (exposicao_id) REFERENCES exposicao(id) ON DELETE CASCADE,
	FOREIGN KEY (visitante_id) REFERENCES visitantes(id) ON DELETE CASCADE)

SELECT * FROM visita;

SELECT * FROM visitantes;

INSERT INTO visitantes (nome,email) VALUES ('Germano','germano@gomes.email');
INSERT INTO visitantes (nome,email) VALUES ('Zeus','olimpo@deus.email');
INSERT INTO visitantes (nome,email) VALUES ('Gabriel','gabigol@homes.email');
INSERT INTO visitantes (nome,email) VALUES ('Guilherme','grauto@gmail.email');

SELECT * FROM exposicao;

INSERT INTO exposicao (titulo, data_inicio, data_termino, local) VALUES ('EXPOSIÇÃO 01','2023-11-22','2024-01-12','ADEC');
INSERT INTO exposicao (titulo, data_inicio, data_termino, local) VALUES ('EXPOSIÇÃO 04','2023-01-15','2024-05-30','OUTLET');
INSERT INTO exposicao (titulo, data_inicio, data_termino, local) VALUES ('EXPOSIÇÃO 55','2023-11-04','2024-10-28','SENAI');
INSERT INTO exposicao (titulo, data_inicio, data_termino, local) VALUES ('EXPOSIÇÃO 30','2023-10-05','2024-1-15','ADEC');
INSERT INTO exposicao (titulo, data_inicio, data_termino, local) VALUES ('EXPOSIÇÃO 10','2023-12-20','2024-12-25','MUSEU-sc');


INSERT INTO visita (data_visita, exposicao_id, visitante_id) VALUES ('2024-11-22', 2, 3);
INSERT INTO visita (data_visita, exposicao_id, visitante_id) VALUES ('2023-10-30', 2, 3);
------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE obra_arte_exposicao (
	id SERIAL PRIMARY KEY,
	obra_arte_id INTEGER NOT NULL,
	exposicao_id INTEGER NOT NULL
)

SELECT * FROM obra_arte_exposicao;

ALTER TABLE obra_arte_exposicao ADD CONSTRAINT fk_obra_arte_id_key FOREIGN KEY (obra_arte_id) REFERENCES obra_de_arte(id);
ALTER TABLE obra_arte_exposicao ADD CONSTRAINT fk_exposicao_id_key FOREIGN KEY (exposicao_id) REFERENCES exposicao(id);

SELECT * FROM obra_de_arte;

INSERT INTO obra_de_arte (titulo, descrcao, ano_criacao, tipo) VALUES ('MONALISA DE CRIA', 'MONA DO RJ', 2024, 'PINTURA');
INSERT INTO obra_de_arte (titulo, descrcao, ano_criacao, tipo) VALUES ('ZEUS', 'OLIMPO', 2023, 'PINTURA');
INSERT INTO obra_de_arte (titulo, descrcao, ano_criacao, tipo) VALUES ('PEDRA MOLHADA', 'AGUA MOLE', 2022, 'PINTURA');
INSERT INTO obra_de_arte (titulo, descrcao, ano_criacao, tipo) VALUES ('ZEUS', 'GOW', 2003, 'PINTURA');
INSERT INTO obra_de_arte (titulo, descrcao, ano_criacao, tipo) VALUES ('PEDRA MOLe', 'AGUA dura', 2005, 'PINTURA');

INSERT INTO obra_arte_exposicao (obra_arte_id, exposicao_id) VALUES (1,1);
INSERT INTO obra_arte_exposicao (obra_arte_id, exposicao_id) VALUES (1,4);
INSERT INTO obra_arte_exposicao (obra_arte_id, exposicao_id) VALUES (5,3);
INSERT INTO obra_arte_exposicao (obra_arte_id, exposicao_id) VALUES (4,2);
INSERT INTO obra_arte_exposicao (obra_arte_id, exposicao_id) VALUES (2,4);

SELECT * FROM obra_arte_exposicao WHERE obra_arte_id=1;
-----------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE obra_arte_artista (
	id SERIAL PRIMARY KEY,
	obra_arte_id INTEGER NOT NULL,
	artista_id INTEGER NOT NULL,
	FOREIGN KEY (obra_arte_id) REFERENCES obra_de_arte(id) ON DELETE CASCADE,
	FOREIGN KEY (artista_id) REFERENCES artista(id) ON DELETE CASCADE
);
SELECT * FROM obra_arte_artista;

SELECT * FROM artista;

INSERT INTO artista (nome, email, data_nascimento, descricao_biografica, nacionalidade) 
VALUES ('JAIRO','JAIRO@EMAIL.COM','1999-10-05','BRZUEIRO','BRASILIANO');
INSERT INTO artista (nome, email, data_nascimento, descricao_biografica, nacionalidade) 
VALUES ('JUCA','LULU@EMAIL.COM','1998-12-25','CACAU','BRITANICO');
INSERT INTO artista (nome, email, data_nascimento, descricao_biografica, nacionalidade) 
VALUES ('MIAU','GATO@EMAIL.COM','2006-05-05','CACAU','BRASILIANO');
INSERT INTO artista (nome, email, data_nascimento, descricao_biografica, nacionalidade) 
VALUES ('LION','LION@EMAIL.COM','2000-10-05','ZEZE','BRASILIANO');

INSERT INTO obra_arte_artista (obra_arte_id, artista_id) VALUES (1,2);
INSERT INTO obra_arte_artista (obra_arte_id, artista_id) VALUES (1,2);
INSERT INTO obra_arte_artista (obra_arte_id, artista_id) VALUES (3,2);
INSERT INTO obra_arte_artista (obra_arte_id, artista_id) VALUES (2,2);
INSERT INTO obra_arte_artista (obra_arte_id, artista_id) VALUES (4,3);



												--COMANDOS--
-------------------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) total_obras_arte FROM obra_de_arte;

SELECT 
	o.titulo AS titulo_obra_de_arte,
	o.ano_criacao AS ano_criacao_obra_de_arte,
	a.nome AS nome_artista,
	a.nacionalidade AS nacionalidade_artista
FROM obra_de_arte AS o 
JOIN obra_arte_artista AS oa ON o.id = oa.obra_arte_id
JOIN artista AS a ON oa.artista_id = a.id

------------------------------------------------------------------------------------------------------
--mesmo do de cima so q com apelidos

SELECT 
	o.titulo AS titulo_obra_de_arte,
	o.ano_criacao AS ano_criacao_obra_de_arte,
	a.nome AS nome_artista,
	a.nacionalidade AS nacionalidade_artista
FROM obra_de_arte AS o 
JOIN obra_arte_artista AS oa ON o.id = oa.obra_arte_id
JOIN artista AS a ON oa.artista_id = a.id
WHERE o.ano_criacao > 2023
-----------------------------------------------------------------------------------------------------

SELECT * FROM exposicao AS ex
JOIN visita AS vs ON ex.id = vs.exposicao_id
JOIN visitantes AS vts ON vts.id = vs.visitante_id




-----------------------------------------------------------------------------------------------------

DROP TABLE visitantes;

SELECT * FROM visitantes;

-- INSERT INTO usuarios (nome, email) VALUES ('Irineu nao sabe nem eu','memes@br.com');
-- INSERT INTO usuarios VALUES (DEFAULT,'João','Mael@gmail.com')

-- UPDATE usuarios SET nome = 'zé graça', email = 'estar@gg.col' WHERE id = 4

-- DELETE FROM usuarios WHERE email = 'estar@gg.col'

-- ALTER TABLE usuarios ADD COLUMN ativo BOOLEAN DEFAULT TRUE 

-- DROP TABLE usuarios

-- ctrl + ; COMENTA!!!