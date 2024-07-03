<%-- 
    Document   : mainAdministrador
    Created on : 14/05/2021, 05:35:01 PM
    Author     : Deary
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Solicitud"%>
<%@page import="ModeloDAO.ReporteDAO"%>
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
        <c:if test="${admin.getRol()!=1}">
            <c:redirect url = "login.jsp"/>
        </c:if>
        <div class="super_container">
            
            <header class="header d-flex flex-row">
                <jsp:include page="headerAdministrador.jsp"/>
            </header>
            <!-- backGroud header -->
            
            <div class="home" style="background-image:url(images/news_background.jpg);">
               
                <div class="home_content">
                    <h1>Bienvenido ${admin.getNombre()}</h1>
                </div>
            </div>
            
            
        </div>

                <div class="container p-5">
                    
                   <div class="card-deck">
 <div class="card text-white  mb-5" style="background-color: #55b575; border-radius: 50px">
    
    <div class="card-body">
        
        
                
      <h1 class="card-title text-center">Citas</h1>
      
      <h2 class="text-center">18</h2>
      <h1 class="text-center">Monto</h1>
      <%
                    ReporteDAO dao=new ReporteDAO();
                    List<Solicitud>list=dao.listarSumaCita();
                    Iterator<Solicitud>iter=list.iterator();
                    Solicitud per=null;
                    
                    while(iter.hasNext()){
                        per=iter.next();
                    
                %>
      <h2 class="text-center">S/. <%= per.getSumaCita()%></h2>
       <%}%>
    </div>
  </div>
  <div class="card text-white  mb-5" style="background-color: #de4958; border-radius: 50px">
    
    <div class="card-body">
      <h1 class="card-title text-center">Citas por Emergencia</h1>
      <h2 class="text-center">18</h2>
      <h1 class="text-center">Monto</h1>
      
      <h2 class="text-center">S/ 84.00</h2>
    </div>
  </div>
  <div class="card text-white  mb-5"style="background-color: #437a56; border-radius: 50px" >


    
    <div class="card-body">
      <h1 class="card-title text-center">Analisis de laboratorio</h1>
      <h2 class="text-center">15</h2>
      <h1 class="text-center">Monto</h1>
      <h2 class="text-center">S/ 132.58</h2>
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

