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
                    <h1>Venta de Medicamentos<span class="typed" data-typed-items="sads, Devessaloper, Freelanfdsfdscer, dasd"></span></h1>
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
                    <form method="POST" action="Controlador">
                        <div class="modal" tabindex="-1" id="comprarFarmaco">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="estitle">Seleccione los Medicamentos que Desea Comprar</h3>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div id="mbody">
                                            <table class="table text-center center " id="farmacos">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Medicamento</th>
                                                        <th scope="col">Cantidad</th>
                                                        <th scope="col">Precio Unidad</th>
                                                        <th scope="col">subTotal</th> 
                                                        <th scope="col">Accion</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="bodymed">

                                                </tbody>
                                            </table>
                                            <div class=" p-3 bg-light miflex">
                                                <div class="">
                                                    <P><b>SELECCIONA EL TIPO DE PAGO</b></p>
                                                    <select name="tipoPago" class="input_field contact_form_email">
                                                        <option value="Tarjeta">TARJETA</option>  
                                                        <option value="Paypal">PAYPAL</option>
                                                    </select>
                                                    <P><b>SELECCIONA EL TIPO DE ENTREGA</b></p>
                                                    <select name="tipoEntrega" class="input_field contact_form_email">
                                                        <option value="Presencial">PRESENCIAL</option>
                                                        <option value="Domicilo">A DOMICILIO</option>  
                                                    </select>
                                                </div>
                                                <div class="text-right abajo">
                                                    <h3><b>SubTotal S/ <spam id="precioSubtotal"></spam></b></h3>
                                                    <h2><b>Total a Pagar S/ <spam id="precioTotal"></spam></b></h2>
                                                    <input type="hidden" name="monto" id="subtotalMe" readonly>
                                                    <input type="hidden" name="totalVenta" id="totalMe" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-center" id="loaderF"><img src="../images/tail-spin.svg" width="50" alt="loader"></div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-success" id="generarCompra" name="accion" value="generarCompra">Pagar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="text-center">
                        <h2><b>RECETAS</b></h2>
                    </div>
                    <br>
                    <table class="table text-center center" id="tableRec">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Medico</th>
                                <th scope="col">Medicamentos</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Observación/Indicación</th>
                                <th scope="col">Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var = "contador" value = "${0}"/>
                            <c:forEach items="${historial}" var="ite">
                                <tr>
                                    <c:set var="contador" value="${contador + 1}" />
                                    <th scope="row">${contador}</th>
                                    <td>${ite.getFecha()}</td>
                                    <td>${ite.getPersonal()}</td>
                                    <td>
                                        <ul>
                                            <c:forEach items="${receta}" var="pro">
                                                <c:if test="${pro.getIdhistoria()==ite.getIdHistoria()}">
                                                    <li>${pro.getProducto()}</li>
                                                    </c:if>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul>
                                            <c:forEach items="${receta}" var="ca">
                                                <c:if test="${ca.getIdhistoria()==ite.getIdHistoria()}">
                                                    <li>${ca.getCantidad()}</li>
                                                    </c:if>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul>
                                            <c:forEach items="${receta}" var="ob">
                                                <c:if test="${ob.getIdhistoria()==ite.getIdHistoria()}">
                                                    <li>${ob.getObservacion()}</li>
                                                    </c:if>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        <button class="btn btn-info btComprar" name="" value="" data-idHisto="${ite.getIdHistoria()}">Comprar</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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
