USE clinica_veterinaria;

-- =========================================================
-- CLIENTES - 15
-- =========================================================

INSERT INTO tb_cliente (nome, telefone, email, cpf) VALUES
('João Silva', '81991234567', 'joao@email.com', '12345678901'),
('Maria Santos', '81992345678', 'maria@email.com', '23456789012'),
('Carlos Oliveira', '81993456789', 'carlos@email.com', '34567890123'),
('Ana Beatriz Souza', '81994567890', 'ana@email.com', '45678901234'),
('Pedro Henrique Lima', '81995678901', 'pedro@email.com', '56789012345'),
('Juliana Costa', '81996789012', 'juliana@email.com', '67890123456'),
('Lucas Ferreira', '81997890123', 'lucas@email.com', '78901234567'),
('Fernanda Alves', '81998901234', 'fernanda@email.com', '89012345678'),
('Rafael Martins', '81999012345', 'rafael@email.com', '90123456789'),
('Camila Rocha', '81991122334', 'camila@email.com', '11223344556'),
('Bruno Carvalho', '81992233445', 'bruno@email.com', '22334455667'),
('Larissa Mendes', '81993344556', 'larissa@email.com', '33445566778'),
('Gabriel Pereira', '81994455667', 'gabriel@email.com', '44556677889'),
('Beatriz Ramos', '81995566778', 'beatriz@email.com', '55667788990'),
('Thiago Nascimento', '81996677889', 'thiago@email.com', '66778899001');


-- =========================================================
-- ESPÉCIES - 5
-- =========================================================

INSERT INTO tb_especie (nome) VALUES
('Cachorro'),
('Gato'),
('Coelho'),
('Ave'),
('Hamster');


-- =========================================================
-- RAÇAS - 10
-- =========================================================

INSERT INTO tb_raca (nome, fk_especie_id) VALUES
('Labrador', 1),
('Golden Retriever', 1),
('Poodle', 1),
('Pastor Alemão', 1),
('Shih-tzu', 1),
('Siamês', 2),
('Persa', 2),
('Mini Lop', 3),
('Calopsita', 4),
('Sírio', 5);


-- =========================================================
-- ANIMAIS - 20
-- =========================================================

INSERT INTO tb_animal
(nome, data_nascimento, sexo, fk_cliente_id, fk_especie_id, fk_raca_id)
VALUES
('Rex', '2020-05-12', 'Macho', 1, 1, 1),
('Mel', '2021-03-20', 'Fêmea', 2, 1, 2),
('Thor', '2019-08-15', 'Macho', 3, 1, 3),
('Luna', '2022-01-10', 'Fêmea', 4, 1, 5),
('Bob', '2018-11-25', 'Macho', 5, 1, 4),

('Mia', '2021-07-13', 'Fêmea', 6, 2, 6),
('Nina', '2020-09-18', 'Fêmea', 7, 2, 7),
('Simba', '2019-02-14', 'Macho', 8, 2, 6),
('Tom', '2022-06-22', 'Macho', 9, 2, 7),

('Bidu', '2023-01-15', 'Macho', 10, 3, 8),
('Floquinho', '2022-10-05', 'Macho', 11, 3, 8),
('Pipoca', '2023-03-12', 'Fêmea', 12, 3, 8),

('Lola', '2021-05-09', 'Fêmea', 13, 4, 9),
('Sol', '2020-12-20', 'Macho', 14, 4, 9),
('Pérola', '2022-08-17', 'Fêmea', 15, 4, 9),
('Kiwi', '2021-11-11', 'Macho', 1, 4, 9),

('Nino', '2023-02-03', 'Macho', 2, 5, 10),
('Pingo', '2022-04-19', 'Macho', 3, 5, 10),
('Cookie', '2023-06-21', 'Fêmea', 4, 5, 10),
('Amora', '2022-09-30', 'Fêmea', 5, 5, 10);


-- =========================================================
-- VETERINÁRIOS - 8
-- =========================================================

