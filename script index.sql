-- index pra pesquisar ou ordenar consultas pela data

CREATE INDEX idx_consulta_data
ON consulta(data_hora);
