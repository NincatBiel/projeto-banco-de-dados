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
        CALL sp_cadastrar_cliente();
-- inserir um animal novo

CREATE PROCEDURE sp_cadastrar_animal(
    IN nome VARCHAR(20),
    IN p_data_nasc DATE,
    IN p_sexo ENUM('Macho', 'Fêmea'),
    IN p_cliente_id INT,
    IN p_especie_id INT,
    IN p_raca_id INT
)
BEGIN
    INSERT INTO tb_animal (nome, data_nascimento, sexo, fk_cliente_id, fk_especie_id, fk_raca_id)
    VALUES (p_nome, p_data_nasc, p_sexo, p_cliente_id, p_especie_id, p_raca_id);
    
END//
-- agendar consulta nova
 CREATE PROCEDURE agendar_consulta(
    IN p_data_hora DATETIME,
    IN ENUM('Realizada','Marcada','Cancelada'),
    IN p_veterianrio INT,
    IN p_animal INT
 )
BEGIN
    INSERT INTO tb_consulta (data_hora, status, fk_animal_id, fk_veterinario_id)
    VALUES (p_data_hora, p_status, p_animal, p_veterinario);

END//

    -- POR UMA CALL
CALL agendar_consult();
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
    CALL sp_histocio_animal();

DELIMITER ;
