/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

/**
 *
 * @author 
 */
import Entidades.Paciente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import ConfigBD.Conexion;

public class PacienteDAO {
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Paciente p=new Paciente();
    
    public List listar() {
        ArrayList<Paciente>list=new ArrayList<>();
        String sql="SELECT * FROM paciente INNER JOIN documento ON "
                    + "documento.idTipoDocumento = paciente.idTipoDocumento"
                + " INNER JOIN genero ON paciente.idSexo=genero.idSexo";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Paciente per=new Paciente();
                per.setIdPaciente(rs.getInt("idPaciente"));
                per.setTipoDocumento(rs.getString("tipoDocumento"));
                per.setDocumento(rs.getString("documento"));
                per.setNombre(rs.getString("nombrePaciente"));
                per.setApellido_paterno(rs.getString("apellido_pa"));
                per.setApellido_materno(rs.getString("apellido_ma"));
                per.setTipoSexo(rs.getString("tipoSexo"));
                per.setDireccion(rs.getString("direccionPaciente"));
                per.setTelefono(rs.getInt("telefonoPaciente"));
                
                
                
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
     public Paciente listarId(int idPaciente)
    {
        Paciente pac=new Paciente();
        String sql="select * from paciente INNER JOIN usuarios ON usuarios.fk_paciente = paciente.idPaciente where idPaciente="+idPaciente;
        
         try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                pac.setIdPaciente(rs.getInt(1));
                pac.setDocumento(rs.getString(3));
                pac.setNombre(rs.getString(4));
                pac.setApellido_paterno(rs.getString(5));
                pac.setApellido_materno(rs.getString(6));
                pac.setDireccion(rs.getString(8));
                pac.setTelefono(rs.getInt(9));
                
                pac.setCorreo(rs.getString(11));
                pac.setPassword(rs.getString(12));
                
            }
        } catch (Exception e) {
        }
         return pac;
    }
}
