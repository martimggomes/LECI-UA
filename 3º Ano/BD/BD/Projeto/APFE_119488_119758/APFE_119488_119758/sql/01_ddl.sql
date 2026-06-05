USE p1g2;
GO

CREATE SCHEMA Explicacao_Online;
GO

CREATE TABLE Explicacao_Online.Utilizador (
	Id_Utilizador		INT				NOT NULL,
	Nome				NVARCHAR(100)	NOT NULL,
	Email				NVARCHAR(100)	NOT NULL,
	Senha				NVARCHAR(150)	NOT NULL,
	Data_Reg			DATE			NOT NULL,
	
	CONSTRAINT PK_Utilizador PRIMARY KEY (Id_Utilizador)
);
GO

CREATE TABLE Explicacao_Online.Instituicao (
	Id_Instituicao		INT				NOT NULL,
	Localizacao			NVARCHAR(255)	NOT NULL,
	Sigla				NVARCHAR(20)	,
	Nome				NVARCHAR(150)	NOT NULL,
	
	CONSTRAINT PK_Instituicao PRIMARY KEY (Id_Instituicao)
);
GO

CREATE TABLE Explicacao_Online.Aluno (
	Id_Utilizador		INT				NOT NULL,
	Data_Nasc			DATE			NOT NULL,
	Data_Ades			DATE			NOT NULL,
	Id_Instituicao		INT				NOT NULL, 
	
	CONSTRAINT PK_Aluno PRIMARY KEY (Id_Utilizador),
	CONSTRAINT FK_Aluno_Utilizador FOREIGN KEY (Id_Utilizador)
		REFERENCES Explicacao_Online.Utilizador(Id_Utilizador) ON DELETE CASCADE,
	CONSTRAINT FK_Aluno_Instituicao FOREIGN KEY (Id_Instituicao)
		REFERENCES Explicacao_Online.Instituicao(Id_Instituicao)
);
GO

CREATE TABLE Explicacao_Online.Formador (
	Id_Utilizador		INT				NOT NULL,
	Especialidade		NVARCHAR(100),
	Biografia			NVARCHAR(300),
	
	CONSTRAINT PK_Formador PRIMARY KEY (Id_Utilizador),
	CONSTRAINT FK_Formador_Utilizador FOREIGN KEY (Id_Utilizador)
		REFERENCES Explicacao_Online.Utilizador(Id_Utilizador) ON DELETE CASCADE
);
GO

CREATE TABLE Explicacao_Online.Escola_sec (
	Id_Instituicao	INT				NOT NULL,
	Agrupamento		NVARCHAR(100)	,
	
	CONSTRAINT PK_Escola_sec PRIMARY KEY (Id_Instituicao),
	CONSTRAINT FK_Escola_Instituicao FOREIGN KEY (Id_Instituicao)
		REFERENCES Explicacao_Online.Instituicao(Id_Instituicao) ON DELETE CASCADE
);
GO

CREATE TABLE Explicacao_Online.Universidade (
	Id_Instituicao	INT				NOT NULL,
	Ranking			INT				,
	
	CONSTRAINT PK_Universidade PRIMARY KEY (Id_Instituicao),
	CONSTRAINT FK_Univ_Instituicao FOREIGN KEY (Id_Instituicao)
		REFERENCES Explicacao_Online.Instituicao(Id_Instituicao) ON DELETE CASCADE
);
GO

CREATE TABLE Explicacao_Online.Politecnico (
	Id_Instituicao	INT				NOT NULL,
	Area_Esp		NVARCHAR(100)	,
	
	CONSTRAINT PK_Politecnico PRIMARY KEY (Id_Instituicao),
	CONSTRAINT FK_Poli_Instituicao FOREIGN KEY (Id_Instituicao)
		REFERENCES Explicacao_Online.Instituicao(Id_Instituicao) ON DELETE CASCADE
);
GO

CREATE TABLE Explicacao_Online.Curso (
	Cod_Curso		INT				NOT NULL,
	Titulo			NVARCHAR(150)	NOT NULL,
	Descricao		NVARCHAR(300)	,
	Dificuldade		NVARCHAR(50)	,
	Id_Formador		INT				NOT NULL,
	Preco			DECIMAL(10, 2)	NOT NULL,
	
	CONSTRAINT PK_Curso PRIMARY KEY (Cod_Curso),
	CONSTRAINT FK_Curso_Formador FOREIGN KEY (Id_Formador)
		REFERENCES Explicacao_Online.Formador(Id_Utilizador)
);
GO

CREATE TABLE Explicacao_Online.Aula (
	Id_Aula			INT				NOT NULL,
	Duracao			INT				,
	Num_Aula		INT				NOT NULL,
	Titulo			NVARCHAR(150)	NOT NULL,
	Cod_Curso		INT				NOT NULL,
	
	CONSTRAINT PK_Aula PRIMARY KEY (Id_Aula),
	CONSTRAINT FK_Aula_Curso FOREIGN KEY (Cod_Curso)
		REFERENCES Explicacao_Online.Curso(Cod_Curso) ON DELETE CASCADE
);
GO

