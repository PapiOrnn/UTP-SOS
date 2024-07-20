<%-- 
    Document   : headerPaciente
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>
<div class="header_content d-flex align-items-center">
    <!-- Logo -->
    <div class="logo_container">
        <div class="logo">
            <a href="../actions_main/mainPaciente.jsp"><img src="../images/logo.png" alt=""></a>
        </div>
    </div>

    <!-- Main Navigation -->
    <nav class="main_nav_container">
        <div class="main_nav">
            <ul class="main_nav_list1">
                <li class="main_nav_item"><a href="../actions_main/mainPaciente.jsp">Inicio</a></li>
                <li class="main_nav_item"><a href="Controlador?accion=reservarCita">Reservar Cita</a></li>
                <li class="main_nav_item"><a href="Controlador?accion=citas">Mis Citas</a></li>
                <li class="main_nav_item"><a href="Controlador?accion=historialclinico">Historial Clinico</a></li>
                <li class="main_nav_item"><a href="Controlador?accion=farmaciaa">Farmacia</a></li>
            </ul>
        </div>
    </nav>
</div>
<div class="header_side d-flex flex-row justify-content-center align-items-center">
    <div class="main_nav">
        <ul class="main_nav_list" style="color: black;">
            <li class="nav-item dropdown">
                <button class="dropdown-toggle btn btn-light" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="min-width: 10rem;">
                    ${paciente.getNombre()}
                </button>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#"> ${paciente.getCorreo()}</a>
                    <form action="Controlador"  method="POST">
                        <button  type="submit" class="dropdown-item btn btn-danger" name="accion" value="salir">Salir</button>
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
