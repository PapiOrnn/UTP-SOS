<%-- 
    Document   : listarEspecialidad
    Created on : 4 jun. 2024, 17:50:41
    Author     : Albert 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entidades.Especialidad"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.EspecialidadDAO"%>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <!-- Meta Tags -->    
        <meta charset="UTF-8">     
        <title>Especialidad</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.18/datatables.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.18/datatables.min.css">        
         <!-- CSS Stylesheets -->       
        <link rel="stylesheet" type="text/css" href="../styles/bootstrap4/bootstrap.min.css">
        <link href="../plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="../styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="../styles/news_post_responsive.css">
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
                    <h1>Especialidad</h1>
                </div>
            </div>
             <div class="container p-5"> 
            <div class="leave_comment">
            <div class="leave_comment_title"><a href="../actions_add_edit/agregarEspecialidad.jsp"><button type="button" class="btn btn-info">Agregar Especialidad</button></a></div>
           
     <div class="table-responsive" id="mydatatable-container">
    <table class="records_list table table-striped table-bordered table-hover" id="mydatatable">
        <thead class="thead-dark">
           <tr>
                        <th class="text-center">Nro</th>
                        <th class="text-center">Especialidad</th>
                        <th class="text-center">Costo</th>
                        
                        <th class="text-center">Acciones</th>
                        
                        
                    </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Filter..</th>
                <th>Filter..</th>
                <th>Filter..</th>
                
                
                
                <th style="visibility: hidden">Filter..</th>
                
            </tr>
        </tfoot>
        <tbody>
            <%
                    EspecialidadDAO dao=new EspecialidadDAO();
                    List<Especialidad>list=dao.listar();
                    Iterator<Especialidad>iter=list.iterator();
                    Especialidad per=null;
                    int contador=0;
                    while(iter.hasNext()){
                        per=iter.next();
                    
                %>
                 <tr>
                        <td class="text-center"><%= contador=contador+1%></td>
                        
                        <td class="text-center"><%= per.getNomEspecialidad()%></td>
                        <td><%= per.getCosto()%></td>
                        
                       
                       
      
                        <td colspan="2">
                            <form method="Post" action="Controlador">
                                 <input type="hidden" name="idEspecialidad" value="<%=per.getIdEspecialidad()%>" >
                               <button type="submit" class="btn btn-warning" name="accion" value="editarEspecialidad">Editar</button>
                               <button type="submit" class="btn btn-danger" name="accion" value="eliminarEspecialidad">Eliminar</button>
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
