<%-- 
    Document   : agregarPersonal
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
                    <h1>Agregar Personal</h1>
                </div>
            </div>
            <!-- Main Content -->
            <div class="container">
                <div class="row">
                    <div class="leave_comment_form_container">
                        <h1>Ingresa los Datos</h1>
                        <form action="Controlador" method="POST">  
                            <!-- Campo para seleccionar tipo de documento -->    
                            <div class="form-group">                            
                            <label>Tipo de documento: </label> <br>
                            <select id="Sexo" class="input_field" required name="tipoDocumento">
                                <option disabled selected>Seleccione Tipo de Documento</option>
                                <option value="1">DNI</option>
                                <option value="2">Carnet de Extranjería</option>
                            </select>
                            </div>
                            
                            <!-- Campo para ingresar número de documento -->
                            <div class="form-group">
                            <label>Numero de documento </label> <br>
                            <input type="text" class="input_field"  id="txtNom" required name="nroDocumento" >                                
                            </div>

                            <!-- Campo para ingresar nombre -->
                            <div class="form-group">
                            <br><label>Nombre: </label> <br>
                            <input type="text"  class="input_field" id="txtNom" required name="nombre" >
                            </div>
                                                    
                            <!-- Campo para ingresar apellido paterno -->
                            <div class="form-group">
                            <br><label>Apellido Paterno </label> <br>
                            <input type="text"  class="input_field" id="txtNom" required name="apellido_pa" >
                            </div> 
                            
                            <!-- Campo para ingresar apellido materno -->                            
                            <div class="form-group">
                            <br><label>Apellido Materno </label> <br>
                            <input type="text"  class="input_field" id="txtNom" required name="apellido_ma">
                            </div> 
                            
                            <!-- Campo para seleccionar sexo -->
                            <div class="form-group">                                                                                    
                            <br><label>Sexo: </label> <br>
                            <select id="Sexo" class="input_field" required  name="sexo">
                                <option disabled selected>Seleccione Sexo</option>
                                <option  value="1">Masculino</option>
                                <option  value="2">Femenino</option>
                            </select>
                            </div>
                            
                            <!-- Campo para ingresar dirección -->
                            <div class="form-group">
                            <br><label>Dirección: </label> <br>
                            <input type="text"  class="input_field" id="txtNom" required name="direccion" >
                            </div>   
                            
                             <!-- Campo para ingresar teléfono -->
                            <div class="form-group">                           
                            <br><label>Telefono: </label> <br>
                            <input type="text"  class="input_field" id="txtNom" required name="telefono" >
                            </div>   

                            <!-- Campo para seleccionar especialidad -->                            
                            <div class="form-group">  
                                        <label for="inputState">Especialidad</label>
                                        <select id="inputState" class="form-control" name="idEspecialidad">
                                           
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
                            <select  class="input_field" required  name="idRol">
                                
                                <option  value="3">Medico</option>
                                <option  value="4">Laboratorio Clinico</option>
                                <option  value="5">Enfermero</option>
                            </select>
                            </div> 
                            
                            <!-- Datos de sesión -->
                            <p>Datos de Sesion</p>
                            <label>Correo: </label>
                            <input type="email"  class="input_field" id="txtNom" required name="correo" >
                            <br><label>Contraseña: </label> <br>
                            <input type="password"  class="input_field" id="txtNom" required name="password">
                            <button type="submit" class="btn btn-primary" name="accion" value="registrarPersonal">Agregar</button>
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
        <jsp:include page="../actions _others/footer.jsp"/>
    </body>
</html>

