DROP SCHEMA IF EXISTS VelozCar;
CREATE SCHEMA VelozCar; 
USE VelozCar;


-- ===============================================================================
-- TABELAS
-- ===============================================================================


CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    estado VARCHAR(50),
    numero_cnh VARCHAR(20),
    data_cadastro DATE
);



CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_nascimento DATE,
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);



CREATE TABLE Veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100),
    marca VARCHAR(50),
    cor VARCHAR(30),
    ano INT,
    quilometragem INT,
    status VARCHAR(20),
    valor_diaria DECIMAL(10,2)
);



CREATE TABLE Contrato_Aluguel (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_funcionario INT,
    id_veiculo INT,
    data_inicio DATE,
    data_fim DATE,
    valor_total DECIMAL(10,2),
    status VARCHAR(20),
    tipo_seguro VARCHAR(50),

    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);



CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_contrato INT,
    valor_total DECIMAL(10,2),
    data_pagamento DATE,
    data_vencimento DATE,
    data_confirmacao DATE,
    forma_pagamento VARCHAR(20),
    status VARCHAR(20),

    FOREIGN KEY (id_contrato) REFERENCES Contrato_Aluguel(id_contrato)
);



CREATE TABLE Manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT,
    descricao_servico VARCHAR(200),
    custo DECIMAL(10,2),
    status VARCHAR(20),
    responsavel VARCHAR(100),
    data_inicio DATE,
    data_fim DATE,

    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);




-- ===============================================================================
-- INSERTS
-- ===============================================================================

INSERT INTO Cliente (nome, cpf, telefone, email, estado, numero_cnh, data_cadastro) VALUES
('Ana Silva', '123.456.789-00', '83999990001', 'ana@email.com', 'PB', 'CNH12345', '2024-01-10'),
('Bruno Costa', '123.456.789-01', '83999990002', 'bruno@email.com', 'PB', 'CNH12346', '2024-01-11'),
('Carlos Souza', '123.456.789-02', '83999990003', 'carlos@email.com', 'PE', 'CNH12347', '2024-01-12'),
('Daniel Lima', '123.456.789-03', '83999990004', 'daniel@email.com', 'RN', 'CNH12348', '2024-01-13'),
('Eduardo Alves', '123.456.789-04', '83999990005', 'edu@email.com', 'PB', 'CNH12349', '2024-01-14'),
('Fernanda Rocha', '123.456.789-05', '83999990006', 'fernanda@email.com', 'CE', 'CNH12350', '2024-01-15'),
('Gabriel Martins', '123.456.789-06', '83999990007', 'gabriel@email.com', 'PB', 'CNH12351', '2024-01-16'),
('Helena Dias', '123.456.789-07', '83999990008', 'helena@email.com', 'PE', 'CNH12352', '2024-01-17'),
('Igor Ribeiro', '123.456.789-08', '83999990009', 'igor@email.com', 'RN', 'CNH12353', '2024-01-18'),
('Juliana Freitas', '123.456.789-09', '83999990010', 'juliana@email.com', 'PB', 'CNH12354', '2024-01-19');


INSERT INTO Funcionario (nome, cpf, email, telefone, data_nascimento, cargo, salario) VALUES
('Marcos Lima', '111.111.111-01', 'marcos@email.com', '83988880001', '1990-05-10', 'Atendente', 2500.00),
('Paula Souza', '111.111.111-02', 'paula@email.com', '83988880002', '1992-08-15', 'Gerente', 5000.00),
('Ricardo Alves', '111.111.111-03', 'ricardo@email.com', '83988880003', '1988-03-20', 'Atendente', 2600.00),
('Sandra Costa', '111.111.111-04', 'sandra@email.com', '83988880004', '1995-07-12', 'Financeiro', 3000.00),
('Thiago Rocha', '111.111.111-05', 'thiago@email.com', '83988880005', '1993-09-01', 'Atendente', 2400.00),
('Vanessa Martins', '111.111.111-06', 'vanessa@email.com', '83988880006', '1991-11-11', 'Gerente', 5200.00),
('Wesley Dias', '111.111.111-07', 'wesley@email.com', '83988880007', '1987-06-18', 'Financeiro', 3100.00),
('Xavier Ribeiro', '111.111.111-08', 'xavier@email.com', '83988880008', '1994-02-22', 'Atendente', 2550.00),
('Yasmin Freitas', '111.111.111-09', 'yasmin@email.com', '83988880009', '1996-04-30', 'Atendente', 2450.00),
('Zeca Silva', '111.111.111-10', 'zeca@email.com', '83988880010', '1985-12-05', 'Gerente', 5500.00);


