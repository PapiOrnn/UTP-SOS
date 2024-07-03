

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entidades.Solicitud"%>


<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ReporteDAO"%>
<!DOCTYPE html>
<html>
   
        <head>
        <meta charset="UTF-8">
       
        <title>Reporte Citas</title>
        <!-- Required meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">




       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js"></script>

        <!-- Datatables -->
        <link rel="stylesheet" href="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.18/datatables.min.css">
        <script src="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.18/datatables.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/news_post_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/news_post_responsive.css">
    </head>
    <body >
        <div class="super_container">
            <header class="header d-flex flex-row">
                <jsp:include page="headerAdministrador.jsp"/>
            </header>
            <div class="home" style="background-image:url(images/news_background.jpg);">
               
                <div class="home_content">
                    <h1>Reporte Citas</h1>
                    
                </div>
            </div>
             <div class="container p-5"> 
            <div class="leave_comment">
               
                
                <div class="leave_comment_title" ><a href="agregarPaciente.jsp" style="margin-left: 950px;"><button type="button" style="font-size: 25px;" class="fas fa-print btn btn-info"></button></a></div>
                <br>
     <div class="table-responsive" id="mydatatable-container">
    <table class="records_list table table-striped table-bordered table-hover" id="mydatatable">
        <thead class="thead-dark">
            <tr>
                
                        <th class="text-center">Nro</th>
                        <th class="text-center">Paciente</th>
                        <th class="text-center">Medico</th>
                        <th class="text-center">Especialidad</th>
                        <th class="text-center">Fecha</th>
                      
                        
                        
                        
                        <th class="text-center">Modalidad</th>
                        <th class="text-center">Costo</th>
                        <th class="text-center">Estado</th>
                       
                        
                  
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
                
                
            </tr>
        </tfoot>
        <tbody>
            <%
                    ReporteDAO dao=new ReporteDAO();
                    List<Solicitud>list=dao.listar();
                    Iterator<Solicitud>iter=list.iterator();
                    Solicitud per=null;
                    int contador=0;
                    while(iter.hasNext()){
                        per=iter.next();
                    
                %>
                 <tr>
                        <td class="text-center"><%= contador=contador+1%></td>
                        <td class="text-center"><%= per.getNomPaciente()%> <%= per.getApellidoPaternoPaciente()%> <%= per.getApellidoMaternoPaciente()%></td>
                        <td><%= per.getNombreMedico()%> <%= per.getApellidoPaternoMedico()%> <%= per.getApellidoMaternoMedico()%></td>
                        <td class="text-center"><%= per.getTipoCita()%></td>
                        <td class="text-center"><%= per.getFecha()%></td>
                       
 
                        <td class="text-center"><%= per.getModalidad()%></td>
                      
                        <td class="text-center"><%= per.getCosto()%></td>
                        <td class="text-center"><%= per.getEstadoServicio()%></td>
      
                       
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
