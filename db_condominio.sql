CREATE DATABASE db_condominio
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = FALSE;


CREATE TABLE Edificio (
    id SERIAL PRIMARY KEY,
    endereco VARCHAR(250) NOT NULL
);


CREATE TABLE Apto (
    id SERIAL PRIMARY KEY,
    numero INTEGER NOT NULL,
    area NUMERIC(10,2),
    id_edi INTEGER,
    CONSTRAINT fk_edificio
        FOREIGN KEY (id_edi) 
        REFERENCES Edificio(id)
        ON DELETE CASCADE
);

INSERT INTO Edificio (endereco) VALUES 
('Rua das Flores, 123'),
('Avenida Central, 500'),
('Alameda dos Anjos, 88');


INSERT INTO Apto (numero, area, id_edi) VALUES 
(101, 55.50, 1),
(202, 110.00, 2),
(305, 45.00, 3);

DELETE FROM Apto;

DELETE FROM Edificio WHERE id = 1;