INSERT INTO tb_veterinario
(nome, crmv, cpf, email, telefone)
VALUES
('Dr. André Almeida', 'CRMV01', '10101010101', 'andre@clinica.com', '81991111111'),
('Dra. Paula Mendes', 'CRMV02', '20202020202', 'paula@clinica.com', '81992222222'),
('Dr. Ricardo Souza', 'CRMV03', '30303030303', 'ricardo@clinica.com', '81993333333'),
('Dra. Mariana Costa', 'CRMV04', '40404040404', 'mariana@clinica.com', '81994444444'),
('Dr. Felipe Rocha', 'CRMV05', '50505050505', 'felipe@clinica.com', '81995555555'),
('Dra. Carla Oliveira', 'CRMV06', '60606060606', 'carla@clinica.com', '81996666666'),
('Dr. Eduardo Lima', 'CRMV07', '70707070707', 'eduardo@clinica.com', '81997777777'),
('Dra. Renata Alves', 'CRMV08', '80808080808', 'renata@clinica.com', '81998888888');


-- =========================================================
-- ESPECIALIDADES
-- =========================================================

INSERT INTO tb_especialidade (nome) VALUES
('Clínica Geral'),
('Dermatologia'),
('Cardiologia'),
('Ortopedia'),
('Oftalmologia'),
('Cirurgia'),
('Animais Exóticos'),
('Odontologia');


-- =========================================================
-- VETERINÁRIOS x ESPECIALIDADES
-- =========================================================

INSERT INTO tb_vet_especialidade
(fk_veterinario_id, fk_especialidade_id)
VALUES
(1, 1),
(1, 6),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(2, 1),
(4, 1),
(6, 2);


-- =========================================================
-- PROCEDIMENTOS - 15
-- =========================================================

INSERT INTO tb_procedimento
(nome, tempo_ideal, descricao, preco)
VALUES
('Consulta clínica', '00:30:00', 'Avaliação clínica geral do animal', 120.00),
('Vacinação', '00:20:00', 'Aplicação de vacina', 90.00),
('Curativo', '00:20:00', 'Limpeza e proteção de ferimentos', 60.00),
('Aplicação de medicamento', '00:15:00', 'Aplicação de medicamento prescrito', 45.00),
('Exame de sangue', '00:30:00', 'Coleta para análise sanguínea', 100.00),
('Ultrassonografia', '01:00:00', 'Exame ultrassonográfico', 220.00),
('Radiografia', '00:40:00', 'Exame radiográfico', 180.00),
('Limpeza dentária', '01:00:00', 'Higienização odontológica', 250.00),
('Castração', '02:00:00', 'Procedimento cirúrgico de castração', 450.00),
('Tosa higiênica', '00:40:00', 'Tosa e higienização', 80.00),
('Limpeza de ouvido', '00:20:00', 'Higienização do ouvido', 55.00),
('Exame oftalmológico', '00:30:00', 'Avaliação dos olhos', 130.00),
('Eletrocardiograma', '00:40:00', 'Avaliação cardíaca', 160.00),
('Retirada de pontos', '00:20:00', 'Remoção de suturas', 50.00),
('Internação', '24:00:00', 'Internação e acompanhamento clínico', 300.00);


-- =========================================================
-- MEDICAMENTOS - 10
-- =========================================================

INSERT INTO tb_medicamento
(nome, descricao, preco)
VALUES
('Amoxicilina', 'Antibiótico veterinário', 35.90),
('Dipirona', 'Analgésico e antitérmico', 18.50),
('Prednisona', 'Anti-inflamatório', 25.90),
('Meloxicam', 'Anti-inflamatório não esteroidal', 42.00),
('Enrofloxacino', 'Antibiótico veterinário', 48.90),
('Omeprazol', 'Protetor gástrico', 22.50),
('Ivermectina', 'Antiparasitário', 29.90),
('Cetoconazol', 'Antifúngico', 38.00),
('Clorexidina', 'Antisséptico', 27.50),
('Fenobarbital', 'Anticonvulsivante', 55.00);


-- =========================================================
-- SERVIÇOS
-- =========================================================

