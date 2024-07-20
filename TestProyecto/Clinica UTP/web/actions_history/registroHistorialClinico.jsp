<%--
    Document   : registroHistorialClinico
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
        <title>Registro Historial Clinico</title>
        <jsp:include page="../actions_library/head.jsp"/>
        <link rel="stylesheet" type="text/css" href="../styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/news_post_responsive.css">
        <link rel="stylesheet" type="text/css" href="../styles/datatables.min.css">
    </head>
    <body>
        <!-- Redirección si el usuario no tiene el rol adecuado -->
        <c:if test="${medico.getRol()!=3}">
            <c:redirect url = "../actions_others/login.jsp"/>
        </c:if>
        <div class="super_container">
            <!-- Header -->
            <header class="header d-flex flex-row">
                <jsp:include page="../actions_header/headerMedico.jsp"/>
            </header>
            <!-- Home -->
            <div class="home" style="background-image:url(../images/news_background.jpg);">
                <div class="home_content">
                    <h1>Registrar Historial Clinico</h1>
                </div>
            </div>
            <!-- News -->
            <div class="container">
                <br>
                <br>
                <div class="modal" tabindex="-1" id="farmacos">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title" id="estitle">Especialidad de </h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table class="table text-center center" id="lisfarm">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Medicamento</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Indicación & Observación</th>
                                            <th scope="col">Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody id="bod">

                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal para ver laboratorios -->
                <div class="modal" tabindex="-1" id="verLaboratorio">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title" id="estitle"><spam id="nombreAna"></spam></h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div id="tbodyL">

                                </div>
                                <div class="text-center" id="loaderL"><img src="images/tail-spin.svg" width="50" alt="loader"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal" tabindex="-1" id="modTriaje">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title" id="estitle">Triaje</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div id="tbodyT">

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display: flex; justify-content: space-between">
                    <h1 class="leave_comment_title">Nombre:   ${datos.getNombre()} ${datos.getApellido_paterno()} ${datos.getApellido_materno()}</h1>
                    <h1 class="leave_comment_title text-right">${fecha}</h1>
                </div>
                <div class="leave_comment_title text-center">Historia Clinica</div>
                <form action="Controlador" method="POST">
                    <input type="hidden" name="idSolicitud" value="${idSolicitud}">
                    <input type="hidden" name="idPaciente" value="${idPaciente}">
                    <table class="table text-center center" id="tableRec">
                        <thead class="">
                            <tr>
                                <th scope="col">Nro de Historia</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Triaje</th>
                                <th scope="col">Diagnostico</th>
                                <th scope="col">Medicamentos</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Observacion</th>
                                <th scope="col">Analisis</th>
                                <th scope="col">Medico</th>
                                <th scope="col">Laboratorio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var = "contador" value = "${0}"/>
                            <c:forEach items="${historial}" var="ite">
                                <tr>
                                    <c:set var="contador" value="${contador + 1}" />
                                    <th scope="row">${contador}</th>
                                    <td>${ite.getFecha()}</td>
                                    <td>
                                        <c:if test="${ite.getTriaje()!=null}">
                                            <button class="btn btn-warning verTriaje" data-Triaj="${ite.getTriaje()}">Ver Triaje</button>
                                        </c:if>
                                        <c:if test="${ite.getTriaje()==null}">
                                            ...
                                        </c:if>
                                    </td>
                                    <td>${ite.getDiagnostico()}</td>
                                    <td>
                                        <ul>
                                            <c:forEach items="${receta}" var="pro">
                                                <c:if test="${pro.getIdhistoria()==ite.getIdHistoria()}">
                                                    <li>${pro.getProducto()}</li>
                                                    </c:if>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul>
                                            <c:forEach items="${receta}" var="ca">
                                                <c:if test="${ca.getIdhistoria()==ite.getIdHistoria()}">
                                                    <li>${ca.getCantidad()}</li>
                                                    </c:if>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul>
                                            <c:forEach items="${receta}" var="ob">
                                                <c:if test="${ob.getIdhistoria()==ite.getIdHistoria()}">
                                                    <li>${ob.getObservacion()}</li>
                                                    </c:if>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul>
                                            <c:set var = "idA" value = "${0}"/>
                                            <c:forEach items="${receta}" var="ana">
                                                <c:if test="${ana.getIdhistoria()==ite.getIdHistoria()}">
                                                    <c:if test="${ana.getIdAnalisis()!=0}">
                                                        <li data-idAnalis="${ana.getIdAnalisis()}">${ana.getNombreAnalisis()}</li>
                                                            <c:set var="idA" value="${ana.getIdAnalisis()}" />
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${receta==null}">
                                                <li>Sin receta de Analisis Clinicos</li>
                                                </c:if>
                                        </ul>
                                    </td>
                                    <td>${ite.getPersonal()}</td>
                                    <td>    
                                        <c:if test="${ite.getIdResultado()!=0}">
                                            <button class="btn btn-warning verlab" name="" value="" data-idlabo="${ite.getIdResultado()}">Ver</button>
                                        </c:if>
                                        <c:if test="${ite.getIdResultado()==0}">
                                            Sin resultados de laboratorio
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <P><b>INGRESE DIAGNOSTICO</b></p>
                    <textarea name="diagnostico" class="input_field contact_form_name" type="text" placeholder="INGRESE DIAGNOSTICO" required="required" data-error="Name is required." style="height: 130px"></textarea>
                    <P class="text-center"><b>RECETA</b></p>
                    <div class="leave_comment_title text-right"><button class="btn btn-success" type="button" name="" value="" id="addreceta">Agregar</button></div>
                    <br>
                    <table class="table text-center center">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Medicamento</th>
                                <th>Cantidad</th>
                                <th>Indicación & Observación</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody id="tbod">

                        </tbody>
                    </table>

                    <P><b>ANALISIS</b></P>
                    <div class="form-group">
                        <select id="inputState" class="input_field" name="tipoanalisis">
                            <option disabled selected>SELECCIONE UN TIPO DE ANALISIS</option>
                            <c:forEach items="${listAnalisis}" var="ite">
                                <option value="${ite.getIdAnalisis()}">${ite.getNombreAnalisis()}</option>     
                            </c:forEach> 
                        </select>
                    </div>
                    <c:if test="${poremergencia == null}">
                        <button name="accion" type="submit" class="comment_send_btn trans_200" value="registrohistorialclinico">GUARDAR HISTORIAL</button>
                    </c:if>
                    <c:if test="${poremergencia != null}">
                        <button name="accion" type="submit" class="comment_send_btn trans_200" value="actualizarhistorialEmergencia">GUARDAR HISTORIAL</button>
                    </c:if>

                    <br>
                    <br>
                </form>
            </div>
        </div>
        <!-- Enlaces a scripts JavaScript -->
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
