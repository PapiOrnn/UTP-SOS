/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author 
 */
public class TiposAnalisis {
    int idAnalisis;
    String nombreAnalisis;
    double precioAnalisis;

    public TiposAnalisis() {
    }

    public int getIdAnalisis() {
        return idAnalisis;
    }

    public void setIdAnalisis(int idAnalisis) {
        this.idAnalisis = idAnalisis;
    }

    public String getNombreAnalisis() {
        return nombreAnalisis;
    }

    public void setNombreAnalisis(String nombreAnalisis) {
        this.nombreAnalisis = nombreAnalisis;
    }

    public double getPrecioAnalisis() {
        return precioAnalisis;
    }

    public void setPrecioAnalisis(double precioAnalisis) {
        this.precioAnalisis = precioAnalisis;
    }
    
}