INSERT INTO tb_servico (nome, descricao, preco) VALUES
('Banho', 'Banho completo', 50.00),
('Tosa', 'Tosa completa', 70.00),
('Banho e tosa', 'Banho e tosa completa', 100.00),
('Hospedagem', 'Hospedagem por diária', 120.00),
('Consulta especializada', 'Consulta com especialista', 180.00);


-- =========================================================
-- CONSULTAS - 35
-- =========================================================

INSERT INTO tb_consulta
(data_hora, status, fk_animal_id, fk_veterinario_id)
VALUES
('2026-08-01 08:00:00', 'Realizada', 1, 1),
('2026-08-01 09:00:00', 'Realizada', 2, 2),
('2026-08-01 10:00:00', 'Realizada', 6, 3),
('2026-08-02 08:30:00', 'Realizada', 3, 1),
('2026-08-02 09:30:00', 'Realizada', 7, 2),
('2026-08-02 10:30:00', 'Realizada', 10, 7),
('2026-08-03 08:00:00', 'Realizada', 4, 4),
('2026-08-03 09:00:00', 'Realizada', 5, 5),
('2026-08-03 10:00:00', 'Realizada', 8, 3),
('2026-08-04 08:00:00', 'Realizada', 9, 2),
('2026-08-04 09:00:00', 'Realizada', 11, 7),
('2026-08-04 10:00:00', 'Realizada', 12, 7),
('2026-08-05 08:30:00', 'Realizada', 13, 8),
('2026-08-05 09:30:00', 'Realizada', 14, 8),
('2026-08-05 10:30:00', 'Realizada', 15, 8),
('2026-08-06 08:00:00', 'Realizada', 16, 8),
('2026-08-06 09:00:00', 'Realizada', 17, 7),
('2026-08-06 10:00:00', 'Realizada', 18, 7),
('2026-08-07 08:00:00', 'Realizada', 19, 7),
('2026-08-07 09:00:00', 'Realizada', 20, 7),
('2026-08-08 08:00:00', 'Realizada', 1, 6),
('2026-08-08 09:00:00', 'Realizada', 2, 2),
('2026-08-09 08:30:00', 'Realizada', 3, 1),
('2026-08-09 09:30:00', 'Realizada', 6, 3),
('2026-08-10 08:00:00', 'Realizada', 7, 2),
('2026-08-10 09:00:00', 'Realizada', 8, 3),
('2026-08-11 08:00:00', 'Realizada', 10, 7),
('2026-08-11 09:00:00', 'Realizada', 13, 8),
('2026-08-12 08:30:00', 'Realizada', 4, 4),
('2026-08-12 09:30:00', 'Realizada', 5, 5),
('2026-08-13 08:00:00', 'Marcada', 9, 2),
('2026-08-13 09:00:00', 'Marcada', 14, 8),
('2026-08-14 08:00:00', 'Marcada', 17, 7),
('2026-08-14 09:00:00', 'Cancelada', 20, 7),
('2026-08-15 08:00:00', 'Marcada', 1, 1);


-- =========================================================
-- DIAGNÓSTICOS
-- =========================================================

INSERT INTO tb_diagnostico
(diagnostico, fk_consulta_id)
VALUES
('Saúde geral normal', 1),
('Dermatite alérgica leve', 2),
('Avaliação cardíaca sem alterações', 3),
('Otite externa', 4),
('Gastrite leve', 5),
('Saúde geral normal', 6),
('Displasia coxofemoral em avaliação', 7),
('Problema odontológico', 8),
('Infecção urinária', 9),
('Saúde geral normal', 10),
('Problema gastrointestinal', 11),
('Saúde geral normal', 12),
('Alteração respiratória leve', 13),
('Saúde geral normal', 14),
('Condição clínica estável', 15),
('Infecção de ouvido', 16),
('Parasitose', 17),
('Parasitose', 18),
('Saúde geral normal', 19),
('Saúde geral normal', 20),
('Saúde geral normal', 21),
('Dermatite', 22),
('Dor articular', 23),
('Infecção urinária', 24),
('Alergia alimentar', 25),
('Avaliação cardíaca', 26),
('Saúde geral normal', 27),
('Problema dermatológico', 28),
('Problema ortopédico', 29),
('Saúde geral normal', 30);


