# projeto-banco-de-dados
Nome do projeto: Clínica Veterinária
Link de apresentação: https://canva.link/whphkb3l40kmatf

Descrição: Criação de um banco de dados destinado a uma clínica veterinária, onde relaciona clientes, animais, veterinarios, consultas, serviços, medicamentos e pagamentos com geração automática de cobrança

Objetivo: Criar um banco de dados de fácil uso e manutenabilidade.

Equipe:
Arthur Costa
Erik Victor
Gabriel de Almeida
Gabriel Benjamim
Luiz Gabriel

Ferramenta de modelagem usada: draw.io
Ferramenta de SGBD usada: MySQL Workbench CE

Requisitos Funcionais:
RF001 — Cadastrar clientes.
RF002 — Cadastrar animais.
RF003 — Cadastrar espécies.
RF004 — Cadastrar raças.
RF005 — Cadastrar veterinários.
RF006 — Cadastrar especialidades.
RF007 — Associar veterinários às especialidades.
RF008 — Cadastrar medicamentos.
RF009 — Cadastrar procedimentos.
RF010 — Cadastrar serviços.
RF011 — Registrar consultas.
RF012 — Registrar diagnósticos.
RF013 — Registrar procedimentos realizados.
RF014 — Registrar prescrições.
RF015 — Associar medicamentos às prescrições.
RF016 — Registrar pagamentos.
RF017 — Consultar histórico clínico do animal.
RF018 — Consultar informações financeiras da clínica.

Regras de Negócio:
RN001 — Um cliente pode possuir vários animais.
RN002 — Um animal pertence a apenas um cliente.
RN003 — Um animal pertence a uma espécie.
RN004 — Uma raça pertence a uma espécie.
RN005 — Um veterinário pode possuir uma ou mais especialidades.
RN006 — Um animal pode possuir várias consultas.
RN007 — Uma consulta pertence a apenas um animal.
RN008 — Uma consulta deve possuir um veterinário responsável.
RN009 — Uma consulta pode possuir vários procedimentos.
RN010 — Uma consulta pode gerar uma ou mais prescrições.
RN011 — Uma prescrição pode possuir vários medicamentos.
RN012 — Um pagamento não poderá possuir valor menor ou igual a zero.
RN013 — Uma consulta cancelada não deverá gerar cobrança de procedimento.
RN014 — O histórico de um animal deverá preservar os atendimentos realizados anteriormente.
RN015 — Uma consullta só pode gerar um valor final
RN016 — Um valor final deve ser gerado a partir de uma consulta e de um serviço

Como criar o banco: acesse script criação db.sql
Como inserir dados: acesse script inserts.sql
Como executar as consultas: estão divididas em views e consultas em script views.sql
Sendo elas: 
vw_veterinario_especialidades
vw_consultas_marcadas
vw_historico_animais_doencas
vw_consulta_animal
vw_servicos
vw_procedimentos