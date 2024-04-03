drop database if exists MotosClub;
create database MotosClub;
use MotosClub;

-- Tablas de para Personas y sus Triggers ----------------------------------------------------
-- Tabla fondos
CREATE TABLE fondos (
    idFondo INT PRIMARY KEY AUTO_INCREMENT,
    afiliacion DECIMAL(10, 2),
    mensualidad DECIMAL(10, 2) 
);

-- Insertamos los valores por defecto en la tabla de fondos
INSERT INTO fondos (afiliacion, mensualidad) VALUES 
(00000.00, 00000.00),
(50000.00, 00000.00),
(50000.00, 20000.00);

-- Tabla rangos y rango
CREATE TABLE rangos (
    idRango INT PRIMARY KEY AUTO_INCREMENT,
    rango VARCHAR(20) NOT NULL,
    idFondo INT, -- Agregamos la llave foránea para fondos
    FOREIGN KEY (idFondo) REFERENCES fondos(idFondo)
);

-- Insertamos los valores por defecto en la tabla de rangos
INSERT INTO rangos (rango, idFondo) VALUES 
('Hangaroung', 1), -- Asignamos el mismo fondo a todos los rangos inicialmente
('Prospect', 2),
('FullColors', 3);


-- Tabla experiencia
CREATE TABLE experiencia (
    idExperiencia INT PRIMARY KEY AUTO_INCREMENT,
    experiencia VARCHAR(20) NOT NULL
);

-- Insertar valores de experiencia en la tabla experiencia
INSERT INTO experiencia (experiencia) VALUES 
('Novato'),
('Intermedio'),
('Experto');

-- Tabla de recorrido
CREATE TABLE recorrido (
    idRecorrido INT PRIMARY KEY AUTO_INCREMENT,
    kilometraje DECIMAL(10, 2) NOT NULL,
    idExperiencia INT,
    FOREIGN KEY (idExperiencia) REFERENCES experiencia(idExperiencia)
);

-- Eliminamos el trigger anterior si existe
DROP TRIGGER IF EXISTS asignar_experiencia;

-- Creamos un nuevo trigger para asignar la experiencia al recorrido
DELIMITER //
CREATE TRIGGER asignar_experiencia BEFORE INSERT ON recorrido
FOR EACH ROW
BEGIN
    -- Asignar la experiencia según el kilometraje
    IF NEW.kilometraje >= 5000 THEN
        SET NEW.idExperiencia = 3; -- ID de la experiencia "Experto"
    ELSEIF NEW.kilometraje >= 2000 AND NEW.kilometraje < 5000 THEN
        SET NEW.idExperiencia = 2; -- ID de la experiencia "Intermedio"
    ELSE
        SET NEW.idExperiencia = 1; -- ID de la experiencia "Novato"
    END IF;
END;
//
DELIMITER ;

-- Insertar valores por defecto en el rango de 500 a 7000 kilómetros
INSERT INTO recorrido (kilometraje) VALUES 
(500), (1000), (1500), (2000), (2500), (3000), 
(3500), (4000), (4500), (5000), (5500), (6000), 
(6500), (7000);

-- Tabla de roles y roles:
CREATE TABLE roles (
    idRol INT PRIMARY KEY AUTO_INCREMENT,
    rol VARCHAR(50) NOT NULL
);

INSERT INTO roles (rol) VALUES 
('Miembro comun'),
('Presidente'),
('Vicepresidente'),
('Capitan de Ruta'), 
('Tesorero'),
('Sargento de Armas'),
('Secretario');

-- Tabla de personas
CREATE TABLE personas (
    idPersona INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) ,
    celular VARCHAR(20) NOT NULL,
    correo_electronico VARCHAR(100) ,
    contraseña VARCHAR(100) NOT NULL,
    fechaN DATE NOT NULL,
    idRango INT,
    idRecorrido INT,
    idRol INT, -- Agregamos la llave foránea para los roles
    FOREIGN KEY (idRango) REFERENCES rangos(idRango),
    FOREIGN KEY (idRecorrido) REFERENCES recorrido(idRecorrido),
    FOREIGN KEY (idRol) REFERENCES roles(idRol) -- Agregamos la llave foránea para los roles
);

-- Creamos un nuevo trigger para asignar el rol según el rango al insertar una nueva persona
-- Eliminamos el trigger actual si existe
DROP TRIGGER IF EXISTS asignar_rol_despues_de_insertar;
DELIMITER //
CREATE TRIGGER asignar_rol_despues_de_insertar BEFORE INSERT ON personas
FOR EACH ROW
BEGIN
    DECLARE miembro_comun_id INT;

    -- Obtenemos el ID del rol de "Miembro comun"
    SELECT idRol INTO miembro_comun_id FROM roles WHERE rol = 'Miembro comun';

    -- Si el rango es "FullColors", asignamos el rol correspondiente
    IF NEW.idRango = 3 THEN
        SET NEW.idRol = NEW.idRol; -- Mantenemos el idRol que se inserta
    ELSE
        -- Si no es "FullColors", asignamos el ID del rol de "Miembro comun"
        SET NEW.idRol = miembro_comun_id;
    END IF;
