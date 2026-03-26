-- Database: db_convenio

-- DROP DATABASE IF EXISTS db_convenio;

CREATE DATABASE db_convenio
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = FALSE;

-- =========================
-- DDL - CRIAÇÃO DAS TABELAS
-- =========================

CREATE TABLE pessoas 
(
	id_pes SERIAL,
	nome_pes VARCHAR(100) NOT NULL,
	idade_pes INT CHECK (idade_pes >= 18),
	cidade_pes VARCHAR(100),
	CONSTRAINT pk_id_pes PRIMARY KEY (id_pes)
);

CREATE TABLE dependentes
(
	id_dep SERIAL,
	nome_dep VARCHAR(100),
	id_pes INT,
	CONSTRAINT pk_id_dep PRIMARY KEY (id_dep),
	CONSTRAINT fk_id_pes 
        FOREIGN KEY (id_pes) 
        REFERENCES pessoas (id_pes) 
);

-- =========================
-- DML - INSERÇÃO DE DADOS
-- =========================

INSERT INTO pessoas (nome_pes, idade_pes, cidade_pes) 
VALUES ('Pedro', 20, 'SP');

SELECT * FROM pessoas;

-- id_pes = 1 (Pedro)
INSERT INTO dependentes (nome_dep, id_pes) 
VALUES ('Maria', 1);

SELECT * FROM dependentes;

-- MAIS REGISTROS
INSERT INTO pessoas (nome_pes, idade_pes, cidade_pes) VALUES
('Caio', 50, 'SP'),
('Fernando', 24, 'RJ'),
('Daiana', 23, 'MT'),
('Davi', 45, 'SP'),
('Cesar', 88, 'SP');

SELECT * FROM pessoas;

--DML -- DELETAR DADOS
DELETE FROM pessoas;

--DELETAR DADOS UTILIZANDO CLAUSULA WHERE
DELETE FROM pessoas WHERE nome_pes = 'Davi'

--MODIFICAR DADOS, ATUALIZAR
UPDATE dependentes SET nome_dep = 'Ana Clara' WHERE nome_dep = 'Maria';

SELECT * FROM dependentes;

-----------

UPDATE pessoas SET nome_pes = 'Rodrigo' WHERE nome_pes = 'Daiana' 

SELECT * FROM pessoas;



