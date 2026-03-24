
CREATE DATABASE aula_aula03b;


CREATE TABLE aluno (
    rgm NUMERIC(5),
    nome VARCHAR(100),
    endereco VARCHAR(150),
    telefone VARCHAR(20)
);

CREATE TABLE disciplina (
    codigo NUMERIC(5),
    nome VARCHAR(100),
    ementa VARCHAR(200)
);

CREATE TABLE aluno_disciplina (
    cod_aluno NUMERIC(5),
    cod_disciplina NUMERIC(5),
    nota1 NUMERIC(4,2),
    nota2 NUMERIC(4,2),
    media NUMERIC(4,2),
    faltas INTEGER
);

-- Criar PRIMARY KEYS
ALTER TABLE aluno ADD CONSTRAINT pk_aluno PRIMARY KEY (rgm);
ALTER TABLE disciplina ADD CONSTRAINT pk_disciplina PRIMARY KEY (codigo);

-- Criar FOREIGN KEYS
ALTER TABLE aluno_disciplina
ADD CONSTRAINT fk_aluno
FOREIGN KEY (cod_aluno) REFERENCES aluno(rgm);

ALTER TABLE aluno_disciplina
ADD CONSTRAINT fk_disciplina
FOREIGN KEY (cod_disciplina) REFERENCES disciplina(codigo);


ALTER TABLE aluno ADD COLUMN rg VARCHAR(20);
ALTER TABLE aluno ADD COLUMN cpf VARCHAR(14);


ALTER TABLE aluno ALTER COLUMN cpf SET NOT NULL;
ALTER TABLE aluno ADD CONSTRAINT unique_cpf UNIQUE (cpf);


ALTER TABLE aluno_disciplina DROP COLUMN faltas;


ALTER TABLE aluno_disciplina RENAME TO notas;


ALTER TABLE notas ALTER COLUMN media SET NOT NULL;

ALTER TABLE aluno RENAME TO alunos;


ALTER TABLE notas DROP CONSTRAINT fk_aluno;
ALTER TABLE alunos DROP CONSTRAINT pk_aluno;

ALTER TABLE alunos DROP COLUMN rgm;



ALTER TABLE notas DROP CONSTRAINT fk_disciplina;
DROP TABLE disciplina;

DROP TABLE notas;
DROP TABLE alunos;