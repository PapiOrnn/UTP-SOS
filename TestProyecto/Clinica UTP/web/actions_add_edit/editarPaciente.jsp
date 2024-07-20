<%-- 
    Document   : editarPaciente
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
                <!-- Incluir el encabezado del administrador -->
            <header class="header d-flex flex-row">
                <!-- Incluir el encabezado del administrador -->
                <jsp:include page="../actions_header/headerAdministrador.jsp"/>
            </header>
            <!-- Home Section -->
            <div class="home" style="background-image:url(../images/news_background.jpg);">
                <div class="home_content">
                    <h1>Editar Paciente</h1>
                </div>
            </div>

            <!-- News -->
            <div class="container">
                <div class="row">
                    <!-- News Post Column -->
                       <div class="col-lg-6">                            
                        <div class="leave_comment_form_container">
                                <h1>Ingresa los Datos</h1>                                
                                <form class="contact-form" action="Controlador" method="POST">
                        <!-- Campo oculto para el ID del paciente -->
                        <div class="field name">
                            <input type="hidden" value="${ep.getIdPaciente()}" class="input_field" name="idPaciente" placeholder="Nombre">
                        </div>
                        <!-- Campo para el DNI del paciente (deshabilitado) -->
                        <label>DNI</label>
                        <div class="field name">
                            <input type="text" disabled value="${ep.getDocumento()}" class="input_field" name="nombre" placeholder="Nombre">
                        </div>
                        <!-- Campo para el nombre del paciente -->
                        <label>Nombre</label>
                        <div class="field name">
                            <input type="text" value="${ep.getNombre()}" class="input_field" name="nombre" placeholder="Nombre">
                        </div>
                        <!-- Campo para el apellido paterno del paciente -->
                         <label>Apellido Paterno</label>
                        <div class="field">
                            <input type="text" value="${ep.getApellido_paterno()}" class="input_field" name="app" placeholder="Apellido Paterno">
                        </div>
                        <!-- Campo para el apellido materno del paciente -->
                         <label>Apellido Materno</label>
                        <div class="field">
                            <input type="text" value="${ep.getApellido_materno()}" class="input_field" name="apm" placeholder="Apellido Materno">
                        </div>
                        <!-- Campo para el teléfono del paciente -->
                         <label>Telefono</label>
                        <div class="field">
                            <input type="number" value="${ep.getTelefono()}" class="input_field" name="cel" placeholder="Celular">
                        </div>
                        <!-- Campo para la dirección del paciente -->
                         <label>Direccion</label>
                        <div class="field">
                            <input type="text" value="${ep.getDireccion()}" class="input_field" name="direccion" placeholder="Direccion">
                        </div>
                          <label>Correo</label>
                        <!-- Campo para el correo del paciente -->
                        <div class="field">
                            <input type="text" value="${ep.getCorreo()}" class="input_field" name="correo" placeholder="Celular">
                        </div>
                        <!-- Campo para la contraseña del paciente -->
                         <label>Contraseña</label>
                        <div class="field">
                            <input type="text" value="${ep.getPassword()}" class="input_field" name="pass" placeholder="Direccion">
                        </div>
                        <!-- Botón para enviar el formulario y actualizar el paciente -->
                        <div class="button-area">
                            <button type="submit" class="btn btn-primary" name="accion" value="actualizarPaciente">Actualizar</button>
                        </div>
                            </form> 
                        </div>
                    </div>   
                </div> 
            </div>
        </div><br><br>
                            
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
