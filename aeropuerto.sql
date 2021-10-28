/*Comando que se utiliza para crea una nueva base de datos*/
CREATE DATABASE aeropuerto


/*Comando que se utiliza para seleccionar la base de datos*/
USE aeropuerto


/*Estructura para crear una tabla con el comando create table*/
CREATE TABLE persona(
		cod_persona int(11) AUTO_INCREMENT NOT NULL,/*Campo autoincrementable*/
		doc_persona VARCHAR(50) NOT NULL,
		tipo_documento VARCHAR(50) NOT NULL,
		nombre_persona varchar(50) NOT NULL,
		apellido_persona varchar(50) NOT NULL,
		fecha_nac date NOT NULL,
		sexo VARCHAR(50) NOT NULL,
		celular varchar(10) NOT NULL,
		correo varchar(50) NOT NULL,
		PRIMARY KEY(cod_persona))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/

/*Sentencia para hacer un cambio a una tabla en este caso se añade una columna nueva fecha_reg para registar la 
fecha actual con datetime*/
	 	ALTER TABLE persona ADD fecha_reg DATETIME

/*Estructura para crear una tabla con el comando create table*/
CREATE TABLE marca(
		cod_marca INT(11) AUTO_INCREMENT NOT NULL,
		nombre VARCHAR(50) NOT NULL,
		PRIMARY KEY(cod_marca))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/
		

/*Estructura para crear una tabla con el comando create table*/
CREATE TABLE avion(
		cod_avion INT(11) AUTO_INCREMENT NOT NULL,
		descripcion TEXT NOT NULL,
		capacidad VARCHAR (50) NOT NULL,
		marca INT(11) NOT NULL,
		CONSTRAINT fk_Marca FOREIGN KEY (marca) REFERENCES marca (cod_marca),/*Estructura que relaciona 
		las tablas avion y marca con la llave foranea marca que pertenece a la tabla avion 
		y cod_marca como llave primaria que perteneciente a la tabla marca*/		
		

/*Estructura para crear una tabla con el comando create table*/	
CREATE TABLE origen(
		cod_origen INT(11) AUTO_INCREMENT NOT NULL,
		origen VARCHAR	(50),
		PRIMARY KEY(cod_origen))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/	

		
/*Estructura para crear una tabla con el comando create table*/
CREATE TABLE destino(
		cod_destino int(11) AUTO_INCREMENT NOT NULL,
		destino VARCHAR	(50),
		PRIMARY KEY(cod_destino))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/
		
		
/*Estructura para crear una tabla con el comando create table*/
CREATE TABLE estado(
		cod_estado INT(11) AUTO_INCREMENT NOT NULL,
		estado VARCHAR(50),
		PRIMARY KEY(cod_estado))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/

		/*Estructura para crear una tabla con el comando create table*/
		CREATE TABLE vuelo(
		cod_vuelo INT(11) AUTO_INCREMENT NOT NULL,
		cod_origen INT(11) NOT NULL,
		cod_destino INT(11) NOT NULL,
		cod_estado INT(11) NOT NULL,
		cod_marca INT(11) NOT NULL,
		cod_persona INT(11) NOT NULL,
		CONSTRAINT fk_Origen FOREIGN KEY (cod_origen) REFERENCES origen (cod_origen),/*Estructura que relaciona las 
		tablas origen y vuelo con la llave foranea cod_origen que pertenece a la tabla vuelo 
		y cod_origen como llave primaria que perteneciente a la tabla origen*/
		CONSTRAINT fk_Destino FOREIGN KEY (cod_destino) REFERENCES destino (cod_destino),/*Estructura que relaciona 
		las tablas destino y vuelo con la llave foranea cod_destino que pertenece a la tabla vuelo 
		y cod_destino  como llave primaria que perteneciente a la tabla destino*/
		CONSTRAINT fk_Estado FOREIGN KEY (cod_estado) REFERENCES estado (cod_estado),/*Estructura que relaciona las 
		tablas estado y vuelo con la llave foranea cod_estado que pertenece a la tabla vuelo 
		y cod_estado como llave primaria que perteneciente a la tabla estado*/
		CONSTRAINT fk_Marcas FOREIGN KEY (cod_marca) REFERENCES marca (cod_marca),/*Estructura que relaciona las 
		tablas marca y vuelo con la llave foranea cod_marca que pertenece a la tabla vuelo 
		y cod_marca como llave primaria que perteneciente a la tabla marca*/
		CONSTRAINT fk_Persona FOREIGN KEY (cod_persona) REFERENCES persona (cod_persona),/*Estructura que relaciona 
		las tablas persona y vuelo con la llave foranea cod_persona que pertenece a la tabla vuelo 
		y cod_persona como llave primaria que perteneciente a la tabla persona*/
		PRIMARY KEY(cod_vuelo))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/


/*Estructura para crear una tabla con el comando create table*/
CREATE TABLE factura(
		cod_factura INT(11) AUTO_INCREMENT NOT NULL,
		total DECIMAL (20,3),
		asiento VARCHAR (50),
		clase VARCHAR (50),
		fecha_reg DATETIME,
		cod_vuelo INT(11),
	   CONSTRAINT fk_vuelo FOREIGN KEY (cod_vuelo) REFERENCES vuelo (cod_vuelo),/*Estructura que relaciona 
		las tablas factura y vuelo con la llave foranea cod_vuelo que pertenece a la tabla vuelo 
		y cod_factura como llave primaria que perteneciente a la tabla factura*/
		PRIMARY KEY(cod_factura))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/	