/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    //atender cita
    $(document).on('click', '.atender', function (e) {
        let idpaci = $(this).parents("tr").find("td")[0].innerHTML;
        let soli = $(this).parents("tr").find("td")[1].innerHTML;
        let fecha = $(this).parents("tr").find("td")[4].innerHTML;
        $("#fecha").val(fecha);
        $("#idPaciente").val(idpaci);
        $("#idSolicitud").val(soli);
    });
    //atender laboratorio
    $(document).on('click', '.atenderLaborar', function (e) {
        //e.preventDefault();
        let idtipoa = e.target.getAttribute("data-idTipo");
        let idpaci = $(this).parents("tr").find("td")[0].innerHTML;
        let idHisto = $(this).parents("tr").find("td")[1].innerHTML;
        let soli = $(this).parents("tr").find("td")[2].innerHTML;
        let estadSol = $(this).parents("tr").find("td")[9].innerHTML;
        $("#historiaXanalisis").val(idHisto);
        $("#idPaciente").val(idpaci);
        $("#idSolicitud").val(soli);
        $("#idTipoa").val(idtipoa);
        $("#estadoSol").val(estadSol);
        
    });
    //mostrar resultados de laboratorio
    $(document).on('click', '.verlab', function (e) {
        getResultadoLaboratorio(e);
    });
    //listar medicamentos para recetar
        listarMedicamentos();
    //mostrar triajee
    $(document).on('click', '.verTriaje', function (e) {
        viewTriaje(e);
    });
    //agregar nueva fila para recetas
    $(document).on('click', '#addreceta', function () {
        $('#farmacos').modal();
        $('#lisfarm').css("width","100%" );
    });
    //agregar medicamento a recetar
    $(document).on('click', '.recetar', function (e) {
        
        let id = e.target.parentNode.parentNode.cells[0].textContent;
        let nombre = e.target.parentNode.parentNode.cells[1].textContent;
        //agregar receta
        addReceta(id,nombre);
    });
    //quitar receta
    $(document).on('click', '.quitar', function (e) {
        let padre = e.target.parentNode.parentNode.parentNode;
        let id = e.target.parentNode.parentNode;
        //primera forma sin usar nodopadre
        //id.remove();
        //segunda forma
        padre.removeChild(id);
    });
    //datatable de mis citas pendientes
    if (document.getElementById("tablecitaspendientes"))
    {
        $('#tablecitaspendientes').DataTable({language: table_español});
    }
    /*if (document.getElementById("lisfarm"))
    {
        $('#lisfarm').DataTable({language: table_español});
    }*/

});

function addReceta(id,nombre)
{
    const    tbo = document.querySelector("#tbod");
    let str = `<tr>
                <td><input class="input_field" type="number" name="id[]" value="${id}" readonly></td>
                <td><input class="input_field" type="text" name="nombre[]" value="${nombre}" readonly></td>
                <td><input class="input_field" type="number" name="cantidad[]" required></td>
                <td><input class="input_field" type="text" name="observacion[]" required></td>
                <td><button class="btn btn-danger quitar" type="button" name="quitar">Quitar</button></td>
            </tr>`;
    tbo.insertAdjacentHTML("beforeend", str);
}
function listarMedicamentos() {
    
    $('#lisfarm').DataTable( {
        ajax: {
            url: 'Controlador?accion=listarFarmacos',
            dataSrc: ''},
        columns:[
            { data: 'idFarmaco'},
            { data: 'nombreFarmaco'},
            { data: 'precio'},
            { data: 'stock'},
            { defaultContent: '<button type="button" class="btn btn-success recetar">Recetar</button>'},
        ],
        language:table_español
    });
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
function getResultadoLaboratorio(e)
{
    let idlab = e.target.getAttribute("data-idlabo");
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
        }
    });
    $('#verLaboratorio').modal();    //mostrar modal
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