-- =========================================================
-- PROCEDIMENTOS REALIZADOS
-- =========================================================

INSERT INTO tb_procedimento_realizado
(observacao, fk_procedimento_id, fk_consulta_id)
VALUES
('Avaliação inicial', 1, 1),
('Vacinação anual', 2, 2),
('Aplicação de medicamento', 4, 3),
('Limpeza de ouvido', 11, 4),
('Exame de sangue', 5, 5),
('Consulta clínica', 1, 6),
('Radiografia para avaliação', 7, 7),
('Limpeza dentária', 8, 8),
('Exame de sangue', 5, 9),
('Vacinação', 2, 10),
('Curativo realizado', 3, 11),
('Aplicação de medicamento', 4, 12),
('Exame oftalmológico', 12, 13),
('Consulta clínica', 1, 14),
('Vacinação', 2, 15),
('Limpeza de ouvido', 11, 16),
('Aplicação de antiparasitário', 4, 17),
('Aplicação de antiparasitário', 4, 18),
('Consulta clínica', 1, 19),
('Vacinação', 2, 20),
('Exame de sangue', 5, 21),
('Curativo', 3, 22),
('Radiografia', 7, 23),
('Exame de sangue', 5, 24),
('Consulta clínica', 1, 25),
('Eletrocardiograma', 13, 26),
('Consulta clínica', 1, 27),
('Exame oftalmológico', 12, 28),
('Radiografia', 7, 29),
('Vacinação', 2, 30);


-- =========================================================
-- PRESCRIÇÕES
-- =========================================================

INSERT INTO tb_prescricao
(observacao, fk_consulta_id)
VALUES
('Administrar conforme orientação veterinária', 2),
('Tratamento durante 7 dias', 4),
('Uso após alimentação', 5),
('Tratamento anti-inflamatório', 7),
('Administrar durante 5 dias', 9),
('Uso tópico', 11),
('Tratamento por 10 dias', 13),
('Administrar conforme orientação', 16),
('Controle de parasitas', 17),
('Controle de parasitas', 18),
('Tratamento por 7 dias', 22),
('Tratamento da infecção', 24),
('Tratamento de alergia', 25),
('Uso contínuo conforme orientação', 26),
('Tratamento dermatológico', 28);


-- =========================================================
-- MEDICAMENTOS PRESCRITOS
-- =========================================================

INSERT INTO tb_medicamento_prescrito
(dosagem, frequencia, duracao, fk_prescricao_id, fk_medicamento_id)
VALUES
('500 mg', '2 vezes ao dia', '7 dias', 1, 1),
('20 gotas', '3 vezes ao dia', '5 dias', 2, 2),
('10 mg', '1 vez ao dia', '7 dias', 3, 6),
('5 mg', '1 vez ao dia', '5 dias', 4, 4),
('250 mg', '2 vezes ao dia', '5 dias', 5, 5),
('Aplicar na região afetada', '2 vezes ao dia', '7 dias', 6, 9),
('50 mg', '1 vez ao dia', '10 dias', 7, 3),
('1 comprimido', '1 vez ao mês', '3 meses', 8, 7),
('1 comprimido', '1 vez ao mês', '3 meses', 9, 7),
('1 comprimido', '1 vez ao mês', '3 meses', 10, 7),
('Aplicar na pele', '2 vezes ao dia', '7 dias', 11, 8),
('250 mg', '2 vezes ao dia', '7 dias', 12, 1),
('10 mg', '1 vez ao dia', '5 dias', 13, 3),
('1 comprimido', '1 vez ao dia', '30 dias', 14, 10),
('Aplicar na pele', '1 vez ao dia', '10 dias', 15, 8);


-- =========================================================
-- VALORES
-- =========================================================

