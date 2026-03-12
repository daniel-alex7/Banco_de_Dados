-- Database: db_studio

-- DROP DATABASE IF EXISTS db_studio;

CREATE DATABASE db_studio
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


Create table artistas
(
   id_art int not null,
   nome_art varchar(50) not null,
   telefone_art numeric(9),
   email_art varchar(50),
   cpf_art numeric(11),
   constraint pk_id_art primary key (id_art),
   --restrição, nome da retrição, tipo, e campo/ coluna que vai receber.
   constraint uk_cpf_art unique (cpf_art)
);

--triagramacao = 3 letras do objeto pertecente

Create table genero 
(
	id_gen int not null,
	nome_gen varchar(50) not null,
	constraint pk_id_gen primary key (id_gen)
);

Create table gravacao
(
	id_gra int not null,
	id_art int,
	id_gen int,
	valor_gra numeric(7,2),
	constraint pk_id_gra primary key (id_gra),
	constraint fk_id_art foreign key (id_art) references artistas (id_art),
	constraint fk_id_gen foreign key (id_gen) references genero (id_gen)
	
);

--Inserção de dados

Insert into artistas values (100, 'Paulo', 119999999, 'paulo@gmail.com', 11122244455);
Insert into genero values (1000, 'Gospel');
Insert into gravacao values (1, 100, 1000, 100.99);


Insert into artistas values (101, 'Jose', 119999999, 'jose@gmail.com', 11122244477);
Insert into genero values (1001, 'RAP');
Insert into gravacao values (2, 101, 1001, 101.99);











