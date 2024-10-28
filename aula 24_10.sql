-- SELECT 
-- 	a.nome AS nome_artista,
-- 	COUNT(o.id) AS quantidade_obras
-- FROM obra_de_arte AS o 
-- JOIN obra_arte_artista AS oa ON o.id = oa.obra_arte_id
-- JOIN artista AS a ON oa.artista_id = a.id
-- GROUP BY a.nome

-- SELECT * FROM obra_de_arte JOIN obra_arte_exposicao ON obra_de_arte.id = obra_arte_exposicao.obra_arte_id
-- JOIN exposicao AS e ON obra_arte_exposicao.exposicao_id= e.id

SELECT * FROM exposicao AS ex
JOIN visita AS vs ON ex.id = vs.exposicao_id
JOIN visitantes AS vts ON vts.id = vs.visitante_id
