<%-- 
    Document   : historialCitaPaciente
    Created on : 14/05/2024, 03:23:03 PM
    Author     : Christian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Historial Cita</title>
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

        <div class="super_container">

            <!-- Header -->
            <header class="header d-flex flex-row">
                <jsp:include page="headerPaciente.jsp"/>
            </header>
            <!-- Home -->

            <div class="home">
                <div class="home_background_container prlx_parent">
                    <div class="home_background prlx" style="background-image:url(images/news_background.jpg)"></div>
                </div>
                <div class="home_content">
                    <h1>Realizar Pago de Servicios</h1>
                </div>
            </div>

            <!-- News -->

            <div class="news">
                <div class="container">
                    <div class="row">
                        <!-- News Post Column -->
                        <div class="col-lg-8">
                            <P><b>REALIZAR PAGO DE ....</b></p>
                            <label><b>HORARIO SELECCIONADO</b></label>
                            <input type="hidden" readonly id="idespecialidad" required name="idespecialidad" value="">
                            <input type="hidden" readonly id="idHorario" required name="idHorario" value="">
                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Especialidad</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext" id="espEscogida" required="required" value="" >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Hora</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext" id="hora" required="required" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Medico</label>
                                <div class="col-sm-10">
                                    <input type="hidden" readonly id="idmedico" required name="idmedico" value="">
                                    <input type="text" readonly class="form-control-plaintext" id="medico" required="required" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Costo</label>
                                <div class="col-sm-10">
                                    <input type="hidden" readonly id="idmedico" required name="idmedico" value="">
                                    <input type="text" readonly class="form-control-plaintext" id="medico" required="required" value="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <P><b>INGRESE LOS DATOS DE SU TARJETA</b></p>
                            <div class="container-card">
                                <div class="col2">
                                    <label>Numero de Tarjeta</label>
                                    <input class="number" type="text" ng-model="ncard" maxlength="19" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                                    <label>Nombre</label>
                                    <input class="inputname" type="text" placeholder=""/>
                                    <label>Fecha de Expiracion</label>
                                    <input class="expire" type="text" placeholder="MM / YYYY"/>
                                    <label>Codigo de Seguridad</label>
                                    <input class="ccv" type="text" placeholder="CVC" maxlength="3" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                                    <button class="buy"><i class="material-icons"></i>$00.00</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/misScripts.js"></script>
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
