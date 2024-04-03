SELECT 
    p.nombres AS 'Nombre del Propietario',
    m.idMoto AS 'ID Moto',
    m.placa AS 'Placa',
    m.color AS 'Color',
    m.cilindraje AS 'Cilindraje (cc)',
    m.soat AS 'Fecha de Vencimiento SOAT',
    m.rtm AS 'Fecha de Vencimiento RTM',
    ma.marca AS 'Marca',
    l.linea AS 'Línea',
    tm.tipo AS 'Tipo de Moto'
FROM 
    moto m
JOIN 
    linea l ON m.idLinea = l.idLinea
JOIN 
    tipoMoto tm ON m.idTipoMoto = tm.idTipoMoto
JOIN 
    personas p ON m.idPersona = p.idPersona
JOIN 
    marca ma ON l.idMarca = ma.idMarca;

