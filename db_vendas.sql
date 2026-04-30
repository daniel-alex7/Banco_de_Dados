-- Database: db_vendas

-- DROP DATABASE IF EXISTS db_vendas;

CREATE DATABASE db_vendas
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


--criação de tabela

CREATE TABLE vendas (
	id_ven int primary key,
	vendedor_ven varchar(100),
	valor_ven numeric(7,2),
	data_ven date
);


--inserir dados

INSERT INTO vendas VALUES (1, 'Pedro',10000,'05-11-2026');
INSERT INTO vendas VALUES (2, 'Paulo',2000,'06-03-2026');
INSERT INTO vendas VALUES (3, 'Ana',50000,'30-08-2026');
INSERT INTO vendas VALUES (4, 'João',60000,'05-04-2026');
INSERT INTO vendas VALUES (5, 'Paulo',5050,'19-04-2026');


SELECT * FROM vendas;

SELECT SUM(valor_ven)
from vendas;


--vendas por vendedor
SELECT vendedor_ven, SUM(valor_ven)
from vendas
GROUP BY vendedor_ven;

--vendas feita
SELECT COUNT(*) as total_vendas
FROM vendas;


INSERT INTO vendas VALUES (6, 'Ana',5000,'19-04-2026');

--vendas por cada vendedor
SELECT vendedor_ven, COUNT(*)
FROM vendas
GROUP BY vendedor_ven;

--quantas vendas cada vendedor fez no valor total maior que 10.000
SELECT vendedor_ven, COUNT(*)
FROM vendas
GROUP BY vendedor_ven
HAVING sum(valor_ven)> 10000;

--qual o menor e o maior venda
SELECT min(valor_ven), max(valor_ven)
FROM vendas;

--QUAL A MENOR E MAIOR VENDA DE CADA VENDEDOR

SELECT vendedor_ven, min(valor_ven), max(valor_ven)
FROM vendas
GROUP BY vendedor_ven;


-- qual media de vendas por dia nos dias 5 e 29 de abril
INSERT INTO vendas VALUES (7, 'Pedro',90000,'05-11-2026');

SELECT ROUND (avg(valor_ven)), 2
FROM vendas
WHERE data_ven IN ('05-04-2026','29-04-2026')


--QUAIS DIAS AS VENDAM SUPERAM 3.000
SELECT data_ven AS datas, sum(valor_ven) AS valores
FROM vendas
GROUP BY data_ven
HAVING SUM(valor_ven) > 3000;


INSERT INTO vendas VALUES (8, 'João', 2000, '07-01-2026')
INSERT INTO vendas VALUES (9, 'João', 1000, '07-01-2026')
--em quais dias, no perido de 06 a 09/01 a media das vendas foi menor que 2000
SELECT data_ven, AVG(valor_ven)
FROM vendas
WHERE data_ven BETWEEN '06-01-2026' and '09-01-2026'
GROUP BY data_ven
HAVING AVG(valor_ven) < 2000;


