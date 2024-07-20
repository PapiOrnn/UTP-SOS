<%-- 
    Document   : headerEnfermero
    Created on : 18-jun-2024, 5:42:13
    Author     : Albert
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="header_content d-flex align-items-center">
    <!-- Logo -->
    <div class="logo_container">
        <div class="logo">
            <a href="mainEnfermero.jsp"><img src="images/logo.png" alt=""></a>
        </div>
    </div>
    
    <!-- Main Navigation -->
    <c:if test="${enfermero.getRol()==5}">
        <nav class="main_nav_container">
            <div class="main_nav">
                <ul class="main_nav_list">
                    <li class="main_nav_item"><a href="mainEnfermero.jsp">Inicio</a></li>
                    <li class="main_nav_item"><a href="buscarPacienteE.jsp">Buscar Paciente</a></li>	
                </ul>
            </div>
        </nav>     
    </c:if>
    <c:if test="${farmaceutico.getRol()==6}">     
        <nav class="main_nav_container">
            <div class="main_nav">
                <ul class="main_nav_list">
                    <li class="main_nav_item"><a href="mainEnfermero.jsp">Inicio</a></li>
                    <li class="main_nav_item"><a href="Controlador?accion=farmacia">Farmacia</a></li>	
                    <li class="main_nav_item"><a href="Farmacos.jsp">Farmacos</a></li>	
                </ul>
            </div>
        </nav>
    </c:if>
</div>
<div class="header_side d-flex flex-row justify-content-center align-items-center">
    <div class="main_nav">
        <ul class="main_nav_list" style="color: black;">
            <li class="nav-item dropdown">
                <button class="nav-link dropdown-toggle btn btn-light" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="min-width: 10rem;">
                    ${enfermero.getNombre()}${farmaceutico.getNombre()}
                </button>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">${enfermero.getCorreo()}${farmaceutico.getCorreo()}</a>
                    <form action="Controlador"  method="POST">
                    <button  type="submit" class="dropdown-item" name="accion" value="salir">Salir</button>
                </form>
                </div>
            </li>
        </ul>
    </div>
</div>
<!-- Hamburger -->
<div class="hamburger_container">
    <i class="fas fa-bars trans_200"></i>
</div>
