-- 1) Criar banco
CREATE DATABASE db_aula02;

CREATE TABLE teste (
    codigo NUMERIC(5) NOT NULL,
    salario NUMERIC(7,2),
    dia_hoje DATE,
    texto VARCHAR(10),
    aprovado BOOLEAN
);

-- Inserir dados
INSERT INTO teste (codigo, salario, dia_hoje, texto, aprovado)
VALUES
(123, 455.56, '2012-03-19', 'Hello', TRUE),
(99999, 99999.56, '2012-03-19', 'Ola', FALSE);

-- 3.1) Renomear tabela
ALTER TABLE teste RENAME TO aulabd;

-- 3.2) Renomear coluna
ALTER TABLE aulabd RENAME COLUMN aprovado TO situacao;

-- 3.3) Adicionar RGM
ALTER TABLE aulabd ADD COLUMN rgm NUMERIC(5);

-- 3.4) Adicionar novo campo
ALTER TABLE aulabd ADD COLUMN novo_campo VARCHAR(100);

-- 3.5) Preencher novo_campo (necessário antes do NOT NULL)
UPDATE aulabd SET novo_campo = 'padrao';

-- Tornar NOT NULL
ALTER TABLE aulabd ALTER COLUMN novo_campo SET NOT NULL;

-- 3.6) Remover salário
ALTER TABLE aulabd DROP COLUMN salario;

-- Preencher valores únicos
UPDATE aulabd SET rgm = 1 WHERE codigo = 123;
UPDATE aulabd SET rgm = 2 WHERE codigo = 99999;

-- Tornar NOT NULL
ALTER TABLE aulabd ALTER COLUMN rgm SET NOT NULL;

-- Criar PK
ALTER TABLE aulabd ADD CONSTRAINT pk_rgm PRIMARY KEY (rgm);

-- 3.8) Apagar tabela
DROP TABLE aulabd;