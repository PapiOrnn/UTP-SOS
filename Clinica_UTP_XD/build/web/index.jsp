<%-- 
    Document   : index
    Created on : 3 jun. 2024, 17:50:41
    Author     : Albert 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta Tags -->
        <title>Clinica</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Course Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Importing CSS files for styling -->        
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
    </head>
    <body>

        <!-- Header section -->
        <header class="header d-flex flex-row">
            <div class="header_content d-flex flex-row align-items-center">
                <!-- Logo -->
                <div class="logo_container">
                    <div class="logo">
                        <img src="images/logo.png" alt="">
                    </div>
                </div>

                <!-- Main Navigation -->
                <nav class="main_nav_container">
                    <div class="main_nav">
                        <ul class="main_nav_list">                            
                            <!-- Navigation Items -->
                            <li class="main_nav_item"><a href="#">Inicios</a></li>
                            <li class="main_nav_item"><a href="#">Sobre nosotros</a></li>	
                            <li class="main_nav_item"><a href="#">Medicos</a></li>					
                            <li class="main_nav_item"><a href="#">Especialidades</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <!-- Login Icon and Link -->            
            <div class="header_side d-flex flex-row justify-content-center align-items-center">
                <i class="fas fa-user"></i> 
                <div class="logo"><a href="login.jsp"><span>INICIAR SESIÓN</span></a></div>
            </div>
        </header>

        <!-- Home section with Hero Slider -->
        <div class="home">
            <!-- Hero Slider Container -->
            <div class="hero_slider_container">
                <div class="hero_slider owl-carousel">

                    <!-- Hero Slide 1 -->
                    <div class="hero_slide">
                        <div class="hero_slide_background" style="background-image:url(images/slider_background.jpg)"></div>
                        <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                            <div class="hero_slide_content text-center">
                                <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut"><span>Agenda tu cita virtual!</span></h1>
                            </div>
                        </div>
                    </div>

                    <!-- Hero Slide 2 -->
                    <div class="hero_slide">
                        <div class="hero_slide_background" style="background-image:url(images/slider_background.jpg)"></div>
                        <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                            <div class="hero_slide_content text-center">
                                <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut"><span>Atención de calidad</span></h1>
                            </div>
                        </div>
                    </div>

                    <!-- Hero Slide 3 -->
                    <div class="hero_slide">
                        <div class="hero_slide_background" style="background-image:url(images/slider_background.jpg)"></div>
                        <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                            <div class="hero_slide_content text-center">
                                <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut"><span>Personal de calidad</span></h1>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- Hero Slider Navigation -->
                <div class="hero_slider_left hero_slider_nav trans_200"><span class="trans_200"><</span></div>
                <div class="hero_slider_right hero_slider_nav trans_200"><span class="trans_200">></span></div>
            </div>
        </div>

        <!-- Hero Boxes Section -->        
        <div class="hero_boxes">
            <div class="hero_boxes_inner">
                <div class="container">
                    <div class="row">
                        <!-- Hero Box 1 -->                        
                        <div class="col-lg-4 hero_box_col">
                            <div class="hero_box d-flex flex-row align-items-center justify-content-start">
                                <img src="images/earth-globe.svg" class="svg" alt="">
                                <div class="hero_box_content">
                                    <h2 class="hero_box_title">Muchas Especialidades</h2>
                                </div>
                            </div>
                        </div>
                        <!-- Hero Box 2 -->
                        <div class="col-lg-4 hero_box_col">
                            <div class="hero_box d-flex flex-row align-items-center justify-content-start">
                                <img src="images/books.svg" class="svg" alt="">
                                <div class="hero_box_content">
                                    <h2 class="hero_box_title">Vida Saludable</h2>
                                </div>
                            </div>
                        </div>
                        <!-- Hero Box 3 -->
                        <div class="col-lg-4 hero_box_col">
                            <div class="hero_box d-flex flex-row align-items-center justify-content-start">
                                <img src="images/professor.svg" class="svg" alt="">
                                <div class="hero_box_content">
                                    <h2 class="hero_box_title">Medicos Asombrosos</h2>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Vision and Mission Section -->        
        <div class="become">
            <div class="container">
                <div class="row row-eq-height">
                    <!-- Vision and Mission Text -->
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
                    <!-- Vision and Mission Image -->
                    <div class="col-lg-6 order-1 order-lg-2">	
                        <div class="become_image">
                            <img src="images/become1.jpg" alt="">
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Importing JavaScript files for functionality -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/greensock/TweenMax.min.js"></script>
        <script src="plugins/greensock/TimelineMax.min.js"></script>
        <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="plugins/greensock/animation.gsap.min.js"></script>
        <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/scrollTo/jquery.scrollTo.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/custom.js"></script>
        
    <footer>
    <div class="footer-copyright text-center py-3 " style="background-color: #4d4546; color:white;">© 2021 Copyright
    <a href="#"> Clinica UTP</a>
  </div>
</footer>
    </body>
</html>
