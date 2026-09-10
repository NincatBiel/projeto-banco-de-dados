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

CALL sp_cadastrar_cliente(/*insira o nome*/, /*insira o telefone*/, /*insira o email*/, /*insira o cpf*/);
-- inserir um animal novo

-- agendar consulta nova

-- historico de um animal especifico

DELIMITER ;