INSERT INTO tb_valor
(subtotal, desconto, total, fk_consulta_id, fk_servico_id)
VALUES
(NULL, 0.00, NULL, 1, NULL),
(NULL, 20.00, NULL, 2, 1),
(NULL, 0.00, NULL, 3, 5),
(NULL, 15.00, NULL, 4, NULL),
(NULL, 20.00, NULL, 5, 5),
(NULL, 0.00, NULL, 6, NULL),
(NULL, 30.00, NULL, 7, 5),
(NULL, 0.00, NULL, 8, NULL),
(NULL, 20.00, NULL, 9, NULL),
(NULL, 10.00, NULL, 10, NULL),
(NULL, 0.00, NULL, 11, NULL),
(NULL, 0.00, NULL, 12, NULL),
(NULL, 20.00, NULL, 13, 5),
(NULL, 0.00, NULL, 14, NULL),
(NULL, 10.00, NULL, 15, NULL),
(NULL, 25.00, NULL, 16, NULL),
(NULL, 0.00, NULL, 17, NULL),
(NULL, 0.00, NULL, 18, NULL),
(NULL, 0.00, NULL, 19, NULL),
(NULL, 10.00, NULL, 20, NULL),
(NULL, 20.00, NULL, 21, NULL),
(NULL, 10.00, NULL, 22, NULL),
(NULL, 30.00, NULL, 23, NULL),
(NULL, 20.00, NULL, 24, NULL),
(NULL, 0.00, NULL, 25, NULL),
(NULL, 30.00, NULL, 26, 5),
(NULL, 0.00, NULL, 27, NULL),
(NULL, 30.00, NULL, 28, 5),
(NULL, 0.00, NULL, 29, NULL),
(NULL, 10.00, NULL, 30, NULL);


-- =========================================================
-- PAGAMENTOS
-- =========================================================

INSERT INTO tb_pagamento
(modo, fk_cliente_id, fk_valor_id)
VALUES
('A vista', 1, 1),
('Cartão de crédito', 2, 2),
('Cartão de crédito', 6, 3),
('A vista', 3, 4),
('Boleto', 7, 5),
('Cartão de crédito', 8, 6),
('A vista', 4, 7),
('Cartão de crédito', 5, 8),
('A vista', 7, 9),
('Cartão de crédito', 9, 10),
('A vista', 11, 11),
('Cartão de crédito', 12, 12),
('Boleto', 13, 13),
('A vista', 14, 14),
('Cartão de crédito', 15, 15),
('A vista', 1, 16),
('Cartão de crédito', 2, 17),
('A vista', 3, 18),
('Boleto', 4, 19),
('Cartão de crédito', 5, 20),
('A vista', 1, 21),
('Cartão de crédito', 6, 22),
('Boleto', 3, 23),
('A vista', 6, 24),
('Cartão de crédito', 4, 25),
('A vista', 7, 26),
('Cartão de crédito', 13, 27),
('Boleto', 13, 28),
('A vista', 5, 29),
('Cartão de crédito', 5, 30);


-- =========================================================
-- STATUS DOS PAGAMENTOS
-- =========================================================

INSERT INTO tb_pagamento_status
(status, fk_pagamento_id)
VALUES
('Aprovado', 1),
('Aprovado', 2),
('Aprovado', 3),
('Aprovado', 4),
('Em aberto', 5),
('Aprovado', 6),
('Aprovado', 7),
('Aprovado', 8),
('Aprovado', 9),
('Aprovado', 10),
('Aprovado', 11),
('Aprovado', 12),
('Em aberto', 13),
('Aprovado', 14),
('Aprovado', 15),
('Aprovado', 16),
('Aprovado', 17),
('Aprovado', 18),
('Em aberto', 19),
('Aprovado', 20),
('Aprovado', 21),
('Aprovado', 22),
('Cancelado', 23),
('Aprovado', 24),
('Aprovado', 25),
('Aprovado', 26),
('Aprovado', 27),
('Em aberto', 28),
('Aprovado', 29),
('Aprovado', 30);
