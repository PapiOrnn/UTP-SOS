<%-- 
    Document   : mainEnfermero
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <jsp:include page="../actions_library/head.jsp"/>
        <link rel="stylesheet" type="text/css" href="../styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/news_post_responsive.css">

    </head>
    <body>
        
        <div class="super_container">

            <header class="header d-flex flex-row">
                <jsp:include page="../actions_header/headerEnfermero.jsp"/>
            </header>
            <!-- backGroud header -->    
                    <div class="home" style="background-image:url(../images/news_background.jpg);">
                
                <div class="home_content">
                    <h1>Bienvenido ${enfermero.getNombre()}${farmaceutico.getNombre()}</h1>
                </div>
                
                
        </div>

        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="../styles/bootstrap4/popper.js"></script>
        <script src="../styles/bootstrap4/bootstrap.min.js"></script>
        <script src="../plugins/greensock/TweenMax.min.js"></script>
        <script src="../plugins/greensock/TimelineMax.min.js"></script>
        <script src="../plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="../plugins/greensock/animation.gsap.min.js"></script>
        <script src="../plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="../plugins/scrollTo/jquery.scrollTo.min.js"></script>
        <script src="../plugins/easing/easing.js"></script>
        <script src="../js/news_post_custom.js"></script>
    </body>
</html>
