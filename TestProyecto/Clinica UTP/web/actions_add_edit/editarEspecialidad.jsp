<%-- 
    Document   : editarEspecialidad
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta Tags -->        
        <title>Especialidad</title>
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
                    <h1>Editar Especialidad</h1>
                </div>
            </div>
            
            <div class="container">
                <div class="row">
                    <!-- News Post Column -->
                    <div class="col-lg-6">
                        <!-- Formulario para editar la especialidad -->                            
                        <div class="leave_comment_form_container">
                                <h1 class="text-center">Ingresa los Datos</h1>
                                <br>
                            <form class="contact-form" action="#" method="POST">
                              <!-- Campo oculto para el ID de la especialidad -->
                                <div class="field name">
                                    <input type="hidden" value="${ep.getIdEspecialidad()}" class="input_field" name="idEspecialidad" >
                                </div>
                                <!-- Campo para el nombre de la especialidad -->
                                <div class="field name">
                                    <input type="text" value="${ep.getNomEspecialidad()}" class="input_field" name="nomEspecialidad" >
                                </div>
                                <!-- Campo para el costo de la especialidad -->
                                <div class="field name">
                                    <input type="number" value="${ep.getCosto()}"class="input_field" step="0.1" name="costoEspecialidad" >
                                </div>
                                    <!-- Botón para enviar el formulario y actualizar la especialidad -->                                
                                <div class="button-area">
                                    <button type="submit" class="btn btn-primary" name="accion" value="actualizarEspecialidad">Actualizar</button>
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

