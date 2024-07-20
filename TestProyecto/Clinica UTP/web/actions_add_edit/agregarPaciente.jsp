<%-- 
    Document   : agregarPaciente
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta Tags -->        
        <title>Pacientes</title>
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
            <!-- Home -->
            <div class="home" style="background-image:url(../images/news_background.jpg);">
                <div class="home_content">
                    <h1>Agregar Paciente</h1>
                </div>
            </div>
            <!-- Main Content -->
                <div class="container">
                    <div class="row">
                    <!-- Formulario para agregar paciente -->
                        <div class="col-lg-6">         
                            <div class="leave_comment_form_container">
                                <h1>Ingresa los Datos</h1>
                                <form class="contact-form" action="Controlador" method="POST">
                                <!-- Campo para seleccionar tipo de documento -->                                   
                                <div class="form-group">
                                    <label for="inputState">Tipo de Documento</label>
                                    <select id="inputState" class="form-control" name="tipodoc">
                                        <option selected value="1">DNI</option>
                                        <option value="2">Carnet de Extranjeria</option>
                                    </select>
                                </div>
                                 <!-- Campo para ingresar documento -->                               
                                <div class="field name">
                                    <input type="text" class="input_field" name="documento" placeholder="Documento">
                                </div>
                                <!-- Campo para ingresar nombre -->
                                <div class="field name">
                                    <input type="text" class="input_field" name="nombre" placeholder="Nombre">
                                </div>
                                <!-- Campo para ingresar apellido paterno -->
                                <div class="field">
                                    <input type="text" class="input_field" name="app" placeholder="Apellido Paterno">
                                </div>
                                <!-- Campo para ingresar apellido materno -->
                                <div class="field">
                                    <input type="text" class="input_field" name="apm" placeholder="Apellido Materno">
                                </div>
                                <!-- Campo para ingresar celular -->
                                <div class="field">
                                    <input type="number" class="input_field" name="cel" placeholder="Celular">
                                </div>
                                <!-- Campo para ingresar dirección -->
                                <div class="field">
                                    <input type="text" class="input_field" name="direccion" placeholder="Direccion">
                                </div>
                                <!-- Campo para seleccionar sexo -->
                                <div class="form-group">
                                    <select id="inputState" class="form-control" name="sexo">
                                        <option selected value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                    </select>
                                </div>
                                <!-- Campo para ingresar correo -->
                                <div class="field">
                                    <input type="text" class="input_field" name="correo" placeholder="Correo">
                                </div>
                                <!-- Campo para ingresar contraseña -->
                                <div class="field">
                                    <input type="password"  class="input_field"name="pass" placeholder="Contraseña">
                                </div>
                                <!-- Botón para enviar el formulario -->
                                <div class="button-area">
                                    <button type="submit" class="btn btn-primary" name="accion" value="registrarPaciente">Agregar</button>
                                </div>
                                </form>
                            </div><br><br>
                        </div>
                    </div>
                </div>
        </div>
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

