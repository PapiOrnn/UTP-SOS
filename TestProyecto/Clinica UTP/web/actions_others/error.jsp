<%-- 
    Document   : error
    Created on : 2 jul. 2024, 15:35:09
    Author     : Albert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Clinica</title>
        <!-- CSS Stylesheets -->     
        <jsp:include page="../actions_library/head.jsp" />
        <link rel="stylesheet" type="text/css" href="../styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/responsive.css">
    </head>
    <body>
        <!-- Home -->

        <div class="home">
            <!-- Hero Slider -->
            <div class="hero_slider_container">
                <div class="hero_slider owl-carousel">
                    <!-- Hero Slide -->
                    <div class="hero_slide">
                        <div class="hero_slide_background" style="background-image:url(../images/slider_background.jpg)"></div>
                        <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                            <div class="hero_slide_content text-center">
                                <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut"><span>Oops! Pagina No Encotrada</span></h1>
                            </div>
                        </div>
                    </div>

                    <!-- Hero Slide -->
                    <div class="hero_slide">
                        <div class="hero_slide_background" style="background-image:url(../images/slider_background.jpg)"></div>
                        <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                            <div class="hero_slide_content text-center">
                                <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut"><span>Estamos Trabajando Para Corregir Este Problema</span></h1>
                            </div>
                        </div>
                    </div>

                    <!-- Hero Slide -->
                    <div class="hero_slide">
                        <div class="hero_slide_background" style="background-image:url(../images/slider_background.jpg)"></div>
                        <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                            <div class="hero_slide_content text-center">
                                <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut"><span>Regresa A La Pagina Principal</span></h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero_slider_left hero_slider_nav trans_200"><span class="trans_200"><</span></div>
                <div class="hero_slider_right hero_slider_nav trans_200"><span class="trans_200">></span></div>
            </div>
        </div>

        <!-- LLamar script -->
         <jsp:include page="../actions_library/script.jsp" /> 
        <script src="../js/custom.js"></script>
    </body>
</html>
