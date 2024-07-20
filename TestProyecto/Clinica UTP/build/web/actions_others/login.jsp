<%-- 
    Document   : login
    Created on : 3 jun. 2024, 17:40:41
    Author     : Albert 
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta Tags -->        
        <title>Inicio de Sesion</title>

        <!-- CSS Stylesheets -->        
        <jsp:include page="../actions_library/head.jsp" />
        <!-- CSS Propio Login  -->  
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/contact_styles.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/contact_responsive.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">

    </head>
    <body>
        <!-- Conditional Redirects Based on User Role -->        
        <c:if test="${paciente.getRol()==2}">
            <c:redirect url = "../actions_main/mainPaciente.jsp"/>
        </c:if>
        <c:if test="${paciente.getRol()==3}">
            <c:redirect url = "../actions_main/mainMedico.jsp"/>
        </c:if>
        <c:if test="${paciente.getRol()==4}">
            <c:redirect url = "../actions_main/mainAuxiliar.jsp"/>
        </c:if>
        <c:if test="${paciente.getRol()==5}">
            <c:redirect url = "../actions_main/mainEnfermero.jsp"/>
        </c:if>
        <!-- Main Container -->
        <div class="super_container">
            <!-- Content Container -->
            <div class="content_container">
                <!-- Background Image -->                
                <div class="background_image" style="background-image: url(../images/slider_background1.jpg)"></div>
                <!-- Login Container -->                
                <div class="login_container">
                    <div class="login_content">
                        <!-- Logo -->
                        <div class="logo">
                            <img src="../images/logo.png" alt="">
                        </div>
                        <!-- Welcome Message -->
                        <h3>Bienvenido</h3>
                        <!-- Login Form -->                        
                        <form class="contact-form" action="Controlador" method="POST">
                            <!-- Email Field -->                            
                            <div class="fields">
                                <div class="field name">
                                    <input type="text" name="correo" placeholder="Correo" value="${correo}" required>
                                </div>
                            </div>
                            <!-- Password Field -->                                
                            <div class="field">
                                <input type="password" name="contra" placeholder="Contraseña" value="${pass}" required>
                            </div>
                            <!-- Error Message -->                            
                            <c:if test="${resp==0}">
                                <font size="3" color="red">Correo & Contraseña Incorrecta</font>
                            </c:if>
                            <!-- Submit Button -->                                
                            <br>
                            <div class="button-area">
                                <button type="submit" name="accion" value="ingresar">INICIAR SESIÓN</button>
                            </div>
                            <br>
                            <!-- Registration Link -->                            
                            <a href="../actions_history/registro.jsp">Si no tienes una cuenta Regístrate ahora</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <!-- LLamar script -->
    <jsp:include page="../actions_library/script.jsp" /> 

    </body>
</html>
