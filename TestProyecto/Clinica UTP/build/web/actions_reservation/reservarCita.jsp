<%-- 
    Document   : reservarCita
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Reservar Cita</title>
        <jsp:include page="../actions_library/head.jsp"/>
        <link rel="stylesheet" type="text/css" href="../styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/news_post_responsive.css">
    </head>
    <body>
        <c:if test="${paciente.getRol()!=2}">
            <c:redirect url = "../actions_others/login.jsp"/>
        </c:if>
        <div class="super_container">

            <!-- Header -->
            <header class="header d-flex flex-row">
                <jsp:include page="../actions_header/headerPaciente.jsp"/>
            </header>
            <!-- Home -->

            <div class="home" style="background-image:url(../images/news_background.jpg);">

                <div class="home_content">
                    <h1>Registrar tu Cita</h1>
                </div>
            </div>

            <!-- News -->

            <div class="news">
                <div class="container">
                   <c:if test="${cReservado!=null}">
                        <div class="modal" tabindex="-1" id="CitaReservada">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                        <div class="alert alert-success" role="alert" style="margin-top:1.5rem; margin-bottom: 0 ">
                                            ${cReservado}
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <div class="row">

                        <!-- News Post Column -->

                        <div class="col-lg-8">
                            <!-- Leave Comment -->

                            <div class="leave_comment_title text-center">Empieza ahora agendar tu cita</div>
                            <br>
                            <form action="Controlador" method="POST">  

                                <P><b>SELECCIONA LA ESPECIALIDAD</b>
                                    <select id="especialidad" class="input_field contact_form_email" required>
                                        <option disabled selected>SELECCIONE UNA ESPECIALIDAD</option>
                                        <c:forEach items="${especialidad}" var="ite">
                                            <option value="${ite.getIdEspecialidad()}">${ite.getNomEspecialidad()}</option>     
                                        </c:forEach>   
                                    </select>
                                </p>
                                <div class="modal" tabindex="-1" id="horario">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="estitle">Especialidad de </h3>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table" id="tableHorarioo">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th scope="col">#</th>
                                                            <th scope="col">Día</th>
                                                            <th scope="col">Hora Inicio</th>
                                                            <th scope="col">Hora Fin</th>
                                                            <th scope="col">Medico</th>
                                                            <th scope="col">Accion</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="bod">

                                                    </tbody>
                                                </table>
                                                <div class="text-center" id="mensajeVacio"><p><b>No Hay Citas Disponibles En Esta Especialidad</b></p></div>
                                                <div class="text-center" id="loader"><img src="../images/tail-spin.svg" width="50" alt="loader"></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <label><b>HORARIO SELECCIONADO</b></label>
                                <input type="hidden" readonly id="idespecialidad" required name="idespecialidad" value="${objsolicitud.getIdEspecialidad()}">
                                <input type="hidden" readonly id="idHorario" required name="idHorario" value="${objsolicitud.getIdHorario()}">
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label">Especialidad</label>
                                    <div class="col-sm-10">
                                        <input type="text" readonly class="form-control-plaintext" id="espEscogida" required="required" value="${objsolicitud.getEspecialidad()}" >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Hora</label>
                                    <div class="col-sm-10">
                                        <input type="text" readonly class="form-control-plaintext" id="hora" required="required" value="${objsolicitud.getHorarioInicio()}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label">Medico</label>
                                    <div class="col-sm-10">
                                        <input type="hidden" readonly id="idmedico" required name="idmedico" value="${objsolicitud.getIdPersonal()}">
                                        <input type="text" readonly class="form-control-plaintext" id="medico" required="required" value="${objsolicitud.getPersonal()}">
                                    </div>
                                </div>

                                <P><b>MODALIDAD</b>
                                    <select class="input_field contact_form_email"  name="modalidad" required="required">
                                        <option value="Presencial" <c:if test="${objsolicitud.getModalidad() == 'Presencial'}">
                                                selected
                                            </c:if>>
                                            PRESENCIAL
                                        </option>
                                        <option value="Virtual" <c:if test="${objsolicitud.getModalidad() == 'Virtual'}">
                                                selected
                                            </c:if>>
                                            VIRTUAL
                                        </option>           
                                    </select></p>
                                    <c:set var="da" value="${fech}" />
                                <label><b>COSTO</b></label>
                                <input type="hidden" readonly id="costo" required name="costo" value="${objsolicitud.getCosto()}">
                                <div class="shadow-none p-3 mb-5 bg-light rounded" id="costoTotal" value="${objsolicitud.getCosto()}">
                                    <h2>${objsolicitud.getCosto()}</h2>
                                </div>
                                <input type="hidden" readonly required name="idsoll" value="${objsolicitud.getIdSolicitud()}">
                                <c:if test="${objsolicitud.getIdSolicitud()==null}">
                                    <button id="disa" type="submit" class="comment_send_btn trans_200 disab"  name="accion" value="RegistrarCita">Reservar Cita</button>
                                </c:if>
                                <c:if test="${objsolicitud.getIdSolicitud()!=null}">
                                     <button id="disa" type="submit" class="comment_send_btn trans_200 disab"  name="accion" value="guardarCitaEdit">Modificar Cita</button>
                                </c:if>

                            </form>
                        </div>

                        <!-- Sidebar Column -->

                        <div class="col-lg-4">
                            <div class="sidebar">

                                <!-- Archives -->

                                <!-- Latest Posts -->

                                <div class="sidebar_section">
                                    <div class="sidebar_section_title">

                                    </div>

                                    <div class="latest_posts">

                                        <!-- Latest Post -->
                                        <div class="latest_post">
                                            <div class="latest_post_image">
                                                <img src="../images/latest_1.jpg" alt="https://unsplash.com/@dsmacinnes">
                                            </div>
                                            <div class="latest_post_title"><a href="#">Cuenta con nosotros	</a></div>
                                            <div class="latest_post_meta">

                                            </div>
                                        </div>

                                        <!-- Latest Post -->
                                        <div class="latest_post">
                                            <div class="latest_post_image">
                                                <img src="../images/latest_2.jpg" alt="https://unsplash.com/@erothermel">
                                            </div>
                                            <div class="latest_post_title"><a href="#">Elige tu mejor horario</a></div>
                                            <div class="latest_post_meta">

                                            </div>
                                        </div>

                                        <!-- Latest Post -->
                                        <div class="latest_post">
                                            <div class="latest_post_image">
                                                <img src="../images/latest_3.jpg" alt="https://unsplash.com/@element5digital">
                                            </div>
                                            <div class="latest_post_title"><a href="#">Tu salud es primero</a></div>
                                            <div class="latest_post_meta">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Tags -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="../js/scriptPaciente.js"></script> 
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

