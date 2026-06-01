CREATE SCHEMA EX4_1_5
GO

create table EX4_1_5.Pessoa
(
	End_Email		NVARCHAR(100),
	Nome			NVARCHAR(100),

	CONSTRAINT PK_Pessoa PRIMARY KEY (End_Email)
)

GO


create table EX4_1_5.Instituicao
(
	Endereco		NVARCHAR(200),
	Nome			NVARCHAR(100),

	CONSTRAINT PK_Instituicao PRIMARY KEY (Endereco)
)
GO

Create table EX4_1_5.Autor
(
	End_Email		NVARCHAR(100),
	End_Instituicao NVARCHAR(200),

	CONSTRAINT PK_Autor PRIMARY KEY (End_Email, End_Instituicao),
	CONSTRAINT FK_Autor_Pessoa FOREIGN KEY (End_Email) REFERENCES EX4_1_5.Pessoa(End_Email),
	CONSTRAINT FK_Autor_Instituicao FOREIGN KEY (End_Instituicao) REFERENCES EX4_1_5.Instituicao(Endereco)
)

GO
Create table EX4_1_5.Artigo_Cientifico
(
	Num_Reg			INT,
	Titulo			NVARCHAR(200),

	CONSTRAINT PK_Artigo PRIMARY KEY (Num_Reg)
)
GO

Create table  EX4_1_5.Participante
(
	End_Email		NVARCHAR(100),
	End_Inst		NVARCHAR(200),
	Morada			NVARCHAR(200),
	Data_Insc		DATE,

	CONSTRAINT PK_Participante PRIMARY KEY (End_Email),
	CONSTRAINT FK_Participante_Pessoa FOREIGN KEY (End_Email) REFERENCES EX4_1_5.Pessoa(End_Email),
	CONSTRAINT FK_Participante_Instituicao FOREIGN KEY (End_Inst) REFERENCES EX4_1_5.Instituicao(Endereco)
)
GO

Create table EX4_1_5.Estudante
(
	End_Email		NVARCHAR(100),
	Loc_Compr		NVARCHAR(100),

	CONSTRAINT PK_Estudante PRIMARY KEY (End_Email),
	CONSTRAINT FK_Estudante_Participante FOREIGN KEY (End_Email) REFERENCES EX4_1_5.Participante(End_Email)
)
GO

Create table EX4_1_5.Nao_Estudante
(
	End_Email		NVARCHAR(100),
	Ref_Trans		NVARCHAR(100),

	CONSTRAINT PK_Nao_Estudante PRIMARY KEY (End_Email),
	CONSTRAINT FK_Nao_Estudante_Participante FOREIGN KEY (End_Email) REFERENCES EX4_1_5.Participante(End_Email)
)
GO

CREATE TABLE EX4_1_5.Possui
(
	Num_Registo		INT,
	End_Email		NVARCHAR(100),
	End_Instituicao NVARCHAR(200),

	CONSTRAINT PK_Possui PRIMARY KEY (Num_Registo, End_Email,End_Instituicao),

	CONSTRAINT FK_Possui_Artigo_Cientifico FOREIGN KEY (Num_Registo) REFERENCES EX4_1_5.Artigo_Cientifico(Num_Reg),
	CONSTRAINT FK_Possui_Autor FOREIGN KEY (End_Email,End_Instituicao) REFERENCES EX4_1_5.Autor(End_Email,End_Instituicao)
)
