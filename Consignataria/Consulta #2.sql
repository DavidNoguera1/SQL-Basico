 SELECT 
    a.idAutomoviles AS 'ID Automovil',
    m.marca AS 'Marca',
    a.modelo AS 'Modelo (Fecha de Produccion)',
    a.precio AS 'Precio',
    a.descuento AS 'Descuento',
    a.cilindraje AS 'Cilindraje',
    car.caracteristicas AS 'Caracteristicas',
    car.precio AS 'Precio Caracteristica',
    c.nombre AS 'Concesionario',
    c.direccion AS 'Direccion'
FROM 
    Automoviles a
JOIN 
    Marca m ON a.idMarca = m.idMarca
JOIN 
    Concesionario c ON a.idConcesionario = c.idConcesionario
JOIN 
    AutomovilCaracteristica ac ON a.idAutomoviles = ac.idAutomovil
JOIN 
    Caracteristicas car ON ac.idCaracteristica = car.idCaracteristicas;

