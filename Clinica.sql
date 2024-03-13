CREATE DATABASE clinica

use clinica;

/*Creando tabla tipoMascota*/
CREATE TABLE tipoMascota (
  idTipo INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  tipo VARCHAR (150)
);

/*Insertando datos a tabla tipoMascota*/
insert into tipoMascota(tipo)
values('Perro'),
	  ('Gato'),
      ('Loro'),
      ('Hamster'),
      ('Conejo'),
      ('Paloma'),
      ('Otro');
      

/*Creando tabla usuarios*/
CREATE TABLE usuario (
  idPropietario INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombres VARCHAR(50),
  apellidos VARCHAR(50),
  identificacion VARCHAR(20),
  direccion VARCHAR(255),
  telefono VARCHAR(20),
  correoE VARCHAR(100) 
);

/*Insertando datos a la tabla de usuarios*/
INSERT INTO usuario (nombres, apellidos, identificacion, direccion, telefono, correoE)
VALUES ('Juan Carlos', 'Burgos', '1085', 'Calle 18 No 34-104', '318', 'carlos@gmail'),
 ('María', 'Santander', '1086', 'Mza 20 casa 3, B/gualcaloma', '317', 'maria@hotmail');



/*Creando tabla mascotas*/

CREATE TABLE mascotas (
  idMascota INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(100),
  imagen VARCHAR(255),
  edad INT (10),
  raza VARCHAR(50),
  idTipo INT(10),
  FOREIGN KEY (idTipo) REFERENCES tipoMascota(idTipo),
  idPropietario INT(10),
  FOREIGN KEY (idPropietario) REFERENCES usuario(idPropietario)
);

/*Insertando datos a la tabla de mascotas*/
/*Insertando datos a la tabla de mascotas*/
INSERT INTO mascotas (nombre, imagen, edad, raza, idTipo, idPropietario)
VALUES ('yuya', 'yuya.jpg', 12, 'Labrador', 1, 1),
       ('felix', 'felix.jpg', 10, 'Mestizo', 2, 2);

