<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta21.Nuevo" %>

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
  <link rel="stylesheet" href="../../../dist/css/keyboard.min.css" />
  <link rel="stylesheet" href="../../../dist/css/keyboard-previewkeyset.min.css" />

  <link rel="stylesheet" href="../../../dist/css/adminlte.min.css" />
  <link rel="stylesheet" href="../../../Content/style_custom_v31.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem"> 
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Literal ID="lblubicacion" runat="server"></asp:Literal>
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>|
                        <a href="#" style="color:black"  id="datos"></a>

                        <a href="#"><img src="../../../Img/VolverF40.png" title="Volver" class="img-thumbnail float-right" onclick="retornar();" /></a>
                        <%--<a href="#"><img src="../../../Img/Actualizar40.png" title="Actualizar" class="img-thumbnail float-right" onclick="actualizar();" /></a>--%>

                        <label id="lfactura" >
                            <a href="#"><img src="../../../Img/factura40.png" title="Factura" class="img-thumbnail" onclick="grabar('01');" /></a>
                        </label>

                        <label id="lboleta" >
                            <a href="#"><img src="../../../Img/boleta40.png" title="Boleta" class="img-thumbnail" onclick="grabar('03');" /></a>
                        </label>

                        <label id="lpagorapido" >
                            <a href="#"><img src="../../../Img/Rapido40.png" title="Pago Rápido" class="img-thumbnail" onclick="grabar('91');" /></a>    
                        </label>

                    </div>
                </div>
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card">

                    <div class="card-body" style="padding:0.5rem">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-sm-8 col-md-8 col-lg-8">
                                            <input type="text" id="qproducto" name="qproducto" class="form-control" placeholder="Producto"  />
                                         
                                            

                                            <input type="hidden" name="hmobile" id="hmobile" value="0" runat="server"/>
                                            <input type="hidden" name="hid" id="hid" value="0" runat="server"/>
                                            <input type="hidden" name="hentrega" id="hentrega"  runat="server"/>
                                            <input type="hidden" name="hclientetipo" id="hclientetipo"  runat="server"/>
                                            <input type="hidden" name="hguiacreacion" id="hguiacreacion"  runat="server"/>
                                            <input type="hidden" name="hmoneda" id="hmoneda"  runat="server" value="PEN"/>
                                            <input type="hidden" name="hpagina" id="hpagina"  runat="server"/>
                                            <input type="hidden" name="hpagado" id="hpagado"  runat="server"/>
                                            <input type="hidden" name="hidpersona" id="hidpersona" value="0" runat="server"/>
                                            <input type="hidden" name="hestado" id="hestado" value="0" runat="server"/>
                                            <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                                            <input type="hidden" name="hidcaja" id="hidcaja" runat="server"/>
                                            <input type="hidden" name="himpresora" id="himpresora" runat="server"/>
                                            <input type="hidden" name="hacceso" id="hacceso" runat="server"/>
                                            <input type="hidden" name="hcaja" id="hcaja" runat="server"/>
                                            <input type="hidden" name="hserie" id="hserie" runat="server"/>
                                            <input type="hidden" name="hempleado" id="hempleado" runat="server"/>
                                            <input type="hidden" name="hstock" id="hstock" runat="server"/>
                                            <input type="hidden" name="hstockver" id="hstockver" runat="server"/>
                                            <input type="hidden" name="hprecuentaimpresion" id="hprecuentaimpresion" runat="server"/>
                                            <input type="hidden" name="hcomandaimpresion" id="hcomandaimpresion" runat="server"/>
                                            <input type="hidden" name="hanulacioncomanda" id="hanulacioncomanda" runat="server"/>
                                            <input type="hidden" name="hidalmacen" id="hidalmacen" runat="server"/>
                                            <input type="hidden" name="hidubicacion" id="hidubicacion" runat="server"/>
                                            <input type="hidden" name="hprecuentacantidad" id="hprecuentacantidad" runat="server"/>
                                            <input type="hidden" name="hubicaciones" id="hubicaciones" runat="server"/>
                                            <input type="hidden" name="htipocambio" id="htipocambio" runat="server"/>
                                            <input type="hidden" name="hfecha" id="hfecha" runat="server"/>
                                            <input type="hidden" name="hidpedidodetalle" id="hidpedidodetalle" runat="server"/>
                                            <input type="hidden" name="hcomnadapermiso" id="hcomnadapermiso" runat="server" value="0"/>
                                            <input type="hidden" name="hcomandapendiente" id="hcomandapendiente" runat="server" value="1"/>
                                            <input type="hidden" name="hcomandaenviada" id="hcomandaenviada" runat="server" value="0"/>
                                            <input type="hidden" name="hcontingencia" id="hcontingencia" runat="server" value="0"/>
                                            <input type="hidden" name="hcambioprecio" id="hcambioprecio" runat="server" value="0"/>

                                            <input type="hidden" name="hmoneda1" id="hmoneda1" runat="server" value="0"/>
                                            <input type="hidden" name="hmoneda2" id="hmoneda2" runat="server" value="0"/>
                                            <input type="hidden" name="hscanerproducto" id="hscanerproducto" runat="server"/>
                                        </div>
                                        <div class="col-sm-4 col-md-4 col-lg-4">
                                            <a href="#" onclick="buscarproducto();">
                                                <img src="../../../icons/normal/search32.png" />
                                            </a>
                                        </div>
                                    </div>
                                    <div id="divcategorias" class="row"></div>
                                    <div id="divproductos" class="row"></div>
                                </div>

                                <div class="col-lg-6">
                                    <table id="tbldetalle" class="table"></table>
                                </div>            
                            </div>

                        </div>
                       
                    </div>
                    <!-- /.card -->
                </div>
            </section>
            <!-- /.content -->
        </div>
        
       
        <div class="modal" id="dialogproducto_descuento_item" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel" style="color:black">Descuento Item</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                       <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <h3><label id="nombre_descuento_item"></label></h3>
                            </div>
                        </div>
                       <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <span style="font-size:24px">SubTotal</span>
                            </div>
                            <div class="col-sm-8 col-md-8 col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_item_submonto" id="descuento_item_submonto" class="form-control" style="text-align:right;font-size:28px; width:140px" readonly="readonly"/>
                            </div>
                        </div>        
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-centered">
                                <input type="radio" name="descuento_item_opcion" value="1" checked="checked"/>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4"><span style="font-size:24px">Monto</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_item_monto" id="descuento_item_monto" class="form-control"  maxlength="7"  placeholder="0.00" onkeypress="return isNumberKey(event)"  style="text-align:right;font-size:28px;width:140px" />
                            </div>
                        </div>
                        <div class="row">
                           <div class="col-sm-4 col-md-4 col-lg-4 col-centered">
                                <input type="radio" name="descuento_item_opcion" value="0"  />
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4"><span style="font-size:24px">Porc(%)</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_item_porcentaje" id="descuento_item_porcentaje" class="form-control"  maxlength="7" placeholder="0.00" onkeypress="return isNumberKey(event)"  style="text-align:right;font-size:28px;width:140px" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-centered">
                                <input type="button" class="btn btn-export" onclick="calcularproducto_descuento_item();" value="(*)" title="Calcular"/>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4"><span style="font-size:24px">Nuevo Total</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_item_total" id="descuento_item_total" class="form-control" value="0.00" style="text-align:right;font-size:28px;width:140px"  readonly="readonly"/>
                            </div>
                        </div>
                    </div>
					<div class="modal-footer">                     
                            <input type="button" class="btn btn-warning" onclick="cancelarproducto_descuento_item();" value="Cancelar" title="Cancelar"  />
                            <input type="button" class="btn btn-success" onclick="actualizarproducto_descuento_item();" value="Grabar" title="Grabar"   />

                            <input type="hidden" name="hidproducto_descuento_item" id="hidproducto_descuento_item"/>
                            <input type="hidden" name="hid_descuento_item" id="hid_descuento_item"/>
                            <input type="hidden" name="htotal_descuento_item" id="htotal_descuento_item"/>
                    </div>
                </div>
           </div>
        </div>

        <div class="modal" id="dialogproducto_descuento_global" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel02" style="color:black">Descuento Global</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">                        
                       <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <span style="font-size:24px">SubTotal</span>
                            </div>
                            <div class="col-sm-8 col-md-8 col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_global_submonto" id="descuento_global_submonto" class="form-control" style="text-align:right;font-size:28px; width:140px" readonly="readonly"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="descuento_global_opcion" value="1" checked="checked"/>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4 col-centered"><span style="font-size:24px">Monto</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_global_monto" id="descuento_global_monto" class="form-control" maxlength="7" placeholder="0.00" onkeypress="return isNumberKey(event)" style="text-align:right;font-size:28px;width:140px" />
                            </div>
                            
                        </div>
                       <div class="row">
                           <div class="col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="descuento_global_opcion" value="0" />
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4 col-centered"><span style="font-size:24px">Porc(%)</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_global_porcentaje" id="descuento_global_porcentaje" class="form-control" maxlength="7" placeholder="0.00" onkeypress="return isNumberKey(event)" style="text-align:right;font-size:28px;width:140px" />
                            </div>
                            
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <input type="button" class="btn btn-export" onclick="calcularproducto_descuento_global();" value="(*)" title="Calcular"/>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4 col-centered"><span style="font-size:24px">Total</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_global_total" id="descuento_global_total" class="form-control" maxlength="7" placeholder="0.00" onkeypress="return isNumberKey(event)" style="text-align:right;font-size:28px;width:140px" readonly="readonly" />
                            </div>
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-warning" onclick="cancelarproducto_descuento_global();" value="Cancelar" title="Cancelar"  />
                        <input type="button" class="btn btn-success" onclick="actualizarproducto_descuento_global();" value="Grabar" title="Grabar"   />
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

<script src="../../../dist/js/jquery.keyboard.min.js"></script>
<script src="../../../dist/js/jquery.keyboard.extension-all.min.js"></script>


<script src="../../../dist/js/jquery.mousewheel.min.js"></script>
<script src="../../../dist/js/jquery.keyboard.extension-typing.min.js"></script>
<script src="../../../dist/js/jquery.keyboard.extension-previewkeyset.min.js"></script>
<script src="../../../dist/layouts/keyboard-layouts-greywyvern.min.js"></script>

<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
<script src="../../../plugins/jquery/puntoventa/puntoventa21/jquery.nuevoweb-3.0.0.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html>