<%-- 
    Document   : historialClinico
    Created on : 14/05/2024, 03:28:15 PM
    Author     : Edu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Historial Clinico</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Course Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/courses_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/courses_responsive.css">
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
                    <h1>Historial Clinico</h1>
                </div>
            </div>

            <!-- Historial -->
            <div class="container" style="max-width: 1250px">
                <br>
                <c:if test="${historial==null}">
                    <h3>Es la primera vez te atenderas en la Clinica UTP todavia <b>NO</b> tienes historial Clinico para revisar</h3>
                </c:if>
                <c:if test="${historial!=null}"> 
                    <form action="Controlador" method="POST">
                        <div class="modal" tabindex="-1" id="horarioLaboratorio">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">  
                                        <div class="d-flex flex-row justify-content-between" style="width: 40%">
                                            <h3 class="modal-title" id="estitle"><spam id="nomAna"></spam></h3>
                                            <h3 class="modal-title" id="estitle">Costo: S/<spam id="costoAa"></spam></h3>
                                        </div>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table" id="tableHorarioLab">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Fecha</th>
                                                    <th scope="col">Hora Inicio</th>
                                                    <th scope="col">Hora Fin</th>
                                                    <th scope="col">Medico</th>
                                                    <th scope="col">Accion</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bod">

                                            </tbody>
                                        </table>
                                        <input type="hidden" readonly name="IdMedicoL" placeholder="IdMedicoL" id="IdMedicoL"/>
                                        <input type="hidden" readonly name="IdHorarioL"  placeholder="IdHorarioL" id="IdHorarioL"/>
                                        <input type="hidden" readonly name="costoL" placeholder="costoL" id="costoL"/>
                                        <input type="hidden" readonly name="historiaXanalisis" value="" placeholder="historiaXanalisis" id="historiaXanalisis"/>
                                        <input type="hidden" readonly name="idAnalisisL" placeholder="idAnalisisL" id="idAnalisisL"/>
                                        <div class="text-center" id="mensajeVacio"><p><b>No Hay Citas Disponibles Para Laboratorio</b></p></div>
                                        <div class="text-center" id="loader"><img src="images/tail-spin.svg" width="50" alt="loader"></div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
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
                                <th scope="col">Accion</th>
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
                                            <button class="btn btn-warning verlab" name="" value="" data-idlabo="${ite.getIdResultado()}">Ver Resultado</button>
                                        </c:if>
                                        <c:if test="${ite.getIdResultado()==0}">
                                            Sin resultados de laboratorio
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${idA!=0 && ite.getIdResultado()==0}">
                                            <button class="btn btn-outline-info horlab" name="accion" value="reservarLaboratorio" data-idHist="${ite.getIdHistoria()}">Reservar Laboratorio</button>
                                        </c:if>
                                        <c:if test="${ite.getIdResultado()!=0}">
                                            <button class="btn btn-light" disabled>Examen Realizado</button>
                                        </c:if>
                                        <c:if test="${idA==0}">
                                            <button class="btn btn-outline" disabled>Nada que Reservar</button>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if> 
                <br>
                <br>
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
        <script src="js/teachers_custom.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>