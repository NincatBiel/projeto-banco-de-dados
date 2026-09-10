DELIMITER //
-- inserir um cliente novo
CREATE PROCEDURE sp_cadastrar_cliente(
    IN nome VARCHAR(100),
    IN telefone VARCHAR(17),
    IN email VARCHAR(100),
    IN cpf VARCHAR(20))
    BEGIN
        INSERT INTO tb_cliente (nome, telefone, email, cpf)
        VALUES (nome, telefone, email, cpf);
    END //

-- CALL sp_cadastrar_cliente(/*insira o nome*/, /*insira o telefone*/, /*insira o email*/, /*insira o cpf*/);
-- inserir um animal novo

-- agendar consulta nova
CREATE PROCEDURE sp_agendar_consulta(
	IN animal_id INT,
    IN veterinario_id INT,
    IN data DATETIME)
    BEGIN
        INSERT INTO tb_consulta(fk_animal_id, fk_veterinario_id, data)
        VALUES (animal_id, veterinario_id, data);
    END //

-- CALL sp_agendar_consulta(/*fk animal*/, /*fk veterinario*/, /*data e hora*/)

-- historico de um animal especifico
CREATE PROCEDURE sp_historico_animal(
        IN animal_nome VARCHAR(20))
BEGIN
    SELECT
        a.nome AS 'Animal',
        c.data_hora AS 'Data da consulta',
        c.status AS 'Status',
        d.diagnostico AS 'Diagnóstico'
    FROM tb_animal a
    INNER JOIN tb_consulta c
        ON a.animal_id = c.fk_animal_id
    LEFT JOIN tb_diagnostico d
        ON c.consulta_id = d.fk_consulta_id
    WHERE a.nome = animal_nome
    ORDER BY c.data_hora DESC;
END //

-- CALL historico_animal('');

-- Adicionar diagnóstico
DELIMITER //
CREATE PROCEDURE sp_add_diagnostico(
IN diagnostico VARCHAR(100),
IN consulta_id INT)
BEGIN
INSERT INTO tb_diagnostico(diagnostico, fk_consulta_id)
VALUES (diagnostico, consulta_id);
END //

-- Adicionar prescricao
DELIMITER //
CREATE PROCEDURE sp_add_prescricao(
IN prescricao VARCHAR(250),
IN consulta_id INT)
BEGIN
INSERT INTO tb_prescricao(observacao, fk_consulta_id)
VALUES (prescricao, consulta_id);
END //


DELIMITER ;
