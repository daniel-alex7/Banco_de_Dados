CREATE DATABASE db_livraria
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
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(15),
    endereco_entrega VARCHAR(255),
    tem_dividas BOOLEAN DEFAULT FALSE )

-- 2. Tabela de Editoras
CREATE TABLE EDITORA (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_fantasia VARCHAR(100) NOT NULL,
    contato_email VARCHAR(100),
    site_internet VARCHAR(100)
);


CREATE TABLE LIVRO (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100),
    preco_venda DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT DEFAULT 0,
    id_editora INT,
    FOREIGN KEY (id_editora) REFERENCES EDITORA(id_editora)
);


CREATE TABLE PEDIDO_CLIENTE (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_pedido ENUM('Pendente', 'Em Analise', 'Aceito', 'Rejeitado', 'Enviado', 'Descartado') DEFAULT 'Pendente',
    numero_nota_fiscal VARCHAR(50),
    id_cliente INT NOT NULL,
    decisao_gerente TEXT, 
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);


CREATE TABLE ITENS_PEDIDO (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_livro INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario_no_momento DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO_CLIENTE(id_pedido),
    FOREIGN KEY (id_livro) REFERENCES LIVRO(id_livro)
);

-- 6. Tabela de Registro de Faltas no Estoque
-- "Os casos de falta de livro no estoque serão registrados pelo sistema"
CREATE TABLE REGISTRO_FALTA_ESTOQUE (
    id_falta INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    id_pedido_origem INT,
    data_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    processado_pelo_gerente BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_livro) REFERENCES LIVRO(id_livro),
    FOREIGN KEY (id_pedido_origem) REFERENCES PEDIDO_CLIENTE(id_pedido)
);


CREATE TABLE PEDIDO_AQUISICAO_EDITORA (
    id_aquisicao INT PRIMARY KEY AUTO_INCREMENT,
    id_editora INT NOT NULL,
    data_envio_internet DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_chegada ENUM('Aguardando', 'Recebido') DEFAULT 'Aguardando',
    FOREIGN KEY (id_editora) REFERENCES EDITORA(id_editora)
);
