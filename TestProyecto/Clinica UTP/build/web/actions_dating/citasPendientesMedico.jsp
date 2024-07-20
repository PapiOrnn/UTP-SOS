<%-- 
    Document   : citasPendientesMedico
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta Tags -->        
        <title>Historial Cita</title>
        <jsp:include page="../actions_library/head.jsp"/>

        <link rel="stylesheet" type="text/css" href="../styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/news_post_responsive.css">
        <link rel="stylesheet" type="text/css" href="../styles/datatables.min.css">
    </head>
    <body>
        <!-- Verifica si el rol del usuario no es médico -->
        <c:if test="${medico.getRol()!=3}">
        <!-- Redirige al usuario a la página de login si no es médico -->s
            <c:redirect url = "../actions_others/login.jsp"/>
        </c:if>
        <div class="super_container">
            <!-- Header -->            
            <header class="header d-flex flex-row">
            <!-- Incluye el encabezado del médico -->                
                <jsp:include page="../actions_header/headerMedico.jsp"/>
            </header>
            <!-- Sección de inicio con imagen de fondo -->
            <div class="home" style="background-image:url(../images/news_background.jpg);">
            <!-- Título de la sección -->
                <div class="home_content">
                    <h1>Citas Pendientes</h1>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                         <!-- Título de la sección de comentarios -->
                        <div class="leave_comment">
                            <div class="leave_comment_title">Visualiza las citas pendientes</div>
                            <br>
                            <!-- Formulario que envía datos al controlador -->
                            <form form action="Controlador" method="POST">
                                <table id="tablecitaspendientes" class="table" style="width:100%">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th class="hide_me">idpa</th>
                                            <th>ID Solicitud</th>
                                            <th>Documento Paciente</th>
                                            <th>Nombre Paciente</th>
                                            <th>Fecha</th>
                                            <th>Hora Inicio</th>
                                            <th>Hora Fin</th>
                                            <th>Modalidad</th>
                                            <th>Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                         <!-- Itera sobre la lista de citas -->
                                        <c:forEach items="${citas}" var="c">
                                            <tr>
                                                <td class="hide_me">${c.getIdPaciente()}</td>
                                                <td>${c.getIdSolicitud()}</td>
                                                <td>${c.getDocu()}</td>
                                                <td>${c.getNomPaciente()}</td>
                                                <td>${c.getFecha()}</td>
                                                <td>${c.getHorarioInicio()}</td>
                                                <td>${c.getHorarioFin()}</td>
                                                <td>${c.getModalidad()}</td>
                                                <td><button type="submit" name="accion" value="enviosolicitudes" class="atender btn btn-warning" >Atender</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <input type="hidden" name="idSolicitud" id="idSolicitud">
                                <input type="hidden" name="idPaciente" id="idPaciente">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="../js/datatables.min.js"></script>
        <script src="../js/scriptMedico.js"></script> 
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

