-- Database: db_escola

-- DROP DATABASE IF EXISTS db_escola;

-- CREATE DATABASE db_escola
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'Portuguese_Brazil.1252'
--     LC_CTYPE = 'Portuguese_Brazil.1252'
--     LOCALE_PROVIDER = 'libc'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;

-- criação de tabelas
create table cursos (
	id_cur 			serial primary key,
	nome_cur 		varchar(100) not null,
	duracao_cur 	int
);

create table alunos(
	rgm_alu 		numeric(11) primary key,
	nome_alu 		varchar(100),
	id_cur 			int references cursos(id_cur)
);

--inserção de dados nas tabelas
select * from cursos;
insert into cursos (nome_cur, duracao_cur) values ('TADS', 4), ('CCP', 8);

insert into alunos (rgm_alu, nome_alu, id_cur) values 
(11111111111, 'Daniel', 1), 
(22222222222, 'Juliana', 2),
(33333333333, 'Calebe', 1);

--selecionar dados
--SELECIONE TODOS OS NOMES DOS CURSOS CADASTRADOS EM ORDEM DECRESCENTE
select nome_cur as curso from cursos order by nome_cur desc; --com as rotulamos o nome do campo cursos



--SELECIONE O CODIGO DO CURSO CHAMADO CCP
select id_cur from cursos where nome_cur='ccp' or nome_cur = 'CCP';
--Outra forma
select id_cur from cursos where nome_cur in('ccp','CCP');




--SELECIONE TODOS OS CURSOS QUE ESTÃO COM DURAÇÃO ENTRE 2 E 4
select * from cursos where duracao_cur <= 2 and duracao_cur >= 4;
--outra forma
select * from cursos where duracao_cur between 2 and 4;



--SELECIONE O NOME DOS ALUNOS QUE CURSAM TADS EM ORDEM CRESCENTE
select nome_alu from alunos where id_cur = 1  order by nome_alu asc; 

--integridade referencial, quando verificamos se a pk = fk
select nome_alu from alunos, cursos where cursos.id_cur = alunos.id_cur and nome_cur = 'TADS' 
order by nome_alu asc; 




--SELECIONE O NOME DO ALUNO QUE TEM A LETRA 'E' NO FINAL DO NOME
select nome_alu from alunos where nome_alu ilike '%e';

--SELECIONE O NOME DO ALUNO QUE TEM DANIEL OU JULIANA
select nome_alu 
from alunos 
where nome_alu ilike '%Daniel%' 
   or nome_alu ilike '%Juliana%';

--SELECIONE O NOME DOS ALUNOS QUE POSSUI A LETRA 'A' NO FINAL DO NOME
select nome_alu from alunos where nome_alu ilike '%a';

--SELECIONE O NOME DO CURSO QUE POSSUI O ALUNO CHAMADO DANIEL
select nome_cur from  cursos, alunos where nome_alu = 'Daniel'  and  cursos.id_cur = alunos.id_cur;
