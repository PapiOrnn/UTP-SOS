/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ConfigBD.Conexion;
import Entidades.Especialidad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 
 */
public class EspecialidadDAO {
     Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Especialidad p=new Especialidad();
    
    public List listar() {
        ArrayList<Especialidad>list=new ArrayList<>();
        String sql="SELECT * FROM especialidad WHERE idEspecialidad !=0 ORDER BY tipoEspecialidad DESC";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Especialidad per=new Especialidad();
                per.setIdEspecialidad(rs.getInt("idEspecialidad"));
                per.setNomEspecialidad(rs.getString("tipoEspecialidad"));
                per.setCosto(rs.getDouble("costo"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void eliminarEspecialidad(int idEspecialidad){
        String sql="delete from especialidad where idEspecialidad="+idEspecialidad;
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public Especialidad listarId(int idEspecialidad)
    {
        Especialidad esp=new Especialidad();
        String sql="select * from especialidad where idEspecialidad="+idEspecialidad;
       
         try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                esp.setIdEspecialidad(rs.getInt(1));
                esp.setNomEspecialidad(rs.getString(2));
                esp.setCosto(rs.getDouble(3));
            }
        } catch (Exception e) {
        }
         return esp;
    }
}
