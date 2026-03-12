-- Database: db_Empresas

-- DROP DATABASE IF EXISTS "db_Empresas";

CREATE DATABASE "db_Empresas"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

--Criação de Tabelas

CREATE TABLE  EMPREGADOS (CODIGO INT, NOME VARCHAR(100), EMAIL TEXT);

CREATE TABLE DEPTOS
(
    CODIGO INT, 
    NOME VARCHAR(100)
);

CREATE TABLE CARGOS
(
    CODIGO INT,
	NOME TEXT,
	SALARIO NUMERIC(7,2) -- aceita 7 digitos e 2 depois da casa decimal 
);

--Seleção de dados: 

SELECT * FROM EMPREGADOS;
SELECT * FROM DEPTOS;
SELECT * FROM CARGOS;


--Inserir dados:

INSERT INTO EMPREGADOS VALUES (01, 'Daniel Robson', 'daniel456@gmail.com');
INSERT INTO DEPTOS VALUES (01, 'TI');
INSERT INTO CARGOS VALUES (01, 'Desenvolvedor', 10000.00);


	