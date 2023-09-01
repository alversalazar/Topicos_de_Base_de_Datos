USE master;
GO
IF DB_ID (N'Hospital') IS NOT NULL
 DROP DATABASE Hospital;
GO
CREATE DATABASE	Hospital
ON
(NAME = Hospital_dat,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Hospital.mdf', 
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
(NAME =Hospital_log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Hospital.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB )
GO
USE Hospital;

GO	
---------------------TABLAS----------------------------------------------------

CREATE TABLE Paciente
(   
      
	 idPaciente int IDENTITY (1,1),
	 nombre varchar(25) NOT NULL,
	 apPaterno varchar(50) NOT NULL,
	 apMaterno  varchar(20) NOT NULL,
	 fechaNacimiento  datetime NOT NULL,
	 genero  varchar(10) NOT NULL,
	 direccion  varchar(100) NOT NULL,
	 telefono  varchar (20) NOT NULL,
	 correo varchar(50) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1

	 CONSTRAINT PK_Paciente PRIMARY KEY (idPaciente)

);
CREATE TABLE Medico
(   
      
	 idMedico int IDENTITY (1,1),
	 nombre varchar(25) NOT NULL,
	 apPaterno varchar(50) NOT NULL,
	 apMaterno  varchar(20) NOT NULL,
	  especialidad  varchar(50) NOT NULL,
	 direccion  varchar(100) NOT NULL,
	 telefono  varchar(20) NOT NULL,
	 correo varchar(50) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_Medico PRIMARY KEY (idMedico)

);
CREATE TABLE Departamento
(   
      
	 idDepartamento int IDENTITY (1,1),
	 nombre  varchar(100) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_Departamento PRIMARY KEY (idDepartamento)

);

CREATE TABLE Consulta
(   
      
	 idConsulta int IDENTITY (1,1),
	 fecha datetime NOT NULL,
	 estatus bit NOT NULL DEFAULT 1,
	 idPaciente int NOT NULL,
	 idMedico int NOT NULL,
	 idDepartamento int NOT NULL

	 
	 CONSTRAINT PK_Consulta PRIMARY KEY (idConsulta)

);



--------------------INDEX---------------------------------

CREATE INDEX IX_Paciente ON Paciente(idPaciente);
CREATE INDEX IX_Medico ON Medico(idMedico);
CREATE INDEX IX_Departamento ON Departamento(idDepartamento);
CREATE INDEX IX_Consulta ON Consulta(idConsulta);

GO


--------------------RELACIONES--------------------------------

ALTER TABLE Consulta
ADD CONSTRAINT FK_ConsultaPaciente
FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente);
GO

ALTER TABLE Consulta
ADD CONSTRAINT FK_ConsultaMedico
FOREIGN KEY (idMedico) REFERENCES Medico(idMedico);
GO
ALTER TABLE Consulta
ADD CONSTRAINT FK_ConsultaDepartamento
FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento);
GO
ALTER TABLE Consulta
ADD CONSTRAINT FK_ConsultaConsulta
FOREIGN KEY (idConsulta) REFERENCES Consulta(idConsulta);
GO
 
