<%-- 
    Document   : historialCitaPaciente
    Created on : 14/05/2021, 03:23:03 PM
    Author     : Christian
--%>
<%@page import="Entidades.Solicitud"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Mis Citas</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Course Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/news_post_responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/datatables.min.css">
    </head>
    <body>
        <c:if test="${paciente.getRol()!=2}">
            <c:redirect url = "login.jsp"/>
        </c:if>
        <div class="super_container">

            <!-- Header -->

            <header class="header d-flex flex-row">
                <jsp:include page="headerPaciente.jsp"/>
            </header>

            <!-- Home -->

            <div class="home" style="background-image:url(images/news_background.jpg);">
                <div class="home_content">
                    <h1>Historial de Citas</h1>
                </div>
            </div>

            <!-- News -->
            <div class="container">
                <div class="row">
                    <c:if test="${cancelCita!=null || labreservado!=null}">
                        <div class="modal" tabindex="-1" id="CitaReservada">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                        <div class="alert alert-success" role="alert" style="margin-top:1.5rem; margin-bottom: 0 ">
                                            ${cancelCita} ${labreservado}
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <!-- News Post Column -->
                    <div class="col-lg-12">
                        <%
                            List<Solicitud> da = (List<Solicitud>) request.getAttribute("listaCitas");
                            List<Solicitud> citasLab = (List<Solicitud>) request.getAttribute("listaCitasLab");
                        %>
                        <div class="leave_comment">
                            <div class="leave_comment_title text-center">Mis Citas Para Especialidades</div>
                            <br>
                            <table id="tablemiscitas" class="table" style="width:100%">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Especialidad</th>
                                        <th scope="col">Medico</th>
                                        <th scope="col">Hora Inicio</th>
                                        <th scope="col">Hora Fin</th>
                                        <th scope="col">Fecha</th>
                                        <th scope="col">Modalidad</th>
                                        <th scope="col">Costo</th>
                                        <th scope="col">Estado Servicio</th>
                                        <th scope="col" align="center">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        if (da != null) {
                                            int i = 1;
                                            for (Solicitud a : da) {
                                    %>
                                    <tr>
                                        <td><%=i++%></td>
                                        <td><%=a.getEspecialidad()%></td>
                                        <td><%=a.getPersonal()%></td>
                                        <td><%=a.getHorarioInicio()%></td>
                                        <td><%=a.getHorarioFin()%></td>
                                        <td><%=a.getFecha()%></td>
                                        <td><%=a.getModalidad()%></td>
                                        <td><%=a.getCosto()%></td>                                         
                                        <td><%=a.getEstadoServicio()%></td>
                                        <td colspan="2">  
                                            <form method="Post" action="Controlador">
                                                <input type="hidden" name="idsolicitud" value="<%=a.getIdSolicitud()%>" >
                                                <%
                                                    if (a.getEstadoServicio().equalsIgnoreCase("Cancelado") || a.getEstadoServicio().equalsIgnoreCase("Atendido")) {
                                                %>
                                                <button type="submit" class="btn btn-light" disabled><%=a.getEstadoServicio()%></button>
                                                <%
                                                } else {
                                                %>
                                                <button type="submit" class="btn btn-warning" name="accion" value="editarCita">Editar</button>
                                                <button type="submit" class="btn btn-danger" name="accion" value="cancelarCita">Cancelar</button>
                                                <%
                                                    }
                                                %>
                                            </form>
                                        </td>
                                    </tr> 

                                    <%
                                            }
                                        }
                                    %> 
                                </tbody>
                            </table>
                            <br>
                            <button class="btn btn-info" id="mostrar">Mostrar todas las Citas</button>
                            <br>
                            <hr>
                            <div class="leave_comment_title text-center">Mis Citas Para Laboratorio</div>
                            <br>
                            <table id="tablemiscitasLab" class="table text-center" style="width:100%">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tipo Analisis</th>
                                        <th scope="col">Medico</th>
                                        <th scope="col">Hora Inicio</th>
                                        <th scope="col">Hora Fin</th>
                                        <th scope="col">Fecha</th>
                                        <th scope="col">Modalidad</th>
                                        <th scope="col">Costo</th>
                                        <th scope="col">Estado Servicio</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        if (citasLab != null) {
                                            int i = 1;
                                            for (Solicitud a : citasLab) {
                                    %>
                                    <tr>
                                        <td><%=i++%></td>
                                        <td><%=a.getEspecialidad()%></td>
                                        <td><%=a.getPersonal()%></td>
                                        <td><%=a.getHorarioInicio()%></td>
                                        <td><%=a.getHorarioFin()%></td>
                                        <td><%=a.getFecha()%></td>
                                        <td><%=a.getModalidad()%></td>
                                        <td><%=a.getCosto()%></td>                                         
                                        <td><%=a.getEstadoServicio()%></td>
                                        <td>  
                                            <form method="Post" action="Controlador">
                                                <input type="hidden" name="idsolicitud" value="<%=a.getIdSolicitud()%>" >
                                                <%
                                                    if (a.getEstadoServicio().equalsIgnoreCase("Cancelado") || a.getEstadoServicio().equalsIgnoreCase("Atendido")) {
                                                %>
                                                <button type="submit" class="btn btn-light" disabled><%=a.getEstadoServicio()%></button>
                                                <%
                                                } else {
                                                %>
                                                <button type="submit" class="btn btn-danger" name="accion" value="cancelarCita">Cancelar</button>
                                                <%
                                                    }
                                                %>
                                            </form>
                                        </td>
                                    </tr> 

                                    <%
                                            }
                                        }
                                    %> 
                                </tbody>
                            </table>
                            <br>
                            <button class="btn btn-info" id="mostrarCitasL">Mostrar todas las Citas</button>
                            <br>
                            <br>
                        </div>
                    </div>
                </div>  
            </div>
        </div> 
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/datatables.min.js"></script>
        <script src="js/scriptPaciente.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/greensock/TweenMax.min.js"></script>
        <script src="plugins/greensock/TimelineMax.min.js"></script>
        <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="plugins/greensock/animation.gsap.min.js"></script>
        <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="plugins/scrollTo/jquery.scrollTo.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/news_post_custom.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
