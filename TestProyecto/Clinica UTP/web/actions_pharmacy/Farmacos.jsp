<%-- 
    Document   : farmacia
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Farmacia</title>
        <jsp:include page="../actions_library/head.jsp"/>
        <link rel="stylesheet" type="text/css" href="../styles/courses_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/courses_responsive.css">
        <link rel="stylesheet" type="text/css" href="../styles/datatables.min.css">
    </head>
    <body>
        <div class="super_container">
            <!-- Header -->
            <header class="header d-flex flex-row">
                <jsp:include page="../actions_header/headerEnfermero.jsp"/>
            </header>
            <!-- Home -->
            <div class="home" style="background-image:url(../images/news_background.jpg);">
                <div class="home_content">
                    <h1>Farmacia <span class="typed" data-typed-items="sads, Devessaloper, Freelanfdsfdscer, dasd"></span></h1>
                </div>
            </div>

            <!-- Popular -->

            <div class="popular page_section">
                <div class="container">
                    <c:if test="${compraMedic!=null}">
                        <div class="modal" tabindex="-1" id="CitaReservada">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                        <div class="alert alert-success" role="alert" style="margin-top:1.5rem; margin-bottom: 0 ">
                                            ${compraMedic}
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <div class="row">
                        <div class="col">
                            <div class="section_title text-center">
                                <h1>Farmacos</h1>
                            </div>
                        </div>
                    </div>
                    <div class="row course_boxes">
                        <!-- Popular Course Item -->
                        <div class="col-lg-4 course_box">
                            <div class="card">
                                <img class="card-img-top" src="../images/course_1.jpg">
                                <div class="card-body text-center">
                                    <div class="card-title"><a href="courses.html">PREDNISONA</a></div>
                                    <div class="card-text">20 MG X 10 TABLETAS </div>
                                </div>
                            </div>
                        </div>

                        <!-- Popular Course Item -->
                        <div class="col-lg-4 course_box">
                            <div class="card">
                                <img class="card-img-top" src="../images/course_2.jpg">
                                <div class="card-body text-center">
                                    <div class="card-title"><a href="courses.html">FUROSEMIDA</a></div>
                                    <div class="card-text">40 MG X 10 TABLETAS </div>
                                </div>
                            </div>
                        </div>

                        <!-- Popular Course Item -->
                        <div class="col-lg-4 course_box">
                            <div class="card">
                                <img class="card-img-top" src="../images/course_3.jpg">
                                <div class="card-body text-center">
                                    <div class="card-title"><a href="courses.html">NIRFOL 1% X 1 VIAL</a></div>
                                    <div class="card-text">PRODUCTO SE VENDE POR UNIDAD </div>
                                </div>
                            </div>
                        </div>

                        <!-- Popular Course Item -->
                        <div class="col-lg-4 course_box">
                            <div class="card">
                                <img class="card-img-top" src="../images/course_4.jpg">
                                <div class="card-body text-center">
                                    <div class="card-title"><a href="courses.html">AMOXICLIN</a></div>
                                    <div class="card-text">12 H 875 MG / 125 MG X 14 COMPRIMIDOS</div>
                                </div>
                            </div>
                        </div>

                        <!-- Popular Course Item -->
                        <div class="col-lg-4 course_box">
                            <div class="card">
                                <img class="card-img-top" src="../images/course_5.jpg">
                                <div class="card-body text-center">
                                    <div class="card-title"><a href="courses.html">HIPERLIPEN</a></div>
                                    <div class="card-text">X 30 CÁPSULAS </div>
                                </div>
                            </div>
                        </div>

                        <!-- Popular Course Item -->
                        <div class="col-lg-4 course_box">
                            <div class="card">
                                <img class="card-img-top" src="../images/course_6.jpg">
                                <div class="card-body text-center">
                                    <div class="card-title"><a href="courses.html"> IBUPROFENO</a></div>
                                    <div class="card-text"> 800 MG X 10 TABLETAS </div>
                                </div>
                            </div>
                        </div>
                        <!-- Popular Course Item -->
                    </div>
                </div>		
            </div>
        </div>

        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="../js/datatables.min.js"></script>
        <script src="../js/scriptPaciente.js"></script> 
        <script src="../styles/bootstrap4/popper.js"></script>
        <script src="../styles/bootstrap4/bootstrap.min.js"></script>
        <script src="../plugins/greensock/TweenMax.min.js"></script>
        <script src="../plugins/greensock/TimelineMax.min.js"></script>
        <script src="../plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="../plugins/greensock/animation.gsap.min.js"></script>
        <script src="../plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="../plugins/scrollTo/jquery.scrollTo.min.js"></script>
        <script src="../plugins/easing/easing.js"></script>
        <script src="../js/courses_custom.js"></script>
       <!-- Incluir el pie de página -->
        <jsp:include page="../actions_others/footer.jsp"/>
    </body>
</html>
