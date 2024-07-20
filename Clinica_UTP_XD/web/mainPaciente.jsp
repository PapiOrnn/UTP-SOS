<%-- 
    Document   : mainPacientes
    Created on : 13/05/2024, 05:46:03 PM
    Author     : Deary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/news_post_responsive.css">

    </head>
    <body>
        <c:if test="${paciente.getRol()!=2}">
            <c:redirect url = "login.jsp"/>
        </c:if>
        <div class="super_container">

            <header class="header d-flex flex-row">
                <jsp:include page="headerPaciente.jsp"/>
            </header>
            <!-- backGroud header -->
            <div class="home" style="background-image:url(images/news_background.jpg);">
               
                <div class="home_content">
                    <h1>Bienvenido a Clinica UTP</h1>
                </div>
            </div>

            <div class="become">
                <div class="container">
                    <div class="row row-eq-height">

                        <div class="col-lg-6 order-2 order-lg-1">
                            <div class="become_title">
                                <h1>Nuestros medicos</h1>
                            </div>
                            <p class="become_text">Nuestros médicos están altamente calificados y provienen de los principales centros académicos de todo el mundo. Nuestro personal médico proviene de nuestra asociación con los grupos de prácticas médicas más renombrados en el Sur de California, incluida la Universidad de California, Los Ángeles (UCLA), que nos permite garantizar la mejor atención a los pacientes y los estándares más altos del hospital.</p>

                        </div>

                        <div class="col-lg-6 order-1 order-lg-2">	
                            <div class="become_image">
                                <img src="images/become.jpg" alt="">
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <section class="Baj" id="Baj">
                <div class="max-width">

                    <div class="serv-content">
                        <div class="card">
                            <div class="box">

                                <div class="text">CARDIOLOGÍA PEDIÁTRICA</div>

                                <p>Nuestro servicio de cardiología: “Corazón Instituto Especializado” ofrece a los niños la atención médica profesionales de Cardiología Pediátrica.</p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="box">

                                <div class="text">ESPECIALIDADES 24 HORAS</div>

                                <p>Nuestras fortalezas: profesionales de calidad humana, rigor ético, competencia técnica y científica. Ambientes confortables, alta tecnología, parqueaderos en ambas sedes.</p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="box">

                                <div class="text">CHEQUEO EJECUTIVO</div>

                                <p>El más completo grupo de exámenes diagnósticos y consultas médicas especializadas, para ser evaluado desde una visión integral.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="become">
                    <div class="container">
                        <div class="row row-eq-height">

                            <div class="col-lg-6 order-2 order-lg-1">
                                <div class="become_title">
                                    <h1>Vision</h1>
                                </div>
                                <p class="become_text">Para el año 2025 la Clínica UTP será reconocida por el desarrollo de centros de cuidado clínico con enfoque de atención basada en valor, consolidándose como una institución con estándares superiores de calidad, innovación y desarrollo tecnológico y como un gran lugar para trabajar.</p>
                                <div class="become_title">
                                    <h1>Mision</h1>
                                </div>
                                <p class="become_text">Contribuir al cuidado de la vida y la recuperación de la salud, a través de la prestación de servicios de alta complejidad, centrados en la persona, con un equipo humano cálido y calificado para alcanzar desenlaces clínicos superiores, promover el cuidado del medio ambiente, la sostenibilidad económica y la permanencia en el tiempo.</p>
                            </div>

                            <div class="col-lg-6 order-1 order-lg-2">	
                                <div class="become_image">
                                    <img src="images/become1.jpg" alt="">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>   
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
