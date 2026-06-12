CREATE SCHEMA EX6_2
GO

CREATE TABLE EX6_2.Paciente
(
	Num_Utente		INT				NOT NULL,
	Nome			NVARCHAR(100)	NOT NULL,
	Endereco		NVARCHAR(200),
	Data_nascimento	DATE,
	CONSTRAINT PK_Paciente PRIMARY KEY (Num_Utente)
);
GO

CREATE TABLE EX6_2.Medico
(
	Num_Id_Sns		INT				NOT NULL,
	Nome			NVARCHAR(100)	NOT NULL,
	Especialidade	NVARCHAR(50),
	CONSTRAINT PK_Medico PRIMARY KEY (Num_Id_Sns)
);
GO

CREATE TABLE EX6_2.Farmacia
(
	NIF				NUMERIC(9,0)	NOT NULL,
	Nome			NVARCHAR(100)	NOT NULL,
	Endereco		NVARCHAR(200),
	Telefone		VARCHAR(20),
	CONSTRAINT PK_Farmacia PRIMARY KEY (NIF)
);
GO

CREATE TABLE EX6_2.Farmaceutica
(
	Num_Registo		INT				NOT NULL,
	Nome			NVARCHAR(100)	NOT NULL,
	Endereco		NVARCHAR(200),
	Telefone		VARCHAR(20),
	CONSTRAINT PK_Farmaceutica PRIMARY KEY (Num_Registo)
);
GO

CREATE TABLE EX6_2.Farmaco
(
	Formula			VARCHAR(100)	NOT NULL,
	Nome			NVARCHAR(100)	NOT NULL,
	Num_Registo		INT				NOT NULL,
	CONSTRAINT PK_Farmaco PRIMARY KEY (Formula),
	CONSTRAINT FK_Farmaco_Farmaceutica FOREIGN KEY (Num_Registo)
		REFERENCES EX6_2.Farmaceutica(Num_Registo),
	CONSTRAINT UC_Farmaco_Nome UNIQUE (Nome, Num_Registo)
);
GO

CREATE TABLE EX6_2.Prescricao
(
	Num_Prescricao	INT				NOT NULL,
	Data			DATE			NOT NULL,
	Num_Utente		INT				NOT NULL,
	Num_Id_Sns		INT				NOT NULL,
	Nif_Farmacia	NUMERIC(9,0),
	CONSTRAINT PK_Prescricao PRIMARY KEY (Num_Prescricao),
	CONSTRAINT FK_Prescricao_Paciente FOREIGN KEY (Num_Utente)
		REFERENCES EX6_2.Paciente(Num_Utente),
	CONSTRAINT FK_Prescricao_Medico FOREIGN KEY (Num_Id_Sns)
		REFERENCES EX6_2.Medico(Num_Id_Sns),
	CONSTRAINT FK_Prescricao_Farmacia FOREIGN KEY (Nif_Farmacia)
		REFERENCES EX6_2.Farmacia(NIF)
);
GO

CREATE TABLE EX6_2.Contem
(
	Num_Prescricao	INT				NOT NULL,
	Formula			VARCHAR(100)	NOT NULL,
	CONSTRAINT PK_Contem PRIMARY KEY (Num_Prescricao, Formula),
	CONSTRAINT FK_Contem_Prescricao FOREIGN KEY (Num_Prescricao)
		REFERENCES EX6_2.Prescricao(Num_Prescricao),
	CONSTRAINT FK_Contem_Farmaco FOREIGN KEY (Formula)
		REFERENCES EX6_2.Farmaco(Formula)
);
GO

CREATE TABLE EX6_2.Vende
(
	NIF				NUMERIC(9,0)	NOT NULL,
	Formula			VARCHAR(100)	NOT NULL,
	CONSTRAINT PK_Vende PRIMARY KEY (NIF, Formula),
	CONSTRAINT FK_Vende_Farmacia FOREIGN KEY (NIF)
		REFERENCES EX6_2.Farmacia(NIF),
	CONSTRAINT FK_Vende_Farmaco FOREIGN KEY (Formula)
		REFERENCES EX6_2.Farmaco(Formula)
);
GO