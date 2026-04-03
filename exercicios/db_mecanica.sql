CREATE DATABASE db_mecanica
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = FALSE;



CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(200)
);


CREATE TABLE VEICULO (
    placa CHAR(7) PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);


CREATE TABLE MECANICO (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

-- 4. Tabela de Catálogo (Serviços e Peças pré-definidos)
-- Conforme a descrição: "relação de serviços comumente realizados e relação de peças"
CREATE TABLE CATALOGO_ITENS (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    tipo ENUM('Serviço', 'Peça') NOT NULL
);

-- 5. Tabela de Orçamentos
-- Centraliza as informações do atendimento, prazos e status
CREATE TABLE ORCAMENTO (
    id_orcamento INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATETIME DEFAULT CURRENT_TIMESTAMP,
    prazo_estimado_dias INT,
    status ENUM('Pendente', 'Aprovado', 'Em Execução', 'Concluído', 'Pago') DEFAULT 'Pendente',
    comentarios TEXT,
    placa_veiculo CHAR(7) NOT NULL,
    id_mecanico INT NOT NULL,
    FOREIGN KEY (placa_veiculo) REFERENCES VEICULO(placa),
    FOREIGN KEY (id_mecanico) REFERENCES MECANICO(id_mecanico)
);

-- 6. Tabela de Itens do Orçamento (Relacionamento N:N entre Orçamento e Catálogo)
-- Permite que o mecânico adicione itens do catálogo ou insira novos livremente
CREATE TABLE ITENS_ORCAMENTO (
    id_item_orcamento INT PRIMARY KEY AUTO_INCREMENT,
    id_orcamento INT NOT NULL,
    id_item INT, 
    descricao_personalizada VARCHAR(100), 
    quantidade INT DEFAULT 1,
    valor_cobrado DECIMAL(10, 2) NOT NULL,
    aprovado_pelo_cliente BOOLEAN DEFAULT FALSE,
    execucao_concluida BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_orcamento) REFERENCES ORCAMENTO(id_orcamento),
    FOREIGN KEY (id_item) REFERENCES CATALOGO_ITENS(id_item)
);

CREATE TABLE PAGAMENTO (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_orcamento INT UNIQUE NOT NULL,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2) NOT NULL,
    metodo_pagamento VARCHAR(30),
    FOREIGN KEY (id_orcamento) REFERENCES ORCAMENTO(id_orcamento)
);