END;
//
-- Insertar el dato de prueba en la tabla de personas con el rol de "Tesorero"
INSERT INTO personas (nombres, apellidos, cedula, celular, correo_electronico, contraseña, fechaN, idRango, idRecorrido, idRol)
VALUES ('David Noguera', 'Noguera Ibarra', '12345678', '123456789', 'prueba@gmail.com', '123', '2004-10-09', 3, 7, 5),
('Samuel Enrique ', 'Bolaños', '987654321', '987654321', 'prueba@egmail.com', 'contraseña', '2002-01-01', 2, 7, 5),
('Ejemplo 1', 'Prueba', '123', '123', 'prueba@egmail.com', 'contra', '2000-03-01', 2, 7, 5);



-- Tablas de para Motos ----------------------------------------------------

CREATE TABLE marca (
    idMarca INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL
);

INSERT INTO marca (marca) VALUES 
('Honda'),('Yamaha'), ('Kawasaki');

CREATE TABLE linea (
    idLinea INT PRIMARY KEY AUTO_INCREMENT,
    linea VARCHAR(50) NOT NULL,
    idMarca INT,
    FOREIGN KEY (idMarca) REFERENCES marca(idMarca)
);

INSERT INTO linea (linea, idMarca) VALUES
('CBR', 1),           -- Honda
('Africa Twin', 1),   -- Honda
('YZF-R1', 2),        -- Yamaha
('MT Series', 2),     -- Yamaha
('Ninja', 3),         -- Kawasaki
('Z Series', 3);      -- Kawasaki

CREATE TABLE tipoMoto (
    idTipoMoto INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(100) NOT NULL
);

INSERT INTO tipoMoto (tipo) VALUES
('Sport'), ('Naked'), ('Cruiser'), ('Touring');

CREATE TABLE moto (
    idMoto INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(20),
    color VARCHAR(20),
    cilindraje DECIMAL(10, 2),
    soat DATE,
    rtm DATE,
    idLinea INT,
    idTipoMoto INT,
    idPersona INT,
    FOREIGN KEY (idLinea) REFERENCES linea(idLinea),
    FOREIGN KEY (idTipoMoto) REFERENCES tipoMoto(idTipoMoto),
    FOREIGN KEY (idPersona) REFERENCES personas(idPersona)
);

-- Insertar motos 
INSERT INTO moto (placa, color, cilindraje, soat, rtm, idLinea, idTipoMoto, idPersona) VALUES
('ABC123', 'Rojo', 600.00, '2024-04-01', '2024-06-01', 2, 3, 1),  -- Moto Honda CBR para la Persona 1
('DEF456', 'Azul', 1000.00, '2024-04-15', '2024-07-15', 3, 2, 2), -- Moto Yamaha YZF-R1 para la Persona 2
('GHI789', 'Negro', 900.00, '2024-05-01', '2024-08-01', 5, 4, 3);  -- Moto Kawasaki Ninja para la Persona 3

-- Vistas

CREATE VIEW Integrantes_Y_Motos AS
SELECT 
    p.nombres AS 'Nombres',
    p.apellidos AS 'Apellidos',
    ma.marca AS 'Marca',
    l.linea AS 'Línea',
    m.cilindraje AS 'Cilindraje',
    m.placa AS 'Placa'
FROM 
    moto m
JOIN 
    linea l ON m.idLinea = l.idLinea
JOIN 
    marca ma ON l.idMarca = ma.idMarca
JOIN 
    personas p ON m.idPersona = p.idPersona;

-- Vistas

CREATE VIEW Ingresos_Mes AS
SELECT 
    p.nombres AS 'Nombres',
    p.apellidos AS 'Apellidos',
    p.cedula AS 'Cédula',
    r.rango AS 'Rango',
    f.afiliacion AS 'Afiliación',
    f.mensualidad AS 'Mensualidad'
FROM 
    personas p
JOIN 
    rangos r ON p.idRango = r.idRango
JOIN 
    fondos f ON r.idFondo = f.idFondo;
    
-- Vistas
CREATE VIEW Junta AS
SELECT 
    p.nombres AS 'Nombres',
    p.apellidos AS 'Apellidos',
    p.cedula AS 'Cédula',
    ro.rol AS 'Cargo',
    r.rango AS 'Rango',
    rec.kilometraje AS 'Kilometraje'
FROM 
    personas p
JOIN 
    recorrido rec ON p.idRecorrido = rec.idRecorrido
JOIN 
    roles ro ON p.idRol = ro.idRol
JOIN 
    rangos r ON p.idRango = r.idRango;
    
-- Vista

CREATE VIEW Junta_Fullcolor AS
/*Creo esta tabla por si acaso debido a que solo los 
miebros FullColors pueden estar asumir un rol de la
junta
*/
SELECT 
    p.nombres AS 'Nombres',
    p.apellidos AS 'Apellidos',
    p.cedula AS 'Cédula',
    ro.rol AS 'Cargo',
    r.rango AS 'Rango',
    rec.kilometraje AS 'Kilometraje'
FROM 
    personas p
JOIN 
    recorrido rec ON p.idRecorrido = rec.idRecorrido
JOIN 
    roles ro ON p.idRol = ro.idRol
JOIN 
    rangos r ON p.idRango = r.idRango
WHERE 
    r.rango = 'FullColors';

