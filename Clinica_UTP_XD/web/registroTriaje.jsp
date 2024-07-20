<%-- 
    Document   : registroTriaje
    Created on : 08-jul-2024, 16:17:25
    Author     : Mauricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Registro Historial Clinico</title>
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
                    <h1>Registrar Triaje</h1>
                </div>
            </div>

            <!-- News -->

            <div class="container">
                <br>
                <br>
                <div style="display: flex; justify-content: space-between">
                    <h1 class="leave_comment_title">Nombre:   ${datos.getNombre()} ${datos.getApellido_paterno()} ${datos.getApellido_materno()}</h1>
                    <h1 class="leave_comment_title text-right">${fecha}</h1>
                </div>
                <div class="leave_comment_title text-center">Historia Clinica</div>
                <form action="Controlador" method="POST">

                    <input type="hidden" name="idPaciente" value="${datos.getIdPaciente()}">
                    <table class="table text-center center">
                        <thead class="">
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
                    <P><b>Ingrese Datos del Triaje</b></p>
                    <div class="row">
                        <div class="col-lg-6">
                            <P><b>Altura</b></p>
                            <input type="text" class="input_field contact_form_name"  name="altura" placeholder="INGRESE ALTURA" required="required" data-error="Name is required." >
                            <P><b>Peso</b></p>
                            <input type="text" class="input_field contact_form_name"  name="peso" placeholder="INGRESE PESO" required="required" data-error="Name is required." >
                            <P><b>Temperatura</b></p>
                            <input type="text" class="input_field contact_form_name"  name="temperatura" placeholder="INGRESE TEMPERATURA" required="required" data-error="Name is required." >
                        </div>
                        <div class="col-lg-6">
                            <P><b>Presion Arterial</b></p>
                            <input type="text" class="input_field contact_form_name"  name="parterial" placeholder="INGRESE PRESION ARTERIAL" required="required" data-error="Name is required." >
                            <P><b>Signos Vitales</b></p>
                            <input type="text" class="input_field contact_form_name"  name="signosVitales" placeholder="INGRESE SIGNOS VITALES" required="required" data-error="Name is required." >
                        </div>
                    </div>   
                    <button name="accion" type="submit" class="comment_send_btn trans_200" value="registrotriaje">GUARDAR HISTORIAL</button>
                    <br>
                    <br>
                </form>
            </div>
        </div>

        <script src="js/jquery-3.2.1.min.js"></script>
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
