CREATE SCHEMA EX4_1_2
GO


create table EX4_1_2.Airport
(
	Airport_code		CHAR(3),
	City				NVARCHAR(50),
	State				NVARCHAR(50),
	Name				NVARCHAR(100),

	CONSTRAINT PK_Airport PRIMARY KEY (Airport_code)

)

GO


create table EX4_1_2.Airplane_Type
(
	Company				NVARCHAR(50),
	Type_name			NVARCHAR(50),
	Max_Seats			INT,

	CONSTRAINT PK_Airplane_Type PRIMARY KEY (Type_name)
)
GO

create table EX4_1_2.Can_Land
(

	Airport_code		CHAR(3),
	Type_name			NVARCHAR(50),


	CONSTRAINT PK_Can_Land PRIMARY KEY (Airport_code, Type_name),
	CONSTRAINT FK_Can_Land_Airport FOREIGN KEY (Airport_code) REFERENCES EX4_1_2.Airport(Airport_code),
	CONSTRAINT FK_Can_Land_Airplane_Type FOREIGN KEY (Type_name) REFERENCES EX4_1_2.Airplane_Type(Type_name)
)
GO


create table EX4_1_2.Airplane
(
	Company				NVARCHAR(50),
	Type_name			NVARCHAR(50),
	Airplane_Id			INT,


	CONSTRAINT PK_Airplane PRIMARY KEY (Airplane_Id),
	CONSTRAINT FK_Airplane_Airplane_Type FOREIGN KEY (Type_name) REFERENCES EX4_1_2.Airplane_Type(Type_name)

)

GO


create table EX4_1_2.Flight
(
	Number				INT,
	Airline				NVARCHAR(50),
	Weekdays			NVARCHAR(20),

	CONSTRAINT PK_Flight PRIMARY KEY (Number),
)




create table EX4_1_2.Flight_Leg
(
	Flight_Number		INT,
	Leg_No				INT,
	Dep_Time			TIME,
	Arr_Time			TIME,
	Dep_Air_Code		CHAR(3),
	Arr_Air_Code		CHAR(3),
	
	CONSTRAINT PK_Flight_Leg PRIMARY KEY (Flight_Number,Leg_No),
	CONSTRAINT FK_Flight_Leg_Dep_Airport FOREIGN KEY (Dep_Air_Code) REFERENCES EX4_1_2.Airport(Airport_code),
	CONSTRAINT FK_Flight_Leg_Arr_Airport FOREIGN KEY (Arr_Air_Code) REFERENCES EX4_1_2.Airport(Airport_code),
	CONSTRAINT FK_Flight_Leg_Flight FOREIGN KEY (Flight_Number) REFERENCES EX4_1_2.Flight(Number)


)
GO





create table EX4_1_2.Leg_Instance
(
	No_Av_Seats			INT,
	Leg_No				INT,
	date				DATE,
	Flight_Number		INT,
	Airplane_Id			INT,
	Dep_Time			TIME,
	Arr_Time			TIME,
	Dep_Air_Code		CHAR(3),
	Arr_Air_Code		CHAR(3),


	CONSTRAINT PK_Leg_Instance PRIMARY KEY (Flight_Number,Leg_No,date),
	CONSTRAINT FK_Leg_Instance_Airplane FOREIGN KEY (Airplane_Id) REFERENCES EX4_1_2.Airplane(Airplane_Id),
	CONSTRAINT FK_Leg_Instance_Flight_Leg FOREIGN KEY (Flight_Number, Leg_No) REFERENCES EX4_1_2.Flight_Leg(Flight_Number,Leg_No),
	CONSTRAINT FK_Leg_Instance_Dep_Airport FOREIGN KEY (Dep_Air_Code) REFERENCES EX4_1_2.Airport(Airport_code),
	CONSTRAINT FK_Leg_Instance_Arr_Airport FOREIGN KEY (Arr_Air_Code) REFERENCES EX4_1_2.Airport(Airport_code)
)
GO


create table EX4_1_2.Seat
(
	Seat_No				INT,
	Leg_No				INT,
	date				DATE,
	Flight_Number		INT,
	Cphone				NVARCHAR(30),
	Customer_Name		NVARCHAR(100),


	CONSTRAINT PK_Seat PRIMARY KEY (Seat_No, Flight_Number),
	CONSTRAINT FK_Seat_Leg_Instance FOREIGN KEY (Flight_Number,Leg_No,date) REFERENCES EX4_1_2.Leg_Instance(Flight_Number,Leg_No,date)

)

GO

create table EX4_1_2.Fare
(
	Flight_Number		INT,
	Code				NVARCHAR(10),
	Amount				DECIMAL(10,2),
	Restrictions		NVARCHAR(200),

	CONSTRAINT PK_Fare PRIMARY KEY (Flight_Number),
	CONSTRAINT FK_Fare_Flight FOREIGN KEY (Flight_Number) REFERENCES EX4_1_2.Flight(Number)
)