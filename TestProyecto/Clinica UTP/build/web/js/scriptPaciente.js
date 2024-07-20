/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    //desabiliytar button
    desabilitarBtn("#disa", true, "#AAAAAA");

    // ENVIAMOS EL EVENTO CHANGE AL SELECT para listar los horarios
    $(document).on('change', '#especialidad', function () {
        $("#bod").html('');
        document.getElementById("mensajeVacio").style.display = "none";
        //$("#mensajeVacio").css("display", "none");
        $("#loader").css("display", "");
        listarCitas();
    });
    //modale compra items
    $(document).on('click', '.btComprar', function (e) {
        $("#mbody").css("display", "none");
        $("#loaderF").css("display", "");
        $("#generarCompra").attr('disabled', true);
        listarMedicamentos(e);
    });
    //listar horario de citas del laboratorio
    $(document).on('click', '.horlab', function (e) {
        let idAnaliss = e.target.parentNode.parentNode.children[7].children[0].children[0].getAttribute("data-idAnalis");
        let nomAna = e.target.parentNode.parentNode.children[7].children[0].children[0].textContent;
        var histoanalisi = e.target.getAttribute("data-idHist");
        $("#nomAna").html(nomAna);
        $("#historiaXanalisis").val(histoanalisi);
        $("#idAnalisisL").val(idAnaliss);
        consultarCostoLaboratorio(idAnaliss);
        listarHorarioLabaratorio();
    });
        //reservarrr un horario
    $(document).on('click', '.reservalab', function (e)
    {
        let idmedic = e.target.getAttribute("data-idMedico");
        let idhor = e.target.getAttribute("data-idHorario");
        $("#IdMedicoL").val(idmedic);
        $("#IdHorarioL").val(idhor);

        //desabilitarBtn("#disa", false, "crimson");
    });
    //quitar medicamento
    $(document).on('click', '.quitar', function (e) {
        let padre = e.target.parentNode.parentNode.parentNode;
        let id = e.target.parentNode.parentNode;
        //primera forma sin usar nodopadre
        //id.remove();
        //segunda forma
        padre.removeChild(id);
        recalcular();
    });
    //mostrar resultados de laboratorio
    $(document).on('click', '.verlab', function (e) {
        getResultadoLaboratorio(e);
    });
    //mostrar triajee
    $(document).on('click', '.verTriaje', function (e) {
        viewTriaje(e);
    });
    //mostrar opcion escogida
    $(document).on('click', '.guard', function ()
    {
        // OBTENEMOS EL TEXTO VISIBLE DEL CONTROL SELECT
        select_item = $("#especialidad").val();
        opcion = $("#especialidad option:selected").text();
        $("#espEscogida").val(opcion);
        $("#idespecialidad").val(select_item);
        //llamamos al function
        consultarCostoEspecialidad(select_item);
        var id = $(this).parents("tr").find("th")[0].innerHTML;
        var dia = $(this).parents("tr").find("td")[0].innerHTML;
        var horaini = $(this).parents("tr").find("td")[1].innerHTML;
        var horafin = $(this).parents("tr").find("td")[2].innerHTML;
        var medico = $(this).parents("tr").find("td")[3].innerHTML;
        var idmedico = $(this).parents("tr").find("td")[5].innerHTML;
        let idhorario = $(this).parents("tr").find("td")[6].innerHTML;
        //$("#selec").html(`${id} ${dia} ${horaini} ${horafin}`);
        $("#dia").val(dia);
        $("#hora").val(`${horaini} Hasta ${horafin}`);
        $("#idmedico").val(idmedico);
        $("#medico").val(medico);
        $("#idHorario").val(idhorario);
        desabilitarBtn("#disa", false, "crimson");
    });
    //datatable de miscitas
    if (document.getElementById("tablemiscitas"))
    {
        //mostrar/ocultar
        ocultarDatos("#tablemiscitas", "#mostrar");
        ocultarDatos("#tablemiscitasLab", "#mostrarCitasL");
        $('#tablemiscitas').DataTable({language: table_español});
        $('#tablemiscitasLab').DataTable({language: table_español});
    }
    if (document.getElementById("tableRec"))
    {
        $('#tableRec').DataTable({language: table_español});    //iniciar table
    }
       $('#CitaReservada').modal();    //mostrar modal de confirmacion de cita reservada
});
function ocultarDatos(idTabla, idBtn)
{
    let tablecitas = document.querySelector(idTabla);
    let nodtr = tablecitas.querySelectorAll('table tbody tr');
    function ocultar() {
        for (let i = 0; i <= nodtr.length; i++)
        {
            if (tablecitas.rows[i].cells[8].textContent == 'Atendido' || tablecitas.rows[i].cells[8].textContent == 'Cancelado')
            {
                tablecitas.rows[i].style.display = "none";
            }
        }
    }
    function mostrar() {
        for (let i = 0; i <= nodtr.length; i++)
        {
            if (tablecitas.rows[i].cells[8].textContent == 'Atendido' || tablecitas.rows[i].cells[8].textContent == 'Cancelado')
            {
                tablecitas.rows[i].style.display = null;
            }
        }
    }
    if (document.querySelector(idBtn))
    {
        ocultar();
        document.querySelector(idBtn).classList.add("band");
    }
    $(idBtn).click(function () {
        let ba = document.querySelector(idBtn).classList.toggle("band");
        if (ba) {
            ocultar();
            document.querySelector(idBtn).textContent = "Mostrar todas las Citas";
        } else {
            mostrar();
            document.querySelector(idBtn).textContent = "Ocultar";
        }
    })
}
function verificarMedicamentosComprados(){
    let band=true;
    let tableMedic= document.querySelector("#farmacos");
    console.log(tableMedic);
    let nodtr = tableMedic.querySelectorAll('table tbody tr');
    console.log(nodtr);
    for (let i = 1; i <= nodtr.length; i++)
    {
        if (tableMedic.rows[i].cells[5].children[0].getAttribute("data-stado")=='Adquirido'){
            console.log(tableMedic.rows[i].cells[5].children[0].getAttribute("data-stado"));
            band=false;
        }
    }
    if(!band){
       $("#generarCompra").attr('disabled', true);
    }
}
function recalcular()
{
    let nodtr = document.getElementById('bodymed').querySelectorAll("tr");
    let palabra;
    let recalculado = 0;
    if (nodtr.length != 0)
    {
        for (let i = 0; i < nodtr.length; i++)
        {
            palabra = String(document.getElementById("bodymed").rows[i].cells[4].textContent);
            recalculado += parseFloat(palabra.substr(3));
            document.getElementById('precioSubtotal').textContent = recalculado;
            document.getElementById('precioTotal').textContent = (recalculado * 0.18) + recalculado;
            $("#subtotalMe").val(recalculado);
            $("#totalMe").val((recalculado * 0.18) + recalculado);
        }
    } else {
        document.getElementById('precioSubtotal').textContent = "0.0";
        document.getElementById('precioTotal').textContent = "0.0";
        desabilitarBtn("#generarCompra", true);
    }
}
function listarCitas()
{
    // DECLARAMOS LAS VARIABLES QUE USAREMOS
    var select_item, opcion;
    // OBTENEMOS EL VALOR DEL SELECT QUE HEMOS SELECCIONADO.
    select_item = $("#especialidad").val();
    $.ajax({
        type: 'Post',
        url: 'Controlador',
        data: {accion: "horario", id: select_item},
        success: function (resp) {
            $("#bod").html('');
            console.log(resp);
            let myObj = JSON.parse(resp);
            if (myObj != 0)
            {
                $("#loader").css("display", "none");
                $("#mensajeVacio").css("display", "none");
                $.each(myObj, function (index, item)
                {
                    $("#bod").html($("#bod").html() + `
                <tr>
                    <th scope="row">${item.idHorario}</th>
                    <td>${item.fecha}</td>
                    <td>${item.horaInicio}</td>
                    <td>${item.horaFin}</td>
                    <td>${item.medico}</td> 
                    <td>  
                        <button type="button" class="btn btn-success guard" data-dismiss="modal">Reservar</button>
                    </td>
                    <td>${item.idMedico}</td>
                    <td>${item.idHorario}</td>
                </tr>`);
                });
                $('td:nth-child(7)').hide();
                $('td:nth-child(8)').hide();
            } else {
                $("#loader").css("display", "none");
                $("#mensajeVacio").css("display", "");
            }
        }
    });

    $('#horario').modal();    //mostrar modal

    opcion = $("#especialidad option:selected").text();
    document.querySelector("#estitle").textContent = "Especialidad de " + opcion;
}
function listarHorarioLabaratorio()
{
    $("#bod").html('');
    $("#mensajeVacio").css("display", "none");
    $("#loader").css("display", "");
    $.ajax({
        type: 'GET',
        url: 'Controlador',
        data: {accion: "horarioLaboratorio"},
        success: function (resp) {
            $("#bod").html('');
            let myObj = JSON.parse(resp);
            if (myObj != 0)
            {
                $("#loader").css("display", "none");
                $("#mensajeVacio").css("display", "none");
                $.each(myObj, function (index, item)
                {
                    $("#bod").html($("#bod").html() + `
                <tr>
                    <th scope="row">${item.idHorario}</th>
                    <td>${item.fecha}</td>
                    <td>${item.horaInicio}</td>
                    <td>${item.horaFin}</td>
                    <td>${item.medico}</td> 
                    <td>  
                        <button type="submit" name="accion" value="reservarLaboratorio" class="btn btn-success reservalab" data-idMedico="${item.idMedico}" data-idHorario="${item.idHorario}">Reservar</button>
                    </td>
                </tr>`);
                });
            } else {
                $("#loader").css("display", "none");
                $("#mensajeVacio").css("display", "");
            }
        }
    });
    $('#horarioLaboratorio').modal();    //mostrar modal
}
function getResultadoLaboratorio(e)
{
    let idlab = e.target.getAttribute("data-idlabo");
    console.log(idlab);
    $("#tbodyL").html('');
    $("#nombreAna").html('');
    $("#loaderL").css("display", "");
    $.ajax({
        type: 'GET',
        url: 'Controlador',
        data: {accion: "resultLaboratorio", idlab},
        success: function (resp) {
            let myObj = JSON.parse(resp);
            $("#loaderL").css("display", "none");
            $("#tbodyL").html(myObj[0]['resultadoLaboratorio']);
            $("#nombreAna").html(myObj[0]['nombreAnalisis']);
            console.log(myObj[0]['resultadoLaboratorio']);
        }
    });
    $('#verLaboratorio').modal();    //mostrar modal
}
function viewTriaje(e)
{
    $("#tbodyT").html("");
    function dividirCadena(cadenaADividir, separador) {
        let arrayDeTitulos = cadenaADividir.split(separador);
        
        for (var i = 0; i < arrayDeTitulos.length; i++) {
            console.log(arrayDeTitulos[i] + " / ");
            $("#tbodyT").html($("#tbodyT").html()+`<b>${arrayDeTitulos[i]}</b><br>`);
        }
    }
    let triaje = e.target.getAttribute("data-Triaj");
    dividirCadena(triaje,",");
    $('#modTriaje').modal();    //mostrar modal
}
function listMedFetch(e){
    
    let idhisto, total = 0;
    idhisto = e.target.getAttribute("data-idHisto");
    let url=`Controlador?accion=listaMedicamentosReceta&idme=${idhisto}`; 
    $('#comprarFarmaco').modal(); //mostrar el modal
    async function getData()
    {
        try {
            let res=await fetch(url),
            jso= await res.json();
            if(!res.ok) throw{status:res.status,statusText:res.status};
            $("#bodymed").html('');
            jso.forEach(item => {
                total += subtotal(item.precioMedicamento, item.cantidad);

                $("#bodymed").html($("#bodymed").html() + `
                    <tr>
                        <th scope="row">${item.idReceta}</th>
                        <td>${item.producto}</td>
                        <td>${item.cantidad}</td>
                        <td>S/ ${item.precioMedicamento}</td>
                        <td>S/ ${subtotal(item.precioMedicamento, item.cantidad)}</td>
                        <td>  
                            <button type="button" class="btn btn-danger quitar" data-stado="${item.estadoReceta}">Quitar</button>
                        </td>
                        <td><input type="text" name="idReceta[]" value="${item.idReceta}" readonly></td>
                        <td><input type="text" name="idProducto[]" value="${item.idProducto}" readonly></td>
                        <td><input type="text" name="totalxp[]" value="${subtotal(item.precioMedicamento, item.cantidad)}" readonly></td>
                        <td><input type="text" name="cantidad[]" value="${item.cantidad}" readonly></td>
                    </tr>`);
            });
            verificarMedicamentosComprados();
            document.querySelector("#precioSubtotal").textContent = total;
            document.querySelector("#precioTotal").textContent = (total * 0.18) + total;
            $("#subtotalMe").val(total);
            $("#totalMe").val((total * 0.18) + total);
            $("#mbody").css("display", "");
            $("#loaderF").css("display", "none");
            desabilitarBtoCompra();
            desabilitarBtn("#generarCompra", false, "#28a745");
            function subtotal(a, b) {
                return parseFloat(a) * parseFloat(b)
            }
        } catch (error) {
            console.log(error);
            console.log("error catch");
        }
    }
    getData();
}
function listarMedicamentos(e)
{
    // DECLARAMOS LAS VARIABLES QUE USAREMOS
    let idhisto, total = 0;
    idhisto = e.target.getAttribute("data-idHisto");
    $.ajax({
        type: 'Post',
        url: 'Controlador',
        data: {accion: "listaMedicamentosReceta", idhisto: idhisto},
        success: function (resp) {
            $("#bodymed").html('');
            var myObj = JSON.parse(resp);
            $.each(myObj, function (index, item)
            {
                total += subtotal(item.precioMedicamento, item.cantidad);
                $("#bodymed").html($("#bodymed").html() + `
                    <tr>
                        <th scope="row">${item.idReceta}</th>
                        <td>${item.producto}</td>
                        <td>${item.cantidad}</td>
                        <td>S/ ${item.precioMedicamento}</td>
                        <td>S/ ${subtotal(item.precioMedicamento, item.cantidad)}</td>
                        <td>  
                            <button type="button" class="btn btn-danger quitar" data-stado="${item.estadoReceta}">Quitar</button>
                        </td>
                        <td><input type="text" name="idReceta[]" value="${item.idReceta}" readonly></td>
                        <td><input type="text" name="idProducto[]" value="${item.idProducto}" readonly></td>
                        <td><input type="text" name="totalxp[]" value="${subtotal(item.precioMedicamento, item.cantidad)}" readonly></td>
                        <td><input type="text" name="cantidad[]" value="${item.cantidad}" readonly></td>
                    </tr>`);
            });
            $("#generarCompra").attr('disabled', false);
            verificarMedicamentosComprados();
            document.querySelector("#precioSubtotal").textContent = total;
            document.querySelector("#precioTotal").textContent = (total * 0.18) + total;
            $("#subtotalMe").val(total);
            $("#totalMe").val((total * 0.18) + total);
            $("#mbody").css("display", "");
            $("#loaderF").css("display", "none");
            desabilitarBtoCompra();
        }
    });
    //mostrar el modal
    $('#comprarFarmaco').modal();
    function subtotal(a, b) {
        return parseFloat(a) * parseFloat(b)
    }
}