--------------------Poblar--------------------------------------
--------------------Insertar Registros-------------------------
---------------------------------------------



		
					  
			  
    INSERT INTO Paciente(nombre,apPaterno,apMaterno,fechaNacimiento,genero,direccion,correo,telefono)
     VALUES   ('Alberto','Salazar','Zuñiga','2000-03-09 10:30:55','Masculino','Cd. Deportiva, Cd Deportiva, 25750 Monclova, Coah.','albert6@gmail.com','+866-168-16-56'),
	          ('Jose Luis','Hernandez','Garza','2015-03-09 10:00:45','Masculino','Av. Huemac, Brasil Esq, Anáhuac, 25750 Monclova, Coah.','joseluis@gmail.com','+866-198-11-56'),
			   ('Flor Elizabeth','Flores','Perez','1999-03-09 02:30:23','Femenino','Brasil #201, Guadalupe, 25750 Monclova, Coah.','florperez@gmail.com','+844-188-56-34'),
			   ('Marcos','Mireles','Tovar','1943-03-08 11:30:12','Masculino','Valparaíso 212, Guadalupe, 25750 Monclova, Coah.','mirelestovar@gmail.com','+866-111-13-59'),
			   ('Nataly','Meza','Rodriguez','1987-03-12 07:33:23','Femenino','Calle Guatemala S/N, Guadalupe, 25750 Monclova, Coah.','nataly13@gmail.com','+866-677-23-12'),
			   ('Samuel Israel','Vazquez','Villarial','2006-03-09 10:43:21','Masculino','Blvd Harold R. Pape 6201, Guadalupe, 25750 Monclova, Coah.','samyisra@gmail.com','+844-190-23-45'),
			   ('Juan de dios','Del Bosque','Saldua','2002-03-11 10:34:11','Masculino','Carretera 30, Magisterio, 25716 Frontera, Coah.','juan@gmail.com','+866-166-78-01')
		


	 INSERT INTO Medico(nombre,apPaterno,apMaterno,especialidad,direccion,correo,telefono)
     VALUES    ('Angel de Jesus','Lopes','Valdes','Cirugano','Cd. Deportiva, Cd Deportiva, 25750 Monclova, Coah.','angelwe76@gmail.com','+866-168-16-56'),
	           ('Hugo Domingo','Hernandez','Garcia','Ginecologo','Av. Huemac, Brasil Esq, Anáhuac, 25750 Monclova, Coah.','joseluis@gmail.com','+866-198-11-56'),
			   ('Esther Elizabeth','Espejo','Sanchez','Patologa','Brasil #201, Guadalupe, 25750 Monclova, Coah.','florperez@gmail.com','+844-188-56-34'),
			   ('Marco Antonio','Wong','Mireles','Pediatra','Valparaíso 212, Guadalupe, 25750 Monclova, Coah.','mirelestovar@gmail.com','+866-111-13-59'),
			   ('Sofia Alejandra Elizabeth','Martinez','Solis','Radiologo','Calle Guatemala S/N, Guadalupe, 25750 Monclova, Coah.','nataly13@gmail.com','+866-677-23-12'),
			   ('Roberto Jasiel Ali','Wong','Smith','Psiquiatra','Blvd Harold R. Pape 6201, Guadalupe, 25750 Monclova, Coah.','samyisra@gmail.com','+844-190-23-45'),
			   ('Juan de dios','Del Bosque','Jimenez','Otorrinologo','Carretera 30, Magisterio, 25716 Frontera, Coah.','juan@gmail.com','+866-166-78-01')

		INSERT INTO Departamento(nombre)
        VALUES         ('Cardiologia '),
		               ('Cirugía '),
					   ('Genética y Defectos Congénitos'),
					   ('Ginecología y Obstetricia'),
					   ('Medicina del Deporte'),
                       ('Medicina Familiar '),
					   ('Medicina Interna '),
					   ('Patología Clínica '),
					   ('Pediatría '),
					   ('Psiquiatría '),
					    ('Radiología e Imagen '),
					   ('Emergencias '),
					    ('Otorrinolaringología '),
						 ('Gastroenterología '),
						  ('Urología ')

		
      INSERT INTO Consulta(fecha,idPaciente,idMedico,idDepartamento)
	    VALUES   ('2023-09-03 10:30:00',1,1,2), --09 03
	           	('2023-09-04 09:00:00',2,2,4), --09 04
				 ('2023-09-05 09:15:00',3,3,3), --09 05
	           	('2023-09-05 10:30:00',4,4,2),    --09 05
				 ('2023-09-18 10:24:00',5,5,4),    --09 18
	           	('2023-09-19 10:20:00',6,6,9),    --09 19
				  	('2023-09-19 10:20:00',7,6,7)   --09 19

		        
	 

SELECT * FROM  Paciente
SELECT * FROM  Medico
SELECT * FROM  Departamento
SELECT * FROM  Consulta



--INSERT INTO Medico(nombre,apPaterno,apMaterno,especialidad,direccion,correo,telefono)
   --  VALUES    ('Antonio','Rodriguez','Tovar','Medico General','Progreso, Guadalupe Borja, 25680 Frontera, Coah.','antonio76@gmail.com','+866-103-45-99')


	-- Update Medico set nombre = 'Roberto' where idMedico = 7

	-- Delete Medico where idMedico = 8