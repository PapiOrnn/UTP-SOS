package Entidades;

/** @author Equipo 3*/

public class Especialidad {
    int idEspecialidad;
    String nomEspecialidad;
    double costo;
    
    // Constructor por defecto. - Evaluar
    public Especialidad() {
    }
    // Obtiene el ID de la especialidad.
    public int getIdEspecialidad() {
        return idEspecialidad;
    }
    //Establece el ID de la especialidad.
    public void setIdEspecialidad(int idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
    }
    //Obtiene el nombre de la especialidad.
    public String getNomEspecialidad() {
        return nomEspecialidad;
    }
    //Establece el nombre de la especialidad.
    public void setNomEspecialidad(String nomEspecialidad) {
        this.nomEspecialidad = nomEspecialidad;
    }
    //Obtiene el costo de la especialidad.
    public double getCosto() {
        return costo;
    }
    //Establece el costo de la especialidad.
    public void setCosto(double costo) {
        if (costo < 0) {
            throw new IllegalArgumentException("El costo no puede ser negativo.");
        }
        this.costo = costo;
    }
    
}
