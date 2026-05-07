-- Criação das tabelas base
CREATE TABLE Profissional (
    codigo INT PRIMARY KEY, -- Seguindo o nome do diagrama [cite: 7]
    funcao VARCHAR(100),
    nome VARCHAR(100)
);

CREATE TABLE Obra (
    codigo INT PRIMARY KEY,
    endereco VARCHAR(100),
    descricao VARCHAR(100)
);

CREATE TABLE Material (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(100)
);

-- Tarefa possui FK para Obra (Relacionamento 1:N)
CREATE TABLE Tarefa (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(100),
    dt_inicio DATE,
    dt_fim DATE,
    valor NUMERIC(10,2),
    cod_obra INT NOT NULL,
    CONSTRAINT fk_obra_tarefa FOREIGN KEY (cod_obra) REFERENCES Obra(codigo)
);

-- Relacionamentos N:N
CREATE TABLE faz (
    cod_prof INT,
    cod_tarefa INT,
    PRIMARY KEY (cod_prof, cod_tarefa),
    FOREIGN KEY (cod_prof) REFERENCES Profissional(codigo),
    FOREIGN KEY (cod_tarefa) REFERENCES Tarefa(codigo)
);

CREATE TABLE usa (
    cod_mat INT,
    cod_obra INT,
    PRIMARY KEY (cod_mat, cod_obra),
    FOREIGN KEY (cod_mat) REFERENCES Material(codigo),
    FOREIGN KEY (cod_obra) REFERENCES Obra(codigo)
);


INSERT INTO Profissional VALUES (1, 'Pedreiro', 'Carlos Silva'), (2, 'Engenheiro Civil', 'Ana Souza');
INSERT INTO Obra VALUES (10, 'Rua A', 'Reforma X'), (20, 'Rua B', 'Construção Y');
INSERT INTO Material VALUES (100, 'Cimento'), (200, 'Tijolo');

-- Inserindo tarefas vinculadas às obras
INSERT INTO Tarefa VALUES 
(501, 'Fundação', '2014-03-02', '2014-03-15', 450.00, 10), 
(502, 'Pintura', '2014-04-20', '2014-04-25', 120.00, 20);

INSERT INTO faz VALUES (1, 501), (2, 502);
INSERT INTO usa VALUES (100, 10), (200, 20);

--3 
-- Atualizar os valores das tarefas, aplicando 
-- um aumento de 22% sobre o preço, somente para as tarefas cujo
-- preço for menor que 150. 
UPDATE Tarefa SET valor = valor * 1.22 WHERE valor < 150;
SELECT * FROM Tarefa;

--4
-- Selecionar todas as tarefas cuja data de inicio seja igual a 02/03/2014
-- e cujo valor total esteja entre 100 e 500

SELECT * FROM Tarefa 
WHERE dt_inicio = '2014-03-02' 
AND valor BETWEEN 100 AND 500;

--5
-- Selecionar todos os materiais cuja descrição 
-- comece com A ou C ou R. O resultado deverá ser apresentado
-- em ordem alfabética


SELECT * FROM Material 
WHERE descricao LIKE 'A%' OR descricao LIKE 'C%' OR descricao LIKE 'R%'
ORDER BY descricao ASC;


--6 Selecionar todos os profissionais que NÃO são Arquitetos ou Engenheiros
SELECT * FROM Profissional 
WHERE funcao NOT IN ('Arquiteto', 'Engenheiro');

--7 
-- Selecionar o código e o nome do profissional, além da descrição e
-- data de inicio das tarefas por ordem
-- descendente de data de inicio, usando alias (apelido de tabela). 
SELECT 
    p.codigo AS "Código do Profissional", 
    p.nome AS "Nome do Profissional", 
    t.descricao AS "Descrição da Tarefa", 
    t.dt_inicio AS "Data de Início"
FROM Profissional AS p
JOIN faz AS f ON p.codigo = f.cod_prof
JOIN Tarefa AS t ON f.cod_tarefa = t.codigo
ORDER BY t.dt_inicio DESC;

--8 Exibir a quantidade de materiais utilizados em cada obra. 
-- Exibir a descrição da obra e a quantidade. 

SELECT o.descricao, COUNT(u.cod_mat) AS qtd_materiais
FROM Obra o
JOIN usa u ON o.codigo = u.cod_obra
GROUP BY o.descricao;

--9
-- Obter o valor total de cada obra que tenha ocorrido 
-- entre 15/04/2014 até 25/04/2014. Apresentar o resultado
-- em ordem alfabética por descrição da obra. 

SELECT o.descricao, SUM(t.valor) AS valor_total
FROM Obra o
JOIN Tarefa t ON o.codigo = t.cod_obra
WHERE t.dt_inicio BETWEEN '2014-04-15' AND '2014-04-25'
GROUP BY o.descricao
ORDER BY o.descricao ASC;

--10
-- Mostrar nome e a função do profissional, descrição 
-- e valor da tarefa além da descrição da obra a qual pertence
-- cada tarefa. Renomeie as colunas no retorno da consulta.

SELECT 
    p.nome AS "Nome do Profissional",
    p.funcao AS "Função Exercida",
    t.descricao AS "Tarefa Realizada",
    t.valor AS "Custo da Atividade",
    o.descricao AS "Nome do Empreendimento"
FROM Profissional p
JOIN faz f ON p.codigo = f.cod_prof
JOIN Tarefa t ON f.cod_tarefa = t.codigo
JOIN Obra o ON t.cod_obra = o.codigo;