CREATE SCHEMA EX4_1_1
GO

create table EX4_1_1.Cliente
(
	NIF			NUMERIC(9,0),
	num_cart	NVARCHAR(12),
	nome		NVARCHAR(40),
	endereco	NVARCHAR(100),

	CONSTRAINT PK_Cliente PRIMARY KEY (NIF)
)
GO




create table EX4_1_1.Balcao(
	numero		INT,
	nome		NVARCHAR(40),
	endereco	NVARCHAR(100),
	
	CONSTRAINT PK_Balcao PRIMARY KEY (numero)

)




GO


create table EX4_1_1.Tipo_Veiculo(
	codigo						INT,
	ar_condicionado				BIT,
	designacao					NVARCHAR(50),
	
	
	CONSTRAINT PK_Tipo_Veiculo PRIMARY KEY (codigo)
)

GO


create table EX4_1_1.Veiculo(
	matricula		NVARCHAR(10),
	ano				INT,
	marca			NVARCHAR(50),
	codigo_veiculo	INT,
	
	CONSTRAINT PK_Veiculo PRIMARY KEY (matricula),
	CONSTRAINT FK_Veiculo_TipoVeiculo FOREIGN KEY (codigo_veiculo) REFERENCES EX4_1_1.Tipo_Veiculo(codigo)

)


GO

create table EX4_1_1.Aluguer
(
	numero				INT,
	duracao				INT,
	data				DATE,
	NIF_Cliente			NUMERIC(9,0),
	Num_Balcao			INT,
	Matricula_Veiculo	NVARCHAR(10),
	CONSTRAINT PK_Aluguer PRIMARY KEY (numero),
	CONSTRAINT FK_Aluguer_Cliente FOREIGN KEY (NIF_Cliente) REFERENCES EX4_1_1.Cliente(NIF),
	CONSTRAINT FK_Aluguer_Balcao  FOREIGN KEY (Num_Balcao) REFERENCES EX4_1_1.Balcao(numero),
	CONSTRAINT FK_Aluguer_Veiculo FOREIGN KEY (Matricula_Veiculo) REFERENCES EX4_1_1.Veiculo(matricula)
)


GO
create table EX4_1_1.Ligeiro(
	codigo						INT,
	num_lugares					INT,
	combustivel					NVARCHAR(20),
	portas						INT,
	
	
	CONSTRAINT PK_Ligeiro PRIMARY KEY (codigo),
	CONSTRAINT FK_Ligeiro_TipoVeiculo FOREIGN KEY (codigo) REFERENCES EX4_1_1.Tipo_Veiculo(codigo)
)

GO

create table EX4_1_1.Pesado(
	codigo						INT,
	peso						INT,
	passageiros					INT,
	
	
	CONSTRAINT PK_Pesado PRIMARY KEY (codigo),
	CONSTRAINT FK_Pesado_TipoVeiculo FOREIGN KEY (codigo) REFERENCES EX4_1_1.Tipo_Veiculo(codigo)
)


GO
create table EX4_1_1.Similaridade(
	codigo_tipo						INT,
	codigo_tipo_similar				INT,
	

	CONSTRAINT PK_Similaridade PRIMARY KEY (codigo_tipo, codigo_tipo_similar),
	CONSTRAINT FK_Similaridade_Tipo_Veiculo_1 FOREIGN KEY (codigo_tipo) REFERENCES EX4_1_1.Tipo_Veiculo(codigo),
	CONSTRAINT FK_Similaridade_Tipo_Veiculo_2 FOREIGN KEY (codigo_tipo_similar) REFERENCES EX4_1_1.Tipo_Veiculo(codigo)
)

