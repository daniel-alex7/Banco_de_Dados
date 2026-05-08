-- Criando as tabelas independentes primeiro
CREATE TABLE Departamento (
    codigo NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL
);

CREATE TABLE Cidade (
    codigo NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL
);

CREATE TABLE Cargo (
    codigo NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    salario_base NUMBER(10,2)
);

-- Criando a tabela Funcionario com as chaves estrangeiras (FKs)
CREATE TABLE Funcionario (
    codigo NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    telefone VARCHAR2(20),
    salario NUMBER(10,2),
    cod_depto NUMBER,
    cod_cidade NUMBER,
    cod_cargo NUMBER,
    CONSTRAINT FK_DEPTO FOREIGN KEY (cod_depto) REFERENCES Departamento(codigo),
    CONSTRAINT FK_CIDADE FOREIGN KEY (cod_cidade) REFERENCES Cidade(codigo),
    CONSTRAINT FK_CARGO FOREIGN KEY (cod_cargo) REFERENCES Cargo(codigo)
);

-- Inserindo Departamentos
INSERT INTO Departamento VALUES (1, 'TI');
INSERT INTO Departamento VALUES (2, 'RH');
INSERT INTO Departamento VALUES (3, 'Financeiro');
INSERT INTO Departamento VALUES (4, 'Vendas');
INSERT INTO Departamento VALUES (5, 'Logística');

-- Inserindo Cidades
INSERT INTO Cidade VALUES (1, 'São Paulo');
INSERT INTO Cidade VALUES (2, 'Campinas');
INSERT INTO Cidade VALUES (3, 'Santos');
INSERT INTO Cidade VALUES (4, 'Sorocaba');
INSERT INTO Cidade VALUES (5, 'Jundiaí');

-- Inserindo Cargos
INSERT INTO Cargo VALUES (1, 'Analista', 2500);
INSERT INTO Cargo VALUES (2, 'Assistente', 1200);
INSERT INTO Cargo VALUES (3, 'Gerente', 5000);
INSERT INTO Cargo VALUES (4, 'Auxiliar', 900);
INSERT INTO Cargo VALUES (5, 'Estagiário', 450);

-- Inserindo Funcionários (com salários variados para testar os filtros)
INSERT INTO Funcionario VALUES (101, 'Ana Silva', '119999', 3000, 1, 1, 1);
INSERT INTO Funcionario VALUES (102, 'Bruno Souza', '118888', 400, 1, 2, 5); -- Salário < 500
INSERT INTO Funcionario VALUES (103, 'Carlos Lima', '117777', 1500, 2, 1, 2);
INSERT INTO Funcionario VALUES (104, 'Daniela Oliveira', '116666', 800, 3, 3, 4); -- Salário < 1000
INSERT INTO Funcionario VALUES (105, 'Eduardo Costa', '115555', 6000, 1, 4, 3);

-- 3) Atualizar salário dos funcionários para 10% de aumento
UPDATE Funcionario SET salario = salario * 1.10;

-- 4) Mostrar os funcionários que ganham mais que 1000
SELECT nome FROM Funcionario WHERE salario > 1000;

-- 5) Mostrar o número de funcionários que possuem salário menor que 500
SELECT COUNT(*) AS total_baixos_salarios FROM Funcionario WHERE salario < 500;

-- 6) Mostrar a média dos salários de todos funcionários
SELECT AVG(salario) AS media_geral FROM Funcionario;

-- 7) Mostrar a média dos salários dos funcionários que ganham menos que 1000
SELECT AVG(salario) AS media_baixos_salarios FROM Funcionario WHERE salario < 1000;

-- 8) Retornar o salário máximo dos funcionários
SELECT MAX(salario) AS maior_salario FROM Funcionario;

-- 9) Retornar o salário mínimo dos funcionários
SELECT MIN(salario) AS menor_salario FROM Funcionario;

-- 10) Contar o número de funcionários
SELECT COUNT(*) AS total_funcionarios FROM Funcionario;

-- 11) Mostrar a soma de todos os salários
SELECT SUM(salario) AS folha_pagamento_total FROM Funcionario;

-- 12) Mostrar a soma de todos os salários agrupados por departamento
SELECT cod_depto, SUM(salario) AS soma_por_depto FROM Funcionario GROUP BY cod_depto;

-- 13) Listar os funcionários em ordem alfabética A/Z
SELECT nome FROM Funcionario ORDER BY nome ASC;

-- 14) Listar os funcionários em ordem alfabética Z/A
SELECT nome FROM Funcionario ORDER BY nome DESC;

-- 15) Listar o total de todos funcionários que possuem salário maior que 200
SELECT COUNT(*) AS total_acima_200 FROM Funcionario WHERE salario > 200;

-- 16) Contar funcionários com salário > 200 que pertencem ao departamento 1
SELECT COUNT(*) AS total_depto1_acima_200 FROM Funcionario WHERE salario > 200 AND cod_depto = 1;

-- 17) Mostrar nome e salário de quem ganha mais que a média de todos os salários
SELECT nome, salario FROM Funcionario 
WHERE salario > (SELECT AVG(salario) FROM Funcionario);