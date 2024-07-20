
package ConfigBD;

import java.beans.*;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

/** @author Equipo 3*/

public class Conexion {
    public static Connection getConexion()
    {
        Connection cn = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost/clinica","root","");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return cn;
    }
}
