<%-- 
    Document   : registro
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta Tags -->        
        <title>Registro</title>
        <!-- CSS Stylesheets -->     
        <jsp:include page="../actions_library/head.jsp" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/registro.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/contact_responsive.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style_register.css">
    </head>
    <body>
        <div class="super_container">
            
            <div class="home">
                <div class="home_background_container prlx_parent">
                    <div class="home_background prlx" style="background-image:url(../images/slider_background1.jpg)"></div>
                </div>
                <div class="home_content">
                     
                            <img src="../images/logo.png" alt="">
                        
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
    <!-- LLamar script -->
    <jsp:include page="../actions_library/script.jsp" /> 
        
    </body>
</html>
