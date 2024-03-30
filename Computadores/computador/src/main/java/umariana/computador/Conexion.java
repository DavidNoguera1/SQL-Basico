
package umariana.computador;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author David Noguera
 */

public class Conexion {

    public static Connection getDBConnection() {
        String url = "jdbc:mysql://localhost:3306/tienda?serverTimezone=UTC";
        String user = "root";
        String password = "admin";

        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
            if (conn != null) {
                System.out.println("Conectado");
            }
        } catch (Exception e) {
            System.out.println("Ha ocurrido un error: " + e.getMessage());
            e.printStackTrace(); // Esto imprimirá la traza de la excepción en la consola
        }
        return conn;
    }
}


