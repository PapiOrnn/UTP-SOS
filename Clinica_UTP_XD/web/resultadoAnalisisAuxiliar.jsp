<%-- 
    Document   : reservarCita
    Created on : 14/05/2021, 03:31:17 PM
    Author     : Christian
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
    </head>
    <body>

        <div class="super_container">

            <!-- Header -->
            <header class="header d-flex flex-row">
                <jsp:include page="headerAuxiliar.jsp"/>
            </header>
            <!-- Home -->

            <div class="home" style="background-image:url(images/news_background.jpg);">

                <div class="home_content">
                    <h1>Resultados CLINICOS</h1>
                </div>
            </div>

            <!-- News -->


            <div class="news">
                <div class="container">
                    <form action="Controlador" method="POST">
                        <div style="display: flex; justify-content: space-between">
                            <h1 class="leave_comment_title">Nombre del Paciente:   ${datos.getNombre()} ${datos.getApellido_paterno()} ${datos.getApellido_materno()}</h1>
                            <h1 class="leave_comment_title text-right">${fecha}</h1>
                        </div>
                        <h2><b></b></h2>
                        <P><b>Ingrese los Resultados</b></p>
                        <textarea name="resultado" class="input_field" type="text" placeholder="" required="required" style="height: 30vh;"></textarea>
                        <input type="hidden" readonly name="fecha" value="${fecha}" />
                        <input type="hidden" readonly name="idSolicitud" value="${idSolicitud}" />
                        <input type="hidden" readonly name="historiaXanalisis" value="${historiaXanalisis}" />
                        <input type="hidden" readonly name="idTipoa" value="${idTipoa}" />
                        <button name="accion" type="submit" class="comment_send_btn trans_200" value="registrarResultadosLab">GUARDAR RESULTADO</button>
                    </form>
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
        <jsp:include page="footer.jsp"/>
    </body>
</html>