INSERT INTO Veiculo (modelo, marca, cor, ano, quilometragem, status, valor_diaria) VALUES
('Onix', 'Chevrolet', 'Prata', 2022, 15000, 'Disponível', 120.00),
('HB20', 'Hyundai', 'Branco', 2021, 20000, 'Disponível', 110.00),
('Gol', 'Volkswagen', 'Preto', 2020, 30000, 'Alugado', 100.00),
('Corolla', 'Toyota', 'Cinza', 2023, 10000, 'Disponível', 200.00),
('Civic', 'Honda', 'Preto', 2022, 12000, 'Manutenção', 190.00),
('Argo', 'Fiat', 'Vermelho', 2021, 25000, 'Disponível', 105.00),
('Kwid', 'Renault', 'Branco', 2020, 40000, 'Disponível', 90.00),
('Tracker', 'Chevrolet', 'Azul', 2023, 8000, 'Disponível', 180.00),
('Compass', 'Jeep', 'Preto', 2022, 15000, 'Alugado', 220.00),
('Toro', 'Fiat', 'Cinza', 2021, 30000, 'Disponível', 210.00);


INSERT INTO Contrato_Aluguel (id_cliente, id_funcionario, id_veiculo, data_inicio, data_fim, valor_total, status, tipo_seguro) VALUES
(1, 1, 3, '2024-02-01', '2024-02-05', 500.00, 'Finalizado', 'Básico'),
(2, 2, 9, '2024-02-02', '2024-02-06', 800.00, 'Ativo', 'Completo'),
(3, 3, 1, '2024-02-03', '2024-02-04', 120.00, 'Finalizado', 'Básico'),
(4, 1, 2, '2024-02-04', '2024-02-07', 330.00, 'Finalizado', 'Completo'),
(5, 2, 4, '2024-02-05', '2024-02-10', 1000.00, 'Ativo', 'Completo'),
(6, 3, 6, '2024-02-06', '2024-02-08', 210.00, 'Finalizado', 'Básico'),
(7, 4, 7, '2024-02-07', '2024-02-09', 180.00, 'Finalizado', 'Básico'),
(8, 5, 8, '2024-02-08', '2024-02-12', 720.00, 'Ativo', 'Completo'),
(9, 6, 10, '2024-02-09', '2024-02-13', 840.00, 'Ativo', 'Completo'),
(10, 7, 1, '2024-02-10', '2024-02-11', 120.00, 'Finalizado', 'Básico');



INSERT INTO Pagamento (id_contrato, valor_total, data_pagamento, data_vencimento, data_confirmacao, forma_pagamento, status) VALUES
(1, 500.00, '2024-02-01', '2024-02-05', '2024-02-01', 'Pix', 'Pago'),
(2, 800.00, '2024-02-02', '2024-02-06', NULL, 'Cartão', 'Pendente'),
(3, 120.00, '2024-02-03', '2024-02-04', '2024-02-03', 'Dinheiro', 'Pago'),
(4, 330.00, '2024-02-04', '2024-02-07', '2024-02-04', 'Pix', 'Pago'),
(5, 1000.00, '2024-02-05', '2024-02-10', NULL, 'Cartão', 'Pendente'),
(6, 210.00, '2024-02-06', '2024-02-08', '2024-02-06', 'Pix', 'Pago'),
(7, 180.00, '2024-02-07', '2024-02-09', '2024-02-07', 'Dinheiro', 'Pago'),
(8, 720.00, '2024-02-08', '2024-02-12', NULL, 'Cartão', 'Pendente'),
(9, 840.00, '2024-02-09', '2024-02-13', NULL, 'Pix', 'Pendente'),
(10, 120.00, '2024-02-10', '2024-02-11', '2024-02-10', 'Dinheiro', 'Pago');


