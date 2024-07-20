
package ModeloDAO;
/** @author Equipo 3*/
import Entidades.Personal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import ConfigBD.Conexion;

public class PersonalDAO {
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Personal p=new Personal();

    public List listar() {
        ArrayList<Personal>list=new ArrayList<>();
        
        try {
            
            String sql="SELECT * FROM personal INNER JOIN especialidad ON personal.idEspecialidad = especialidad.idEspecialidad INNER JOIN genero ON personal.idSexo = genero.idSexo INNER JOIN documento on documento.idTipoDocumento = personal.idTipoDocumento INNER JOIN roles ON personal.idRol = roles.idRol INNER JOIN usuarios ON personal.idPersonal = usuarios.fk_personal ORDER BY tipoRol ASC";
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Personal per=new Personal();
                per.setIdPersonal(rs.getInt("idPersonal"));
                per.setTipoDocumento(rs.getString("tipoDocumento"));
                per.setDocumento(rs.getString("nroDocumento"));
                per.setNombre(rs.getString("nombrePersonal"));
                per.setApellido_paterno(rs.getString("apellido_pa"));
                per.setApellido_materno(rs.getString("apellido_ma"));
                per.setTipoSexo(rs.getString("tipoSexo"));
                per.setDireccion(rs.getString("direccionPersonal"));
                per.setTelefono(rs.getInt("telefonoPersonal"));

                per.setRol(rs.getInt("idRol"));
                per.setIdEspecialidad(rs.getInt("idEspecialidad"));
              
                   

                per.setEspecialidad(rs.getString("tipoEspecialidad"));
                per.setTipoRol(rs.getString("tipoRol"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List listarEspecialidad() {
        ArrayList<Personal>list=new ArrayList<>();
        String sql="SELECT * from especialidad";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Personal per=new Personal();
                per.setIdEspecialidad(rs.getInt("idEspecialidad"));
                per.setEspecialidad(rs.getString("tipoEspecialidad"));
                per.setCosto(rs.getDouble("costo"));
             
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public Personal listarId(int idPersonal)
    {
        Personal pac=new Personal();
        String sql="select * from personal INNER JOIN especialidad ON especialidad.idEspecialidad = personal.idEspecialidad INNER JOIN roles ON roles.idRol = personal.idRol INNER JOIN usuarios ON usuarios.fk_personal = personal.idPersonal where idPersonal="+idPersonal;
        
         try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                pac.setIdPersonal(rs.getInt(1));
                pac.setDocumento(rs.getString(3));
                pac.setNombre(rs.getString(4));
                pac.setApellido_paterno(rs.getString(5));
                pac.setApellido_materno(rs.getString(6));
                pac.setDireccion(rs.getString(8));
                pac.setTelefono(rs.getInt(9));
                pac.setRol(rs.getInt(10));
                pac.setIdEspecialidad(rs.getInt(11));
                pac.setEspecialidad(rs.getString(13));
                
                pac.setTipoRol(rs.getString(16));
                pac.setCorreo(rs.getString(18));
                pac.setPassword(rs.getString(19));
               
                
            }
        } catch (Exception e) {
        }
         return pac;
    }
    
      public void desactivarUsuario(int idPersonal){
       
        String sql="update usuarios set estado=? where fk_personal="+idPersonal;
        try {
             con=cn.getConexion();
            ps=con.prepareStatement(sql);
            
            ps.setString(1, "desactivado");
            ps.executeUpdate();
        } catch (Exception e) {
        }
      
    }
}
