/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ConfigBD.Conexion;
import Entidades.Horario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 *
 * @author Christian
 */
public class HorarioDAO {
     Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Horario p=new Horario();
    
   public List listar() {
        ArrayList<Horario>list=new ArrayList<>();
        String sql="SELECT * FROM horario INNER JOIN personal ON personal.idPersonal = horario.idPersonal ORDER BY fechaHorario";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Horario per=new Horario();
                per.setIdHorario(rs.getInt("idHorario"));
                per.setHoraFin(rs.getString("horarioFin"));
                per.setHoraInicio(rs.getString("horarioInicio"));
                per.setFecha(rs.getString("fechaHorario"));
                per.setEstadoHorario(rs.getString("estadoHorario"));
                per.setMedico(rs.getString("nombrePersonal"));
                per.setApe_pa(rs.getString("apellido_pa"));
                per.setApe_ma(rs.getString("apellido_ma"));
                
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
   public List listarMedicos() {
        ArrayList<Horario>list=new ArrayList<>();
        String sql="SELECT idPersonal, nombrePersonal, apellido_pa, apellido_ma FROM personal WHERE idRol=3 OR idRol=4";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Horario per=new Horario();
                per.setIdMedico(rs.getInt("idPersonal"));
                per.setMedico(rs.getString("nombrePersonal"));
                per.setApe_pa(rs.getString("apellido_pa"));
                per.setApe_ma(rs.getString("apellido_ma"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
   public void eliminarHorario(int idHorario){
        String sql="delete from horario where idHorario="+idHorario;
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
   public Horario listarId(int idHorario)
    {
        Horario hor=new Horario();
        String sql="select * from horario INNER JOIN personal ON horario.idpersonal = personal.idPersonal where idHorario="+idHorario;
        
         try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                hor.setIdHorario(rs.getInt(1));
                hor.setHoraInicio(rs.getString(2));
                hor.setHoraFin(rs.getString(3));
                hor.setFecha(rs.getString(4));
                hor.setIdMedico(rs.getInt(6));
                hor.setMedico(rs.getString(10));
                hor.setApe_pa(rs.getString(11));
                hor.setApe_ma(rs.getString(12));
                
            }
        } catch (Exception e) {
        }
         return hor;
    }
}
