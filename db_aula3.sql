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

-- criação de tabelas sem restrições

Create table paciente
(
	id_pac int,
	nome_pac varchar(100),
	tel_pac numeric(10),
	data_nasc date
);

Create table medico
(
	id_med int,
	nome_med varchar(100),
	especialidade_med varchar(100)
);

Create table consulta
(
	id_cons int,
	data_cons date,
	valor_cons numeric(7,2),
	id_med int
);

-- criar as alterações
-- criar restrições primary ley e foreing key

Alter table paciente ADD constraint pk_id_pac primary key (id_pac); 

--campos nulos ou obrigatórios
Alter table paciente alter column nome_pac set not null; 


--primary table medico
Alter table medico add constraint pk_id_med primary key (id_med);

--foreign key na tabela 

Alter table consulta add constraint fk_id_med foreign key (id_med) 
references medico (id_med);		

Alter table consulta add column id_pac int;

Alter table consulta add constraint fk_id_pac foreign key (id_pac) 
references paciente (id_pac);


--renomear nome da tabela paciente para pacientes

Alter table paciente rename to pacientes;



