
package Entidades;

/** @author Equipo 3*/
public class Solicitud {
    
    protected int idSolicitud, idPaciente, idPersonal, idServicio, idEspecialidad, idHorario,conteoCita, conteoCitaEmergencia, conteoAnalisis, idAnalisis, historiaXanalisis;
    protected double costo;
    protected String modalidad,estadoServicio,especialidad,horarioInicio,horarioFin,personal,fecha, nomPaciente, docu,prioridad,nombreAnalisis;
    protected String nombrePaciente, nombreMedico, tipoCita, tipoHorario, apellidoPaternoPaciente,apellidoMaternoPaciente,apellidoPaternoMedico,apellidoMaternoMedico;
    protected double sumaCita,sumaCitaEmergencia, sumaAnalisis;
    public Solicitud() {
    }

    public int getIdSolicitud() {
        return idSolicitud;
    }

    public int getConteoCita() {
        return conteoCita;
    }

    public void setConteoCita(int conteoCita) {
        this.conteoCita = conteoCita;
    }

    public int getConteoCitaEmergencia() {
        return conteoCitaEmergencia;
    }

    public void setConteoCitaEmergencia(int conteoCitaEmergencia) {
        this.conteoCitaEmergencia = conteoCitaEmergencia;
    }

    public int getConteoAnalisis() {
        return conteoAnalisis;
    }

    public void setConteoAnalisis(int conteoAnalisis) {
        this.conteoAnalisis = conteoAnalisis;
    }

    public double getSumaCitaEmergencia() {
        return sumaCitaEmergencia;
    }

    public void setSumaCitaEmergencia(double sumaCitaEmergencia) {
        this.sumaCitaEmergencia = sumaCitaEmergencia;
    }

    public double getSumaAnalisis() {
        return sumaAnalisis;
    }

    public void setSumaAnalisis(double sumaAnalisis) {
        this.sumaAnalisis = sumaAnalisis;
    }

    public double getSumaCita() {
        return sumaCita;
    }

    public void setSumaCita(double sumaCita) {
        this.sumaCita = sumaCita;
    }

    

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public String getApellidoPaternoPaciente() {
        return apellidoPaternoPaciente;
    }

    public void setApellidoPaternoPaciente(String apellidoPaternoPaciente) {
        this.apellidoPaternoPaciente = apellidoPaternoPaciente;
    }

    public String getApellidoMaternoPaciente() {
        return apellidoMaternoPaciente;
    }

    public void setApellidoMaternoPaciente(String apellidoMaternoPaciente) {
        this.apellidoMaternoPaciente = apellidoMaternoPaciente;
    }

    public String getApellidoPaternoMedico() {
        return apellidoPaternoMedico;
    }

    public void setApellidoPaternoMedico(String apellidoPaternoMedico) {
        this.apellidoPaternoMedico = apellidoPaternoMedico;
    }

    public String getApellidoMaternoMedico() {
        return apellidoMaternoMedico;
    }

    public void setApellidoMaternoMedico(String apellidoMaternoMedico) {
        this.apellidoMaternoMedico = apellidoMaternoMedico;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public String getNombreMedico() {
        return nombreMedico;
    }

    public void setNombreMedico(String nombreMedico) {
        this.nombreMedico = nombreMedico;
    }

    public String getTipoCita() {
        return tipoCita;
    }

    public void setTipoCita(String tipoCita) {
        this.tipoCita = tipoCita;
    }

    public String getTipoHorario() {
        return tipoHorario;
    }

    public void setTipoHorario(String tipoHorario) {
        this.tipoHorario = tipoHorario;
    }

    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getModalidad() {
        return modalidad;
    }

    public int getIdHorario() {
        return idHorario;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }
    
    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    public String getEstadoServicio() {
        return estadoServicio;
    }

    public void setEstadoServicio(String estadoServicio) {
        this.estadoServicio = estadoServicio;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getHorarioInicio() {
        return horarioInicio;
    }

    public void setHorarioInicio(String horarioInicio) {
        this.horarioInicio = horarioInicio;
    }

    public String getHorarioFin() {
        return horarioFin;
    }

    public void setHorarioFin(String horarioFin) {
        this.horarioFin = horarioFin;
    }

    public String getPersonal() {
        return personal;
    }

    public void setPersonal(String personal) {
        this.personal = personal;
    }

    public int getIdPersonal() {
        return idPersonal;
    }

    public void setIdPersonal(int idPersonal) {
        this.idPersonal = idPersonal;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(int idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
    }

    public String getNomPaciente() {
        return nomPaciente;
    }

    public void setNomPaciente(String nomPaciente) {
        this.nomPaciente = nomPaciente;
    }

    public String getDocu() {
        return docu;
    }

    public void setDocu(String docu) {
        this.docu = docu;
    }

    public int getIdAnalisis() {
        return idAnalisis;
    }

    public void setIdAnalisis(int idAnalisis) {
        this.idAnalisis = idAnalisis;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getNombreAnalisis() {
        return nombreAnalisis;
    }

    public void setNombreAnalisis(String nombreAnalisis) {
        this.nombreAnalisis = nombreAnalisis;
    }

    public int getHistoriaXanalisis() {
        return historiaXanalisis;
    }

    public void setHistoriaXanalisis(int historiaXanalisis) {
        this.historiaXanalisis = historiaXanalisis;
    }
    
}
    

    