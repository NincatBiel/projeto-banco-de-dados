CREATE DATABASE IF NOT EXISTS clinica_veterinaria;
USE clinica_veterinaria;
-- ============
-- = Cadastro =
-- ============
CREATE TABLE tb_cliente (
	cliente_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100),
	telefone VARCHAR(17),
	email VARCHAR(100),
	cpf VARCHAR(20)
);

CREATE TABLE tb_especie (
	especie_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE tb_raca (
	raca_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    fk_especie_id INT NOT NULL,
	CONSTRAINT fk_especie_raca FOREIGN KEY (fk_especie_id) REFERENCES tb_especie(especie_id)
);

CREATE TABLE tb_animal (
	animal_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20),
	data_nascimento DATE,
	sexo ENUM('Macho', 'Fêmea') NOT NULL,
	fk_cliente_id INT NOT NULL,
	fk_especie_id INT NOT NULL,
	fk_raca_id INT NOT NULL,
	CONSTRAINT fk_cliente_animal FOREIGN KEY (fk_cliente_id) REFERENCES tb_cliente(cliente_id),
	CONSTRAINT fk_especie_animal FOREIGN KEY (fk_especie_id) REFERENCES tb_especie(especie_id),
	CONSTRAINT fk_raca_animal FOREIGN KEY (fk_raca_id) REFERENCES tb_raca(raca_id)
);

CREATE TABLE tb_veterinario (
	veterinario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    crmv VARCHAR(6) NOT NULL UNIQUE,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE tb_especialidade (
	especialidade_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE tb_vet_especialidade (
	fk_veterinario_id INT NOT NULL,
	fk_especialidade_id INT NOT NULL,
	PRIMARY KEY (fk_veterinario_id, fk_especialidade_id),
	CONSTRAINT fk_veterinario_vet_especialidade FOREIGN KEY (fk_veterinario_id) REFERENCES tb_veterinario(veterinario_id),
	CONSTRAINT fk_especialidade_vet_especialidade FOREIGN KEY (fk_especialidade_id) REFERENCES tb_especialidade(especialidade_id)
);

CREATE TABLE tb_procedimento (
	procedimento_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    tempo_ideal TIME,
    descricao VARCHAR(200),
    preco DECIMAL(8,2)
);

CREATE TABLE tb_medicamento (
	medicamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL UNIQUE,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(6,2)    
);

CREATE TABLE tb_servico(
	servico_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(60),
    descricao VARCHAR(100),
	preco DECIMAL(8,2)
);

-- ===============
-- = Atendimento =
-- ===============
CREATE TABLE tb_consulta(
	consulta_id INT PRIMARY KEY AUTO_INCREMENT,
	data_hora DATETIME NOT NULL,
    status ENUM('Realizada','Marcada','Cancelada'),
    fk_animal_id INT NOT NULL,
    fk_veterinario_id INT NOT NULL,
    CONSTRAINT fk_veterinario_consulta FOREIGN KEY (fk_veterinario_id) REFERENCES tb_veterinario(veterinario_id),
    CONSTRAINT fk_animal_consulta FOREIGN KEY (fk_animal_id) REFERENCES tb_animal(animal_id)
);

CREATE TABLE tb_diagnostico(
diagnostico_id INT PRIMARY KEY AUTO_INCREMENT,
diagnostico VARCHAR(300),
fk_consulta_id INT NOT NULL,
CONSTRAINT fk_consulta_diagnostico FOREIGN KEY (fk_consulta_id) REFERENCES tb_consulta(consulta_id)
);

-- FK de procedimento em procedimento_realizado ta como procedimento_proced_realizado
CREATE TABLE tb_procedimento_realizado(
procedimento_realizado_id INT PRIMARY KEY AUTO_INCREMENT,
observacao VARCHAR(250),
fk_procedimento_id INT NOT NULL,
fk_consulta_id INT NOT NULL,
CONSTRAINT fk_procedimento_proced_realizado FOREIGN KEY (fk_procedimento_id) REFERENCES tb_procedimento(procedimento_id),
CONSTRAINT fk_consulta_proced_realizado FOREIGN KEY (fk_consulta_id) REFERENCES tb_consulta(consulta_id)
);

CREATE TABLE tb_prescricao(
prescricao_id INT PRIMARY KEY AUTO_INCREMENT,
observacao VARCHAR(250),
fk_consulta_id INT NOT NULL,
CONSTRAINT fk_consulta_prescricao FOREIGN KEY (fk_consulta_id) REFERENCES tb_consulta(consulta_id)
);

CREATE TABLE tb_medicamento_prescrito(
medicamento_prescrito_id INT PRIMARY KEY AUTO_INCREMENT,
dosagem VARCHAR(100),
frequencia VARCHAR(100),
duracao VARCHAR(100),
fk_prescricao_id INT NOT NULL,
fk_medicamento_id INT NOT NULL,
CONSTRAINT fk_prescricao_med_prescrito FOREIGN KEY (fk_prescricao_id) REFERENCES tb_prescricao(prescricao_id),
CONSTRAINT fk_medicamento_med_prescrito FOREIGN KEY (fk_medicamento_id) REFERENCES tb_medicamento(medicamento_id)
);

-- ==============
-- = Financeiro =
-- ==============

CREATE TABLE tb_valor(
valor_id INT PRIMARY KEY AUTO_INCREMENT,
subtotal DECIMAL(8,2),
desconto DECIMAL(8,2) NOT NULL,
total DECIMAL(8,2),
fk_consulta_id INT NOT NULL,
fk_servico_id INT,
CONSTRAINT fk_consulta_valor FOREIGN KEY (fk_consulta_id) REFERENCES tb_consulta(consulta_id),
CONSTRAINT fk_servico_valor FOREIGN KEY (fk_servico_id) REFERENCES tb_servico(servico_id)
);

CREATE TABLE tb_pagamento(
pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
modo ENUM('Cartão de crédito', 'Boleto', 'A vista'),
fk_cliente_id INT NOT NULL,
fk_valor_id INT NOT NULL,
CONSTRAINT fk_cliente_pagamento FOREIGN KEY (fk_cliente_id) REFERENCES tb_cliente(cliente_id),
CONSTRAINT fk_valor_pagamento FOREIGN KEY (fk_valor_id) REFERENCES tb_valor(valor_id)
);

CREATE TABLE tb_pagamento_status(
pagamento_status_id INT PRIMARY KEY AUTO_INCREMENT,
status ENUM('Aprovado', 'Em aberto', 'Cancelado'),
fk_pagamento_id INT NOT NULL,
CONSTRAINT fk_pagamento_pag_status FOREIGN KEY (fk_pagamento_id) REFERENCES tb_pagamento(pagamento_id)
);
