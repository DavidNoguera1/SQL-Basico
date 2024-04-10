/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package umariana.computador;

import java.io.IOException;
import java.sql.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class SvAgregar extends HttpServlet {

        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el parámetro de la marca del formulario
        String marca = request.getParameter("marca");
        
        // Obtener la conexión de la clase Conexion
        Connection conn = Conexion.getDBConnection();
        
        if (conn != null) {
            try {
                // Preparar la llamada al procedimiento almacenado
                CallableStatement stmt = conn.prepareCall("{call InsertarMarca(?)}");
                stmt.setString(1, marca); // Establecer el parámetro de marca
                
                // Ejecutar el procedimiento almacenado
                stmt.execute();
                
                // Cerrar la conexión
                conn.close();
                
                // Redireccionar o mostrar un mensaje de éxito
                response.sendRedirect("index.jsp"); // Redireccionar al formulario
            } catch (SQLException e) {
                // Manejar cualquier error de SQL
                e.printStackTrace(); // Esto imprimirá la traza de la excepción en la consola del servidor
                // Puedes manejar el error de otra manera, como mostrar un mensaje de error en la página
                response.getWriter().println("Error al agregar la marca. Por favor, inténtelo de nuevo."); // Esto mostrará un mensaje de error en la página
            }
        } else {
            // Manejar el caso en que no se pueda obtener una conexión a la base de datos
            response.getWriter().println("No se pudo establecer una conexión a la base de datos."); // Esto mostrará un mensaje de error en la página
        }
    }

}
