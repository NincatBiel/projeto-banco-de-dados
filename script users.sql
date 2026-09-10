-- admin
CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'admin123';

GRANT ALL ON clinica_veterinaria.* TO 'administrador'@'localhost';

-- Atendente

CREATE USER 'atendente'@'localhost' IDENTIFIED BY 'atendente123';

GRANT EXECUTE ON PROCEDURE clinica_veterinaria.sp_agendar_consulta TO 'atendente'@'localhost';

-- Veterinário

CREATE USER 'veterinario'@'localhost' IDENTIFIED BY 'vet123';

GRANT EXECUTE ON PROCEDURE clinica_veterinaria.sp_add_consulta TO 'veterinario'@'localhost';

GRANT EXECUTE ON PROCEDURE clinica_veterinaria.sp_add_prescricao TO 'veterinario'@'localhost';
