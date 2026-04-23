CREATE TABLE cliente (
<<<<<<< HEAD
        cod_cli INT,
=======
        cod_cli INTEGER,
>>>>>>> dee6465f0aa2a419724a427fc0d5a1454721086a
        nome VARCHAR(40),
        cpf VARCHAR(11) unique,
        rua VARCHAR(30),
        num VARCHAR(10),
        bairro VARCHAR(30),
        cidade VARCHAR(35),
        uf VARCHAR(2),
        cep VARCHAR(8),
        Constraint pk_cliente primary key (cod_cli)
    );

CREATE TABLE passagem (
        num INTEGER,
        valor NUMERIC(5, 2) NOT NULL,
        poltrona INTEGER NOT NULL,
        data_compra DATE,
        tipo_cartao INTEGER,
        num_cartao VARCHAR(30) NOT NULL,
<<<<<<< HEAD
        cod_cli INTEGER,
        Constraint pk_passagem primary key (num),
=======
        cod cli INTEGER,
        Constraint pk passagem primary key (num),
>>>>>>> dee6465f0aa2a419724a427fc0d5a1454721086a
        Constraint fk_passagem_cli foreign key (cod_cli) 
        references cliente (cod_cli)
    );

CREATE TABLE rota (
<<<<<<< HEAD
    num_voo VARCHAR(30),
    rota VARCHAR(30) NOT NULL,
    num_passagem INTEGER,
    CONSTRAINT pk_rota PRIMARY KEY (num_voo),
    CONSTRAINT fk_rota_pass FOREIGN KEY (num_passagem) REFERENCES passagem (num)
);
=======
        num_voo VARCHAR(30),
        rota VARCHAR(30) NOT NULL,
        num_passagem INTEGER,
        Constraint pk_rota primary key (num_voo),
        Constraint fk_rota_pass foreign key (num_passagem) references passagem (num)
    );
>>>>>>> dee6465f0aa2a419724a427fc0d5a1454721086a

-- Povoando Clientes
INSERT INTO cliente VALUES (1, 'EDUARDO SILVA', '11122233344', 'Rua Cecilia', '10', 'Centro', 'São Paulo', 'SP', '01010000');
INSERT INTO cliente VALUES (2, 'GABRIELA COSTA', '22233344455', 'Av. Paulista', '500', 'Bela Vista', 'São Paulo', 'SP', '01310000');
INSERT INTO cliente VALUES (3, 'MARCOS PEREIRA', '33344455566', 'Rua das Flores', '123', 'Alegre', 'Belo Horizonte', 'MG', '30123000');
INSERT INTO cliente VALUES (4, 'ANA SOUZA', '44455566677', 'Rua do Sol', '45', 'Leste', 'Manaus', 'AM', '69000000');
INSERT INTO cliente VALUES (5, 'EDUARDO SANTOS', '55566677788', 'Rua Cecilia', '20', 'Centro', 'São Paulo', 'SP', '01010000');

-- Povoando Passagens
INSERT INTO passagem VALUES (101, 250.00, 12, '2026-01-10', 1, '4444-5555', 1);
INSERT INTO passagem VALUES (102, 320.50, 05, '2026-01-12', 2, '5555-6666', 2);
INSERT INTO passagem VALUES (103, 150.00, 22, '2026-01-15', 1, '6666-7777', 3);
INSERT INTO passagem VALUES (104, 450.00, 01, '2026-01-20', 2, '7777-8888', 4);
INSERT INTO passagem VALUES (105, 200.00, 15, '2026-01-25', 1, '8888-9999', 5);

-- Povoando Rotas
INSERT INTO rota VALUES ('V100', 'São Paulo - Rio', 101);
INSERT INTO rota VALUES ('V200', 'São Paulo - Curitiba', 102);
INSERT INTO rota VALUES ('V300', 'BH - São Paulo', 103);
INSERT INTO rota VALUES ('V400', 'Manaus - Belém', 104);
INSERT INTO rota VALUES ('V500', 'Rio - Salvador', 105);

--1
SELECT cod_cli FROM cliente WHERE nome LIKE '%EDUARDO%';

--2
SELECT * FROM cliente WHERE cod_cli >= 2;

--3
SELECT num_voo FROM rota WHERE rota LIKE '%São Paulo%';

--4
SELECT * FROM cliente WHERE uf = 'SP' OR rua = 'Rua Cecilia';

--5
SELECT cod_cli, nome FROM cliente ORDER BY nome ASC;

--6
<<<<<<< HEAD
SELECT cod_cli, nome FROM cliente ORDER BY cod_cli DESC;

--7
SELECT * FROM cliente WHERE uf = 'SP' ORDER BY uf ASC, nome DESC;
=======
SELECT cod_cli, nome FROM cliente ORDER BY cod_cli DESC

--7
SELECT * FROM cliente WHERE uf <> 'SP' ORDER BY uf ASC, nome DESC;
>>>>>>> dee6465f0aa2a419724a427fc0d5a1454721086a

--8
SELECT nome FROM cliente WHERE cod_cli BETWEEN 2 AND 5;

--9
SELECT nome FROM cliente WHERE nome LIKE '%E%';

--10
SELECT nome FROM cliente WHERE nome NOT LIKE 'G%';

--11
<<<<<<< HEAD
SELECT uf FROM cliente WHERE uf LIKE 'M%';


--12 Seleção com junção 

SELECT c.nome, p.num, p.poltrona
FROM cliente c, passagem p
WHERE c.cod_cli = p.cod_cli -- integridade referencial
ORDER BY c.nome, p.num;


--13 Verificando passagem e rota

SELECT c.nome, p.num, p.poltrona, r.num_voo
FROM   cliente c, passagem p, rota r
WHERE  c.cod_cli = p.cod_cli and p.num = r.num_passagem; --integridade referencial


--14
SELECT p.num, p.poltrona, r.num_voo
FROM   cliente c, passagem p, rota r
WHERE  c.cod_cli = p.cod_cli 
and p.num = r.num_passagem
and c.nome = 'ANA SOUZA'; --integridade referencial


--15

SELECT p.num, p.poltrona, r.num_voo
FROM   cliente c, passagem p, rota r
WHERE  c.cod_cli = p.cod_cli 
and p.num = r.num_passagem
and c.nome = 'ANA SOUZA'
and p.valor > 150 ;



=======
SELECT uf FROM cliente WHERE uf LIKE 'M%';
>>>>>>> dee6465f0aa2a419724a427fc0d5a1454721086a
