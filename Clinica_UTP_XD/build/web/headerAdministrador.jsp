

<div class="header_content d-flex align-items-center">
    <!-- Logo -->
    <div class="logo_container">
        <div class="logo">
            <a href="mainAdministrador.jsp"><img src="images/logo.png" alt=""></a>
        </div>
    </div>
    
    <!-- Main Navigation -->
    <nav class="main_nav_container_admin">
        <div class="main_nav">
            <ul class="main_nav_lista">
                <li class="main_nav_item admin"><a href="listarPersonal.jsp">Mantenimiento Personal</a></li>
                <li class="main_nav_item admin"><a href="listarPacientes.jsp">Mantenimiento Pacientes</a></li>
                <li class="main_nav_item admin"><a href="listarHorario.jsp">Mantenimiento Horario</a></li>
                <li class="main_nav_item admin"><a href="listarEspecialidad.jsp">Mantenimiento Especialidad</a></li>
                <li class="main_nav_item admin" ><button class="dropdown-toggle" 
                                                         style="border:none; background-color:white;outline:none; font-weight: 500;"
                                                         type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        REPORTES
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="reporteCitas.jsp">Citas</a>
    <a class="dropdown-item" href="reporteCitasEmergencia.jsp">Citas por emergencia</a>
    <a class="dropdown-item" href="reporteAnalisis.jsp">Analisis de Laboratorio</a>
  </div></li>
  

            </ul>
        </div>
    </nav>
</div>
<div class="header_side d-flex flex-row justify-content-center align-items-center">
    <div class="main_nav">
        <ul class="main_nav_list" style="color: black;">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${admin.getNombre()}
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#"> ${admin.getCorreo()}</a>
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
