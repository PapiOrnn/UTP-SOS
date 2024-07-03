<%-- 
    Document   : registro
    Created on : 13/05/2021, 11:23:45 AM
    Author     : Deary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Course Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/registro.css">
        <link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/style_register.css">
    </head>
    <body>
        <div class="super_container">
            

            <div class="home">
                <div class="home_background_container prlx_parent">
                    <div class="home_background prlx" style="background-image:url(images/slider_background1.jpg)"></div>
                </div>
                <div class="home_content">
                     
                            <img src="images/logo.png" alt="">
                        
                    <h3>Ingresa tus datos</h3>
                    <form class="contact-form" action="Controlador" method="POST">
                        <div class="form_container">
                            <div class="left_container">
                                <div class="form-group">
                                    <select id="inputState" class="form-control" name="tipodoc">
                                        <option selected value="1">DNI</option>
                                        <option value="2">Carnet de Extranjeria</option>
                                    </select>
                                </div>
                                <div class="field name">
                                    <input type="text" name="documento" placeholder="Documento">
                                </div>
                                <div class="field name">
                                    <input type="text" name="nombre" placeholder="Nombre">
                                </div>
                                <div class="field">
                                    <input type="text" name="app" placeholder="Apellido Paterno">
                                </div>
                                <div class="field">
                                    <input type="text" name="apm" placeholder="Apellido Materno">
                                </div>
                            </div>
                            <div class="right_container">
                                <div class="field">
                                    <input type="number" name="cel" placeholder="Celular">
                                </div>
                                <div class="field">
                                    <input type="text" name="direccion" placeholder="Direccion">
                                </div>
                                <div class="form-group">
                                    <select id="inputState" class="form-control" name="sexo">
                                        <option selected value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                    </select>
                                </div>
                                <div class="field">
                                    <input type="text" name="correo" placeholder="Correo">
                                </div>
                                <div class="field">
                                    <input type="password" name="pass" placeholder="Contraseña">
                                </div>
                            </div>
                        </div>
                        <div class="button-area">
                            <button type="submit" name="accion" value="registrar">Registrar</button>
                        </div>
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
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/contact_custom.js"></script>

    </body>
</html>
