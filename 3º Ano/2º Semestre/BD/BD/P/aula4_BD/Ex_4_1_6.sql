CREATE SCHEMA EX4_1_6;
GO

CREATE TABLE EX4_1_6.Pessoa (
	Nome			NVARCHAR(100)	NOT NULL,
	Cart_Cidadao	NUMERIC(9,0)	NOT NULL,
	Data_Nasc		DATE			NOT NULL,
	Morada			NVARCHAR(200),
	CONSTRAINT PK_Pessoa PRIMARY KEY (Cart_Cidadao)
);
GO

CREATE TABLE EX4_1_6.Atividade (
	Designaçao		NVARCHAR(100)	NOT NULL,
	Identificador	INT				NOT NULL,
	Custo			DECIMAL(10,2)	NOT NULL CHECK (Custo >= 0),
	CONSTRAINT PK_Atividade PRIMARY KEY (Identificador)
);
GO

CREATE TABLE EX4_1_6.Professor (
	Email			NVARCHAR(100),
	Cont_Tel		NUMERIC(9,0),
	Num_Func		INT,
	Cart_Cidadao	NUMERIC(9,0)	NOT NULL,
	CONSTRAINT PK_Professor PRIMARY KEY (Cart_Cidadao),
	CONSTRAINT FK_Prof_Pessoa FOREIGN KEY (Cart_Cidadao)
		REFERENCES EX4_1_6.Pessoa(Cart_Cidadao)
);
GO

CREATE TABLE EX4_1_6.Encarregado_Educacao (
	Email			NVARCHAR(100),
	Cont_Tel		NUMERIC(9,0),
	Cart_Cidadao	NUMERIC(9,0)	NOT NULL,
	CONSTRAINT PK_Encarregado_Educacao PRIMARY KEY (Cart_Cidadao),
	CONSTRAINT FK_Encarregado_Educacao_Pessoa FOREIGN KEY (Cart_Cidadao)
		REFERENCES EX4_1_6.Pessoa(Cart_Cidadao)
);
GO

CREATE TABLE EX4_1_6.Turma (
	Designacao		NVARCHAR(100)		NOT NULL,
	Ano_Let			INT,
	Identificador	INT					NOT NULL,
	Num_Max_Alu		INT,	
	Cart_Cidadao_Prof	NUMERIC(9,0)	NOT NULL,
	Classe			INT					CHECK (Classe BETWEEN 0 AND 4),
	CONSTRAINT PK_Turma PRIMARY KEY (Identificador),
	CONSTRAINT FK_Turma_Professor FOREIGN KEY (Cart_Cidadao_Prof)
		REFERENCES EX4_1_6.Professor(Cart_Cidadao)
);
GO

CREATE TABLE EX4_1_6.Aluno (
	Cart_Cidadao	NUMERIC(9,0)		NOT NULL,
	Id_Turma		INT					NOT NULL,
	Num_Cart_Cid_EE	NUMERIC(9,0)		NOT NULL,
	Relaçao_EE		NVARCHAR(20),
	CONSTRAINT PK_Aluno	PRIMARY KEY (Cart_Cidadao),
	CONSTRAINT FK_Aluno_Pessoa FOREIGN KEY (Cart_Cidadao)
		REFERENCES EX4_1_6.Pessoa(Cart_Cidadao),
	CONSTRAINT FK_Aluno_Turma FOREIGN KEY (Id_Turma)
		REFERENCES EX4_1_6.Turma(Identificador),
	CONSTRAINT FK_Aluno_Encarregado_Educacao FOREIGN KEY (Num_Cart_Cid_EE)
		REFERENCES EX4_1_6.Encarregado_Educacao(Cart_Cidadao)
);

CREATE TABLE EX4_1_6.Disponivel (
	Id_Turma		INT				NOT NULL,
	Id_Atividade	INT				NOT NULL,
	CONSTRAINT PK_Disponivel PRIMARY KEY (Id_Turma, Id_Atividade),
	CONSTRAINT FK_Disponivel_Turma FOREIGN KEY (Id_Turma)
		REFERENCES EX4_1_6.Turma(Identificador),
	CONSTRAINT FK_Disponivel_Atividade FOREIGN KEY (Id_Atividade)
		REFERENCES EX4_1_6.Atividade(Identificador)
);
GO

CREATE TABLE EX4_1_6.Frequenta (
	Cart_Cidadao_Aluno	NUMERIC(9,0)	NOT NULL,
	Id_Atividade		INT				NOT NULL,
	CONSTRAINT PK_Frequenta PRIMARY KEY (Cart_Cidadao_Aluno, Id_Atividade),
	CONSTRAINT FK_Frequenta_Aluno FOREIGN KEY (Cart_Cidadao_Aluno) 
		REFERENCES EX4_1_6.Aluno(Cart_Cidadao),
    CONSTRAINT FK_Frequenta_Atividade FOREIGN KEY (Id_Atividade) 
		REFERENCES EX4_1_6.Atividade(Identificador)
);
GO

CREATE TABLE EX4_1_6.Levanta (
    Cart_Cidadao_Pessoa NUMERIC(9,0)    NOT NULL,
    Cart_Cidadao_Aluno  NUMERIC(9,0)    NOT NULL,
    Relação				NVARCHAR(50),
    CONSTRAINT PK_Levanta PRIMARY KEY (Cart_Cidadao_Pessoa, Cart_Cidadao_Aluno),
    CONSTRAINT FK_Levanta_Pessoa FOREIGN KEY (Cart_Cidadao_Pessoa) 
		REFERENCES EX4_1_6.Pessoa(Cart_Cidadao),
    CONSTRAINT FK_Levanta_Aluno FOREIGN KEY (Cart_Cidadao_Aluno) 
		REFERENCES EX4_1_6.Aluno(Cart_Cidadao)
);
GO