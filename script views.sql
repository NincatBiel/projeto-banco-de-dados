-- consultas com animais, veterinarios e os respectivos donos


SELECT
    a.nome AS 'Animal',
    e.nome AS 'Espécie',
    cli.nome AS 'Dono',
    v.nome AS 'Veterinario',
    c.data_consulta AS 'Data da consulta'
FROM tb_consulta c
INNER JOIN tb_animal a
    ON c.fk_animal_id = a.animal_id
INNER JOIN tb_cliente cli
    ON a.fk_cliente_id = cli.cliente_id
INNER JOIN tb_veterinario v
    ON c.veterinario_id = v.veterinario_id
INNER JOIN tb_especie e
    ON a.fk_especie_id = e.especie_id
ORDER BY c.data_consulta DESC;

-- mesma coisa da anterior só que só as que consulta.status ta como "a ser realizadas"
SELECT COUNT(*) AS 'CONSULTAS REALIZADAS'
FROM consulta
WHERE status = 'realizadas';
-- historico do animal, com o animal e as doenças que ele teve anteriormente, ordenando por animal.nome e contendo diagnostico e data da consulta (onde indica quando o diagnostico afoi feito)
SELECT
    a.nome AS 'Animal',
    d.diagnostico AS 'Diagnostico',
    c.data_consulta AS 'Data da consulta'
FROM tb_consulta c
INNER JOIN animal a
    ON c.animal_id = a.animal_id
LEFT JOIN tb_diagnostico d
ON d.fk_consulta_id = c.consulta_id
WHERE d.diagnostico IS NOT NULL
ORDER BY a.nome ASC;

-- relação de clientes e quantidade de vezes que trouxeram os animais - Ainda falta ajeitar
SELECT
    cli.nome AS 'Dono',
    COUNT(c.consulta_id) AS quantidade_consultas
FROM tb_cliente cli
INNER JOIN tb_animal a
    ON cli.cliente_id = a.fk_cliente_id
INNER JOIN tb_consulta c
    ON a.animal_id = c.animal_id
GROUP BY cli.cliente_id, cli.nome
ORDER BY quantidade_consultas DESC;

-- relação de veterinarios e suas respectivas especialidades - erik
SELECT 
    v.nome AS veterinario,
    e.nome AS especialidade
FROM vet_especialidade ve
JOIN veterinario v ON v.id_veterinario = ve.id_veterinario
JOIN especialidade e ON e.id_especialidade = ve.id_especialidade
ORDER BY v.nome, e.nome;
-- consulta + valor final - Ainda falta ajeitar
SELECT
    c.consulta_id,
    a.nome AS 'Animal',
    cli.nome AS 'Dono',
    c.data_consulta,
    c.valor AS 'valor_final'
FROM tb_consulta c
INNER JOIN tb_animal a
    ON c.animal_id = a.animal_id
INNER JOIN tb_cliente cli
    ON a.dono_id = d.dono_id
ORDER BY c.data_consulta;

-- quantidade de consultas canceladas? sla como se faria isso, feito.

-- servico mais caro e servico mais barato - Ainda falta ajeitar
SELECT
    MAX(valor) AS servico_mais_caro,
    MIN(valor) AS servico_mais_barato
FROM servico;
-- procedimento mais caro e procedimento mais barato  at
SELECT 
MAX(preco) AS 'MAIS CARO',
MIN(preco) AS 'MAIS BARATO'
FROM procedimento;
-- medicamento mais caro e medicamento mais barato art
SELECT 
MAX(preco) AS 'MAIS CARO',
MIN(preco) AS 'MAIS BARATO'
FROM medicamento;
-- relação de serviços - erik
SELECT 
nome AS 'Serviço', 
descricao AS 'Descrição', 
valor AS 'Valor' 
FROM tb_servico;
-- relação de procedimentos
SELECT *
FROM procedimento;
-- quantidade de consultas por cliente

SELECT 
cli.cliente_id AS 'Cliente',
cli.nome as 'Nome',
COUNT(c.consulta_id) AS 'Quantidade de Consultas'
FROM cliente cli
INNER JOIN animal a
on cli.cliente_id = a.fk_cliente_id
INNER JOIN consulta c
ON a.animal_id = c.fk_animal_id
GROUP BY cli.nome, cli cli.cliente_id
ORDER BY 'Quantidade de Consultas' DESC;

-- quantidade de consultas canceladas (ta dando errado n sei pq) art
SELECT
 COUNT(*) AS 'CONSULTAS CANCELADAS'
FROM consulta
WHERE status = "CANCELADO";

-- procedimento mais caro e mais barato(subconsulta)

SELECT nome AS 'Procedimento',
preco AS 'Preço'
FROM procedimento
WHERE preco = (SELECT MAX(preco) FROM procedimento)
OR preco = (SELECT MIN(preco) FROM procedimento);

-- consulta mais o valor final

SELECT
c.consulta_id AS 'Consulta',
a.nome AS 'animal',
c.data_hora AS 'Data da Consulta',
v.total AS 'Valor Final'
FROM consulta c
INNER JOIN animal a
ON c.fk_animal_id = a.animal_id
INNER JOIN valor v
ON c.consulta_id = v.fk_consulta_id
ORDER BY c.data_hora;

-- medicamento mais caro e mais barato

SELECT
nome AS 'Medicamento',
preco AS 'Preço'
FROM medicamento
WHERE preco = (SELECT MAX(preco) FROM medicamento)
OR preco = (SELECT MIN(preco) FROM medicamento);


