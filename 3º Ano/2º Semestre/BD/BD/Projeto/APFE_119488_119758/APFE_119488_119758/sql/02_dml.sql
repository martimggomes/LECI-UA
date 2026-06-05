USE p1g2;
GO

INSERT INTO Explicacao_Online.Utilizador (Id_Utilizador, Nome, Email, Senha, Data_Reg)
VALUES 
(1, 'Ricardo Miguel Silva', 'joao.silva@email.com', 'joaosilva123', '2025-09-01'),
(2, 'Maria Fernanda Costa', 'maria.costa@email.com', 'mariacosta456', '2025-08-15'),
(3, 'Ana Beatriz Pereira', 'ana.pereira@email.com', 'anapereira789', '2025-09-10'),
(4, 'Vicente Nogueira', 'carlos.n@email.com', 'carlosnabc', '2025-01-20'),
(5, 'Tiago Mendes', 'tiago.mendes@email.com', 'tiagomendes321', '2025-09-02'),
(6, 'Sofia Lima', 'sofia.lima@email.com', 'sofialima654', '2025-09-03');
GO

INSERT INTO Explicacao_Online.Instituicao (Id_Instituicao, Localizacao, Sigla, Nome)
VALUES 
(1, 'Campus Universitário de Santiago, Aveiro', 'UA', 'Universidade de Aveiro'),
(2, 'Avenida 25 de Abril, Aveiro', 'ESJE', 'Escola Secundária José Estêvão'),
(3, 'Rua da Misericórdia, Coimbra', 'IPC', 'Instituto Politécnico de Coimbra'),
(4, 'Paço das Escolas, Coimbra', 'UC', 'Universidade de Coimbra');
GO

INSERT INTO Explicacao_Online.Aluno (Id_Utilizador, Data_Nasc, Data_Ades, Id_Instituicao)
VALUES 
(1, '2001-05-14', '2025-09-02', 1),
(3, '2006-11-22', '2025-09-11', 2),
(5, '2000-03-10', '2025-09-04', 3),
(6, '1999-07-25', '2025-09-05', 4);
GO

INSERT INTO Explicacao_Online.Formador (Id_Utilizador, Especialidade, Biografia)
VALUES 
(2, 'Bases de Dados', 'Professora com 10 anos de experiência em SQL Server e Modelação.'),
(4, 'Dispositivos Conectados', 'Engenheiro interessado em Hardware.');
GO

INSERT INTO Explicacao_Online.Escola_sec (Id_Instituicao, Agrupamento) 
VALUES 
(2, 'Agrupamento de Escolas José Estêvão');
GO

INSERT INTO Explicacao_Online.Universidade (Id_Instituicao, Ranking) 
VALUES 
(1, 5),
(4, 6);
GO

INSERT INTO Explicacao_Online.Politecnico (Id_Instituicao, Area_Esp) 
VALUES 
(3, 'Engenharia e Gestão');
GO

INSERT INTO Explicacao_Online.Curso (Cod_Curso, Titulo, Descricao, Dificuldade, Id_Formador, Preco)
VALUES 
(1, 'Introdução ao SQL - DML e DDL', 'Aprenda a criar e gerir bases de dados relacionais.', 'Iniciante', 2, 29.99),
(2, 'Dispositivos Conectados', 'Aprenda a diferenciar barramentos master de barramentos slave', 'Avançado', 4, 49.50);
GO

INSERT INTO Explicacao_Online.Aula (Id_Aula, Duracao, Num_Aula, Titulo, Cod_Curso)
VALUES 
(1, 45, 3, 'O que é o SQL DDL?', 1),
(2, 60, 2, 'Comandos SELECT, INSERT e UPDATE', 1),
(3, 90, 6, 'Barramentos Master/Slave', 2);
GO

INSERT INTO Explicacao_Online.Recurso (Id_Recurso, Tipo, Nome_Arq, Tamanho, Id_Aula)
VALUES 
(1, 'PDF', 'slides_ddl.pdf', 5, 1),
(2, 'ZIP', 'exercicios_sql.zip', 15, 2),
(3, 'PDF', 'barramentos_master_slave.pdf', 15, 3);
GO

INSERT INTO Explicacao_Online.Inscrever (Id_Aluno, Cod_Curso, Data)
VALUES 
(1, 1, '2025-09-05'),
(3, 2, '2025-09-15'),
(5, 1, '2025-09-06'),
(6, 2, '2025-09-16');
GO

INSERT INTO Explicacao_Online.Pagamento (Id_Pagamento, Data, Valor, Estado, Cod_Curso, Id_Aluno, Metodo_Pag)
VALUES 
(1, '2025-09-05', 29.99, 'Concluído', 1, 1, 'MBWay'),
(2, '2025-09-15', 49.50, 'Pendente', 2, 3, 'Transferência'),
(3, '2025-09-06', 29.99, 'Concluído', 1, 5, 'Cartão de Crédito'),
(4, '2025-09-16', 49.50, 'Concluído', 2, 6, 'MBWay');
GO

INSERT INTO Explicacao_Online.Avaliacao (Id_Av, Data, Comentario, Nota, Cod_Curso, Id_Aluno)
VALUES 
(1, '2025-10-01', 'Excelente curso, os slides do DML foram muito úteis!', 5, 1, 1),
(3, '2025-10-05', 'Muito bom, mas achei a matéria um bocado densa.', 4, 1, 5),
(4, '2025-10-15', 'Adorei a explicação prática sobre barramentos!', 5, 2, 6);
GO
