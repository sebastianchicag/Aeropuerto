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


/*Sentencia sql que se utiliza para registrar informacióon en una tabla con el comando insert into*/
	INSERT INTO persona (cod_persona, doc_persona, tipo_documento, nombre_persona, apellido_persona, fecha_nac, sexo, celular, correo,fecha_reg) VALUES
	(1, '1094955221', 'Cedula', 'Juan Sebastian', 'Chica Giraldo', '1996-02-13', 'H', '3235807900', 'juansebastianchicagiraldo@gmail.com',NOW()),
	(2, '1093945332', 'Cedula', 'Juan Jose', 'Ospina Zapata', '1994-12-20', 'H', '3245678909', 'jjose20@gmail.com',NOW()),
	(3, '9602132010', 'Ti', 'Manuel Jose', 'Garcia Rivera', '2004-08-18', 'H', '3234567890', 'juansebastianchicagiraldo@gmail.com',NOW()),
	(4, '1092934599', 'Cedula', 'Maria Cristina', 'Rivera Giraldo', '1995-01-19', 'M', '3234568879', 'mariac@gmail.com',NOW()),
	(5, '1093456485', 'Cedula', 'Maria Fernanda', 'Ospina Garcia', '1994-11-12', 'M', '3234567890', 'marifer@gmail.com',NOW())


/*Sentencia para hacer un cambio a una tabla en este caso se añade una columna nueva fecha_reg para registar la 
fecha actual con datetime*/
	 	ALTER TABLE persona ADD fecha_reg DATETIME
	 	
/*El comando select se utiliza para recuperar datos de una o más tablas*/
		SELECT * FROM persona
	
/*La sentencia update se utiliza para modificar valores en una tabla.*/
		UPDATE persona SET tipo_documento = 'Ti' WHERE cod_persona = 5
	
/*Sentencia que me permite contar  todos los registros, se guarda con un alis utilizando as por ultimo 
se agrupan por sexo*/
		SELECT sexo , count(*) as cantidad FROM persona GROUP BY sexo
	
/*Sentencia que se usa para devolver valores con un campo en especifico utilizando condicion where y la funcion
lower hace minuscula un campo */
		SELECT * FROM persona WHERE LOWER(tipo_documento)= 'Cedula'
	
/*La palabra clave ASC se usa para ordenar el conjunto de resultados de la consulta en orden ascendente*/
		SELECT * FROM persona ORDER BY nombre_persona ASC
		

/*Estructura para crear una tabla con el comando create table*/
CREATE TABLE marca(
		cod_marca INT(11) AUTO_INCREMENT NOT NULL,
		nombre VARCHAR(50) NOT NULL,
		PRIMARY KEY(cod_marca))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/
		 
		
/*Sentencia sql que se utiliza para registrar informacióon en una tabla con el comando insert into*/
	INSERT INTO marca (cod_marca,nombre) VALUES
	(1, 'Boeing 747'),
	(2, 'Boeing 777'),
	(3, 'Airbus A340'),
	(4,  'Airbus A330'),
	(5, 'Boeing 757')
	

/*El comando select se utiliza para recuperar datos de una o más tablas*/
		SELECT * FROM marca
	
/*La sentencia update se utiliza para modificar valores en una tabla.*/
		UPDATE marca SET nombre = 'Boeing 737' WHERE cod_marca = 5
	
/*Sentencia que busca todos los registros con la palabra Boeing y cuenta cuantos registros existen*/
		SELECT nombre AS marca,count(*) as cantidad FROM marca WHERE nombre LIKE '%Boeing%'
		

/*Sentencia que selecciona todos los registros que tengan la palabra Boeing*/		
		SELECT * FROM marca WHERE nombre LIKE '%Boeing%'

/*Sentencia que se usa para contar los registros de una tabla*/		
SELECT COUNT(*) as cantidad FROM marca


