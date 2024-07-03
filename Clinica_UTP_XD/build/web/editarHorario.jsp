<%-- 
    Document   : reservarCita
    Created on : 14/05/2021, 03:31:17 PM
    Author     : Christian
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Entidades.Horario"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.HorarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Horario</title>
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
        <c:if test="${admin.getRol()!=1}">
            <c:redirect url = "login.jsp"/>
        </c:if>
        <div class="super_container">

            <!-- Header -->
            <header class="header d-flex flex-row">
                <jsp:include page="headerAdministrador.jsp"/>
            </header>
            <!-- Home -->

            <div class="home" style="background-image:url(images/news_background.jpg);">
                <div class="home_content">
                    <h1>Editar Horario</h1>
                </div>
            </div>

            <!-- News -->

          

                <div class="container">
                    <div class="row">

                        <!-- News Post Column -->

                        <div class="col-lg-6">
                            <!-- Leave Comment -->

                            
                            <div class="leave_comment_form_container">
                                <h1 class="text-center">Ingresa los Datos</h1>
                                <form class="contact-form" action="Controlador" method="POST">
                                    
                        <div class="field name">
                            <input type="hidden" value="${ep.getIdHorario()}" class="input_field" name="idHorario" placeholder="Fecha">
                        </div>
                        <label>Fecha</label>
                        <div class="field name">
                            <input type="date" value="${ep.getFecha()}" class="input_field" name="fechaHorario" placeholder="Fecha">
                        </div>
                        <label>Horario Inicio</label>
                        <div class="field name">
                            <input type="time" value="${ep.getHoraInicio()}" class="input_field" name="horaInicio" placeholder="Hora Inicio">
                        </div>
                        <label>Horario Fin</label>
                        <div class="field">
                            <input type="time" value="${ep.getHoraFin()}" class="input_field" name="horaFin" placeholder="Hora Fin">
                        </div>
                       
                         <div class="form-group">  
                                        <label for="inputState">Doctor</label>
                                        <select id="inputState" class="form-control" name="idMedico">
                                            <option selected value="${ep.getIdMedico()}" >${ep.getMedico()} ${ep.getApe_pa()} ${ep.getApe_ma()}</option>
                                    <%
                    HorarioDAO dao=new HorarioDAO();
                    List<Horario>list=dao.listarMedicos();
                    Iterator<Horario>iter=list.iterator();
                    Horario per=null;
                    int contador=0;
                    while(iter.hasNext()){
                        per=iter.next();
                    
                %>
                       
                            
                            
                                <option value="<%= per.getIdMedico()%>"><%= per.getMedico()%> <%= per.getApe_pa()%> <%= per.getApe_ma()%></option>
                                
                                 <%}%>
                            </select>
                           
                        </div>
                                
                        <div class="button-area">
                            <button type="submit" class="btn btn-primary" name="accion" value="actualizarHorario">Actualizar</button>
                        </div>
                    </form></div></div></div>
                            </div><br><br>
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