INSERT INTO Manutencao (id_veiculo, descricao_servico, custo, status, responsavel, data_inicio, data_fim) VALUES
(5, 'Troca de óleo', 200.00, 'Concluído', 'Oficina A', '2024-01-10', '2024-01-11'),
(3, 'Revisão geral', 500.00, 'Concluído', 'Oficina B', '2024-01-12', '2024-01-14'),
(2, 'Alinhamento', 150.00, 'Concluído', 'Oficina A', '2024-01-15', '2024-01-15'),
(4, 'Troca de pneus', 800.00, 'Concluído', 'Oficina C', '2024-01-16', '2024-01-18'),
(1, 'Revisão elétrica', 300.00, 'Concluído', 'Oficina B', '2024-01-19', '2024-01-20'),
(6, 'Freios', 400.00, 'Concluído', 'Oficina A', '2024-01-21', '2024-01-22'),
(7, 'Suspensão', 350.00, 'Concluído', 'Oficina C', '2024-01-23', '2024-01-24'),
(8, 'Motor', 1000.00, 'Concluído', 'Oficina B', '2024-01-25', '2024-01-28'),
(9, 'Revisão', 250.00, 'Concluído', 'Oficina A', '2024-01-29', '2024-01-30'),
(10, 'Troca de óleo', 200.00, 'Concluído', 'Oficina C', '2024-02-01', '2024-02-02');




-- ===============================================================================
-- UPDATES
-- ===============================================================================

UPDATE Cliente
SET telefone = '83999991111'
WHERE id_cliente = 1;


UPDATE Pagamento
SET status = 'Pago', data_confirmacao = '2024-02-03'
WHERE id_pagamento = 2;





-- ===============================================================================
-- 2 CONSULTAS DE AGREGAÇÃO POR TABELA
-- ===============================================================================

-- ++++++++++++++++++++++
-- TABELA CLIENTE

SELECT estado, COUNT(*) AS total_clientes
FROM Cliente
GROUP BY estado;

SELECT data_cadastro, COUNT(*) AS total_por_dia
FROM Cliente
GROUP BY data_cadastro;

-- ++++++++++++++++++++++
-- TABELA FUNCIONARIO

SELECT cargo, AVG(salario) AS media_salarial
FROM Funcionario
GROUP BY cargo;

SELECT cargo, COUNT(*) AS total_funcionarios
FROM Funcionario
GROUP BY cargo;

-- ++++++++++++++++++++++
-- TABELA VEICULO

SELECT status, AVG(valor_diaria) AS media_valor
FROM Veiculo
GROUP BY status;

SELECT marca, COUNT(*) AS total_veiculos
FROM Veiculo
GROUP BY marca;

-- ++++++++++++++++++++++
-- TABELA CONTRATO_ALUGUEL

SELECT status, SUM(valor_total) AS total_faturado
FROM Contrato_Aluguel
GROUP BY status;


SELECT tipo_seguro, COUNT(*) AS total_contratos
FROM Contrato_Aluguel
GROUP BY tipo_seguro;

-- ++++++++++++++++++++++
-- TABELA PAGAMENTO

SELECT forma_pagamento, SUM(valor_total) AS total_recebido
FROM Pagamento
GROUP BY forma_pagamento;

SELECT status, COUNT(*) AS total_pagamentos
FROM Pagamento
GROUP BY status;

-- ++++++++++++++++++++++
-- TABELA MANUTENÇÃO

SELECT responsavel, SUM(custo) AS custo_total
FROM Manutencao
GROUP BY responsavel;

SELECT status, AVG(custo) AS media_custo
FROM Manutencao
GROUP BY status;



-- ===============================================================================
-- JOINs
-- ===============================================================================

SELECT c.nome, ca.id_contrato, ca.valor_total
FROM Contrato_Aluguel ca
INNER JOIN Cliente c ON ca.id_cliente = c.id_cliente;

SELECT v.modelo, m.descricao_servico
FROM Veiculo v
LEFT JOIN Manutencao m ON v.id_veiculo = m.id_veiculo;

SELECT p.id_pagamento, ca.id_contrato, p.valor_total
FROM Contrato_Aluguel ca
RIGHT JOIN Pagamento p ON ca.id_contrato = p.id_contrato;


