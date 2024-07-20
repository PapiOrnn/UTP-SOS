
package Entidades;

/** @author Equipo 3*/

public class Horario {
    int idHorario, idMedico;
    String fecha, horaInicio, horaFin, estadoHorario, medico,ape_pa,ape_ma;
    
    //Constructor por defecto.
    public Horario() {
    }
    // Compañero Edu ------> Responsable Corregir Abreviaciones Por Favor - Fecha 05 07 2024
    //Obtiene el apellido paterno del médico.
    public String getApe_pa() {
        return ape_pa;
    }
    //Establece el apellido paterno del médico.
    public void setApe_pa(String ape_pa) {
        this.ape_pa = ape_pa;
    }
    // Obtiene el apellido materno del médico.
    public String getApe_ma() {
        return ape_ma;
    }
   // Establece el apellido materno del médico.
    public void setApe_ma(String ape_ma) {
        this.ape_ma = ape_ma;
    }
   //Obtiene el ID del horario.
    public int getIdHorario() {
        return idHorario;
    }
   // Establece el ID del horario.
    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }
   //Obtiene la fecha del horario.
    public String getFecha() {
        return fecha;
    }
   //Establece la fecha del horario.
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
   //Obtiene la hora de inicio del horario.
    public String getHoraInicio() {
        return horaInicio;
    }
   //Establece la hora de inicio del horario.
    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }
   //Obtiene la hora de fin del horario.
    public String getHoraFin() {
        return horaFin;
    }
   // Establece la hora de fin del horario.
    public void setHoraFin(String horaFin) {
        this.horaFin = horaFin;
    }
   // Obtiene el estado del horario.
    public String getEstadoHorario() {
        return estadoHorario;
    }
   //Establece el estado del horario.
    public void setEstadoHorario(String estadoHorario) {
        this.estadoHorario = estadoHorario;
    }
   //Obtiene el nombre del médico.
    public String getMedico() {
        return medico;
    }
   //Establece el nombre del médico.
    public void setMedico(String medico) {
        this.medico = medico;
    }
   //Obtiene el ID del médico.
    public int getIdMedico() {
        return idMedico;
    }
   //Establece el ID del médico.
    public void setIdMedico(int idMedico) {
        this.idMedico = idMedico;
    }
    
}
