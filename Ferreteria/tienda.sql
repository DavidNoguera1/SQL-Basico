-- crear base de datos tienda
DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda;
USE tienda;

-- Crear la tabla de Productos
CREATE TABLE productos (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    nombreProducto VARCHAR(100),
    precio DECIMAL(10, 2)
);

-- Insertar datos en la tabla de Productos
INSERT INTO productos (nombreProducto, precio) VALUES
('Laptop', 800),
('Teléfono', 400),
('Tableta', 300),
('Micrófono', 200),
('Auriculares', 100);

-- Crear la tabla de Clientes
CREATE TABLE clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

-- Insertar datos en la tabla de clientes
INSERT INTO clientes (idCliente, nombre, email) VALUES
(1, 'Hugo Perez', 'hperez@gmail.com'),
(2, 'Paco Suarez', 'psuarez@gmail.com'),
(3, 'Luis Guancha', 'lguancha@gmail.com'),
(4, 'Lucas Miranda', 'lmiranda@gmail.com'),
(5, 'Pedro López', 'plopez@gmail.com');


-- Crear la tabla de Ventas
CREATE TABLE ventas (
    idVenta INT AUTO_INCREMENT PRIMARY KEY,
    idProducto INT,
    idCliente INT,
    cantidad INT,
    FOREIGN KEY (idProducto) REFERENCES productos(idProducto),
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
);

-- Insertar datos en la tabla de Ventas
INSERT INTO ventas (idProducto, idCliente, cantidad) VALUES
(1, 1, 2),
(3, 2, 1),
(2, 3, 3),
(5, 4, 1),
(4, 5, 2);

-- Creacion de vista (Solo sirven como consultas)
USE tienda;
CREATE  OR REPLACE VIEW v_ventas AS
SELECT v.cantidad,p.idProducto,p.nombreProducto,p.precio,c.idCliente,c.nombre,c.email
FROM ventas v
JOIN productos p
ON v.idProducto = p.idProducto
JOIN clientes c
ON v.idCliente = c.idCliente;

-- Creacion de un metodo
DELIMITER $$
USE tienda$$
CREATE PROCEDURE insertarCliente (
	IN nombre VARCHAR(100),
	IN email VARCHAR(100)
)
BEGIN
INSERT INTO clientes ( nombre, email) 
VALUES(nombre, email);
END$$
DELIMITER ;