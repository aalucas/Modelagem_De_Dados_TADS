-- Remove o banco de dados 'atividade' se ele já existir
DROP DATABASE IF EXISTS atividade;

-- Cria um novo banco de dados chamado 'atividade'
CREATE DATABASE atividade;

-- Conecta ao banco de dados 'atividade'
\c atividade;

-- Cria tabela de Clientes com campos id, nome, email e data de cadastro
CREATE TABLE Clientes(
    id serial PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_cadastro date DEFAULT CURRENT_DATE
    UNIQUE(email)
);

-- Insere um cliente inicial
INSERT INTO Clientes (nome, email) VALUES
('João Silva', ' joaosilva@gmail.com'),
('Lucas Oliveira', 'lucas.luki3007@gmail.com'),
('Igor Avila Pereira', 'igor.pereira@riogrande.ifrs.edu.br');

-- Cria tabela de Planos com campos id, nome e valor mensal
CREATE TABLE Plano(
    id serial PRIMARY KEY,
    nome TEXT NOT NULL,
    valor_mensal money
);

-- Insere planos básico e premium
INSERT INTO Plano (nome, valor_mensal) VALUES
('Plano Básico', '50.00'),
('Plano Premium', '100.00'),
('Plano Gold', '200.00');

-- Cria tabela de relacionamento entre Cliente e Plano
CREATE TABLE Cliente_Plano(
    cliente_id INTEGER REFERENCES Clientes(id),
    plano_id INTEGER REFERENCES Plano(id),
    data_hora_inscricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_hora_fim TIMESTAMP,
    PRIMARY KEY(Cliente_id, Plano_id, data_hora_inscricao)
);

-- Associa o cliente 1 ao plano 1
INSERT INTO Cliente_Plano (cliente_id, plano_id) VALUES
(1, 1),
(2, 2,),
(3, 3);
    
-- Cria tabela de Instrutores
CREATE TABLE Instrutor(
    id serial PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    data_admissao TIMESTAMP,
);

-- Insere um instrutor inicial
INSERT INTO Instrutor (nome) VALUES
('Carlos Pereira');
('Felipe Franco');
('Bambam');
('Renato Cariani');
('Julio')

-- Cria tabela de Aulas
CREATE TABLE Aula(
    id serial PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    horario TIME,
    instrutor_id INTEGER REFERENCES Instrutor(id)
);

-- Insere aulas iniciais de Yoga e Pilates
INSERT INTO Aula (nome, horario, instrutor_id) VALUES
('Yoga', '08:00:00', 1),
('Pilates', '10:00:00', 1),
('Musculação', '12:00:00', 2);

-- Cria tabela de relacionamento entre Cliente e Aula
CREATE TABLE Cliente_Aula(
    Cliente_id INTEGER REFERENCES Clientes(id),
    Aula_id INTEGER REFERENCES Aula(id),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    presente BOOLEAN DEFAULT FALSE,
    PRIMARY KEY(Cliente_id, Aula_id, data_hora)
);

-- Registra presença do cliente 1 na aula 1
INSERT INTO Cliente_Aula (Cliente_id, Aula_id, presente) VALUES
(1, 1, TRUE);
(2, 2, TRUE),
(3, 2, FALSE);

-- Operações de Consulta e Manipulação

-- Consulta todos os instrutores
select * from instrutor;

-- Consulta todos os clientes
select * from cliente;

-- Consulta todos os planos
select * from plano;

-- Consulta apenas os nomes dos instrutores
select nome from instrutor;

-- Consulta todas as presenças em aulas
select * from cliente_aula;

-- Insere uma nova aula de forró
INSERT INTO aula (nome, horario, instrutor_id) VALUES
('AULA DE FORRÓ', '21:00', 1);

-- Consulta todas as aulas
SELECT * FROM aula;

-- Consulta aulas com informações dos instrutores
SELECT * FROM aula JOIN instrutor ON instrutor.id = aula.instrutor_id;

-- Consulta horário, nome da aula e nome do instrutor
SELECT horario, aula.nome, instrutor.nome FROM aula JOIN instrutor ON instrutor.id = aula.instrutor_id;

-- Adiciona coluna de data de nascimento na tabela de clientes
ALTER TABLE cliente ADD COLUMN data_nascimento DATE;

-- Atualiza data de nascimento do cliente 1
UPDATE cliente SET data_nascimento = '1987-01-20' where id = 1;

-- Consulta todos os clientes
select * from cliente;

-- Calcula dias de vida dos clientes
SELECT nome, CURRENT_DATE - data_nascimento FROM cliente;

-- Calcula idade aproximada em anos
SELECT nome, (CURRENT_DATE - data_nascimento)/365 FROM cliente;

-- Calcula idade usando função age do PostgreSQL
SELECT nome, age(data_nascimento) FROM cliente;
