<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estatico03_Filtro.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte.Estatico03_Filtro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Reporte kardex de Venta</title>
	
	<script src="../../../Scripts/jquery-3.1.1.js"></script>
    <script src="../../../Scripts/bootstrap.js"></script>
    <script src="../../../Scripts/jquery-ui-1.12.1.js"></script>
    <script src="../../../Scripts/jquery.validate.min.js"></script>
    <link href="../../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../../../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    
    <link rel="stylesheet" href="../../../Content/style_custom_v50.5.css" />
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
</head>
<body>
    <form id="formdocument" asp-antiforgery="false" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
        <div class="container">
            <div class="row">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-4">
                    <h1>kardex de Venta</h1>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-2">
                    <div class="row">
                        <span style="color:black">Local</span>
                    </div>
                    <div class="row">
                        <asp:DropDownList ID="cbolocal" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbolocal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
             
                <div class="col col-lg-2">
                    <div class="row">
                        <span style="color:black">Categoría</span>
                    </div>
                    <div class="row">
                        <asp:DropDownList ID="cbocategoria" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbocategoria_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-4">
                    <div class="row">
                        <span style="color:black">Producto</span>
                    </div>
                    <div class="row">
                        <asp:DropDownList ID="cboproducto" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
          
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-2">
                    <div class="row">
                        <span style="color:black">Fecha Inicio</span>
                    </div>
                    <div class="row">
				        <div class="input-group date" id="fechainicio" data-target-input="nearest">
					        <input type="text" class="form-control datetimepicker-input datetimepicker-short" data-target="#dfechainicio" id="dfechainicio" name="dfechainicio" readonly="readonly" runat="server" />
					        <div class="input-group-append">
						        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
					        </div>
				        </div>
                    </div>
			    </div>
                <div class="col col-lg-2">
                    <div class="row">
                        <span style="color:black">Hora Inicio</span>
                    </div>
                    <div class="row">
                        <input type="time" id="horainicio" name="horainicio" runat="server" value="00:00" class="form-control"/>
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
			    <div class="col col-lg-2">
                    <div class="row">
                        <span style="color:black">Fecha Fin</span>
                    </div>
                    <div class="row">
				        <div class="input-group date" id="fechafin" data-target-input="nearest">
					        <input type="text" class="form-control datetimepicker-input" data-target="#dfechafin" id="dfechafin" name="dfechafin" readonly="readonly" runat="server"/>
					        <div class="input-group-append">
						        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
					        </div>
				        </div>
                    </div>
			    </div>  
                <div class="col col-lg-2">
                    <div class="row">
                        <span style="color:black">Hora Fin</span>
                    </div>
                    <div class="row">
                        <input type="time" id="horafin" name="horafin" runat="server" value="23:59" class="form-control"/>
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <br />
            </div>
           
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-2">
                    <input type="button" name="btnvolver" id="btnvolver" class="btn btn-warning" style="width:100% !important" value="Volver" />
                    <input type="hidden" name="hruc" id="hruc" value="" runat="server"/>
                    <input type="hidden" name="hlocalcodigo" id="hlocalcodigo" value="" runat="server"/>
                    <input type="hidden" name="hempresatipo" id="hempresatipo" value="" runat="server"/>
                </div>
                <div class="col col-lg-2">
                    <input type="button" name="btnbuscar" id="btnbuscar" class="btn btn-primary" value="Buscar" />
                    
                </div>
                <div class="col col-lg-4"></div>
            </div>
        </div>
    </form>
    <script>
        $(function () {

            var date = new Date(), y = date.getFullYear(), m = date.getMonth();
            var dateini = new Date(y, m, 1);
            var datefin = new Date(y, m + 1, 0);

            $("#dfechainicio").datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                onSelect: function () {
                    var minDate = $('#dfechainicio').datepicker('getDate');
                    $("#dfechafin").datepicker("change", { minDate: minDate });
                }
            }).datepicker("setDate", dateini);

            $("#dfechafin").datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                onSelect: function () {
                    var maxDate = $('#dfechafin').datepicker('getDate');
                    $("#dfechainicio").datepicker("change", { maxDate: maxDate });
                }
            }).datepicker("setDate", datefin);



            $('#btnbuscar').on("click", function (e) {

                
                viewestatico('Estatico03.aspx?' +
                    'local=' + $("#cbolocal").val() +
                    '&localdes=' + $("#cbolocal option:selected").text() +
                    '&categoria=' + $("#cbocategoria").val() +
                    '&categoriades=' + $("#cbocategoria  option:selected").text() +
                    '&producto=' + $("#cboproducto").val() +
                    '&productodes=' + $("#cboproducto  option:selected").text() +
                    '&fechaini=' + $("#dfechainicio").val() + ' ' + $("#horainicio").val() +
                    '&fechafin=' + $("#dfechafin").val() + ' ' + $("#horafin").val());
            });

            $('#btnvolver').on("click", function (e) {
                window.location.href = 'Listado.aspx';
            });
        });

        function viewestatico(cadena) {
            PopupCenter(cadena, 'Estatico');
        }

        function PopupCenter(url, title) {
            var popup = window.open(url, title, "fullscreen");
            if (popup.outerWidth < screen.availWidth || popup.outerHeight < screen.availHeight) {
                popup.moveTo(0, 0);
                popup.resizeTo(screen.availWidth, screen.availHeight);
            }
        }
    </script>
</body>
</html>