CREATE DATABASE clinica_veterinaria;
USE clinica_veterinaria;
-- ============
-- = Cadastro =
-- ============
CREATE TABLE cliente (
	cliente_id INT PRIMARY KEY AUTO_INCREMENT,
	telefone VARCHAR(17),
	email VARCHAR(100),
	cpf VARCHAR(20)
);

CREATE TABLE especie (
	especie_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE raca (
	raca_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    fk_especie_id INT NOT NULL,
	CONSTRAINT fk_especie_raca FOREIGN KEY (fk_especie_id) REFERENCES especie(especie_id)
);

CREATE TABLE animal (
	animal_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(20),
	data_nascimento DATE,
	sexo ENUM('Macho', 'Fêmea') NOT NULL,
	fk_cliente_id INT NOT NULL,
	fk_especie_id INT NOT NULL,
	fk_raca_id INT NOT NULL,
	CONSTRAINT fk_cliente_animal FOREIGN KEY (fk_cliente_id) REFERENCES cliente(cliente_id),
	CONSTRAINT fk_especie_animal FOREIGN KEY (fk_especie_id) REFERENCES especie(especie_id),
	CONSTRAINT fk_raca_animal FOREIGN KEY (fk_raca_id) REFERENCES raca(raca_id)
);

CREATE TABLE veterinario (
	veterinario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    crmv VARCHAR(6) NOT NULL UNIQUE,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE especialidade (
	especialidade_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE vet_especialidade (
	vet_especialidade_id INT PRIMARY KEY AUTO_INCREMENT,
	fk_veterinario_id INT NOT NULL,
	fk_especialidade_id INT NOT NULL,
	CONSTRAINT fk_veterinario_vet_especialidade FOREIGN KEY (fk_veterinario_id) REFERENCES veterinario(veterinario_id),
	CONSTRAINT fk_especialidade_vet_especialidade FOREIGN KEY (fk_especialidade_id) REFERENCES especialidade(especialidade_id)
);

CREATE TABLE procedimento (
	procedimento_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    tempo_ideal TIME,
    descricao VARCHAR(200),
    preco DECIMAL(8,2)
);

CREATE TABLE medicamento (
	medicamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL UNIQUE,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(6,2)    
);

CREATE TABLE servico(
	servico_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(60),
    descricao VARCHAR(100),
	preco DECIMAL(8,2)
);

-- ===============
-- = Atendimento =
-- ===============
CREATE TABLE consulta(
	consulta_id INT PRIMARY KEY AUTO_INCREMENT,
	data_hora DATETIME NOT NULL,
    status ENUM('Realizada','Marcada','Cancelada'),
    fk_animal_id INT NOT NULL,
    fk_veterinario_id INT NOT NULL,
    CONSTRAINT fk_veterinario_consulta FOREIGN KEY (fk_veterinario_id) REFERENCES veterinario(veterinario_id),
    CONSTRAINT fk_animal_consulta FOREIGN KEY (fk_animal_id) REFERENCES animal(animal_id)
);

CREATE TABLE diagnostico(
diagnostico_id INT PRIMARY KEY AUTO_INCREMENT,
diagnostico VARCHAR(300),
fk_consulta_id INT NOT NULL,
CONSTRAINT fk_consulta_diagnostico FOREIGN KEY (fk_consulta_id) REFERENCES consulta(consulta_id)
);

-- FK de procedimento em procedimento_realizado ta como procedimento_proced_realizado
CREATE TABLE procedimento_realizado(
procedimento_realizado_id INT PRIMARY KEY AUTO_INCREMENT,
observacao VARCHAR(250),
fk_procedimento_id INT NOT NULL,
fk_consulta_id INT NOT NULL,
CONSTRAINT fk_procedimento_proced_realizado FOREIGN KEY (fk_procedimento_id) REFERENCES procedimento(procedimento_id),
CONSTRAINT fk_consulta_proced_realizado FOREIGN KEY (fk_consulta_id) REFERENCES consulta(consulta_id)
);

CREATE TABLE prescricao(
prescricao_id INT PRIMARY KEY AUTO_INCREMENT,
observacao VARCHAR(250),
fk_consulta_id INT NOT NULL,
CONSTRAINT fk_consulta_prescricao FOREIGN KEY (fk_consulta_id) REFERENCES consulta(consulta_id)
);

CREATE TABLE medicamento_prescrito(
medicamento_prescrito_id INT PRIMARY KEY AUTO_INCREMENT,
dosagem VARCHAR(100),
frequencia VARCHAR(100),
duracao VARCHAR(100),
fk_prescricao_id INT NOT NULL,
fk_medicamento_id INT NOT NULL,
CONSTRAINT fk_prescricao_med_prescrito FOREIGN KEY (fk_prescricao_id) REFERENCES prescricao(prescricao_id),
CONSTRAINT fk_medicamento_med_prescrito FOREIGN KEY (fk_medicamento_id) REFERENCES medicamento(medicamento_id)
);

-- ==============
-- = Financeiro =
-- ==============

CREATE TABLE valor(
valor_id INT PRIMARY KEY AUTO_INCREMENT,
subtotal DECIMAL(8,2) NOT NULL,
desconto DECIMAL(8,2) NOT NULL,
total DECIMAL(8,2) NOT NULL,
fk_consulta_id INT NOT NULL,
fk_servico_id INT,
CONSTRAINT fk_consulta_valor FOREIGN KEY (fk_consulta_id) REFERENCES consulta(consulta_id),
CONSTRAINT fk_servico_valor FOREIGN KEY (fk_servico_id) REFERENCES servico(servico_id)
);

CREATE TABLE pagamento(
pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
modo ENUM('Cartão de crédito', 'Boleto', 'Dinheiro'),
fk_cliente_id INT NOT NULL,
fk_valor_id INT NOT NULL,
CONSTRAINT fk_cliente_pagamento FOREIGN KEY (fk_cliente_id) REFERENCES cliente(cliente_id),
CONSTRAINT fk_valor_pagamento FOREIGN KEY (fk_valor_id) REFERENCES valor(valor_id)
);

CREATE TABLE pagamento_status(
pagamento_status_id INT PRIMARY KEY AUTO_INCREMENT,
status ENUM('Aprovado', 'Em aberto', 'Cancelado'),
fk_pagamento_id INT NOT NULL,
CONSTRAINT fk_pagamento_pag_status FOREIGN KEY (fk_pagamento_id) REFERENCES pagamento(pagamento_id)
);