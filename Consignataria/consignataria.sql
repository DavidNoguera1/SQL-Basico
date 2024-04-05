DROP DATABASE IF EXISTS consignataria;
CREATE DATABASE consignataria;
USE consignataria;

CREATE TABLE Concesionario (
  idConcesionario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  direccion VARCHAR(100),
  telefono VARCHAR(50)
);

CREATE TABLE Caracteristicas (
  idCaracteristicas INT AUTO_INCREMENT PRIMARY KEY,
  caracteristicas VARCHAR(100),
  precio DECIMAL(10,2)
);

CREATE TABLE Marca (
	idMarca INT AUTO_INCREMENT PRIMARY KEY,
	marca VARCHAR (100)
);

CREATE TABLE Automoviles (
  idAutomoviles INT AUTO_INCREMENT PRIMARY KEY,
  modelo DATE,
  precio DECIMAL (10,2),
  descuento DECIMAL (10,2),
  cilindraje INT,
  idMarca INT,
  idConcesionario INT,
  FOREIGN KEY (idMarca) REFERENCES Marca(idMarca),
  FOREIGN KEY (idConcesionario) REFERENCES Concesionario(idConcesionario)
);


CREATE TABLE AutomovilCaracteristica (
  idAutomovilCaracteristica INT AUTO_INCREMENT PRIMARY KEY,
  idAutomovil INT,
  idCaracteristica INT,
  FOREIGN KEY (idAutomovil) REFERENCES Automoviles(idAutomoviles),
  FOREIGN KEY (idCaracteristica) REFERENCES Caracteristicas(idCaracteristicas)
);


-- Insertar datos en la tabla Concesionario --------------------------------------------------------

INSERT INTO Concesionario (nombre, direccion, telefono) VALUES 
('Concesionario A', 'Calle Principal 123', '123-456-7890'),
('Concesionario B', 'Avenida Central 456', '987-654-3210'),
('Concesionario C', 'Plaza Mayor 789', '456-789-0123');

-- Insertar datos en la tabla Caracteristicas
INSERT INTO Caracteristicas (caracteristicas, precio) VALUES 
('Aire Acondicionado', 2000.00),
('Sistema de Navegación GPS', 1500.00),
('Asientos de Cuero', 1000.00),
('Sunroof', 800.00),
('Cámara de Reversa', 1200.00);

-- Insertar datos en la tabla Marca
INSERT INTO Marca (marca) VALUES 
('Toyota'),
('Honda'),
('Ford'),
('Chevrolet');

-- Insertar datos en la tabla Automoviles
INSERT INTO Automoviles (modelo, precio, descuento, cilindraje, idMarca, idConcesionario) VALUES
('2023-01-15', 25000.00, 0.00, 2000, 1, 1),
('2023-05-20', 30000.00, 1000.00, 1800, 2, 2),
('2022-11-10', 28000.00, 500.00, 2200, 3, 3),
('2023-03-25', 27000.00, 0.00, 1900, 4, 1),
('2023-09-05', 32000.00, 2000.00, 2100, 1, 2);

-- Insertar datos en la tabla AutomovilCaracteristica
-- Asignar algunas características a diferentes automóviles
INSERT INTO AutomovilCaracteristica (idAutomovil, idCaracteristica) VALUES
(1, 1), -- Aire Acondicionado
(1, 3), -- Asientos de Cuero
(2, 2), -- Sistema de Navegación GPS
(3, 4), -- Sunroof
(4, 5), -- Cámara de Reversa
(5, 1), -- Aire Acondicionado
(5, 2), -- Sistema de Navegación GPS
(5, 4); -- Sunroof

tienda-- Procedimiento almacenado para crear una marca

DELIMITER //
CREATE PROCEDURE InsertarMarca (
    IN nombreMarca VARCHAR(100)
)
BEGIN
    INSERT INTO Marca (marca) VALUES (nombreMarca);
END //
DELIMITER ;


