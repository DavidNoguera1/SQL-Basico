SELECT 
    p.nombres AS 'Nombre',
    p.apellidos AS 'Apellido',
    p.cedula AS 'Cédula',
    p.celular AS 'Celular',
    p.correo_electronico AS 'Correo Electrónico',
    p.fechaN AS 'Fecha de Nacimiento',
    r.rango AS 'Rango',
    f.afiliacion AS 'Afiliación',
    f.mensualidad AS 'Mensualidad',
    e.experiencia AS 'Experiencia',
    rec.kilometraje AS 'Recorrido (Kilometraje)',
    ro.rol AS 'Rol'
FROM 
    personas p
JOIN 
    rangos r ON p.idRango = r.idRango
JOIN 
    fondos f ON r.idFondo = f.idFondo
JOIN 
    recorrido rec ON p.idRecorrido = rec.idRecorrido
JOIN 
    experiencia e ON rec.idExperiencia = e.idExperiencia
JOIN 
    roles ro ON p.idRol = ro.idRol;


