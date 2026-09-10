-- Views
-- consultas com animais, veterinarios e os respectivos donos
-- use clinica_veterinaria;
CREATE VIEW vw_consulta_animal AS
SELECT
    a.nome AS 'Animal',
    e.nome AS 'Espécie',
    cli.nome AS 'Dono',
    v.nome AS 'Veterinario',
    c.data_hora AS 'Data da consulta'
FROM tb_consulta c
INNER JOIN tb_animal a
    ON c.fk_animal_id = a.animal_id
INNER JOIN tb_cliente cli
    ON a.fk_cliente_id = cli.cliente_id
INNER JOIN tb_veterinario v
    ON c.fk_veterinario_id = v.veterinario_id
INNER JOIN tb_especie e
    ON a.fk_especie_id = e.especie_id
ORDER BY c.data_hora DESC;

-- mesma coisa da anterior só que só as que consulta.status ta como "a ser realizadas"
CREATE VIEW vw_consultas_marcadas AS
    a.nome AS 'Animal',
    e.nome AS 'Espécie',
    cli.nome AS 'Dono',
    v.nome AS 'Veterinario',
    c.data_hora AS 'Data da consulta'
FROM tb_consulta c
INNER JOIN tb_animal a
    ON c.fk_animal_id = a.animal_id
INNER JOIN tb_cliente cli
    ON a.fk_cliente_id = cli.cliente_id
INNER JOIN tb_veterinario v
    ON c.fk_veterinario_id = v.veterinario_id
INNER JOIN tb_especie e
    ON a.fk_especie_id = e.especie_id
WHERE c.status = 'Marcada';

-- historico do animal, com o animal e as doenças que ele teve anteriormente, ordenando por animal.nome e contendo diagnostico e data da consulta (onde indica quando o diagnostico foi feito)
CREATE VIEW vw_historico_animais_doencas AS
SELECT
    a.nome AS 'Animal',
    d.diagnostico AS 'Diagnostico',
    c.data_consulta AS 'Data da consulta'
FROM tb_consulta c
INNER JOIN tb_animal a
    ON c.animal_id = a.animal_id
LEFT JOIN tb_diagnostico d
ON d.fk_consulta_id = c.consulta_id
WHERE d.diagnostico IS NOT NULL
ORDER BY a.nome ASC;

-- relação de serviços - erik
CREATE VIEW vw_servicos AS
SELECT 
nome AS 'Serviço', 
descricao AS 'Descrição', 
valor AS 'Valor' 
FROM tb_servico;

-- relação de procedimentos
CREATE VIEW vw_procedimentos AS
SELECT 
nome AS 'Procedimento', 
descricao AS 'Descrição', 
preco AS 'Valor' 
FROM tb_procedimento;

-- relação de veterinarios e suas respectivas especialidades - erik
CREATE VIEW vw_veterinario_especialidades AS
SELECT
    v.nome AS veterinario,
    e.nome AS especialidade
FROM tb_vet_especialidade ve
INNER JOIN tb_veterinario v ON v.veterinario_id = ve.fk_veterinario_id
INNER JOIN tb_especialidade e ON e.especialidade_id = ve.fk_especialidade_id
ORDER BY v.nome, e.nome;

-- ===========================================

-- Selects comuns
-- relação de clientes e quantidade de vezes que trouxeram os animais
SELECT
    cli.nome AS 'Dono',
    COUNT(c.consulta_id) AS 'Quantidade de vezes'
FROM tb_cliente cli
INNER JOIN tb_animal a
    ON cli.cliente_id = a.fk_cliente_id
INNER JOIN tb_consulta c
    ON a.animal_id = c.animal_id
GROUP BY cli.cliente_id, cli.nome
ORDER BY 'Quantidade de vezes' DESC;

-- consulta + valor final
SELECT
    c.consulta_id,
    a.nome AS 'Animal',
    cli.nome AS 'Dono',
    c.data_consulta,
    v.total AS 'Valor final'
FROM tb_consulta c
INNER JOIN tb_animal a
    ON c.animal_id = a.animal_id
INNER JOIN tb_cliente cli
    ON a.dono_id = d.dono_id
INNER JOIN tb_valor v
ON c.consulta_id = v.fk_consulta_id
ORDER BY c.data_consulta;

-- servico mais caro e servico mais barato
SELECT
    MAX(valor) AS servico_mais_caro,
    MIN(valor) AS servico_mais_barato
FROM tb_servico;

-- procedimento mais caro e procedimento mais barato  at
SELECT 
MAX(preco) AS 'MAIS CARO',
MIN(preco) AS 'MAIS BARATO'
FROM tb_procedimento;

-- medicamento mais caro e medicamento mais barato art
SELECT 
MAX(preco) AS 'MAIS CARO',
MIN(preco) AS 'MAIS BARATO'
FROM tb_medicamento;

-- medicamento mais caro e mais barato

SELECT
nome AS 'Medicamento',
preco AS 'Preço'
FROM tb_medicamento
WHERE preco = (SELECT MAX(preco) FROM medicamento)
OR preco = (SELECT MIN(preco) FROM medicamento);

-- quantidade de consultas canceladas art
SELECT
 COUNT(*) AS 'Consultas canceladas'
FROM tb_consulta
WHERE status = "Cancelada";

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
FROM tb_consulta c
INNER JOIN tb_animal a
ON c.fk_animal_id = a.animal_id
INNER JOIN tb_valor v
ON c.consulta_id = v.fk_consulta_id
ORDER BY c.data_hora;

-- Execução
SELECT * FROM vw_consulta_animal;
SELECT * FROM vw_consultas_marcadas;
SELECT * FROM vw_historico_animais_doencas;
SELECT * FROM vw_veterinario_especialidades;
SELECT * FROM vw_procedimentos;
SELECT * FROM vw_servicos;


