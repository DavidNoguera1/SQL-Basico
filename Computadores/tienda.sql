DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda;
USE tienda;

/*Creando tabla marcas*/
CREATE TABLE marcas (
  idMarca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  marca VARCHAR (30)
);


/*Insertando datos a tabla marcas*/
insert into marcas(marca)
values('Acer'),
	   ('Lenovo'),
      ('Asus'),
      ('DEL'),
      ('HP'),
      ('MAC');
      

/*Creando tabla de categorias*/
CREATE TABLE categoria (
  idCategoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  tipo VARCHAR (30)
);

/*Insertando datos a tabla categoria*/
insert into categoria(tipo)
values('Computador todo en uno'),
	   ('Computador de mesa'),
      ('Computador portail'),
      ('Computador gamer');
      
      

/*Creando tabla computadores*/
CREATE TABLE computador (
  idComputadores INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  procesador VARCHAR(100),
  memoriaRAM VARCHAR(255),
  almacenamiento VARCHAR(100),
  precio DECIMAL(10,2),
  idMarca INT,
  FOREIGN KEY (idMarca) REFERENCES marcas(idMarca) ON DELETE CASCADE,
  idCategoria INT,
  FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria) ON DELETE CASCADE,
  descripcion TEXT
);

INSERT INTO computador (procesador, memoriaRAM, almacenamiento, precio, idMarca, idCategoria, descripcion)
VALUES ('Intel Core i7', '16GB', '512GB SSD', 1200.00, 1, 2, 'Computador de escritorio potente con procesador Intel Core i7, 16GB de RAM y almacenamiento de 512GB SSD. Ideal para tareas de diseño y desarrollo.');





