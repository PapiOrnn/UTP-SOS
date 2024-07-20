<%-- 
    Document   : historialCitaPaciente
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Citas Pendientes</title>
        <jsp:include page="../actions_library/head.jsp"/>
        <link rel="stylesheet" type="text/css" href="../styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/news_post_responsive.css">
        <link rel="stylesheet" type="text/css" href="../styles/datatables.min.css">
    </head>
    <body>
        <c:if test="${auxiliar.getRol()!=4}">
            <c:redirect url = "../actions_others/login.jsp"/>
        </c:if>
        <div class="super_container">

            <!-- Header -->
            <header class="header d-flex flex-row">
                <jsp:include page="../actions_header/headerAuxiliar.jsp"/>
            </header>
            <!-- Home -->

            <div class="home" style="background-image:url(../images/news_background.jpg);">

                <div class="home_content">
                    <h1>Analisis Pendientes</h1>
                </div>
            </div>

            <!-- News -->

            <div class="news">
                <div class="container">
                    <div class="row">
                        <!-- News Post Column -->
                        <!-- Leave Comment -->
                        <div class="leave_comment_title">Visualiza los analisis pendientes</div>
                        <br>
                        <form form action="Controlador" method="POST">
                            <table id="tablecitaspendientes" class="table text-center center">
                                <thead class="thead-dark">
                                    <tr>
                                        <th class="hide_me">idpa</th>
                                        <th class="hide_me">HistoriaXanalisis</th>
                                        <th>#</th>
                                        <th>Documento</th>
                                        <th>Nombre</th>
                                        <th>Tipo Analisis</th>
                                        <th>Fecha</th>
                                        <th>Horario</th>
                                        <th>Modalidad</th>
                                        <th>Estado</th>
                                        <th>Prioridad</th>
                                        <th>Accion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="normal" value="Normal"/>
                                    <c:set var="alta" value="Alta"/>
                                    <c:set var="Pendiente" value="Pendiente"/>
                                    <c:set var="mTomada" value="Muestra Tomada"/>
                                    <c:forEach items="${citas}" var="c">
                                        <tr>
                                            <td class="hide_me">${c.getIdPaciente()}</td>
                                            <td class="hide_me">${c.getHistoriaXanalisis()}</td>
                                            <td>${c.getIdSolicitud()}</td>
                                            <td>${c.getDocu()}</td>
                                            <td>${c.getNomPaciente()}</td>
                                            <td><ul><li>
                                                ${c.getNombreAnalisis()}
                                                    </li>
                                                    <li>${c.getNombreAnalisis()}</li>
                                                </ul></td>
                                            <td>${c.getFecha()}</td>
                                            <td>${c.getHorarioInicio()} a ${c.getHorarioFin()} </td>
                                            <td>${c.getModalidad()}</td>
                                            <td>${c.getEstadoServicio()}</td>
                                            <td <c:if test="${c.getPrioridad().equals(normal)}">
                                                    style="color: green"
                                                </c:if>
                                                <c:if test="${c.getPrioridad().equals(alta)}">
                                                    style="color: red"
                                                </c:if>><b>${c.getPrioridad()} </b>
                                            </td>
                                            <td>
                                                <button type="submit" name="accion" value="enviosolicitudes" data-idTipo="${c.getIdAnalisis()}" class="atenderLaborar btn btn-warning" >
                                                    <c:if test="${c.getEstadoServicio().equals(Pendiente)}">
                                                        Cambiar Estado
                                                    </c:if>
                                                    <c:if test="${c.getEstadoServicio().equals(mTomada)}">
                                                        Subir Resultado
                                                    </c:if>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <input type="hidden" readonly name="idSolicitud" id="idSolicitud">
                            <input type="hidden" readonly name="idPaciente" id="idPaciente">
                            <input type="hidden" readonly name="idTipoa" id="idTipoa">
                            <input type="text" readonly name="estadoSol" id="estadoSol">
                            <input type="hidden" readonly name="historiaXanalisis" id="historiaXanalisis">
                        </form>
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

