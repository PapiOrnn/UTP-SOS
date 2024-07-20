/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package Controlador;

// Lista de Importaciones  Modelo

import Entidades.Especialidad;
import Entidades.Farmaco;
import Entidades.Historial;
import Entidades.Horario;
import Modelo.ValidarSesion;

// Lista de Importaciones de Entidades
import Entidades.Paciente;
import Entidades.Personal;
import Entidades.Receta;
import Entidades.ResultadoLaboratorio;
import Entidades.Rol;
import Entidades.Solicitud;
import Entidades.TiposAnalisis;
import Entidades.Venta;


// Lista de Modelos
import Modelo.ValidarSesion;
import Modelo.ConsultaHistorial;
import Modelo.Horarios;
import Modelo.ventaFarmacia;
import Modelo.MantenimientoCita;
import Modelo.MantenimientoEspecialidad;
import Modelo.laboratorioAcciones;
import Modelo.medicoAcciones;
import ModeloDAO.EspecialidadDAO;
import ModeloDAO.HorarioDAO;
import ModeloDAO.PacienteDAO;
import ModeloDAO.PersonalDAO;
import com.google.gson.Gson;

// Importanciones 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Usuario
 */



@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet{


    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }    
    
    // Manejo de Solicitudes HTTP Get 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();
        //recuperando valores
        String accion = request.getParameter("accion");
        System.out.println("acccionnn"+accion);
        switch (accion) {
            case "historialclinico":
                historialClinico(request, response);
                break;
            case "citas":
                listarCita(request, response);
                break;
            case "reservarCita":
                listarEspecialidades(request, response);
                break;
            case "citaspend":
                citasPendientes(request, response);
                break;
            case "triaje":
                registrarTriaje(request, response);
                break;
            case "farmaciaa":
                ventaFarmacia(request, response);
                break;
            case "listarFarmacos":
                listarFarmacos(request, response);
                break;
            case "labpendientes":
                LaboratorioPendiente(request, response);
                break;
            case "horarioLaboratorio":
                horarioCitasLaboratorio(request, response);
                break;
            case "costoLaboratorio":
                consultaCostoLaboratorio(request, response);
                break;
            case "resultLaboratorio":
                resultLaboratorio(request, response);
                break;
            default:
                System.out.println("accion no valida");
                response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        //processRequest(request, response);
        HttpSession sesion = request.getSession();
        //recuperando valores
        String accion = request.getParameter("accion");
        switch (accion) {
            case "ingresar":
                ingresar(request, response);
                break;
            case "registrar":
                registrarse(request, response);
            case "salir":
                sesion.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "RegistrarCita":
                reservarCita(request, response);
                break;
            case "reservarLaboratorio":
                reservarLaboratorio(request, response);
                break;
            case "editarCita":
                editarCita(request, response);
                break;
            case "guardarCitaEdit":
                actualizarCita(request, response);
                break;
            case "cancelarCita":
                cancelarCita(request, response);
                break;
            case "horario":
                horarioCitas(request, response);
                break;
            case "buscarPaciente":
                buscarPaciente(request, response);
                break;
            case "buscarPacienteE":
                buscarPacienteE(request, response);
                break;
            case "costoEspecialidad":
                consultaCostoEspecialidad(request, response);
                break;
            case "registrohistorialclinico":
                guardarHistorial(request, response);
                break;
            case "actualizarhistorialEmergencia":
                guardarHistorialEmergencia(request, response);
                break;
            case "registrotriaje":
                guardarTriaje(request, response);
                break;
            case "enviosolicitudes":
                enviandoIdSolicitud(request, response);
                break;
            case "registrarPersonal":
                registrarPersonal(request, response);
                break;
            case "registrarPaciente":
                registrarPaciente(request, response);
                break;
            case "listaMedicamentosReceta":
                listaMedicamentosReceta(request, response);
                break;
            case "generarCompra":
                generarCompra(request, response);
                break;
            case "registrarResultadosLab":
                registrarResultadoLab(request, response);
                break;
            case "registrarEspecialidad":
                registrarEspecialidad(request, response);
                break;
            case "registrarHorario":
                registrarHorario(request, response);
                break;
            case "eliminarEspecialidad":
                eliminarEspecialidad(request, response);
                break;
            case "editarEspecialidad":
                editarEspecialidad(request, response);
                break;
            case "actualizarEspecialidad":
                actualizarEspecialidad(request, response);
                break;
            case "eliminarHorario":
                eliminarHorario(request, response);
                break;
            case "editarHorario":
                editarHorario(request, response);
                break;
            case "actualizarHorario":
                actualizarHorario(request, response);
                break;
            case "editarPaciente":
                editarPaciente(request, response);
                break;
            case "actualizarPaciente":
                actualizarPaciente(request, response);
                break;
            case "actualizarPersonal":
                actualizarPersonal(request, response);
                break;
            case "editarPersonal":
                editarPersonal(request, response);
                break;
            case "editarEstadoUsuario":
                editarEstadoUsuario(request, response);
                break;
            default:
                System.out.println("accion no valida");
                response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    protected void ingresar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        HttpSession sesion = request.getSession();
        //recuperando valores
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contra");
        //recuperando el id del usuario
        Rol ro = new Rol();
        ro = datoSesion.validar(correo, contraseña);
        if (ro != null) {
            Personal objPersonal = new Personal();
            objPersonal = datoSesion.sesionPersonal(ro.getIdUser());
            if (ro.getIdrol() == 1) {
                //Direccionando
                sesion.setAttribute("admin", objPersonal);
                response.sendRedirect(request.getContextPath() + "/mainAdministrador.jsp");
            }
            if (ro.getIdrol() == 2) {
                //Direccionando
                Paciente objResp = new Paciente();
                objResp = datoSesion.sesionPaciente(ro.getIdUser());
                sesion.setAttribute("paciente", objResp);
                response.sendRedirect(request.getContextPath() + "/mainPaciente.jsp");
            }
            if (ro.getIdrol() == 3) {
                //Direccionando
                sesion.setAttribute("medico", objPersonal);
                response.sendRedirect(request.getContextPath() + "/mainMedico.jsp");
            }
            if (ro.getIdrol() == 4) {
                //Direccionando
                sesion.setAttribute("auxiliar", objPersonal);
                response.sendRedirect(request.getContextPath() + "/mainAuxiliar.jsp");
            }
            if (ro.getIdrol() == 5) {
                sesion.setAttribute("enfermero", objPersonal);
                response.sendRedirect(request.getContextPath() + "/mainEnfermero.jsp");
            }
            if (ro.getIdrol() == 6) {
                sesion.setAttribute("farmaceutico", objPersonal);
                response.sendRedirect(request.getContextPath() + "/mainEnfermero.jsp");
            }

        } else {
            request.setAttribute("correo", correo);
            request.setAttribute("pass", contraseña);
            sesion.setAttribute("resp", 0);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void registrarse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        Paciente objPaciente = new Paciente();
        HttpSession sesion = request.getSession();
        //recuperando valores
        String tipodoc = request.getParameter("tipodoc");
        String doc = request.getParameter("documento");
        String nombre = request.getParameter("nombre");
        String app = request.getParameter("app");
        String apm = request.getParameter("apm");
        String cel = request.getParameter("cel");
        String direccion = request.getParameter("direccion");
        String sexo = request.getParameter("sexo");
        String correo1 = request.getParameter("correo");
        String contraseña1 = request.getParameter("pass");
        //asignando

        objPaciente.setTipodoc(Integer.parseInt(tipodoc));
        objPaciente.setDocumento(doc);
        objPaciente.setNombre(nombre);
        objPaciente.setApellido_paterno(app);
        objPaciente.setApellido_materno(apm);
        objPaciente.setTelefono(Integer.parseInt(cel));
        objPaciente.setDireccion(direccion);
        objPaciente.setSexo(Integer.parseInt(sexo));
        objPaciente.setCorreo(correo1);
        objPaciente.setPassword(contraseña1);
        objPaciente.setRol(2);
        //enviando valores al objUsuario
        if (datoSesion.registro(objPaciente)) {
            sesion.setAttribute("rol", 0);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("nombre", nombre);
            request.setAttribute("app", app);
            request.setAttribute("apm", apm);
            request.setAttribute("email", correo1);
            request.setAttribute("pass", contraseña1);
        }
    }

    protected void registrarPaciente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        Paciente objPaciente = new Paciente();
        HttpSession sesion = request.getSession();
        //recuperando valores
        String tipodoc = request.getParameter("tipodoc");
        String doc = request.getParameter("documento");
        String nombre = request.getParameter("nombre");
        String app = request.getParameter("app");
        String apm = request.getParameter("apm");
        String cel = request.getParameter("cel");
        String direccion = request.getParameter("direccion");
        String sexo = request.getParameter("sexo");
        String correo1 = request.getParameter("correo");
        String contraseña1 = request.getParameter("pass");
        //asignando

        objPaciente.setTipodoc(Integer.parseInt(tipodoc));
        objPaciente.setDocumento(doc);
        objPaciente.setNombre(nombre);
        objPaciente.setApellido_paterno(app);
        objPaciente.setApellido_materno(apm);
        objPaciente.setTelefono(Integer.parseInt(cel));
        objPaciente.setDireccion(direccion);
        objPaciente.setSexo(Integer.parseInt(sexo));
        objPaciente.setCorreo(correo1);
        objPaciente.setPassword(contraseña1);
        objPaciente.setRol(2);
        //enviando valores al objUsuario
        if (datoSesion.registro(objPaciente)) {
            request.getRequestDispatcher("listarPacientes.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void registrarPersonal(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        Personal objPersonal = new Personal();
        HttpSession sesion = request.getSession();
        //recuperando valores
        String tipodoc = request.getParameter("tipoDocumento");
        String doc = request.getParameter("nroDocumento");
        String nombre = request.getParameter("nombre");
        String app = request.getParameter("apellido_pa");
        String apm = request.getParameter("apellido_ma");
        String sexo = request.getParameter("sexo");
        String direccion = request.getParameter("direccion");
        String cel = request.getParameter("telefono");
        String rol = request.getParameter("idRol");
        String especialidad = request.getParameter("idEspecialidad");
        String horario = request.getParameter("idHorario");
        String correo1 = request.getParameter("correo");
        String contraseña1 = request.getParameter("password");
        //asignando

        objPersonal.setTipodoc(Integer.parseInt(tipodoc));
        objPersonal.setDocumento(doc);
        objPersonal.setNombre(nombre);
        objPersonal.setApellido_paterno(app);
        objPersonal.setApellido_materno(apm);
        objPersonal.setSexo(Integer.parseInt(sexo));
        objPersonal.setDireccion(direccion);
        objPersonal.setTelefono(Integer.parseInt(cel));
        objPersonal.setRol(Integer.parseInt(rol));
        objPersonal.setIdEspecialidad(Integer.parseInt(especialidad));

        objPersonal.setCorreo(correo1);
        objPersonal.setPassword(contraseña1);

        //enviando valores al objUsuario
        if (datoSesion.registro(objPersonal)) {
            request.getRequestDispatcher("listarPersonal.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void historialClinico(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ConsultaHistorial con = new ConsultaHistorial();
        Paciente objPaciente = new Paciente();
        HttpSession sesion = request.getSession();
        //recuperando valores
        objPaciente = (Paciente) sesion.getAttribute("paciente");

        //enviando valores al objUsuario
        List<Historial> listHistorial = new ArrayList();
        List<Receta> listReceta = new ArrayList();
        listHistorial = con.getHistorial(String.valueOf(objPaciente.getIdPaciente()));
        listReceta = con.getReceta(objPaciente.getIdPaciente());

        if (!listHistorial.isEmpty()) {
            request.setAttribute("historial", listHistorial);
            request.setAttribute("receta", listReceta);
            request.getRequestDispatcher("historialClinico.jsp").forward(request, response);
        } else {
            request.setAttribute("historial", null);
            request.setAttribute("receta", null);
            request.getRequestDispatcher("historialClinico.jsp").forward(request, response);;
        }
    }

    protected void reservarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date fechaa = new Date();
        String strDateFormat = "yyyy-MM-dd"; // El formato de fecha está especificado  
        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
        String fechafinal = objSDF.format(fechaa);

        MantenimientoCita re = new MantenimientoCita();
        HttpSession sesion = request.getSession();
        Paciente objPaciente = new Paciente();
        Solicitud objsol = new Solicitud();
        objPaciente = (Paciente) sesion.getAttribute("paciente");
        int idpaciente = objPaciente.getIdPaciente();
        int idservicio = 1;
        String estado = "Pendiente";
        String idmedico = request.getParameter("idmedico");
        String idhorario = request.getParameter("idHorario");
        String modalidad = request.getParameter("modalidad");
        String costo = request.getParameter("costo");

        objsol.setIdPaciente(idpaciente);
        objsol.setIdPersonal(Integer.parseInt(idmedico));
        objsol.setIdServicio(idservicio);
        objsol.setIdHorario(Integer.parseInt(idhorario));
        objsol.setCosto(Double.parseDouble(costo));
        objsol.setModalidad(modalidad);
        objsol.setFecha(fechafinal);
        objsol.setEstadoServicio(estado);

        if (re.RegistrarSolicitud(objsol)) {
            request.setAttribute("cReservado", "Cita Reservada Con Éxito");
            listarEspecialidades(request,response);
            //response.sendRedirect(request.getContextPath() + "/Controlador?accion=citas");
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void reservarLaboratorio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date fechaa = new Date();
        String strDateFormat = "yyyy-MM-dd"; // El formato de fecha está especificado  
        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
        String fechafinal = objSDF.format(fechaa);

        MantenimientoCita re = new MantenimientoCita();
        HttpSession sesion = request.getSession();
        Paciente objPaciente = new Paciente();
        Solicitud objsol = new Solicitud();
        objPaciente = (Paciente) sesion.getAttribute("paciente");
        int idpaciente = objPaciente.getIdPaciente();
        int idservicio = 2;
        String estado = "Pendiente";
        String idmedico = request.getParameter("IdMedicoL");
        String idhorario = request.getParameter("IdHorarioL");
        String modalidad = "Prensencial";
        String costo = request.getParameter("costoL");
        String historiaXanalisis = request.getParameter("historiaXanalisis");
        String idAnalisis = request.getParameter("idAnalisisL");

        objsol.setIdPaciente(idpaciente);
        objsol.setIdPersonal(Integer.parseInt(idmedico));
        objsol.setIdServicio(idservicio);
        objsol.setIdHorario(Integer.parseInt(idhorario));
        objsol.setCosto(Double.parseDouble(costo));
        objsol.setModalidad(modalidad);
        objsol.setFecha(fechafinal);
        objsol.setEstadoServicio(estado);
        objsol.setHistoriaXanalisis(Integer.parseInt(historiaXanalisis));
        objsol.setIdAnalisis(Integer.parseInt(idAnalisis));

        if (re.RegistrarCitaLaboratorio(objsol)) {
            request.setAttribute("labreservado", "Laboratorio Reservado Con Éxito");
            listarCita(request, response);
            //response.sendRedirect(request.getContextPath() + "/Controlador?accion=citas");
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void listarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Paciente objPaciente = new Paciente();
        HttpSession sesion = request.getSession();
        objPaciente = (Paciente) sesion.getAttribute("paciente");
        List<Solicitud> info = new MantenimientoCita().getCitas(objPaciente.getIdPaciente());
        request.setAttribute("listaCitas", info);
        List<Solicitud> info2 = new MantenimientoCita().getCitasLaboratorio(objPaciente.getIdPaciente());
        request.setAttribute("listaCitasLab", info2);
        request.getRequestDispatcher("historialCitaPaciente.jsp").forward(request, response);
    }

    protected void editarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Solicitud objsol = new Solicitud();
        MantenimientoCita cit = new MantenimientoCita();
        String id = request.getParameter("idsolicitud");
        objsol = cit.buscarCitas(Integer.parseInt(id));

        if (objsol != null) {
            request.setAttribute("objsolicitud", objsol);
            listarEspecialidades(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }
    
    protected void actualizarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date fechaa = new Date();
        String strDateFormat = "yyyy-MM-dd"; // El formato de fecha está especificado  
        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
        String fechafinal = objSDF.format(fechaa);

        MantenimientoCita re = new MantenimientoCita();
        HttpSession sesion = request.getSession();
        Paciente objPaciente = new Paciente();
        Solicitud objsol = new Solicitud();
        objPaciente = (Paciente) sesion.getAttribute("paciente");
        int idpaciente = objPaciente.getIdPaciente();
        int idservicio = 1;
        String estado = "Pendiente";
        String idmedico = request.getParameter("idmedico");
        String idhorario = request.getParameter("idHorario");
        String modalidad = request.getParameter("modalidad");
        String costo = request.getParameter("costo");
        String idsoll = request.getParameter("idsoll");
        
        objsol.setIdPaciente(idpaciente);
        objsol.setIdPersonal(Integer.parseInt(idmedico));
        objsol.setIdServicio(idservicio);
        objsol.setIdHorario(Integer.parseInt(idhorario));
        objsol.setCosto(Double.parseDouble(costo));
        objsol.setModalidad(modalidad);
        objsol.setFecha(fechafinal);
        objsol.setEstadoServicio(estado);

        if (re.ActualizarSolicitud(objsol,idsoll)) {
            request.setAttribute("cReservado", "Cita Modificada Con Éxito");
            request.getRequestDispatcher("reservarCita.jsp").forward(request, response);
            //response.sendRedirect(request.getContextPath() + "/Controlador?accion=citas");
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void cancelarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("idsolicitud");
        MantenimientoCita cit = new MantenimientoCita();
        if (cit.cancelarCita(Integer.parseInt(id))) {
            request.setAttribute("cancelCita", "Cita Cancelada Con Éxito");
            listarCita(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void horarioCitas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperando valores
        String esp = request.getParameter("id");

        List<Horario> listaHorario = new Horarios().getHorario(Integer.parseInt(esp));

        Gson json = new Gson();
        String a = json.toJson(listaHorario);

        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.getWriter().write(a);
    }

    protected void resultLaboratorio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperando valores
        String idlab = request.getParameter("idlab");
        List<ResultadoLaboratorio> result = new ConsultaHistorial().getResultLaboratorio(Integer.parseInt(idlab));

        Gson json = new Gson();
        String a = json.toJson(result);
        System.out.println("result " + a);
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.getWriter().write(a);
    }

    protected void horarioCitasLaboratorio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperando valores
        //String esp = request.getParameter("id");

        List<Horario> listaHorario = new Horarios().getHorarioLaboratorio();

        Gson json = new Gson();
        String a = json.toJson(listaHorario);

        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.getWriter().write(a);
    }

    protected void listaMedicamentosReceta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperando valores
        String idHistoria = request.getParameter("idhisto");

        List<Receta> listaReceta = new ventaFarmacia().getReceta(Integer.parseInt(idHistoria));

        Gson json = new Gson();
        String a = json.toJson(listaReceta);
        System.out.println(a);

        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.getWriter().write(a);
    }

    protected void listarEspecialidades(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Especialidad esp = new Especialidad();
        List<Especialidad> listaEspe = new MantenimientoEspecialidad().getEspecialidades();
        request.setAttribute("especialidad", listaEspe);
        request.getRequestDispatcher("reservarCita.jsp").forward(request, response);
    }

    private void consultaCostoEspecialidad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Horarios resp = new Horarios();
        String idesp = request.getParameter("ides");

        double costo = resp.costoEspecialidad(Integer.parseInt(idesp));

        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.getWriter().write(String.valueOf(costo));
    }

    private void consultaCostoLaboratorio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Horarios resp = new Horarios();
        String idan = request.getParameter("idan");

        double costo = resp.costoLaboratorio(Integer.parseInt(idan));

        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.getWriter().write(String.valueOf(costo));
    }

    private void buscarPaciente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String doc = request.getParameter("docume");
        medicoAcciones con = new medicoAcciones();
        ConsultaHistorial histo = new ConsultaHistorial();
        Paciente objPaciente = new Paciente();
        //recuperando valores
        objPaciente = con.buscarPersona(doc);
        int idd = 0;
        if (objPaciente != null) {
            idd = objPaciente.getIdPaciente();
        }
        //enviando valores al objUsuario
        List<Historial> listHistorial = new ArrayList();
        List<Receta> listReceta = new ArrayList();

        listHistorial = histo.getHistorial(doc);
        listReceta = histo.getReceta(idd);
        String triajeEmergencia = histo.getTriajeEmergencia(idd);
        if (listHistorial != null) {
            if (!listHistorial.isEmpty()) {
                System.out.println("datoss: " + listHistorial);
                request.setAttribute("datos", objPaciente);
                request.setAttribute("historial", listHistorial);
                request.setAttribute("receta", listReceta);
                request.setAttribute("triajeEmergencia", triajeEmergencia);
                request.getRequestDispatcher("buscarPaciente.jsp").forward(request, response);
            } else {
                request.setAttribute("result", "Documento no Encontrado o Incorrecto vuelva a intentarlo");
                request.getRequestDispatcher("buscarPaciente.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    private void buscarPacienteE(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String doc = request.getParameter("docume");
        ConsultaHistorial histo = new ConsultaHistorial();
        medicoAcciones con = new medicoAcciones();
        Paciente objPaciente = new Paciente();
        //recuperando valores
        objPaciente = con.buscarPersona(doc);
        int idd = 0;
        if (objPaciente != null) {
            idd = objPaciente.getIdPaciente();
        }
        //enviando valores al objUsuario
        List<Historial> listHistorial = new ArrayList();
        List<Receta> listReceta = new ArrayList();

        listHistorial = histo.getHistorial(doc);
        listReceta = histo.getReceta(idd);

        if (listHistorial != null) {
            request.setAttribute("datos", objPaciente);
            request.setAttribute("historial", listHistorial);
            request.setAttribute("receta", listReceta);
            request.getRequestDispatcher("buscarPacienteE.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    private void citasPendientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Personal objPersonal = new Personal();
        HttpSession sesion = request.getSession();
        objPersonal = (Personal) sesion.getAttribute("medico");
        List<Solicitud> info = new medicoAcciones().citasPendientes(objPersonal.getIdPersonal());

        request.setAttribute("citas", info);
        request.getRequestDispatcher("citasPendientesMedico.jsp").forward(request, response);
        /*Gson json = new Gson();
        String a = json.toJson(info);
        response.getWriter().write(a);*/
    }

    private void LaboratorioPendiente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Personal objPersonal = new Personal();
        HttpSession sesion = request.getSession();
        objPersonal = (Personal) sesion.getAttribute("auxiliar");
        List<Solicitud> info = new laboratorioAcciones().labPendientes(objPersonal.getIdPersonal());
        request.setAttribute("citas", info);
        request.getRequestDispatcher("analisisPendientesAuxiliar.jsp").forward(request, response);
    }

    private void registrarResultadoLab(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //recuperando datos del cliente
        laboratorioAcciones lab = new laboratorioAcciones();
        String resultado = request.getParameter("resultado");
        String fecha = request.getParameter("fecha");
        String idSol = request.getParameter("idSolicitud");
        String idTipoa = request.getParameter("idTipoa");
        String historiaXanalisis = request.getParameter("historiaXanalisis");

        if (lab.RegistrarResultadosLab(resultado, fecha, Integer.parseInt(idTipoa), Integer.parseInt(idSol), Integer.parseInt(historiaXanalisis))) {
            LaboratorioPendiente(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void guardarHistorial(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        Personal objPersonal = new Personal();

        Historial histo = new Historial();
        medicoAcciones objMe = new medicoAcciones();

        Date fechaa = new Date();
        String strDateFormat = "yyyy-MM-dd"; // El formato de fecha está especificado  
        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
        String fechafinal = objSDF.format(fechaa);
        //recuperando historial
        objPersonal = (Personal) sesion.getAttribute("medico");
        String diagnostico = request.getParameter("diagnostico");
        String idPaciente = request.getParameter("idPaciente");
        String idSolicitud = request.getParameter("idSolicitud");

        //recuperando receta
        String idProducto[] = request.getParameterValues("id[]");
        String nombre[] = request.getParameterValues("nombre[]");
        String cantidad[] = request.getParameterValues("cantidad[]");
        String observacion[] = request.getParameterValues("observacion[]");

        String analisis = request.getParameter("tipoanalisis");

        //historial  enviando datos al obj historial 
        if (idSolicitud.equals("")) {
            idSolicitud = "0";
        }
        histo.setDiagnostico(diagnostico);
        histo.setIdPaciente(Integer.parseInt(idPaciente));
        histo.setIdSolicitud(Integer.parseInt(idSolicitud));
        histo.setIdPersonal(objPersonal.getIdPersonal());
        histo.setFecha(fechafinal);

        if (objMe.RegistrarHistorial(histo)) {
            if (idProducto != null) {
                int id = objMe.buscarUltimoHistorial(Integer.parseInt(idPaciente));
                objMe.RegistroReceta(idProducto, cantidad, observacion, analisis, id);
            }
            response.sendRedirect(request.getContextPath() + "/buscarPaciente.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void guardarHistorialEmergencia(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        Personal objPersonal = new Personal();

        Historial histo = new Historial();
        medicoAcciones objMe = new medicoAcciones();

        Date fechaa = new Date();
        String strDateFormat = "yyyy-MM-dd"; // El formato de fecha está especificado  
        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
        String fechafinal = objSDF.format(fechaa);
        //recuperando historial
        objPersonal = (Personal) sesion.getAttribute("medico");
        String diagnostico = request.getParameter("diagnostico");
        String idPaciente = request.getParameter("idPaciente");

        //recuperando receta
        String idProducto[] = request.getParameterValues("id[]");
        String nombre[] = request.getParameterValues("nombre[]");
        String cantidad[] = request.getParameterValues("cantidad[]");
        String observacion[] = request.getParameterValues("observacion[]");
        String analisis = request.getParameter("tipoanalisis");

        //historial  enviando datos al obj historial 
        histo.setDiagnostico(diagnostico);
        histo.setIdPaciente(Integer.parseInt(idPaciente));
        histo.setIdPersonal(objPersonal.getIdPersonal());
        histo.setFecha(fechafinal);

        if (objMe.actualizarHistorialEmergencia(histo)) {
            if (idProducto != null) {
                int id = objMe.buscarUltimoHistorial(Integer.parseInt(idPaciente));
                objMe.RegistroReceta(idProducto, cantidad, observacion, analisis, id);
            }
            response.sendRedirect(request.getContextPath() + "/buscarPaciente.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void guardarTriaje(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        medicoAcciones objMe = new medicoAcciones();

        //recuperando historial
        String altura = request.getParameter("altura");
        String peso = request.getParameter("peso");
        String pArterial = request.getParameter("parterial");
        String temperatura = request.getParameter("temperatura");
        String signosVitales = request.getParameter("signosVitales");
        String idPaciente = request.getParameter("idPaciente");

        String triaje = "Altura: " + altura + ", Peso: " + peso + ", Presión Arterial: " + pArterial + ", Temperatura: " + temperatura + ", Signos vitales: " + signosVitales;

        //historial  enviando datos al obj historial     
        System.out.println(triaje);
        System.out.println(idPaciente);
        if (objMe.RegistrarTriaje(triaje, Integer.parseInt(idPaciente))) {

            response.sendRedirect(request.getContextPath() + "/buscarPacienteE.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void registrarTriaje(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date fechaa = new Date();
        String strDateFormat = "yyyy-MM-dd"; // El formato de fecha está especificado  
        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
        String fechafinal = objSDF.format(fechaa);
        //recuperando valores
        String id = request.getParameter("idp");
        ConsultaHistorial histo = new ConsultaHistorial();
        medicoAcciones con = new medicoAcciones();
        Paciente objPaciente = new Paciente();
        //List<TiposAnalisis> listAnalisis = new MantenimientoEspecialidad().getTiposAnalisis();

        //recuperando valores
        objPaciente = con.buscarPersona(id);
        int idd = 0;
        if (objPaciente != null) {
            idd = objPaciente.getIdPaciente();
        }
        //enviando valores al objUsuario
        List<Historial> listHistorial = new ArrayList();
        List<Receta> listReceta = new ArrayList();

        listHistorial = histo.getHistorial(id);
        listReceta = histo.getReceta(idd);

        if (listHistorial != null) {
            request.setAttribute("datos", objPaciente);
            request.setAttribute("historial", listHistorial);
            request.setAttribute("fecha", fechafinal);
            request.setAttribute("receta", listReceta);
            request.getRequestDispatcher("registroTriaje.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    protected void enviandoIdSolicitud(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Date fechaa = new Date();
        String strDateFormat = "yyyy-MM-dd"; // El formato de fecha está especificado  
        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); // La cadena de formato de fecha se pasa como un argumento al objeto 
        String fechafinal = objSDF.format(fechaa);

        String idSolicitud = request.getParameter("idSolicitud");
        String poremergencia = request.getParameter("poremergencia");
        String idPaciente = request.getParameter("idPaciente");
        String historiaXanalisis = request.getParameter("historiaXanalisis");
        String idTipoa = request.getParameter("idTipoa");
        String estado = request.getParameter("estadoSol");
        ConsultaHistorial histo = new ConsultaHistorial();
        medicoAcciones con = new medicoAcciones();
        Paciente objPaciente = new Paciente();
        Personal objAuxiliar = new Personal();
        HttpSession sesion = request.getSession();
        objAuxiliar = (Personal) sesion.getAttribute("auxiliar");
        //recuperando valores
        objPaciente = con.buscarPersona(idPaciente);
        int idd = 0;
        if (objPaciente != null) {
            idd = objPaciente.getIdPaciente();
        }
        //enviando valores al objUsuario
        List<Historial> listHistorial = new ArrayList();
        List<Receta> listReceta = new ArrayList();

        listHistorial = histo.getHistorial(idPaciente);
        listReceta = histo.getReceta(idd);
        laboratorioAcciones lab = new laboratorioAcciones();
        List<TiposAnalisis> listAnalisis = lab.getTiposAnalisis();

        if (listHistorial != null) {
            request.setAttribute("poremergencia", poremergencia);
            request.setAttribute("idSolicitud", idSolicitud);
            request.setAttribute("idPaciente", idPaciente);
            request.setAttribute("historiaXanalisis", historiaXanalisis);
            request.setAttribute("fecha", fechafinal);
            request.setAttribute("datos", objPaciente);
            request.setAttribute("historial", listHistorial);
            request.setAttribute("receta", listReceta);
            request.setAttribute("listAnalisis", listAnalisis);
            request.setAttribute("idTipoa", idTipoa);
            if (objAuxiliar != null) {
                if (estado.equals("Pendiente")) {
                    if (lab.cambiarEstadoSol(idSolicitud)) {
                        LaboratorioPendiente(request, response);
                    }
                } else {
                    request.getRequestDispatcher("resultadoAnalisisAuxiliar.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("registroHistorialClinico.jsp").forward(request, response);
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    private void ventaFarmacia(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Paciente objPaciente = new Paciente();
        HttpSession sesion = request.getSession();
        objPaciente = (Paciente) sesion.getAttribute("paciente");
        List<Historial> listHistorial = null;
        List<Receta> listReceta = null;
        System.out.println("objjj: " + objPaciente);
        if (objPaciente != null) {
            listHistorial = new ConsultaHistorial().getHistorial(String.valueOf(objPaciente.getIdPaciente()));
            listReceta = new ConsultaHistorial().getReceta(objPaciente.getIdPaciente());
        } else {
            listHistorial = new ConsultaHistorial().getHistorial(null);
            listReceta = new ConsultaHistorial().getReceta(0);
        }
        System.out.println("lisths : " + listHistorial);
        if (!listHistorial.isEmpty()) {
            if (objPaciente != null) {
                request.setAttribute("historial", listHistorial);
                request.setAttribute("receta", listReceta);
                request.getRequestDispatcher("farmacia.jsp").forward(request, response);
            } else {
                request.setAttribute("historial", listHistorial);
                request.setAttribute("receta", listReceta);
                request.getRequestDispatcher("farmaciaFarmaceutica.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("historial", null);
            request.setAttribute("receta", null);
            request.getRequestDispatcher("farmacia.jsp").forward(request, response);
        }
    }

    private void FarmaciaGeneral(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Paciente objPaciente = new Paciente();
        HttpSession sesion = request.getSession();
        objPaciente = (Paciente) sesion.getAttribute("paciente");
        List<Historial> listHistorial = new ConsultaHistorial().getHistorial(String.valueOf(objPaciente.getIdPaciente()));
        List<Receta> listReceta = new ConsultaHistorial().getReceta(objPaciente.getIdPaciente());

        if (!listHistorial.isEmpty()) {
            request.setAttribute("historial", listHistorial);
            request.setAttribute("receta", listReceta);
            request.getRequestDispatcher("farmacia.jsp").forward(request, response);
        } else {
            request.setAttribute("historial", null);
            request.setAttribute("receta", null);
            request.getRequestDispatcher("farmacia.jsp").forward(request, response);;
        }
    }

    private void generarCompra(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Paciente objPaciente = new Paciente();
        Venta objVenta = new Venta();
        HttpSession sesion = request.getSession();
        //recuperando valores
        objPaciente = (Paciente) sesion.getAttribute("paciente");
        String idComprobante = "1";
        String monto = request.getParameter("monto");
        String totalVenta = request.getParameter("totalVenta");
        String tipoPago = request.getParameter("tipoPago");
        String tipoEntrega = request.getParameter("tipoEntrega");
        String estadoVenta = "Completado";
        String idReceta[] = request.getParameterValues("idReceta[]");
        String idProducto[] = request.getParameterValues("idProducto[]");
        String totalxPro[] = request.getParameterValues("totalxp[]");
        String cantidad[] = request.getParameterValues("cantidad[]");
        System.out.println("Recetaaa " + idReceta);

        objVenta.setIdPaciente(objPaciente.getIdPaciente());
        objVenta.setIdComprobante(Integer.parseInt(idComprobante));
        objVenta.setMonto(Double.parseDouble(monto));
        objVenta.setTotalVenta(Double.parseDouble(totalVenta));
        objVenta.setTipoPago(tipoPago);
        objVenta.setTipoEntrega(tipoEntrega);
        objVenta.setEstadoVenta(estadoVenta);

        boolean xd = new ventaFarmacia().generarVenta(objVenta, idReceta, idProducto, cantidad, totalxPro);
        if (xd) {
            request.setAttribute("compraMedic", "Compra De Medicamentos Completado");
            ventaFarmacia(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/error.html");
        }
    }

    private void listarFarmacos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Farmaco> listFarmaco = new ventaFarmacia().getFarmacos();
        //response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        if (!listFarmaco.isEmpty()) {
            Gson json = new Gson();
            String lis = json.toJson(listFarmaco);
            System.out.println("liasd" + lis);
            response.getWriter().write(lis);

        } else {
            response.getWriter().write("no hay datos");
        }
    }

    private void registrarEspecialidad(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
     ValidarSesion datoSesion = new ValidarSesion();
        Especialidad objEspecialidad = new Especialidad();
        HttpSession sesion = request.getSession();
        //recuperando valores
        String nombreEspecialidad = request.getParameter("nomEspecialidad");
        String costoEspecialidad = request.getParameter("costoEspecialidad");
        
        //asignando
        objEspecialidad.setNomEspecialidad(nombreEspecialidad);
        objEspecialidad.setCosto(Double.parseDouble(costoEspecialidad));
        
        //enviando valores al objUsuario
        if (datoSesion.registroEspecialidad(objEspecialidad)) {
            request.getRequestDispatcher("listarEspecialidad.jsp").forward(request, response);
        } else {
            
        }
    }

    private void registrarHorario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        Horario objHorario = new Horario();
        HttpSession sesion = request.getSession();
        
        String horaInicio = request.getParameter("horaInicio");
        String horaFin = request.getParameter("horaFin");
        String fechaHorario = request.getParameter("fechaHorario");
        String estadoHorario = "Libre";
        String idPersonal = request.getParameter("idMedico");
        
        objHorario.setHoraInicio(horaInicio);
        objHorario.setHoraFin(horaFin);
        objHorario.setFecha(fechaHorario);
        objHorario.setEstadoHorario(estadoHorario);
        objHorario.setIdMedico(Integer.parseInt(idPersonal));
        
        if (datoSesion.registroHorario(objHorario)) {
            request.getRequestDispatcher("listarHorario.jsp").forward(request, response);
        } else {
            
        }
    }

    private void eliminarEspecialidad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        Especialidad objEspecialidad = new Especialidad();
        EspecialidadDAO objdao = new EspecialidadDAO();
        
        String id = request.getParameter("idEspecialidad");
        objdao.eliminarEspecialidad(Integer.parseInt(id));
        
        request.getRequestDispatcher("listarEspecialidad.jsp").forward(request, response);
    }

    private void editarEspecialidad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       ValidarSesion datoSesion = new ValidarSesion();
       Especialidad esp = new Especialidad();
        EspecialidadDAO objdao = new EspecialidadDAO();
        
        String id = request.getParameter("idEspecialidad");
        esp=objdao.listarId(Integer.parseInt(id));
        request.setAttribute("ep",esp);
        request.getRequestDispatcher("editarEspecialidad.jsp").forward(request, response);
    }

    private void eliminarHorario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        Horario objHorario = new Horario();
        HorarioDAO objdao = new HorarioDAO();
        
        String id = request.getParameter("idHorario");
        objdao.eliminarHorario(Integer.parseInt(id));
        
        request.getRequestDispatcher("listarHorario.jsp").forward(request, response);
    }

    private void editarHorario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         ValidarSesion datoSesion = new ValidarSesion();
        Horario hor = new Horario();
        HorarioDAO objdao = new HorarioDAO();
        
        String id = request.getParameter("idHorario");
        hor=objdao.listarId(Integer.parseInt(id));
        request.setAttribute("ep",hor);
        request.getRequestDispatcher("editarHorario.jsp").forward(request, response);
    }

    private void actualizarHorario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       ValidarSesion datoSesion = new ValidarSesion();
        Horario objHorario = new Horario();
        HttpSession sesion = request.getSession();
        //recuperando valores
        String idHorario = request.getParameter("idHorario");
        String horaInicio = request.getParameter("horaInicio");
        String horaFin = request.getParameter("horaFin");
        String fechaHorario = request.getParameter("fechaHorario");
        String idMedico = request.getParameter("idMedico");
        
        
        objHorario.setHoraInicio(horaInicio);
        objHorario.setHoraFin(horaFin);
        objHorario.setFecha(fechaHorario);
        objHorario.setIdHorario(Integer.parseInt(idHorario));
        objHorario.setIdMedico(Integer.parseInt(idMedico));
        //enviando valores al objUsuario
        if (datoSesion.actualizarHorario(objHorario)) {
            request.getRequestDispatcher("listarHorario.jsp").forward(request, response);
        } else {
            
        }
    }

    private void actualizarEspecialidad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      ValidarSesion datoSesion = new ValidarSesion();
        Especialidad objEspecialidad = new Especialidad();
        HttpSession sesion = request.getSession();
        //recuperando valores
        String idEspecialidad = request.getParameter("idEspecialidad");
        String nombreEspecialidad = request.getParameter("nomEspecialidad");
        String costoEspecialidad = request.getParameter("costoEspecialidad");
        
        //asignando
        objEspecialidad.setNomEspecialidad(nombreEspecialidad);
        objEspecialidad.setCosto(Double.parseDouble(costoEspecialidad));
        objEspecialidad.setIdEspecialidad(Integer.parseInt(idEspecialidad));
        //enviando valores al objUsuario
        if (datoSesion.actualizarEspecialidad(objEspecialidad)) {
            request.getRequestDispatcher("listarEspecialidad.jsp").forward(request, response);
        } else {
            
        }
    }

    private void editarPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        Paciente pac = new Paciente();
        PacienteDAO objdao = new PacienteDAO();
        
        String id = request.getParameter("idPaciente");
        pac=objdao.listarId(Integer.parseInt(id));
        request.setAttribute("ep",pac);
        request.getRequestDispatcher("editarPaciente.jsp").forward(request, response);
    }

    private void actualizarPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        Paciente objPaciente = new Paciente();
        HttpSession sesion = request.getSession();
        //recuperando valores
        String idPaciente = request.getParameter("idPaciente");
        String nombrePaciente = request.getParameter("nombre");
        String apellidoPaterno = request.getParameter("app");
        String apellidoMaterno = request.getParameter("apm");
        String telefono = request.getParameter("cel");
        String direccion = request.getParameter("direccion");
        String correo = request.getParameter("correo");
        String password = request.getParameter("pass");
        
        //asignando
        objPaciente.setIdPaciente(Integer.parseInt(idPaciente));
        objPaciente.setNombre(nombrePaciente);
        objPaciente.setApellido_paterno(apellidoPaterno);
        objPaciente.setApellido_materno(apellidoMaterno);
        objPaciente.setTelefono(Integer.parseInt(telefono));
        objPaciente.setDireccion(direccion);
        objPaciente.setCorreo(correo);
        objPaciente.setPassword(password);
        //enviando valores al objUsuario
        if (datoSesion.actualizarPaciente(objPaciente)) {
            request.getRequestDispatcher("listarPacientes.jsp").forward(request, response);
        } else {
            
        }
    }

    private void actualizarPersonal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       ValidarSesion datoSesion = new ValidarSesion();
        Personal objPersonal = new Personal();
        HttpSession sesion = request.getSession();
        //recuperando valores
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String apellidoPaterno = request.getParameter("apellido_pa");
        String apellidoMaterno = request.getParameter("apellido_ma");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String especialidad = request.getParameter("idEspecialidad");
        String rol = request.getParameter("idRol");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        
        //asignando
        objPersonal.setIdPersonal(Integer.parseInt(id));
        objPersonal.setNombre(nombre);
        objPersonal.setApellido_paterno(apellidoPaterno);
        objPersonal.setApellido_materno(apellidoMaterno);
        objPersonal.setTelefono(Integer.parseInt(telefono));
        objPersonal.setDireccion(direccion);
        objPersonal.setIdEspecialidad(Integer.parseInt(especialidad));
        objPersonal.setRol(Integer.parseInt(rol));
        objPersonal.setCorreo(correo);
        objPersonal.setPassword(password);
        //enviando valores al objUsuario
        if (datoSesion.actualizarPersonal(objPersonal)) {
            request.getRequestDispatcher("listarPersonal.jsp").forward(request, response);
        } else {
            
        }
    }

    private void editarPersonal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        Personal pac = new Personal();
        PersonalDAO objdao = new PersonalDAO();
        
        String id = request.getParameter("idPersonal");
        pac=objdao.listarId(Integer.parseInt(id));
        request.setAttribute("ep",pac);
        request.getRequestDispatcher("editarPersonal.jsp").forward(request, response);
    }

    private void editarEstadoUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ValidarSesion datoSesion = new ValidarSesion();
        Personal objPersonal = new Personal();
        PersonalDAO objdao = new PersonalDAO();
        
        String id = request.getParameter("idPersonal");
        objdao.desactivarUsuario(Integer.parseInt(id));
        
        request.getRequestDispatcher("listarPersonal.jsp").forward(request, response);
    }

}

