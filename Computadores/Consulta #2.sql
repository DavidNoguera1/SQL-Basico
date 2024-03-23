SELECT c.idComputadores, m.marca, c.procesador, c.memoriaRAM, c.almacenamiento, c.precio AS Precio_Dolares, cat.tipo AS tipo_computador, c.descripcion
FROM computador c
JOIN marcas m ON c.idMarca = m.idMarca
JOIN categoria cat ON c.idCategoria = cat.idCategoria;