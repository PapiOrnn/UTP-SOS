<%-- 
    Document   : headerMedico
    Created on : 14/05/2024, 05:28:19 PM
    Author     : Hector
--%>
<div class="header_content d-flex align-items-center">
    <!-- Logo -->
    <div class="logo_container">
        <div class="logo">
            <a href="mainAuxiliar.jsp"><img src="images/logo.png" alt=""></a>
        </div>
    </div>
    
    <!-- Main Navigation -->
    <nav class="main_nav_container">
        <div class="main_nav">
            <ul class="main_nav_list">
                <li class="main_nav_item"><a href="mainAuxiliar.jsp">Inicio</a></li>
                <li class="main_nav_item"><a href="Controlador?accion=labpendientes">Analisis Pendientes</a></li>	
            </ul>
        </div>
    </nav>
</div>
<div class="header_side d-flex flex-row justify-content-center align-items-center">
    <div class="main_nav">
        <ul class="main_nav_list" style="color: black;">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${auxiliar.getNombre()}
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#"> ${auxiliar.getCorreo()}</a>
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
