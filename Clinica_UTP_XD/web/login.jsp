<%-- 
    Document   : login
    Created on : 13/05/2021, 11:30:37 AM
    Author     : Deary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesion</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Course Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/style.css">
    </head>
    <body>
        <c:if test="${paciente.getRol()==2}">
            <c:redirect url = "mainPaciente.jsp"/>
        </c:if>
        <c:if test="${paciente.getRol()==3}">
            <c:redirect url = "mainMedico.jsp"/>
        </c:if>
        <c:if test="${paciente.getRol()==4}">
            <c:redirect url = "mainAuxiliar.jsp"/>
        </c:if>
        <c:if test="${paciente.getRol()==5}">
            <c:redirect url = "mainEnfermero.jsp"/>
        </c:if>

        <div class="super_container">

            <div class="content_container">
                <div class="background_image" style="background-image: url(images/slider_background1.jpg)"></div>
                <div class="login_container">
                    <div class="login_content">

                        <div class="logo">
                            <img src="images/logo.png" alt="">
                        </div>

                        <h3>Bienvenido</h3>
                        <form class="contact-form" action="Controlador" method="POST">
                            <div class="fields">
                                <div class="field name">
                                    <input type="text" name="correo" placeholder="Correo" value="${correo}" required>
                                </div>
                            </div>
                            <div class="field">
                                <input type="password" name="contra" placeholder="Contraseña" value="${pass}" required>
                            </div>
                            <c:if test="${resp==0}">
                                <font size="3" color="red">Correo & Contraseña Incorrecta</font>
                            </c:if>
                            <br>
                            <div class="button-area">
                                <button type="submit" name="accion" value="ingresar">INICIAR SESIÓN</button>
                            </div>
                            <br>
                            <a href="registro.jsp">Si no tienes una cuenta Regístrate ahora</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/greensock/TweenMax.min.js"></script>
        <script src="plugins/greensock/TimelineMax.min.js"></script>
        <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="plugins/greensock/animation.gsap.min.js"></script>
        <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="plugins/scrollTo/jquery.scrollTo.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/contact_custom.js"></script>
    </body>
</html>
