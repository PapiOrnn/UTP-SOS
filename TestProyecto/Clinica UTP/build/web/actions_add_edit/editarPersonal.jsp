<%-- 
    Document   : editarPersonal
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>


<%@page import="Entidades.Personal"%>
<%@page import="ModeloDAO.PersonalDAO"%>
<%@page import="Entidades.Paciente"%>
<%@page import="ModeloDAO.PacienteDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entidades.Horario"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.HorarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta Tags -->        
        <title>Personal</title>
        <jsp:include page="../actions_library/head.jsp"/>
        <link rel="stylesheet" type="text/css" href="../styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/news_post_responsive.css">
    </head>
    <body>
        <!-- Verificar si el usuario es administrador -->
        <c:if test="${admin.getRol()!=1}">
            <!-- Redirigir a la página de login si no es administrador -->
            <c:redirect url = "../actions_others/login.jsp"/>
        </c:if>
        <div class="super_container">
            <!-- Header -->
            <header class="header d-flex flex-row">
                <!-- Incluir el encabezado del administrador -->
                <jsp:include page="../actions_header/headerAdministrador.jsp"/>
            </header>
            <!-- Home Section -->
           <div class="home" style="background-image:url(../images/news_background.jpg);">
                <div class="home_content">
                    <h1>Actualizar Personal</h1>
                </div>
            </div>
            <!-- Formulario de actualización de personal -->
            <div class="container">
                <div class="row">
                    <!-- News Post Column -->
                    <div class="leave_comment_form_container">
                        <h1>Ingresa los Datos</h1>
                        <form action="Controlador" method="POST">                              
                            <!-- Campo oculto para el ID del personal -->
                            <input type="hidden" value="${ep.getIdPersonal()}" class="input_field" required name="id" >
                            <!-- Campo para el número de documento, deshabilitado -->    
                            <br><label>Numero de documento </label> <br>
                            <input type="text" value="${ep.getDocumento()}" disabled class="input_field"   required name="nroDocumento" >
                            <!-- Campo para el nombre -->
                            <br><label>Nombre: </label> <br>
                            <input type="text" value="${ep.getNombre()}" class="input_field" required name="nombre" >
                            <!-- Campo para el apellido paterno -->
                            <br><label>Apellido Paterno </label> <br>
                            <input type="text" value="${ep.getApellido_paterno()}" class="input_field"  required name="apellido_pa" >
                            <!-- Campo para el apellido materno -->
                            <br><label>Apellido Materno </label> <br>
                            <input type="text" value="${ep.getApellido_materno()}" class="input_field" required name="apellido_ma">
                            <!-- Campo para la dirección -->                           
                            <br><label>Dirección: </label> <br>
                            <input type="text" value="${ep.getDireccion()}" class="input_field"  required name="direccion" >
                            <!-- Campo para el teléfono -->
                            <br><label>Telefono: </label> <br>
                            <input type="text" value="${ep.getTelefono()}" class="input_field"  required name="telefono" >

                            
                            <div class="form-group">  
                                        <label for="inputState">Especialidad</label>
                                        <select id="inputState" class="form-control" name="idEspecialidad">
                                           <option value="${ep.getIdEspecialidad()}">${ep.getEspecialidad()}</option>
                                    <%
                                    PersonalDAO dao=new PersonalDAO();
                                    List<Personal>list=dao.listarEspecialidad();
                                    Iterator<Personal>iter=list.iterator();
                                    Personal per=null;
                                    int contador=0;
                                    while(iter.hasNext()){
                                        per=iter.next();

                                    %>                                                                          
                                <option value="<%= per.getIdEspecialidad()%>"><%= per.getEspecialidad()%></option>
                                
                                 <%}%>
                                        </select>
                           <br><label>Rol:  </label> <br>
                           <!-- Selección para el rol -->
                            <select  class="input_field" required  name="idRol">
                                <option  value="3">${ep.getTipoRol()}</option>
                                <option  value="3">Medico</option>
                                <option  value="4">Laboratorio Clinico</option>
                                <option  value="5">Enfermero</option>
                            </select>
                            </div> 
                            <p>Datos de Sesion</p>
                            <!-- Campo para el correo electrónico -->
                            <label>Correo: </label>
                            <input type="email"  value="${ep.getCorreo()}" class="input_field" required name="correo" >
                            <!-- Campo para la contraseña -->
                            <br><label>Contraseña: </label> <br>
                            <!-- Botón de enviar -->
                            <input type="text"  value="${ep.getPassword()}" class="input_field"  required name="password">
                            <button type="submit" class="btn btn-primary" name="accion" value="actualizarPersonal">Actualizar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
            <br><br>
                                        
        <!-- JavaScript Files -->   
            <script src="../js/jquery-3.2.1.min.js"></script>
            <script src="../js/misScripts.js"></script>  
            <script src="../styles/bootstrap4/popper.js"></script>
            <script src="../styles/bootstrap4/bootstrap.min.js"></script>
            <script src="../plugins/greensock/TweenMax.min.js"></script>
            <script src="../plugins/greensock/TimelineMax.min.js"></script>
            <script src="../plugins/scrollmagic/ScrollMagic.min.js"></script>
            <script src="../plugins/greensock/animation.gsap.min.js"></script>
            <script src="../plugins/greensock/ScrollToPlugin.min.js"></script>
            <script src="../plugins/scrollTo/jquery.scrollTo.min.js"></script>
            <script src="../plugins/easing/easing.js"></script>
            <script src="../js/news_post_custom.js"></script>
        <!-- Incluir el pie de página -->
        <jsp:include page="../actions_others/footer.jsp"/>
    </body>
</html>

