DELIMITER //
-- inserir um cliente novo
CREATE PROCEDURE sp_cadastrar_cliente(
    IN nome VARCHAR(100),
    IN telefone VARCHAR(17),
    IN email VARCHAR(100),
    IN cpf VARCHAR(20))
    BEGIN
        INSERT INTO tb_cliente (nome, telefone, email, cpf)
        VALUES (@nome, @telefone, @email, @cpf);
    END //

-- CALL sp_cadastrar_cliente(/*insira o nome*/, /*insira o telefone*/, /*insira o email*/, /*insira o cpf*/);
-- inserir um animal novo

-- agendar consulta nova

-- historico de um animal especifico
CREATE PROCEDURE historico_animal(IN animal_nome VARCHAR(20))
BEGIN
    SELECT
        a.nome AS 'Animal',
        c.data_hora AS 'Data da consulta',
        c.status AS 'Status',
        d.diagnostico AS 'Diagnóstico'
    FROM animal a
    INNER JOIN consulta c
        ON a.animal_id = c.fk_animal_id
    LEFT JOIN diagnostico d
        ON c.consulta_id = d.fk_consulta_id
    WHERE a.nome = animal_nome
    ORDER BY c.data_hora DESC;
END //

-- CALL historico_animal('');

DELIMITER ;
