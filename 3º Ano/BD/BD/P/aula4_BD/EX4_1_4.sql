CREATE SCHEMA EX4_1_4
GO

create table EX4_1_4.Paciente(

	Num_Utente              INT,
    Nome                    NVARCHAR(50),
    Endereco                NVARCHAR(100),
    Data_Nascimento         DATE,

    CONSTRAINT PK_Paciente PRIMARY KEY (Num_Utente)
)

GO

create table EX4_1_4.Medico
(
    Num_Id_Sns              INT,
    Nome                    NVARCHAR(50),
    Especialidade           NVARCHAR(50),
    
    CONSTRAINT PK_Medico PRIMARY KEY (Num_Id_Sns)
)
GO

Create table EX4_1_4.Farmaceutica
(
    Nnum_Registon           INT,
    Nome                    NVARCHAR(50),
    Endereco                NVARCHAR(100),
    Telefone                NVARCHAR(20),
    
    CONSTRAINT PK_Farmaceutica PRIMARY KEY (Nnum_Registon)
)
GO

Create table EX4_1_4.Farmaco
(
    Nome                    NVARCHAR(50),
    Formula                 NVARCHAR(50),
    Nnum_Registon           INT,
    
    CONSTRAINT PK_Farmaco PRIMARY KEY (Formula),
    CONSTRAINT FK_Farmaco_Farmaceutica FOREIGN KEY (Nnum_Registon) REFERENCES EX4_1_4.Farmaceutica(Nnum_Registon)
)
GO

Create table EX4_1_4.Farmacia
(
    NIF                     NUMERIC(9,0),
    Nome                    NVARCHAR(50),
    Endereco                NVARCHAR(100),
    Telefone                NVARCHAR(20),
    
    CONSTRAINT PK_Farmacia PRIMARY KEY (NIF)
)
GO

create table EX4_1_4.Prescricao(

	Num_Prescricao          INT,
    Data                    DATE,
    Num_Utente              INT,
    Num_Id_Sns              INT,
    Nif_Farmacia            NUMERIC(9,0),

    CONSTRAINT PK_Prescricao PRIMARY KEY (Num_Prescricao),
    CONSTRAINT FK_Prescricao_Paciente FOREIGN KEY (Num_Utente) REFERENCES EX4_1_4.Paciente(Num_Utente),
    CONSTRAINT FK_Prescricao_Medico FOREIGN KEY (Num_Id_Sns) REFERENCES EX4_1_4.Medico(Num_Id_Sns),
    CONSTRAINT FK_Prescricao_Farmacia FOREIGN KEY (Nif_Farmacia) REFERENCES EX4_1_4.Farmacia(NIF)
)
GO

Create table EX4_1_4.Contem
(
    Num_Prescricao          INT,
    Formula                 NVARCHAR(50),
    
    CONSTRAINT PK_Contem PRIMARY KEY (Num_Prescricao, Formula),
    CONSTRAINT FK_Contem_Prescricao FOREIGN KEY (Num_Prescricao) REFERENCES EX4_1_4.Prescricao(Num_Prescricao),
    CONSTRAINT FK_Contem_Farmaco FOREIGN KEY (Formula) REFERENCES EX4_1_4.Farmaco(Formula)
)
GO


Create table EX4_1_4.Vende
(
    NIF                     NUMERIC(9,0),
    Formula                 NVARCHAR(50),
    
    CONSTRAINT PK_Vende PRIMARY KEY (NIF, Formula),
    CONSTRAINT FK_Vende_Farmacia FOREIGN KEY (NIF) REFERENCES EX4_1_4.Farmacia(NIF),
    CONSTRAINT FK_Vende_Farmaco FOREIGN KEY (Formula) REFERENCES EX4_1_4.Farmaco(Formula)
)
GO