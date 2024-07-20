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
public class Farmaco {
    int idFarmaco, stock;
    String nombreFarmaco, estadoProducto;
    double precio;

    public Farmaco() {
    }

    public int getIdFarmaco() {
        return idFarmaco;
    }

    public void setIdFarmaco(int idFarmaco) {
        this.idFarmaco = idFarmaco;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getNombreFarmaco() {
        return nombreFarmaco;
    }

    public void setNombreFarmaco(String nombreFarmaco) {
        this.nombreFarmaco = nombreFarmaco;
    }

    public String getEstadoProducto() {
        return estadoProducto;
    }

    public void setEstadoProducto(String estadoProducto) {
        this.estadoProducto = estadoProducto;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
}
