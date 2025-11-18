-- Banco de Dados da Lan House TechZada (MySQL)

CREATE DATABASE IF NOT EXISTS techzada;
USE techzada;

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(120),
    telefone VARCHAR(20)
);

-- Tabela de serviços
CREATE TABLE IF NOT EXISTS servicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    preco DECIMAL(8,2) NOT NULL
);

-- Tabela de atendimentos
CREATE TABLE IF NOT EXISTS atendimentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    servico_id INT NOT NULL,
    data_atendimento DATETIME NOT NULL,
    tecnico_responsavel VARCHAR(80),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (servico_id) REFERENCES servicos(id)
);

-- Inserindo clientes
INSERT INTO clientes (nome, email, telefone)
VALUES
    ('Carlos Henrique', 'carlos@gmail.com', '81999990000'),
    ('Juliana Araújo', 'juliana@hotmail.com', '81988887777'),
    ('Pedro Tavares', 'pedro@gmail.com', '81991112222');

-- Inserindo serviços
INSERT INTO servicos (nome, preco)
VALUES
    ('Acesso ao computador (1h)', 6.00),
    ('Impressão P&B', 1.00),
    ('Impressão Colorida', 2.00),
    ('Xerox', 0.50),
    ('Suporte Técnico Básico', 15.00),
    ('Suporte Full-Stack', 40.00),
    ('Instalação de Software', 25.00),
    ('Digitalização de documento', 3.00);

-- Inserindo atendimentos
INSERT INTO atendimentos (cliente_id, servico_id, data_atendimento, tecnico_responsavel)
VALUES
    (1, 1, '2025-01-10 14:20:00', 'Rafael (Full-Stack)'),
    (2, 4, '2025-01-10 15:10:00', 'Lucas (Atendente)'),
    (3, 6, '2025-01-11 10:30:00', 'Marcos (Full-Stack)');

-- Update exemplo
UPDATE servicos
SET preco = 7.00
WHERE nome = 'Acesso ao computador (1h)';

-- Delete exemplo
DELETE FROM servicos
WHERE nome LIKE '%Xerox%';
