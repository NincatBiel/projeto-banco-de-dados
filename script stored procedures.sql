DELIMITER //
-- inserir um cliente novo
CREATE PROCEDURE sp_cadastrar_cliente
    @nome VARCHAR(100),
    @telefone VARCHAR(17),
    @email VARCHAR(100),
    @cpf VARCHAR(20)
    AS
    BEGIN
        INSERT INTO tb_cliente (nome, telefone, email, cpf)
        VALUES (@nome, @telefone, @email, @cpf);
    END //

EXEC sp_cadastrar_cliente @nome = /*insira o nome*/, @telefone = /*insira o telefone*/, @email = /*insira o email*/, @cpf = /*insira o cpf*/;
-- inserir um animal novo

-- agendar consulta nova

-- historico de um animal especifico

DELIMITER ;
