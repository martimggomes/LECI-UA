CREATE SCHEMA EX4_1_3
GO

CREATE TABLE EX4_1_3.Tipo_Fornecedor
(
	Cod_Int		INT			NOT NULL,
	Designação	VARCHAR(50)	NOT	NULL,
	CONSTRAINT PK_Tipo_Forncedor PRIMARY KEY (Cod_Int)
);
GO

CREATE TABLE EX4_1_3.Fornecedor
(
	NIF			NUMERIC(9,0)	NOT NULL,
	Nome		NVARCHAR(40)	NOT NULL,
	Endereço	NVARCHAR(200),	
	Num_Fax		INT,
	Cond_Pag	VARCHAR(50),
	Cod_Int_Tipo_Forn	INT		NOT NULL,
	CONSTRAINT PK_Forencedor PRIMARY KEY (NIF),
	CONSTRAINT FK_Forncedor_Tipo FOREIGN KEY (Cod_Int_Tipo_Forn) 
		REFERENCES EX4_1_3.Tipo_Fornecedor(Cod_Int)
);
GO

CREATE TABLE EX4_1_3.Produto
(
	Codigo		INT				NOT NULL,
	Nome		NVARCHAR(40)	NOT NULL,
	Preco		DECIMAL(10, 2)	NOT NULL CHECK (Preco > 0),
	Taxa_Iva	DECIMAL(4, 2)	NOT NULL,
	Num_Unico	INT				DEFAULT 0,
	CONSTRAINT PK_Produto PRIMARY KEY (Codigo)
);
GO

CREATE TABLE EX4_1_3.Encomenda
(
	Num_Encomenda	INT		NOT NULL,
	Data			DATE	NOT NULL,
	Form_Unico		INT		NOT NULL,
	Nif_Form		NUMERIC(9,0)	NOT NULL,
	CONSTRAINT PK_Encomenda PRIMARY KEY (Num_Encomenda),
	CONSTRAINT FK_Fonecedor FOREIGN KEY (Nif_Form)
		REFERENCES EX4_1_3.Fornecedor(NIF)
);
GO

CREATE TABLE EX4_1_3.Contem
(
	Num_Encomenda	INT		NOT NULL,
	Cod_Produto		INT		NOT NULL
	CONSTRAINT PK_Contem PRIMARY KEY (Num_Encomenda, Cod_Produto),
	CONSTRAINT FK_Produto FOREIGN KEY (Cod_Produto)
		REFERENCES EX4_1_3.Produto(Codigo)
);
GO