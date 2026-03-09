<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dinamico02_Filtro.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte.Dinamico02_Filtro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Registro de Ventas Dinamico</title>
	
	<script src="../../../Scripts/jquery-3.1.1.js"></script>
    <script src="../../../Scripts/bootstrap.js"></script>
    <script src="../../../Scripts/jquery-ui-1.12.1.js"></script>
    <script src="../../../Scripts/jquery.validate.min.js"></script>
    <link href="../../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../../../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../Content/style_custom_v50.5.css" />
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
</head>
<body>
    <form id="formdocument" runat="server" >
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
        <div class="container">
            <div class="row">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-4">
                    <h1>Dinámico Venta Total</h1>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-4">
                    <div class="row">
                        <span style="color:black">Local</span>
                    </div>
                    <div class="row">
                        <asp:DropDownList ID="cbolocal" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbolocal_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-4">
                    <div class="row">
                        <span style="color:black">Caja</span>
                    </div>
                    <div class="row">
                        <asp:DropDownList ID="cbocaja" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-4">
                    <div class="row">
                        <span style="color:black">Cajero</span>
                    </div>
                    <div class="row">
                        <asp:DropDownList ID="cbocajero" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center"  id="divmesero">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-4">
                    <div class="row">
                        <span style="color:black">Mesero</span>
                    </div>
                    <div class="row">
                        <asp:DropDownList ID="cbomesero" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-4">
                    <div class="row">
                        <span style="color:black">Ubicación</span>
                    </div>
                    <div class="row">
                        <asp:DropDownList ID="cbomesa" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-4">
                    <div class="row">
                        <span style="color:black">Cierre</span>
                    </div>
                    <div class="row">
                       <asp:DropDownList ID="cbocierre" CssClass="form-control" runat="server">
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
            <div class="row">
                <div class="col col-lg-4"></div>

                <div class="col col-lg-4">
                    <span id="spandi" style="color:black;font-weight:bold" runat="server"></span>
                    <br />
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-2">
                    <input type="button" name="btnvolver" id="btnvolver" class="btn btn-warning" style="width:100% !important" value="Volver" />
                    <input type="hidden" name="hruc" id="hruc" value="" runat="server"/>
                    <input type="hidden" name="hlocalcodigo" id="hlocalcodigo" value="" runat="server"/>
                    <input type="hidden" name="hdocumentointerno" id="hdocumentointerno" value="0" runat="server"/>
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


            $('body').on("keydown", function (e) {
                if (e.ctrlKey && e.which === 73) { // CTRL+I

                    e.preventDefault();
                    $("#hdocumentointerno").val('1');
                    $("#spandi").html('(DI)');
                }
            });

            $('body').on("keydown", function (e) {
                if (e.ctrlKey && e.which === 76) { // CTRL+L
                    e.preventDefault();
                    $("#hdocumentointerno").val('0');
                    $("#spandi").html('');
                }
            });

            $('#btnbuscar').on("click", function (e) {

                
                viewestatico('Dinamico02.aspx?' +
                    'local=' + $("#cbolocal").val() +
                    '&localdes=' + $("#cbolocal option:selected").text() +
                    '&caja=' + $("#cbocaja").val() +
                    '&cajades=' + $("#cbocaja option:selected").text() +
                    '&cajero=' + $("#cbocajero option:selected").text() +
                    '&mesero=' + $("#cbomesero option:selected").text() +
                    '&mesa=' + $("#cbomesa").val() +
                    '&mesades=' + $("#cbomesa option:selected").text() +
                    '&cierre=' + $("#cbocierre option:selected").text() +
                    '&fechaini=' + $("#dfechainicio").val() + ' ' + $("#horainicio").val() +
                    '&fechafin=' + $("#dfechafin").val() + ' ' + $("#horafin").val() +
                    '&di=' + $("#hdocumentointerno").val());
            });

            $('#btnvolver').on("click", function (e) {
                window.location.href = 'Listado.aspx';
            });

            if ($("#hempresatipo").val() == "2") {
                $("#divmesero").hide();
            }
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