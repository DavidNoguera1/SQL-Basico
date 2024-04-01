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
    fecha DATE,
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

-- Creacion de un procedimiento para insertar un cliente
DELIMITER $$
USE tienda$$
CREATE PROCEDURE insertarCliente (
	IN nombre VARCHAR(100),
	IN email VARCHAR(100)
)
BEGIN
INSERT INTO clientes (nombre, email) 
VALUES(nombre, email);
END$$
DELIMITER ;

-- Creacion de triggers o disparadores
/*
DELIMITER //
CREATE TRIGGER actualizar_precio_total
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
	DECLARE precio_producto DECIMAL(10,2);
    DECLARE total_venta DECIMAL(10,2);
    -- obtener el precio del producto vendido
    SELECT precio INTO precio_producto 
    FROM productos
    WHERE idProducto=NEW.IdProducto;
    -- calcular el total de la venta
    SET total_venta = precio_producto * NEW.cantidad;
    -- actualizar el precio total de la venta en la tabla ventas
    UPDATE ventas 
    SET precio_total = total_venta
    WHERE idVenta=NEW.idVenta;
END //
DELIMITER ; */

INSERT INTO ventas (idProducto, idCliente, cantidad, fecha) VALUES
(1, 1, 2, '2023/03/19');

-- Creando un trigger de registro (Para AFTER)

CREATE TABLE registroventas (
	idRegistroVentas INT AUTO_INCREMENT PRIMARY KEY,
    ultimaActualizacion DATE
);

DELIMITER //
CREATE TRIGGER actualizarRegistro
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
	INSERT INTO registroventas SET ultimaActualizacion=NEW.fecha;
END //
DELIMITER ;

-- Creando un trigger (para BEFORE)
DELIMITER //
CREATE TRIGGER borrarProducto
BEFORE DELETE ON productos
FOR EACH ROW
BEGIN
	DECLARE miProducto INT;
	SELECT count(*) INTO miProducto FROM ventas 
    WHERE idProducto=OLD.idProducto;
    IF miProducto = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no existe';
    END IF;
END
//
DELIMITER 
