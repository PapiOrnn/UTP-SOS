
package Entidades;

/** @author Equipo 3*/
public class ResultadoLaboratorio {
    int idResultado, idSolicitud;
    String fecha, resultadoLaboratorio, nombreAnalisis;

    public ResultadoLaboratorio() {
    }

    public int getIdResultado() {
        return idResultado;
    }

    public void setIdResultado(int idResultado) {
        this.idResultado = idResultado;
    }

    public int getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getResultadoLaboratorio() {
        return resultadoLaboratorio;
    }

    public void setResultadoLaboratorio(String resultadoLaboratorio) {
        this.resultadoLaboratorio = resultadoLaboratorio;
    }

    public String getNombreAnalisis() {
        return nombreAnalisis;
    }

    public void setNombreAnalisis(String nombreAnalisis) {
        this.nombreAnalisis = nombreAnalisis;
    }
    
}