CREATE TABLE Explicacao_Online.Recurso (
	Id_Recurso		INT				NOT NULL,
	Tipo			NVARCHAR(50)	,
	Nome_Arq		NVARCHAR(255)	NOT NULL,
	Tamanho			INT				,
	Id_Aula			INT				NOT NULL,
	
	CONSTRAINT PK_Recurso PRIMARY KEY (Id_Recurso),
	CONSTRAINT FK_Recurso_Aula FOREIGN KEY (Id_Aula)
		REFERENCES Explicacao_Online.Aula(Id_Aula) ON DELETE CASCADE
);
GO

CREATE TABLE Explicacao_Online.Inscrever (
	Id_Aluno		INT				NOT NULL,
	Cod_Curso		INT				NOT NULL,
	Data			DATE			NOT NULL,
	
	CONSTRAINT PK_Inscrever PRIMARY KEY (Id_Aluno, Cod_Curso),
	CONSTRAINT FK_Inscrever_Aluno FOREIGN KEY (Id_Aluno)
		REFERENCES Explicacao_Online.Aluno(Id_Utilizador) ON DELETE CASCADE,
	CONSTRAINT FK_Inscrever_Curso FOREIGN KEY (Cod_Curso)
		REFERENCES Explicacao_Online.Curso(Cod_Curso) ON DELETE CASCADE
);
GO

-- alteracoes
ALTER TABLE Explicacao_Online.Inscrever
DROP CONSTRAINT FK_Inscrever_Aluno;
ALTER TABLE Explicacao_Online.Inscrever
ADD CONSTRAINT FK_Inscrever_Utilizador 
FOREIGN KEY (Id_Aluno) REFERENCES Explicacao_Online.Utilizador(Id_Utilizador) 
ON DELETE CASCADE;

CREATE TABLE Explicacao_Online.Avaliacao (
	Id_Av			INT				NOT NULL,
	Data			DATE			NOT NULL,
	Comentario		NVARCHAR(300)	,
	Nota			INT				NOT NULL CHECK (Nota >= 1 AND Nota <= 5),
	Cod_Curso		INT				NOT NULL,
	Id_Aluno		INT				NOT NULL,
	
	CONSTRAINT PK_Avaliacao PRIMARY KEY (Id_Av),
	CONSTRAINT FK_Avaliacao_Curso FOREIGN KEY (Cod_Curso)
		REFERENCES Explicacao_Online.Curso(Cod_Curso) ON DELETE CASCADE,
	CONSTRAINT FK_Avaliacao_Aluno FOREIGN KEY (Id_Aluno)
		REFERENCES Explicacao_Online.Aluno(Id_Utilizador) ON DELETE CASCADE
);
GO


-- alteracoes 
ALTER TABLE Explicacao_Online.Avaliacao
DROP CONSTRAINT FK_Avaliacao_Aluno;
ALTER TABLE Explicacao_Online.Avaliacao
ADD CONSTRAINT FK_Avaliacao_Utilizador
FOREIGN KEY (Id_Aluno) REFERENCES Explicacao_Online.Utilizador(Id_Utilizador)
ON DELETE CASCADE;


CREATE TABLE Explicacao_Online.Pagamento (
	Id_Pagamento	INT				NOT NULL,
	Data			DATE			NOT NULL,
	Valor			DECIMAL(10, 2)	NOT NULL,
	Estado			NVARCHAR(20)	NOT NULL DEFAULT 'Pendente' CHECK (Estado IN ('Pendente', 'Concluído', 'Cancelado')),
	Cod_Curso		INT				NOT NULL,
	Id_Aluno		INT				NOT NULL,
	Metodo_Pag		NVARCHAR(50)	,
	
	CONSTRAINT PK_Pagamento PRIMARY KEY (Id_Pagamento),
	CONSTRAINT FK_Pagamento_Curso FOREIGN KEY (Cod_Curso)
		REFERENCES Explicacao_Online.Curso(Cod_Curso),
	CONSTRAINT FK_Pagamento_Aluno FOREIGN KEY (Id_Aluno)
		REFERENCES Explicacao_Online.Aluno(Id_Utilizador)
);
GO

-- alteracoes
ALTER TABLE Explicacao_Online.Pagamento
DROP CONSTRAINT FK_Pagamento_Aluno;

ALTER TABLE Explicacao_Online.Pagamento
ADD CONSTRAINT FK_Pagamento_Utilizador 
FOREIGN KEY (Id_Aluno) REFERENCES Explicacao_Online.Utilizador(Id_Utilizador);