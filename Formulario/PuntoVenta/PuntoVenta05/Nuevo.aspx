<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta05.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Pedido</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css" />
  <link rel="stylesheet" href="../../../plugins/jquery-ui/jquery-ui.min.css"  />

  <link rel="stylesheet" href="../../../plugins/daterangepicker/daterangepicker.css" />
  <link rel="stylesheet" href="../../../plugins/select2/css/select2.min.css" />
  <link rel="stylesheet" href="../../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />
  <link rel="stylesheet" href="../../../plugins/toastr/toastr.min.css"  />
  <!-- Theme style -->
  <link rel="stylesheet" href="../../../Content/keyboard.css"/>
  <link rel="stylesheet" href="../../../dist/css/adminlte.min.css" />
  <link rel="stylesheet" href="../../../Content/style_custom_v3.2.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem;"> 
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Literal ID="lblentrega" runat="server"></asp:Literal>|||
                        <asp:Literal ID="lblcliente" runat="server"></asp:Literal>|||
                        <a href="#" style="color:black" id="fechadiferencia"></a>|||
                        <asp:Literal ID="lblubicacion" runat="server"></asp:Literal>|||
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>|||
                        <a href="#" style="color:black"  id="datos"></a>

                        <asp:LoginStatus ID="LoginStatus1" runat="server" 
                        LogoutAction="Redirect"
                        onclick="return true;"
                        LogoutText="<i class='fas fa-sign-out-alt'></i>" 
                        LogoutPageUrl="~/" 
                        OnLoggingOut="Unnamed_LoggingOut" ToolTip="Salir" />

                        <a href="#"><img src="../../../Img/VolverF40.png" title="Volver" class="img-thumbnail float-right" onclick="retornar();" /></a>
                        <a href="#"><img src="../../../Img/Actualizar40.png" title="Actualizar" class="img-thumbnail float-right" onclick="actualizar();" /></a>
                        <a href="#"><img src="../../../Img/Precuenta40.png" title="Precuenta" class="img-thumbnail float-right" onclick="precuenta();" /></a>                        
                        
                    </div>
                </div>
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card">

                    <div class="card-body" style="padding:0.5rem !important">
                        <div class="container-fluid">

                            <div class="row">
                                    <input type="hidden" name="hmobile" id="hmobile" value="0" runat="server"/>
                                    <input type="hidden" name="hid" id="hid" value="0" runat="server"/>
                                    <input type="hidden" name="hidpersona" id="hidpersona" value="0" runat="server"/>
                                    <input type="hidden" name="hestado" id="hestado" value="0" runat="server"/>
                                    <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                                    <input type="hidden" name="hmoneda" id="hmoneda"  runat="server" value="PEN"/>
                                    <input type="hidden" name="hidcaja" id="hidcaja" runat="server"/>
                                    <input type="hidden" name="himpresora" id="himpresora" runat="server"/>
                                    <input type="hidden" name="hacceso" id="hacceso" runat="server"/>
                                    <input type="hidden" name="hcaja" id="hcaja" runat="server"/>
                                    <input type="hidden" name="hserie" id="hserie" runat="server"/>
                                    <input type="hidden" name="hempleado" id="hempleado" runat="server"/>
                                    <input type="hidden" name="hstock" id="hstock" runat="server"/>
                                    <input type="hidden" name="hstockver" id="hstockver" runat="server"/>
                                    <input type="hidden" name="hcomandaimpresion" id="hcomandaimpresion" runat="server"/>
                                    <input type="hidden" name="hidalmacen" id="hidalmacen" runat="server"/>
                                    <input type="hidden" name="hidubicacion" id="hidubicacion" runat="server"/>
                                    <input type="hidden" name="hubicaciones" id="hubicaciones" runat="server"/>
                                    <input type="hidden" name="htipocambio" id="htipocambio" runat="server"/>
                                    <input type="hidden" name="hfecha" id="hfecha" runat="server"/>
                                    <input type="hidden" name="hidpedidodetalle" id="hidpedidodetalle" runat="server"/>
                                    <input type="hidden" name="hcomnadapermiso" id="hcomnadapermiso" runat="server" value="0"/>
                                    <input type="hidden" name="hcomandapendiente" id="hcomandapendiente" runat="server" value="1"/>
                                    <input type="hidden" name="hcomandaenviada" id="hcomandaenviada" runat="server" value="0"/>
                                    <input type="hidden" name="hentrega" id="hentrega" runat="server"/>
                                    <input type="hidden" name="hpagina" id="hpagina"  runat="server"/>
                                    <input type="hidden" name="hpagado" id="hpagado" runat="server"/>

                                    <input type="hidden" name="hprecuentaimpresoras" id="hprecuentaimpresoras" runat="server"/>
                                    <input type="hidden" name="hprecuentaimpresoraip" id="hprecuentaimpresoraip" runat="server"/>
                                

                                    <input type="hidden" name="hmoneda1" id="hmoneda1" runat="server" value="0"/>
                                    <input type="hidden" name="hmoneda2" id="hmoneda2" runat="server" value="0"/>
                            </div>

                            <div class="row">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-8 border-cat">
                                    <table id="tbldetalle" class="table table-bordered table-hover">
                                    </table>
                                </div>            
                                <div class="col-lg-2"></div>
                            </div>

                        </div>
                       
                    </div>
                    <!-- /.card -->
                </div>
            </section>
            <!-- /.content -->
        </div>

        
        


        <div class="modal" id="dialogpersonalizar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-xl modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Personalizar</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">      
                        <div class="row">
                            <div class="col-lg-2">
                                <span style="font-size:24px">Entrada</span>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" id="pentrada" name="pentrada" style="width:30px !important;height:30px !important;"/>
                            </div>
                            <div class="col-lg-2">
                                <span style="font-size:24px" id="spobservacion">Observación</span>
                            </div>
                            <div class="col-lg-4">
                                <input type="text" name="pobservacion" id="pobservacion" maxlength="100" class="form-control" />
                            </div>
                        </div>
                        <br />      
                        <table id="tblpersonalizar" class="table table-bordered table-hover">
                        </table>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-warning" onclick="cancelarpersonalizar();" value="Cancelar" title="Cancelar" />
                        <input type="button" class="btn btn-success" id="btnactualizarpersonalizar" name="btnactualizarpersonalizar" onclick="actualizarpersonalizar();" value="Grabar" title="Grabar"   />
                   </div>
                </div>
            </div>
        </div>

       <div class="modal" id="dialogprecuentaimpresora" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Seleccione Impresora</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-12" style="text-align:center" id="dprecuentaimpresora" name="dprecuentaimpresora">
                                
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelarprecuentaimpresora();" value="Cancelar" title="Cancelar"  />
                       
                   </div>
                </div>
            </div>
        </div>

       
    </form>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../../plugins/jquery/jquery.min.js"></script>
<script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="../../../plugins/jquery-blockuid/jquery.blockUI.min.js"></script>

<!-- Bootstrap 4 -->
<script src="../../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="../../../plugins/jquery-validation/additional-methods.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../../plugins/jszip/jszip.min.js"></script>
<script src="../../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- bs-custom-file-input -->
<script src="../../../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- InputMask -->
<script src="../../../plugins/moment/moment.min.js"></script>
<script src="../../../plugins/inputmask/jquery.inputmask.min.js"></script>
<!-- date-range-picker -->
<script src="../../../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../../../plugins/moment/locale/es.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="../../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="../../../plugins/jquery-bootstrap-confirm-modal/js/jquery.confirmModal.min.js"></script>
<!-- SweetAlert2 -->
<script src="../../../plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Toastr -->
<script src="../../../plugins/toastr/toastr.min.js"></script>

<script src="../../../Scripts/jquery.keyboard.js"></script>
<script src="../../../Scripts/jquery.keyboard.extension-all.js"></script>

<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
<script src="../../../plugins/jquery/puntoventa/PuntoVenta05/jquery.nuevoweb-3.0.0.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html>