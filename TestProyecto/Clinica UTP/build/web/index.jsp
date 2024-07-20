<%-- 
    Document   : index
    Created on : 3 jun. 2024, 17:50:41
    Author     : Albert 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title-->
    <title>Clínica UTP</title>
    <jsp:include page="actions_library/head.jsp" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/main_styles.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/responsive.css">    
  </head>
  <body>
    <!-- Header -->

    <header class="header d-flex flex-row">
      <div class="header_content d-flex flex-row align-items-center">
        <!-- Logo -->
        <div class="logo_container">
          <div class="logo">
            <img src="images/logo.png" alt="" />
          </div>
        </div>

        <!-- Main Navigation -->
        <nav class="main_nav_container">
          <div class="main_nav">
            <ul class="main_nav_list">
              <li class="main_nav_item"><a href="actions_others/error.jsp">Inicio</a></li>
              <li class="main_nav_item"><a href="actions_others/pagos.jsp">Sobre nosotros</a></li>
              <li class="main_nav_item"><a href="actions_add_edit/agregarEspecialidad.jsp">Medicos</a></li>
              <li class="main_nav_item"><a href="#">Especialidades</a></li>
            </ul>
          </div>
        </nav>
      </div>
      <div
        class="header_side d-flex flex-row justify-content-center align-items-center"
      >
        <i class="fas fa-user"></i>
        <div class="logo">
          <a href="actions_others/login.jsp"><span>INICIAR SESIÓN</span></a>
        </div>
      </div>
    </header>

    <!-- Home -->

    <div class="home">
      <!-- Hero Slider -->
      <div class="hero_slider_container">
        <div class="hero_slider owl-carousel">
          <!-- Hero Slide -->
          <div class="hero_slide">
            <div
              class="hero_slide_background"
              style="background-image: url(images/slider_background.jpg)"
            ></div>
            <div
              class="hero_slide_container d-flex flex-column align-items-center justify-content-center"
            >
              <div class="hero_slide_content text-center">
                <h1
                  data-animation-in="fadeInUp"
                  data-animation-out="animate-out fadeOut"
                >
                  <span>Agenda tu cita virtual!</span>
                </h1>
              </div>
            </div>
          </div>

          <!-- Hero Slide -->
          <div class="hero_slide">
            <div
              class="hero_slide_background"
              style="background-image: url(images/slider_background.jpg)"
            ></div>
            <div
              class="hero_slide_container d-flex flex-column align-items-center justify-content-center"
            >
              <div class="hero_slide_content text-center">
                <h1
                  data-animation-in="fadeInUp"
                  data-animation-out="animate-out fadeOut"
                >
                  <span>Atención de calidad</span>
                </h1>
              </div>
            </div>
          </div>

          <!-- Hero Slide -->
          <div class="hero_slide">
            <div
              class="hero_slide_background"
              style="background-image: url(images/slider_background.jpg)"
            ></div>
            <div
              class="hero_slide_container d-flex flex-column align-items-center justify-content-center"
            >
              <div class="hero_slide_content text-center">
                <h1
                  data-animation-in="fadeInUp"
                  data-animation-out="animate-out fadeOut"
                >
                  <span>Personal de calidad</span>
                </h1>
              </div>
            </div>
          </div>
        </div>

        <div class="hero_slider_left hero_slider_nav trans_200">
          <span class="trans_200"><</span>
        </div>
        <div class="hero_slider_right hero_slider_nav trans_200">
          <span class="trans_200">></span>
        </div>
      </div>
    </div>

    <div class="hero_boxes">
      <div class="hero_boxes_inner">
        <div class="container">
          <div class="row">
            <div class="col-lg-4 hero_box_col">
              <div
                class="hero_box d-flex flex-row align-items-center justify-content-start"
              >
                <img src="images/earth-globe.svg" class="svg" alt="" />
                <div class="hero_box_content">
                  <h2 class="hero_box_title">Muchas Especialidades</h2>
                </div>
              </div>
            </div>

            <div class="col-lg-4 hero_box_col">
              <div
                class="hero_box d-flex flex-row align-items-center justify-content-start"
              >
                <img src="images/books.svg" class="svg" alt="" />
                <div class="hero_box_content">
                  <h2 class="hero_box_title">Vida Saludable</h2>
                </div>
              </div>
            </div>

            <div class="col-lg-4 hero_box_col">
              <div
                class="hero_box d-flex flex-row align-items-center justify-content-start"
              >
                <img src="images/professor.svg" class="svg" alt="" />
                <div class="hero_box_content">
                  <h2 class="hero_box_title">Medicos Asombrosos</h2>
                </div>
              </div>
            </div>
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
            <p class="become_text">
              Para el año 2025 la Clínica UTP será reconocida por el desarrollo
              de centros de cuidado clínico con enfoque de atención basada en
              valor, consolidándose como una institución con estándares
              superiores de calidad, innovación y desarrollo tecnológico y como
              un gran lugar para trabajar.
            </p>
            <div class="become_title">
              <h1>Mision</h1>
            </div>
            <p class="become_text">
              Contribuir al cuidado de la vida y la recuperación de la salud, a
              través de la prestación de servicios de alta complejidad,
              centrados en la persona, con un equipo humano cálido y calificado
              para alcanzar desenlaces clínicos superiores, promover el cuidado
              del medio ambiente, la sostenibilidad económica y la permanencia
              en el tiempo.
            </p>
          </div>

          <div class="col-lg-6 order-1 order-lg-2">
            <div class="become_image">
              <img src="images/become1.jpg" alt="" />
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- LLamar script -->
    <jsp:include page="actions_library/script.jsp" />
    <script src="js/custom.js"></script>

    <!-- Incluir el pie de página -->
    <jsp:include page="actions_others/footer.jsp" />
  </body>
</html>
