
-- quantidade de consulta de um animal especifico

DELIMITER //

CREATE PROCEDURE consultas_animal(IN id_animal INT)
BEGIN
SELECT c.consulta_id AS 'Consultas',
a.nome AS 'Animal',
v.nome AS 'Veterinário',
c.data_hora AS 'Data da consulta',
c.status AS 'Status'
FROM consulta c
INNER JOIN animal a
ON c.fk_animal_id = a.animal_id
INNER JOIN veterinario v
ON c.fk_veterinario_id = v.veterinario_id
WHERE c.fk_animal_id = id_animal
ORDER BY c.data_hora DESC;

END //
DELIMITER ;

CALL consultas_animal();  -- chamando o procedure
