<%-- 
    Document   : agregarEspecialidad
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
        <title>Especialidad</title>

        <!-- CSS Stylesheets -->        
        <jsp:include page="../actions_library/head.jsp" />
         <!-- CSS Agregar Especialidad  -->  
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
                    <h1>Agregar Especialidad</h1>
                </div>
            </div>
            <!-- Main Content -->
                <div class="container">
                    <div class="row">
                    <!-- Formulario para agregar especialidad -->
                        <div class="col-lg-6">                         
                            <div class="leave_comment_form_container">
                                <h1 class="text-center">Ingresa los Datos</h1>
                                <br>
                                <form class="contact-form" action="Controlador" method="POST">
                                <!-- Campo para el nombre de la especialidad -->                        
                                    <div class="field name">
                                        <input type="text" class="input_field" name="nomEspecialidad" placeholder="Especialidad">
                                    </div>
                                <!-- Campo para el costo de la especialidad -->                                
                                    <div class="field name">
                                        <input type="number" class="input_field" step="0.1"name="costoEspecialidad" placeholder="Costo">
                                    </div>
                                <!-- Botón para enviar el formulario -->
                                    <div class="button-area">
                                        <button type="submit" class="btn btn-primary" name="accion" value="registrarEspecialidad">Agregar</button>
                                    </div>
                                </form> 
                            </div>
                        </div>
                    </div>
                </div>
        </div><br><br>
        <!-- JavaScript Files -->        
        <jsp:include page="../actions_library/script.jsp" /> 
        <script src="../js/misScripts.js"></script>  
        <script src="../js/news_post_custom.js"></script>
        <!-- Incluir el pie de página -->
        <jsp:include page="../actions_others/footer.jsp"/>
    </body>
</html>

