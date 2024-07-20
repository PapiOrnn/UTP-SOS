<%-- 
    Document   : historialCitaPaciente
    Created on : 14/05/2024, 03:23:03 PM
    Author     : Christian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Iterator"%>
<%@page import="Entidades.Personal"%>
<%@page import="Entidades.Rol"%>
<%@page import="Entidades.Especialidad"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonalDAO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Personal</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/news_post_responsive.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.18/datatables.min.css">
        <script src="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.18/datatables.min.js"></script>
    </head>
    <body>
        <c:if test="${admin.getRol()!=1}">
            <c:redirect url = "login.jsp"/>
        </c:if>
        
        
        
        <div class="super_container">
            <header class="header d-flex flex-row">
                <jsp:include page="headerAdministrador.jsp"/>
            </header>
            <div class="home" style="background-image:url(images/news_background.jpg);">
               
                <div class="home_content">
                    <h1>Personal</h1>
                </div>
            </div>
             <div style="width: 95%; text-align: center; margin-left: auto; margin-right: auto; margin-bottom: 50px" > 
            <div class="leave_comment">
            <div class="leave_comment_title" ><a href="agregarPersonal.jsp"><button style="margin-right: 1500px;"type="button" class="btn btn-info">Agregar Personal</button></a></div>
           
     <div class="table-responsive" id="mydatatable-container">
    <table class="records_list table table-striped table-bordered table-hover" id="mydatatable">
        <thead class="thead-dark">
             <tr>
                                    <th scope="col" class="text-center">Nro</th>
                                    <th scope="col" class="text-center">Tipo Documento</th>
                                    <th scope="col" class="text-center">Documento</th>
                                    <th scope="col" class="text-center">Nombre</th>
                                    <th scope="col" class="text-center">Apellido Paterno</th>
                                    <th scope="col" class="text-center">Apellido Materno</th>
                                    <th scope="col" class="text-center">Sexo</th>
                                    <th scope="col" class="text-center">Direccion</th>
                                    <th scope="col" class="text-center">Telefono</th>
                                    <th scope="col" class="text-center">Especialidad</th>
                                    <th scope="col" class="text-center">Rol</th>
                                    <th scope="col" class="text-center">Acciones</th>
                                </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Filter..</th>
                <th>Filter..</th>
                <th>Filter..</th>
                <th>Filter..</th>
                <th>Filter..</th>
                 <th>Filter..</th>
                <th>Filter..</th>
                <th>Filter..</th>
                <th>Filter..</th>
                <th>Filter..</th>
                 <th>Filter..</th>
                <th style="visibility: hidden">Filter..</th>
                
            </tr>
        </tfoot>
        <tbody>
            <%
                                PersonalDAO dao = new PersonalDAO();
                                List<Personal> list = dao.listar();
                                
                                Iterator<Personal> iter = list.iterator();
                                Personal per = null;
                                int contador=0;
                                while (iter.hasNext()) {
                                    per = iter.next();
                            %>
                 <tr>
                                    <td class="text-center"><%= contador=contador+1%></td>
                                    <td class="text-center"><%= per.getTipoDocumento()%></td>
                                    <td class="text-center"><%= per.getDocumento()%></td>
                                    <td class="text-center"><%= per.getNombre()%></td>
                                    <td class="text-center"><%= per.getApellido_paterno()%></td>
                                    <td class="text-center"><%= per.getApellido_materno()%></td>
                                    <td class="text-center"><%= per.getTipoSexo()%></td>
                                    <td class="text-center"><%= per.getDireccion()%></td>
                                    <td class="text-center"><%= per.getTelefono()%></td>
                                    <td class="text-center"><%= per.getEspecialidad()%></td>
                                    <td class="text-center"><%= per.getTipoRol()%></td>
                                    <td colspan="2">
                            <form method="Post" action="Controlador">
                                 <input type="hidden" name="idPersonal" value="<%= per.getIdPersonal()%>" >
                               <button type="submit" class="btn btn-warning" name="accion" value="editarPersonal">Editar</button>
                               <button type="submit" class="btn btn-danger" name="accion" value="editarEstadoUsuario">Deshabilitar</button>
                            </form>
                        </td>
                                </tr>
                                <%}%>
        </tbody>
    </table>
</div>
     </div></div>
        <style>
#mydatatable tfoot input{
    width: 100% !important;
}
#mydatatable tfoot {
    display: table-header-group !important;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
    $('#mydatatable tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Filtrar.." />' );
    } );

    var table = $('#mydatatable').DataTable({
        "dom": 'B<"float-left"i><"float-right"f>t<"float-left"l><"float-right"p><"clearfix">',
        "responsive": false,
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        "order": [[ 0, "desc" ]],
        "initComplete": function () {
            this.api().columns().every( function () {
                var that = this;

                $( 'input', this.footer() ).on( 'keyup change', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                        }
                });
            })
        }
    });
});
</script>
</div>
        
        
   <jsp:include page="footer.jsp"/>

</body>
</html>
