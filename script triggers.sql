DELIMITER //
-- adicionar automaticante dados em valor.subtotal
CREATE TRIGGER trg_calcular_subtotal
AFTER INSERT ON tb_valor
FOR EACH ROW
BEGIN
    DECLARE v_procedimentos DECIMAL(8,2) DEFAULT 0;
    DECLARE v_medicamentos DECIMAL(8,2) DEFAULT 0;
    DECLARE v_servico DECIMAL(8,2) DEFAULT 0;
    DECLARE v_subtotal DECIMAL(8,2) DEFAULT 0;

    -- Soma dos procedimentos realizados na consulta
    SELECT COALESCE(SUM(p.preco), 0) INTO v_procedimentos
    FROM tb_procedimento_realizado pr
    INNER JOIN tb_procedimento p 
    ON pr.fk_procedimento_id = p.procedimento_id
    WHERE pr.fk_consulta_id = NEW.fk_consulta_id;

    -- Soma dos medicamentos prescritos na consulta
    SELECT COALESCE(SUM(m.preco), 0) INTO v_medicamentos
    FROM tb_prescricao pr
    INNER JOIN 
    tb_medicamento_prescrito mp ON pr.prescricao_id = mp.fk_prescricao_id
    INNER JOIN 
    tb_medicamento m ON mp.fk_medicamento_id = m.medicamento_id
    WHERE pr.fk_consulta_id = NEW.fk_consulta_id;

    -- Valor do serviço (se existir)
    IF NEW.fk_servico_id IS NOT NULL THEN
        SELECT COALESCE(preco, 0) INTO v_servico
        FROM tb_servico
        WHERE servico_id = NEW.fk_servico_id;
    END IF;

    -- Subtotal = procedimentos + medicamentos + serviço
    SET v_subtotal = v_procedimentos + v_medicamentos + v_servico;

    -- Atualiza subtotal e total (total = subtotal - desconto)
    UPDATE tb_valor
    SET subtotal = v_subtotal,
        total = v_subtotal - COALESCE(NEW.desconto, 0)
    WHERE valor_id = NEW.valor_id;
END //

-- trigger pra calcular o valor total automaticamente
DELIMITER //
CREATE TRIGGER trg_calcular_total
BEFORE UPDATE ON tb_valor
FOR EACH ROW
BEGIN
    SET NEW.total = COALESCE(NEW.subtotal, 0) - COALESCE(NEW.desconto, 0);
END //

-- trigger pra definir a consulta como 'marcada'
DELIMITER //
CREATE TRIGGER trg_consulta_marcada
BEFORE INSERT ON tb_consulta
FOR EACH ROW
BEGIN
	SET NEW.status = 'Marcada';
END //

DELIMITER ;
