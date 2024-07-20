package Entidades;

/** @author Equipo 3*/

public class DetalleVenta {

    int idDetalleVenta, idVenta, idProducto, cantidad;
    double precioVenta;

    // Contruir por Defecto - Evaluar 
    public DetalleVenta() {
    }
    //Obtiene el ID del detalle de la venta.
    public int getIdDetalleVenta() {
        return idDetalleVenta;
    }
    
    //Establece el ID del detalle de la venta.
    public void setIdDetalleVenta(int idDetalleVenta) {
        this.idDetalleVenta = idDetalleVenta;
    }
    //Obtiene el ID de la venta.
    public int getIdVenta() {
        return idVenta;
    }
    //Establece el ID de la venta.
    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }
    //Obtiene el ID del producto.
    public int getIdProducto() {
        return idProducto;
    }
    //Establece el ID del producto.
    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }
    //Obtiene la cantidad vendida.
    public int getCantidad() {
        return cantidad;
    }
    //Establece la cantidad vendida.
    public void setCantidad(int cantidad) {
        if (cantidad < 0) {
            throw new IllegalArgumentException("La cantidad no puede ser negativa.");
        }
        this.cantidad = cantidad;
    }
    
    
    //Obtiene el precio de venta.
    public double getPrecioVenta() {
        return precioVenta;
    }
    //Establece el precio de venta.
    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

}
