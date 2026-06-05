INSERT INTO EX6_2.Paciente (Num_Utente, Nome, Endereco, Data_nascimento) VALUES 
(1, 'João Silva', 'Rua Direita, 123, Aveiro', '1985-04-12'),
(2, 'Maria Santos', 'Avenida Central, 45, Porto', '1990-11-23'),
(3, 'Rui Costa', 'Bairro Alto, Lisboa', '1975-08-30'),
(4, 'Ana Rita', 'Rua dos Aliados, Porto', '2000-01-05');

INSERT INTO EX6_2.Medico (Num_Id_Sns, Nome, Especialidade) VALUES 
(101, 'Dr. António Costa', 'Cardiologia'),
(102, 'Dra. Beatriz Almeida', 'Medicina Geral'),
(103, 'Dr. Carlos Mendes', 'Pediatria');

INSERT INTO EX6_2.Farmacia (NIF, Nome, Endereco, Telefone) VALUES 
(500111222, 'Farmácia Central', 'Praça do Município, Aveiro', '234111222'),
(500333444, 'Farmácia Esperança', 'Rua da Estação, Porto', '222333444');

INSERT INTO EX6_2.Farmaceutica (Num_Registo, Nome, Endereco, Telefone) VALUES 
(901, 'PharmaCorp', 'Lisboa', '210000000'),
(906, 'MedLife', 'Coimbra', '239000000'),
(999, 'SaúdePlus', 'Braga', '253000000');

INSERT INTO EX6_2.Farmaco (Formula, Nome, Num_Registo) VALUES 
('F001', 'Paracetamol 500mg', 901),
('F002', 'Ibuprofeno 400mg', 901),
('F003', 'Aspirina', 906),
('F004', 'Ben-u-ron Xarope', 906),
('F005', 'Brufen', 999);

INSERT INTO EX6_2.Prescricao (Num_Prescricao, Data, Num_Utente, Num_Id_Sns, Nif_Farmacia) VALUES 
(1001, '2024-10-01', 1, 102, 500111222),
(1002, '2024-10-05', 2, 101, NULL),
(1003, '2024-10-10', 1, 103, 500333444),
(1004, '2024-10-15', 3, 102, 500111222);

INSERT INTO EX6_2.Contem (Num_Prescricao, Formula) VALUES 
(1001, 'F001'),
(1001, 'F002'),
(1002, 'F003'),
(1003, 'F004'),
(1004, 'F005');

INSERT INTO EX6_2.Vende (NIF, Formula) VALUES 
(500111222, 'F001'),
(500111222, 'F002'),
(500111222, 'F005'),
(500333444, 'F003'),
(500333444, 'F004');
GO