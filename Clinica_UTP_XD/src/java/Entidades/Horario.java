    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author Deary
 */
public class Horario {
    int idHorario, idMedico;
    String fecha, horaInicio, horaFin, estadoHorario, medico,ape_pa,ape_ma;
    
    public Horario() {
    }

    public String getApe_pa() {
        return ape_pa;
    }

    public void setApe_pa(String ape_pa) {
        this.ape_pa = ape_pa;
    }

    public String getApe_ma() {
        return ape_ma;
    }

    public void setApe_ma(String ape_ma) {
        this.ape_ma = ape_ma;
    }

    public int getIdHorario() {
        return idHorario;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(String horaFin) {
        this.horaFin = horaFin;
    }

    public String getEstadoHorario() {
        return estadoHorario;
    }

    public void setEstadoHorario(String estadoHorario) {
        this.estadoHorario = estadoHorario;
    }

    public String getMedico() {
        return medico;
    }

    public void setMedico(String medico) {
        this.medico = medico;
    }

    public int getIdMedico() {
        return idMedico;
    }

    public void setIdMedico(int idMedico) {
        this.idMedico = idMedico;
    }
    
}
