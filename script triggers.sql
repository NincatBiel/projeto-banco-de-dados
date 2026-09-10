delimiter //
-- adicionar automaticante dados em valor.subtotal
-- calcular automaticamente o dado e inserir em valor.total
-- trigger pra calcular o valor total automaticamente

DELIMITER //
CREATE TRIGGER calcular_valor
AFTER INSERT ON valor
FOR EACH ROW
BEGIN
SET NEW.subtotal = (SELECT preco
FROM servico
WHERE servico_id = NEW.fk_servico_id
);
SET NEW.total = NEW.subtotal - NEW.desconto;
END //

DELIMITER ;

-- verificar se em pagamento.modo ta null, se tiver, colocar em pagamento_status "Em aberto", mas se tiver NULL e a consulta.status, tiver como "Cancelada", atualizar pagamento_status.status para "Cancelado"

delimiter ;
