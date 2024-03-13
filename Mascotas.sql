SELECT 
m.nombre AS NombreMascota, m.edad AS Edad, u.nombres AS Propietario, u.telefono AS Telefono, tm.tipo AS Tipo , m.raza AS Raza
FROM mascotas m
JOIN usuario u ON m.idPropietario = u.idPropietario
JOIN tipoMascota tm ON m.idTipo = tm.idTipo;

