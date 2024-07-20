<%-- 
    Document   : buscarPacienteE
    Created on : 18-jun-2024, 5:57:35
    Author     : Alexander
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Buscar Paciente</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Course Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/news_post_responsive.css">
    </head>
    <body>
        <c:if test="${enfermero.getRol()!=5}">
            <c:redirect url = "login.jsp"/>
        </c:if>
        <div class="super_container">

            <!-- Header -->
            <header class="header d-flex flex-row">
                <jsp:include page="headerEnfermero.jsp"/>
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
                                    <button id="comment_send_btn" type="submit" class="comment_send_btn trans_200" name="accion" value="buscarPacienteE">Buscar</button>
                                </form>
                            </div>
                            <br>
                            <c:if test="${datos.getNombre()!=null}">
                                <div style="display: flex; justify-content: space-between">
                                    <h1 class="leave_comment_title">Nombre:   ${datos.getNombre()} ${datos.getApellido_paterno()} ${datos.getApellido_materno()}</h1>
                                    <h2 class="leave_comment_title">Nro Documento:  ${datos.getDocumento()}</h2>
                                </div>
                                <a href="Controlador?accion=triaje&idp=${datos.getIdPaciente()}"><button type="button" class="btn btn-warning" >Registrar Triaje</button></a>                          
                                <br>
                                <br>
                                <table class="table text-center center ">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Nro de Historia</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Diagnostico</th>
                                            <th scope="col">Medicamentos</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Indicación & Observación</th>
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
                                                        <c:forEach items="${receta}" var="ana">
                                                            <c:if test="${ana.getIdhistoria()==ite.getIdHistoria()}">
                                                                <li>${ana.getIdAnalisis()}</li>
                                                                </c:if>
                                                            </c:forEach>
                                                    </ul>
                                                </td>
                                                <td>${ite.getPersonal()}</td>
                                                <td>
                                                    <c:if test="${ite.getIdResultado()!=0}">
                                                        ${ite.getIdResultado()}
                                                    </c:if>
                                                    Sin examanes de laboratorio
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
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
        <script src="plugins/easing/easing.js"></script>
        <script src="js/news_post_custom.js"></script>

    </body>
</html>