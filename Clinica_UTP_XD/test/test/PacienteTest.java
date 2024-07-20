/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

/**
 *
 * @author Usuario
 */

import Entidades.Paciente;

public class PacienteTest {

    public static void main(String[] args) {
        PacienteTest test = new PacienteTest();
        test.testPacienteGettersAndSetters();
        test.testPacienteEquality();
        test.testPacienteNotEqual();
    }

    public void testPacienteGettersAndSetters() {
        Paciente paciente = new Paciente();
        paciente.setIdPaciente(1);
        paciente.setNombre("Juan");
   //     paciente.setApellido("Perez");  // Entidades Paciente 
   //    paciente.setEdad(30);
   //     paciente.setSexo("M");

        if (paciente.getIdPaciente() == 1 &&
            "Juan".equals(paciente.getNombre()) &&
   //         "Perez".equals(paciente.getApellido()) &&
    //        paciente.getEdad() == 30 &&
            "M".equals(paciente.getSexo())) {
            System.out.println("testPacienteGettersAndSetters passed");
        } else {
            System.out.println("testPacienteGettersAndSetters failed");
        }
    }

    public void testPacienteEquality() {
        Paciente paciente1 = new Paciente();
        paciente1.setIdPaciente(1);
        paciente1.setNombre("Juan");
   //     paciente1.setApellido("Perez");

        Paciente paciente2 = new Paciente();
        paciente2.setIdPaciente(1);
        paciente2.setNombre("Juan");
    //    paciente2.setApellido("Perez");

        if (paciente1.equals(paciente2)) {
            System.out.println("testPacienteEquality passed");
        } else {
            System.out.println("testPacienteEquality failed");
        }
    }

    public void testPacienteNotEqual() {
        Paciente paciente1 = new Paciente();
        paciente1.setIdPaciente(1);
        paciente1.setNombre("Juan");

        Paciente paciente2 = new Paciente();
        paciente2.setIdPaciente(2);
        paciente2.setNombre("Pedro");

        if (!paciente1.equals(paciente2)) {
            System.out.println("testPacienteNotEqual passed");
        } else {
            System.out.println("testPacienteNotEqual failed");
        }
    }
}