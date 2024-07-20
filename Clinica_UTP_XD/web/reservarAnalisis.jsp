<%-- 
    Document   : reservarCita
    Created on : 14/05/2024, 03:31:17 PM
    Author     : Albert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <jsp:include page="headerPaciente.jsp"/>
            </header>
            <!-- Home -->

            <div class="home" style="background-image:url(images/news_background.jpg);">
               
                <div class="home_content">
                    <h1>Reservar Analisis de Laboratorio</h1>
                </div>
            </div>

            <!-- News -->

            <div class="news">
                <div class="container">
                    <div class="row">

                        <!-- News Post Column -->

                        <div class="col-lg-8">
                            
                            <!-- Leave Comment -->

                            <div class="leave_comment">
                                <div class="leave_comment_title">Empieza ahora agendar tu analisis de laboratorio</div>
                                <div class="leave_comment_form_container">
                                    <form action="post">
                                        <P>SELECCIONA TIPO DE ANALISIS
                                            <select id="comment_form_email" class="input_field contact_form_email" type="email" placeholder="MEDICINA GENERAL" required="required" data-error="Valid email is required.">
                                                <option value="">Analisis de Sangre</option>
                                                <option value="masculino">Analisis de orina</option>
                                                <option value="femenino">Analisis de Detección Covid-19</option>   

                                            </select></p>
                                        <P>FECHA DE ANALISIS
                                            <input id="comment_form_name" class="input_field contact_form_name" type="text" placeholder="--/--/--" required="required" data-error="Name is required."></P>
                                        <P>HORA DE ANALISIS
                                            <input id="comment_form_email" class="input_field contact_form_email" type="email" placeholder="00.00" required="required" data-error="Valid email is required."></P>
                                        <P>SELECCIONA MODALIDAD
                                            <select id="comment_form_email" class="input_field contact_form_email" type="email" placeholder="MEDICINA GENERAL" required="required" data-error="Valid email is required.">
                                                <option value="">Presencial</option>
                                                <option value="masculino">Movilidad</option>
                                                <option value="femenino">Delivery</option>   

                                            </select></p>
                                        <br>
                                        <button id="comment_send_btn" type="submit" class="comment_send_btn trans_200" value="Submit">Reservar</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Sidebar Column -->

                        <div class="col-lg-4">
                            <div class="sidebar">

                                <!-- Archives -->

                                <!-- Latest Posts -->

                                <div class="sidebar_section">
                                    <div class="sidebar_section_title">

                                    </div>

                                    <div class="latest_posts">

                                        <!-- Latest Post -->
                                        <div class="latest_post">
                                            <div class="latest_post_image">
                                                <img src="images/latest_1.jpg" alt="https://unsplash.com/@dsmacinnes">
                                            </div>
                                            <div class="latest_post_title"><a href="news_post.html">Cuenta con nosotros	</a></div>
                                            <div class="latest_post_meta">

                                            </div>
                                        </div>

                                        <!-- Latest Post -->
                                        <div class="latest_post">
                                            <div class="latest_post_image">
                                                <img src="images/latest_2.jpg" alt="https://unsplash.com/@erothermel">
                                            </div>
                                            <div class="latest_post_title"><a href="news_post.html">Elige tu mejor horario</a></div>
                                            <div class="latest_post_meta">

                                            </div>
                                        </div>

                                        <!-- Latest Post -->
                                        <div class="latest_post">
                                            <div class="latest_post_image">
                                                <img src="images/latest_3.jpg" alt="https://unsplash.com/@element5digital">
                                            </div>
                                            <div class="latest_post_title"><a href="news_post.html">Tu salud es primero</a></div>
                                            <div class="latest_post_meta">

                                            </div>
                                        </div>

                                    </div>

                                </div>

                                <!-- Tags -->
                            </div>
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
<jsp:include page="footer.jsp"/>
    </body>
</html>
