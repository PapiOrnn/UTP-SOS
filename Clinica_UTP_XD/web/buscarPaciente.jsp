<%-- 
    Document   : reservarCita
    Created on : 14/05/2024, 03:31:17 PM
    Author     : Albert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Citas</title>
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
        <c:if test="${medico.getRol()!=3}">
            <c:redirect url = "login.jsp"/>
        </c:if>
        <div class="super_container">

            <!-- Header -->
            <header class="header d-flex flex-row">
                <jsp:include page="headerMedico.jsp"/>
            </header>
            <!-- Home -->

            <div class="home" style="background-image:url(images/news_background.jpg);">

                <div class="home_content">
                    <h1>Busqueda de Paciente</h1>
                </div>
            </div>

            <!-- News -->
            <div class="news">
                <div class="container">
                    <div class="row">

                        <!-- News Post Column -->

                        <div class="col-lg-12">
                            <!-- Leave Comment -->
                            <h1 class="leave_comment_title">Buscar Paciente Por Numero de Documento</h1>
                            <div class="">
                                <form action="Controlador" method="POST">
                                    <input id="comment_form_name" class="input_field contact_form_name" type="text" placeholder="Documento de Identidad" required="required" data-error="Name is required." name="docume"></P>
                                    <button id="comment_send_btn" type="submit" class="comment_send_btn trans_200" name="accion" value="buscarPaciente">Buscar</button>
                                </form>
                            </div>
                            <br>
                            <c:if test="${datos.getNombre()!=null}">
                                <div style="display: flex; justify-content: space-between">
                                    <h1 class="leave_comment_title">Nombre:   ${datos.getNombre()} ${datos.getApellido_paterno()} ${datos.getApellido_materno()}</h1>
                                    <h2 class="leave_comment_title">Nro Documento:  ${datos.getDocumento()}</h2>
                                </div>
                                <form action="Controlador" method="POST">
                                    <input type="hidden" value="${datos.getIdPaciente()}" name="idPaciente"> 

                                    <button type="submit" name="accion" value="enviosolicitudes" class="btn btn-warning" >Registrar Nuevo Historial Clinico</button>

                                </form>
                                <br>
                                <c:if test="${triajeEmergencia!=null}">
                                    <form action="Controlador" method="POST">
                                        <input type="hidden" value="${datos.getIdPaciente()}" name="idPaciente"> 
                                        <input type="hidden" value="poremergencia" name="poremergencia">
                                        <button type="submit" name="accion" value="enviosolicitudes" class="btn btn-warning" >Atender por Emergencia</button>
                                    </form>
                                </c:if>
                                <br>
                                <br>
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
                                <table class="table text-center center" id="tableRec">
                                    <thead class="thead-dark">
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
                            </c:if>
                            <c:if test="${result!=null}">
                                <div class="alert alert-danger" role="alert">
                                    ${result}
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/datatables.min.js"></script>
        <script src="js/scriptMedico.js"></script> 
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
