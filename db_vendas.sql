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

--criação de tabelas
create table vendas
(
	id_ven			int primary key,
	vendedor_ven	varchar(100),
	valor_ven		numeric(7,2),
	data_ven		date
);

--inserção de dados
insert into vendas values 	(1,'Ana',10000,'29-04-2026'), 
							(2,'Pedro',15000,'05-04-2026'),
							(3, 'José',100,'05-02-2026'),
							(4,'Melo',150,'06-01-26'),
							(5,'Anchieta',50000,'05-02-2026');
select * from vendas;
--seleção de dados
--1)Qual o total das vendas?
select sum(valor_ven)
from vendas;

--2)Qual o total das vendas de cada vendedor?
select vendedor_ven, sum(valor_ven)
from vendas
group by vendedor_ven;

--3)Quantas vendas foram feitas?
select count(*)
from vendas;

insert into vendas values (6,'Ana',5000,'09-01-2026');
--4)Quantas vendas cada vendedor fez?
select vendedor_ven,count(*)
from vendas
group by vendedor_ven;

--5)Qual a menor e a maior venda?
select min(valor_ven),max(valor_ven)
from vendas;

--6)Qual a menor e a maior venda de cada vendedor?
select vendedor_ven,min(valor_ven),max(valor_ven)
from vendas
group by vendedor_ven;

insert into vendas values (7,'Pedro',90000,'05-04-2026');
--7)Qual a média das vendas dos dias 05 e 29 de abril de 2026?
select data_ven, avg(valor_ven)
from vendas
where data_ven in ('05-04-2026','29-04-2026')
group by data_ven;

--8)Em quais dias as vendas superaram 3.000?
select data_ven as data_venda,sum(valor_ven) as valor_total
from vendas
group by data_ven
having sum(valor_ven) > 3000;

--9)Em quais dias, no período de 06 a 09/01/2026, a média das vendas foi menor que 2000?
SELECT data_ven, AVG(valor_ven)
FROM vendas
WHERE data_ven BETWEEN '2011-11-14' AND '2011-11-16'
GROUP BY data_ven
HAVING AVG(valor_ven) <2000;

--10)Que vendedores fecharam mais de 2 vendas nos dias 05, 15 e 29 de abril de 2026?
SELECT vendedor_ven, COUNT(*)
FROM vendas
WHERE data_ven IN ('2026-11-14', '2026-11-16', '2026-11-18')
GROUP BY vendedor_ven
HAVING COUNT(*) >2;







	