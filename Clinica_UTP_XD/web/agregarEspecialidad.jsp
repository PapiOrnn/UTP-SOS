<%-- 
    Document   : reservarCita
    Created on : 14/05/2024, 03:31:17 PM
    Author     : Edu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Especialidad</title>
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
    <c:redirect url="login.jsp" />
  </c:if>
  <div class="super_container">
    <!-- Header -->
    <header class="header d-flex flex-row">
      <jsp:include page="headerAdministrador.jsp" />
    </header>
    <!-- Home -->

    <div class="home" style="background-image: url(images/news_background.jpg)">
      <div class="home_content">
        <h1>Agregar Especialidad</h1>
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
            <br />
            <form class="contact-form" action="Controlador" method="POST">
              <div class="field name">
                <input
                  type="text"
                  class="input_field"
                  name="nomEspecialidad"
                  placeholder="Especialidad"
                />
              </div>
              <div class="field name">
                <input
                  type="number"
                  class="input_field"
                  step="0.1"
                  name="costoEspecialidad"
                  placeholder="Costo"
                />
              </div>

              <div class="button-area">
                <button
                  type="submit"
                  class="btn btn-primary"
                  name="accion"
                  value="registrarEspecialidad"
                >
                  Agregar
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <br /><br />
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
  <jsp:include page="footer.jsp" />
</body>

</html>

