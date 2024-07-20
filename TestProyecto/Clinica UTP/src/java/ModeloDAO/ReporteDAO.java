/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;
import ConfigBD.Conexion;
import Entidades.Solicitud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
public class ReporteDAO {
    
    
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Solicitud p=new Solicitud();
    
    public List listar() {
        ArrayList<Solicitud>list=new ArrayList<>();
        String sql="SELECT * FROM solicitud INNER JOIN paciente ON paciente.idPaciente = solicitud.idPaciente INNER JOIN personal ON personal.idPersonal = solicitud.idPersonal INNER JOIN servicio ON servicio.idServicio = solicitud.idServicio INNER JOIN especialidad ON personal.idEspecialidad = especialidad.idEspecialidad";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Solicitud per=new Solicitud();
                per.setIdSolicitud(rs.getInt("idSolicitud"));
                per.setNomPaciente(rs.getString("nombrePaciente"));
                per.setApellidoPaternoPaciente(rs.getString("apellido_pa"));
                per.setApellidoMaternoPaciente(rs.getString("apellido_ma"));
                per.setNombreMedico(rs.getString("nombrePersonal"));
                per.setApellidoPaternoMedico(rs.getString("apellido_pa"));
                per.setApellidoMaternoMedico(rs.getString("apellido_ma"));
                per.setIdPersonal(rs.getInt("idPersonal"));
                per.setTipoCita(rs.getString("tipoEspecialidad"));
                per.setIdHorario(rs.getInt("idHorario"));
                per.setCosto(rs.getDouble("costo"));
                per.setModalidad(rs.getString("modalidad"));
                per.setFecha(rs.getString("fecha"));
                per.setEstadoServicio(rs.getString("estadoServicio"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List listarEmergencia() {
        ArrayList<Solicitud>list=new ArrayList<>();
        String sql="SELECT * FROM solicitud WHERE prioridad='emergencia'";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Solicitud per=new Solicitud();
                per.setIdSolicitud(rs.getInt("idSolicitud"));
                per.setIdPaciente(rs.getInt("idPaciente"));
                per.setIdPersonal(rs.getInt("idPersonal"));
                per.setIdServicio(rs.getInt("idServicio"));
                per.setIdHorario(rs.getInt("idHorario"));
                per.setCosto(rs.getDouble("costo"));
                per.setModalidad(rs.getString("modalidad"));
                per.setFecha(rs.getString("fecha"));
                per.setEstadoServicio(rs.getString("estadoServicio"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List listarAnalisis() {
        ArrayList<Solicitud>list=new ArrayList<>();
        String sql="SELECT * FROM solicitud WHERE idAnalisis =! null";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Solicitud per=new Solicitud();
                per.setIdSolicitud(rs.getInt("idSolicitud"));
                per.setIdPaciente(rs.getInt("idPaciente"));
                per.setIdPersonal(rs.getInt("idPersonal"));
                per.setIdServicio(rs.getInt("idServicio"));
                per.setIdHorario(rs.getInt("idHorario"));
                per.setCosto(rs.getDouble("costo"));
                per.setModalidad(rs.getString("modalidad"));
                per.setFecha(rs.getString("fecha"));
                per.setEstadoServicio(rs.getString("estadoServicio"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List listarSumaCita() {
        ArrayList<Solicitud>list=new ArrayList<>();
        String sql="SELECT SUM(costo) AS 'sumaTotalCita' FROM solicitud";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Solicitud per=new Solicitud();
               per.setSumaCita(rs.getDouble("sumaTotalCita"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
 
    
    
    public List listaContarCita() {
        ArrayList<Solicitud>list=new ArrayList<>();
        String sql="SELECT COUNT(idSolicitud) AS 'conteoCita' FROM solicitud";
        try {
            con=cn.getConexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Solicitud per=new Solicitud();
               per.setConteoCita
                (rs.getInt("conteoCita"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