function consultarCostoEspecialidad(select_item)
{
    //COnsulta el precio del reserva por especialidad
    $.ajax({
        type: 'Post',
        url: 'Controlador',
        data: {accion: "costoEspecialidad", ides: select_item},
        success: function (resp) {
            $("#costoTotal").html(resp);
            $("#costo").val(resp);
        }
    });
}
function consultarCostoLaboratorio(idAna)
{
    //COnsulta el precio del reserva por especialidad
    $.ajax({
        type: 'GET',
        url: 'Controlador',
        data: {accion: "costoLaboratorio", idan: idAna},
        success: function (resp) {
            //$("#costoTotal").html(resp);
            $("#costoL").val(resp);
            document.getElementById("costoAa").textContent=resp;
        }
    });
}
function desabilitarBtoCompra() {
    let button = document.querySelectorAll(".quitar");
    button.forEach((el) => {
        if (el.getAttribute("data-stado") == "Adquirido") {
            el.disabled = true;
            el.classList.remove("btn-danger");
            el.classList.add("btn-secondary");
            el.textContent = "Adquirido";
        } else {
            el.disabled = false;
        }
    });
}
function desabilitarBtn(bt, bandera, color) {
    $(bt).attr('disabled', bandera);
    $(bt).css("background-color", color);
}
var table_español = {
    "processing": "Procesando...",
    "lengthMenu": "Mostrar _MENU_ registros",
    "zeroRecords": "No se encontraron resultados",
    "emptyTable": "Ningún dato disponible en esta tabla",
    "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
    "search": "Buscar:",
    "infoThousands": ",",
    "loadingRecords": "Cargando...",
    "paginate": {
        "first": "Primero",
        "last": "Último",
        "next": "Siguiente",
        "previous": "Anterior"
    },
    "aria": {
        "sortAscending": ": Activar para ordenar la columna de manera ascendente",
        "sortDescending": ": Activar para ordenar la columna de manera descendente"
    },
    "buttons": {
        "copy": "Copiar",
        "colvis": "Visibilidad",
        "collection": "Colección",
        "colvisRestore": "Restaurar visibilidad",
        "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
        "copySuccess": {
            "1": "Copiada 1 fila al portapapeles",
            "_": "Copiadas %d fila al portapapeles"
        },
        "copyTitle": "Copiar al portapapeles",
        "csv": "CSV",
        "excel": "Excel",
        "pageLength": {
            "-1": "Mostrar todas las filas",
            "1": "Mostrar 1 fila",
            "_": "Mostrar %d filas"
        },
        "pdf": "PDF",
        "print": "Imprimir"
    },
    "autoFill": {
        "cancel": "Cancelar",
        "fill": "Rellene todas las celdas con <i>%d<\/i>",
        "fillHorizontal": "Rellenar celdas horizontalmente",
        "fillVertical": "Rellenar celdas verticalmentemente"
    },
    "decimal": ",",
    "searchBuilder": {
        "add": "Añadir condición",
        "button": {
            "0": "Constructor de búsqueda",
            "_": "Constructor de búsqueda (%d)"
        },
        "clearAll": "Borrar todo",
        "condition": "Condición",
        "conditions": {
            "date": {
                "after": "Despues",
                "before": "Antes",
                "between": "Entre",
                "empty": "Vacío",
                "equals": "Igual a",
                "notBetween": "No entre",
                "notEmpty": "No Vacio",
                "not": "Diferente de"
            },
            "number": {
                "between": "Entre",
                "empty": "Vacio",
                "equals": "Igual a",
                "gt": "Mayor a",
                "gte": "Mayor o igual a",
                "lt": "Menor que",
                "lte": "Menor o igual que",
                "notBetween": "No entre",
                "notEmpty": "No vacío",
                "not": "Diferente de"
            },
            "string": {
                "contains": "Contiene",
                "empty": "Vacío",
                "endsWith": "Termina en",
                "equals": "Igual a",
                "notEmpty": "No Vacio",
                "startsWith": "Empieza con",
                "not": "Diferente de"
            },
            "array": {
                "not": "Diferente de",
                "equals": "Igual",
                "empty": "Vacío",
                "contains": "Contiene",
                "notEmpty": "No Vacío",
                "without": "Sin"
            }
        },
        "data": "Data",
        "deleteTitle": "Eliminar regla de filtrado",
        "leftTitle": "Criterios anulados",
        "logicAnd": "Y",
        "logicOr": "O",
        "rightTitle": "Criterios de sangría",
        "title": {
            "0": "Constructor de búsqueda",
            "_": "Constructor de búsqueda (%d)"
        },
        "value": "Valor"
    },
    "searchPanes": {
        "clearMessage": "Borrar todo",
        "collapse": {
            "0": "Paneles de búsqueda",
            "_": "Paneles de búsqueda (%d)"
        },
        "count": "{total}",
        "countFiltered": "{shown} ({total})",
        "emptyPanes": "Sin paneles de búsqueda",
        "loadMessage": "Cargando paneles de búsqueda",
        "title": "Filtros Activos - %d"
    },
    "select": {
        "1": "%d fila seleccionada",
        "_": "%d filas seleccionadas",
        "cells": {
            "1": "1 celda seleccionada",
            "_": "$d celdas seleccionadas"
        },
        "columns": {
            "1": "1 columna seleccionada",
            "_": "%d columnas seleccionadas"
        }
    },
    "thousands": ".",
    "datetime": {
        "previous": "Anterior",
        "next": "Proximo",
        "hours": "Horas",
        "minutes": "Minutos",
        "seconds": "Segundos",
        "unknown": "-",
        "amPm": [
            "am",
            "pm"
        ]
    },
    "editor": {
        "close": "Cerrar",
        "create": {
            "button": "Nuevo",
            "title": "Crear Nuevo Registro",
            "submit": "Crear"
        },
        "edit": {
            "button": "Editar",
            "title": "Editar Registro",
            "submit": "Actualizar"
        },
        "remove": {
            "button": "Eliminar",
            "title": "Eliminar Registro",
            "submit": "Eliminar",
            "confirm": {
                "_": "¿Está seguro que desea eliminar %d filas?",
                "1": "¿Está seguro que desea eliminar 1 fila?"
            }
        },
        "error": {
            "system": "Ha ocurrido un error en el sistema (<a target=\"\\\" rel=\"\\ nofollow\" href=\"\\\">Más información&lt;\\\/a&gt;).<\/a>"
        },
        "multi": {
            "title": "Múltiples Valores",
            "info": "Los elementos seleccionados contienen diferentes valores para este registro. Para editar y establecer todos los elementos de este registro con el mismo valor, hacer click o tap aquí, de lo contrario conservarán sus valores individuales.",
            "restore": "Deshacer Cambios",
            "noMulti": "Este registro puede ser editado individualmente, pero no como parte de un grupo."
        }
    },
    "info": "Mostrando de _START_ a _END_ de _TOTAL_ entradas"
} 