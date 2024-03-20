SELECT 
m.nombre AS NombreMascota, tr.tipo AS tratamiento ,m.edad AS Edad, pr.nombres AS Propietario, pr.telefono AS Telefono, tm.tipo AS Tipo , m.raza AS Raza
FROM mascotas m
JOIN propietarios pr ON m.idPropietario = pr.idPropietario
JOIN tipoMascota tm ON m.idTipo = tm.idTipo
JOIN tratamiento tr ON m.idTratamiento = tr.idTratamiento;