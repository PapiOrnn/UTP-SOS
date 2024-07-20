
package Entidades;

/** @author Equipo 3*/

public class Farmaco {
    int idFarmaco, stock;
    String nombreFarmaco, estadoProducto;
    double precio;

    // Contructo por Defecto
    public Farmaco() {
    }
    //Obtiene el ID del fármaco.
    public int getIdFarmaco() {
        return idFarmaco;
    }
    //Establece el ID del fármaco.
    public void setIdFarmaco(int idFarmaco) {
        this.idFarmaco = idFarmaco;
    }
    //Obtiene el stock del fármaco.
    public int getStock() {
        return stock;
    }
    //Establece el stock del fármaco.
    public void setStock(int stock) {
        if (stock < 0) {
            throw new IllegalArgumentException("El stock no puede ser negativo.");
        }
        this.stock = stock;
    }
    //Obtiene el nombre del fármaco.
    public String getNombreFarmaco() {
        return nombreFarmaco;
    }
    //Establece el nombre del fármaco.
    public void setNombreFarmaco(String nombreFarmaco) {
        this.nombreFarmaco = nombreFarmaco;
    }
    //Obtiene el estado del producto.
    public String getEstadoProducto() {
        return estadoProducto;
    }
    // Establece el estado del producto.
    public void setEstadoProducto(String estadoProducto) {
        this.estadoProducto = estadoProducto;
    }
    //Obtiene el precio del fármaco.
    public double getPrecio() {
        return precio;
    }
    //Establece el precio del fármaco.
    public void setPrecio(double precio) {
        if (precio < 0) {
            throw new IllegalArgumentException("El precio no puede ser negativo.");
        }
        this.precio = precio;
    }
    
}
