/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

/**
 *
 * @author Usuario
 */


import ConfigBD.Conexion;
import java.sql.Connection;
import java.sql.SQLException;

public class ConexionTest {

    private Conexion conexion;
    private Connection conn;

    public static void main(String[] args) {
        ConexionTest test = new ConexionTest();
        test.setUp();
        test.testConexionNotNull();
        test.testConexionValid();
        test.tearDown();
    }

    public void setUp() {
        conexion = new Conexion();
       // conn = conexion.conectar();
    }

    public void testConexionNotNull() {
        if (conn != null) {
            System.out.println("testConexionNotNull passed");
        } else {
            System.out.println("testConexionNotNull failed");
        }
    }

    public void testConexionValid() {
        try {
            if (!conn.isClosed()) {
                System.out.println("testConexionValid passed");
            } else {
                System.out.println("testConexionValid failed");
            }
        } catch (SQLException e) {
            System.out.println("testConexionValid failed with exception: " + e.getMessage());
        }
    }

    public void tearDown() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("tearDown failed with exception: " + e.getMessage());
        }
    }
}
