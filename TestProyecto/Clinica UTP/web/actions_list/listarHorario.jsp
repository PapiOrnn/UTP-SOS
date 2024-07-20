<%-- 
    Document   : listarHorario
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entidades.Horario"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.HorarioDAO"%>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <!-- Meta Tags -->    
        <title>Horario</title>
        <jsp:include page="../actions_library/head.jsp"/>
        <link rel="stylesheet" type="text/css" href="../styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/news_post_responsive.css">
        
        <!-- Required meta tags -->
        

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.18/datatables.min.css">
        <script src="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.18/datatables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js"></script>  
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>        
    </head>
    
    <body >
        <c:if test="${admin.getRol()!=1}">
            <c:redirect url = "../actions_others/login.jsp"/>
        </c:if>
        <div class="super_container">
            <header class="header d-flex flex-row">
                <jsp:include page="../actions_header/headerAdministrador.jsp"/>
            </header>
            <div class="home" style="background-image:url(../images/news_background.jpg);">
               
                <div class="home_content">
                    <h1>Horario</h1>
                </div>
            </div>
             <div class="container p-5"> 
            <div class="leave_comment">
            <div class="leave_comment_title"><a href="../actions_add_edit/agregarHorario.jsp"><button type="button" class="btn btn-info">Agregar Horario</button></a></div>
           
     <div class="table-responsive" id="mydatatable-container">
    <table class="records_list table table-striped table-bordered table-hover" id="mydatatable">
        <thead class="thead-dark">
            <tr>
                
                        <th class="text-center">Nro</th>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Hora Inicio</th>
                        <th class="text-center">Hora Fin</th>
                        <th class="text-center">Estado</th>
                       <th class="text-center">Medico</th>
                        <th class="text-center">Acciones</th>
                        
                  
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
                <th style="visibility: hidden">Filter..</th>
                
            </tr>
        </tfoot>
        <tbody>
            <%
                    HorarioDAO dao=new HorarioDAO();
                    List<Horario>list=dao.listar();
                    Iterator<Horario>iter=list.iterator();
                    Horario per=null;
                    int contador=0;
                    while(iter.hasNext()){
                        per=iter.next();
                    
                %>
                 <tr>
                        <td class="text-center"><%= contador=contador+1%></td>
                        <td class="text-center"><%= per.getFecha()%></td>
                        <td class="text-center"><%= per.getHoraInicio()%></td>
                        <td><%= per.getHoraFin()%></td>
                        
                        <td class="text-center"><%= per.getEstadoHorario()%></td>
                       <td><%= per.getMedico()%> <%= per.getApe_pa()%> <%= per.getApe_ma()%></td>
      
                        <td colspan="2">
                            <form method="Post" action="Controlador">
                                 <input type="hidden" name="idHorario" value="<%=per.getIdHorario()%>" >
                               <button type="submit" class="btn btn-warning" name="accion" value="editarHorario">Editar</button>
                               <button type="submit" class="btn btn-danger" name="accion" value="eliminarHorario">Eliminar</button>
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
        
        <!-- Incluir el pie de página -->
        <jsp:include page="../actions_others/footer.jsp"/>
    </body>
</html>
