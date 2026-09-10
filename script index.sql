-- index pra pesquisar ou ordenar consultas pela data
CREATE INDEX idx_consulta_vet
ON consulta(data_hora);

CREATE INDEX idx_consulta_data
ON consulta(data_hora);

CREATE INDEX idx_cliente_nome 
ON tb_cliente(nome);

CREATE INDEX idx_veterinario_crmv 
ON tb_veterinario(crmv);

CREATE INDEX idx_animal_nome
ON tb_animal(nome);

CREATE INDEX idx_medicamento_nome
ON tb_medicamento(nome);
