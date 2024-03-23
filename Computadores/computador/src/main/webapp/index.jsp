<%-- 
    Document   : index
    Created on : 20/03/2024, 8:21:45 a. m.
    Author     : Sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TiendaComputadores</title>
    </head>
    <body>
        <h1>Tienda de computadores</h1>
        
        <form action= "sv_agregarMarca"method="POST">
            <label for="marca">Marca</labe>
            <input type="text" name ="marcas">
            <input type="submit" value="Agregar">
        </form>
    </body>
</html>
