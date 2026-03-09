<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estatico02_Filtro.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte.Estatico02_Filtro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Registro de Ventas Categoria</title>
	
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
                    <h1>Venta x Categoría</h1>
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
                        <asp:DropDownList ID="cbolocal" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-2">
                    <div class="row">
                        <span style="color:black">Año</span>
                    </div>
                    <div class="row">
                        <asp:DropDownList ID="cboanio" CssClass="form-control input-normal" runat="server" Width="80px" ></asp:DropDownList>
                    </div>
                </div>
                <div class="col col-lg-2">
                    <div class="row">
                        <span style="color:black">Mes</span>
                    </div>
                    <div class="row">
                        <asp:DropDownList ID="cbomes" CssClass="form-control input-normal" runat="server"></asp:DropDownList>     
                    </div>
                </div>
                <div class="col col-lg-4"></div>
            </div>
          
            <div class="row row justify-content-md-center">
                <div class="col col-lg-4"></div>
                <div class="col col-lg-4">
                    <div class="row">
                        <span style="color:black">Tipo Doc</span>
                    </div>
                    <div class="row">
				        <asp:DropDownList ID="cbotipo" CssClass="form-control input-normal" runat="server">
                            <asp:ListItem Value="00" Text="[Todos]"></asp:ListItem>
                            <asp:ListItem Value="01" Text="Factura"></asp:ListItem>
                            <asp:ListItem Value="03" Text="Boleta"></asp:ListItem>
                        </asp:DropDownList>   
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
                <br />
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

                viewestatico('Estatico02.aspx?' +
                    'local=' + $("#cbolocal").val() +
                    '&localdes=' + $("#cbolocal option:selected").text() +
                    '&anio=' + $("#cboanio").val() +
                    '&mes=' + $("#cbomes").val() +
                    '&tipo=' + $("#cbotipo").val() + 
                    '&di=' + $("#hdocumentointerno").val());
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