/*Estructura para crear una tabla con el comando create table*/
CREATE TABLE avion(
		cod_avion INT(11) AUTO_INCREMENT NOT NULL,
		descripcion TEXT NOT NULL,
		capacidad VARCHAR (50) NOT NULL,
		marca INT(11) NOT NULL,
		CONSTRAINT fk_Marca FOREIGN KEY (marca) REFERENCES marca (cod_marca),/*Estructura que relaciona 
		las tablas avion y marca con la llave foranea marca que pertenece a la tabla avion 
		y cod_marca como llave primaria que perteneciente a la tabla marca*/	
		
/*Sentencia sql que se utiliza para registrar informacióon en una tabla con el comando insert into*/	
	INSERT INTO avion (cod_avion,descripcion,capacidad,marca) VALUES
	(1, 'es de los aviones más reconocibles del mundo','467 pasajeros',1),
	(2, 'El Boeing 777 es un avión jet bimotor, de fuselaje ancho y de largo alcance manufacturado por la Boeing','368 pasajeros',2),
	(3, 'El avión Airbus A340 es un avión jet comercial de pasajeros de largo alcance de fuselaje ancho y cuatro motores','370 pasajeros',3),
	(4,  'El Airbus A330 es un avión jet de fuselaje ancho bimotor construido por Airbus','288 pasajeros',4),
	(5, 'El Boeing 757 es un avión jet de fuselaje estrecho de dos motores contruido por la compañía Boeing ','200 pasajeros',5)	

/*Los join sirven para combinar filas de dos o más tablas basándose en un campo común entre ellas*/
		SELECT nombre AS marca ,descripcion FROM avion INNER JOIN marca ON marca.cod_marca = avion.marca
		
/*Estructura para crear una tabla con el comando create table*/	
CREATE TABLE origen(
		cod_origen INT(11) AUTO_INCREMENT NOT NULL,
		origen VARCHAR	(50),
		PRIMARY KEY(cod_origen))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/	

/*Sentencia sql que se utiliza para registrar informacióon en una tabla con el comando insert into*/	
	INSERT INTO origen (cod_origen ,origen) VALUES
	(1, 'Armenia'),
	(2, 'Bogota'),
	(3, 'Cali'),
	(4, 'Pereira'),
	(5, 'Bucaramanga')   
		
/*Estructura para crear una tabla con el comando create table*/
CREATE TABLE destino(
		cod_destino int(11) AUTO_INCREMENT NOT NULL,
		destino VARCHAR	(50),
		PRIMARY KEY(cod_destino))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/
		
/*Sentencia sql que se utiliza para registrar informacióon en una tabla con el comando insert into*/   
	INSERT INTO destino (cod_destino ,destino) VALUES
	(1, 'Ibague'),
	(2, 'Barranquilla'),
	(3, 'Cartagena'),
	(4, 'Manizales'),
	(5, 'Pasto')  
		
/*Estructura para crear una tabla con el comando create table*/
CREATE TABLE estado(
		cod_estado INT(11) AUTO_INCREMENT NOT NULL,
		estado VARCHAR(50),
		PRIMARY KEY(cod_estado))/*Primary key se utiliza para asignar llave la llave primaria como campo unico*/
		
/*Sentencia sql que se utiliza para registrar informacióon en una tabla con el comando insert into*/ 
	INSERT INTO estado (cod_estado ,estado) VALUES
	(1, 'Despegue'),
	(2, 'Aterrizaje')
		

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

/*Sentencia sql que se utiliza para registrar informacióon en una tabla con el comando insert into*/ 
	INSERT INTO vuelo (cod_vuelo, cod_origen,cod_destino,cod_estado,cod_marca,cod_persona) VALUES 
	(1, 5, 4, 2, 3, 1),
	(2, 3, 3, 1, 5, 3),
	(3, 4, 2, 1, 2, 4),
	(4, 2, 1, 2, 2, 2),
	(5, 1, 5, 2, 1, 5)
		
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
		
		
/*Sentencia sql que se utiliza para registrar informacióon en una tabla con el comando insert into*/ 

	INSERT INTO factura (cod_factura, total,asiento,clase,fecha_reg,cod_vuelo,descripcion) VALUES 
	(1, 550.000, '23A', 'Clase Economica', NOW(), 1,'Vuelo con acompañante'),
	(2, 760.250, '15K', 'Clase Ejecutiva', NOW(), 2,'Vuelo con escala'),
	(3, 450.000, '18E', 'Primera Clase', now(), 4,'Vuelo sin escala'),
	(4, 320.000, '10A', 'Clase Economica', NOW(), 2,'Vuelo directo'),
	(5, 980.350, '30D', 'Clase Ejecutiva', NOW(), 5,'Vuelo con fuertes lluvias')	

/*El comando select se utiliza para recuperar datos de una o más tablas*/
		SELECT * FROM factura
	
/*Sentencia que se usa para devolver valores con un campo en especifico utilizando condicion where y la funcion
lower hace minuscula un campo*/
		SELECT nombre_persona,total,asiento,clase,origen,destino ,estado,fecha_reg FROM factura INNER JOIN vuelo ON 
		vuelo.cod_vuelo = factura.cod_vuelo INNER JOIN persona ON persona.cod_persona = vuelo.cod_vuelo INNER JOIN estado ON 
		estado.cod_estado = vuelo.cod_estado INNER JOIN origen ON origen.cod_origen = vuelo.cod_origen  
		INNER JOIN destino ON destino.cod_destino = vuelo.cod_destino WHERE LOWER(estado)= 'aterrizaje' ORDER BY nombre_persona
		
/*Estructura que devuelve registros existentes con tablas relacionadas y se utiliza inner join*/
		SELECT nombre_persona,total,asiento,clase,origen,destino ,estado,fecha_reg FROM factura INNER JOIN vuelo ON 
		vuelo.cod_vuelo = factura.cod_vuelo INNER JOIN persona ON persona.cod_persona = vuelo.cod_vuelo INNER JOIN estado ON 
		estado.cod_estado = vuelo.cod_estado INNER JOIN origen ON origen.cod_origen = vuelo.cod_origen  
		INNER JOIN destino ON destino.cod_destino = vuelo.cod_destino ORDER BY nombre_persona
		
/*Consulta que se utiliza para obtener el valor a pagar mas alto para ello se utiliza la clausula max*/
		SELECT nombre_persona,MAX(total) AS total,asiento,clase,origen,destino ,estado,fecha_reg FROM factura INNER JOIN vuelo ON 
		vuelo.cod_vuelo = factura.cod_vuelo INNER JOIN persona ON persona.cod_persona = vuelo.cod_vuelo INNER JOIN estado ON 
		estado.cod_estado = vuelo.cod_estado INNER JOIN origen ON origen.cod_origen = vuelo.cod_origen  
		INNER JOIN destino ON destino.cod_destino = vuelo.cod_destino ORDER BY nombre_persona
		
/*Consulta que se utiliza para obtener el valor a pagar mas bajo para ello se utiliza la clausula max*/
		SELECT nombre_persona,MIN(total) AS total,asiento,clase,origen,destino ,estado,fecha_reg FROM factura INNER JOIN vuelo ON 
		vuelo.cod_vuelo = factura.cod_vuelo INNER JOIN persona ON persona.cod_persona = vuelo.cod_vuelo INNER JOIN estado ON 
		estado.cod_estado = vuelo.cod_estado INNER JOIN origen ON origen.cod_origen = vuelo.cod_origen  
		INNER JOIN destino ON destino.cod_destino = vuelo.cod_destino ORDER BY nombre_persona	

