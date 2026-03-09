<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoAN03.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Disminución de Anticipo</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

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
    <link rel="stylesheet" href="../../../Content/style_custom_v50.5.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem"> 
                <div class="row">
                    <div class="col-4">
                        <asp:Literal ID="lblcliente" runat="server"></asp:Literal>||
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>
                    </div>
                    <div class="col-4">
                        <div class="d-flex flex-row justify-content-end p-1">
						    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">

                                <div class="btn-group mr-2" role="group" aria-label="First group">
									<button type="button" class="btn btn-outline-primary btn-bold" onclick="relacionados();" title="Relacionados">
                                        <i class="fa fa-credit-card" aria-hidden="true"></i>
									</button>
								</div>  
                                <div class="btn-group mr-2" role="group" aria-label="Second group">
									<button type="button" class="btn btn-outline-danger" onclick="anulacion();" title="Eliminar">
										<i class="fa fa-trash" aria-hidden="true"></i>
									</button>
								</div>
						    </div>
						</div>
                    </div>
                    <div class="col-4">
                        <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="First group">
									<button type="button" class="btn btn-success" id="btnsave" onclick="grabar();" title="Grabar">
										<i class="fas fa-save"></i> Grabar
									</button>
								</div>                               
                                <div class="btn-group mr-2" role="group" aria-label="Second group">
									<button type="button" class="btn btn-outline-warning" id="btnactualizar" title="Actualizar">
										<i class="fa fa-refresh" aria-hidden="true"></i>
									</button>
								</div>
								<div class="btn-group mr-2" role="group" aria-label="Tree group" id="divretornar">
									<button type="button" class="btn btn-secondary" id="btncancelar" title="Retornar">
										<i class="fas fa-undo" aria-hidden="true"></i><b>M</b>
									</button>
								</div>
							</div>
						</div>
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
                                    <input type="hidden" name="htipofererencia" id="htipofererencia" value="" runat="server"/>
                                    <input type="hidden" name="hindicador" id="hindicador" value="" runat="server"/>
                                    <input type="hidden" name="hentrega" id="hentrega"  runat="server"/>
                                    <input type="hidden" name="hpagina" id="hpagina"  runat="server"/>
                                    <input type="hidden" name="hpagado" id="hpagado"  runat="server"/>
                                    <input type="hidden" name="hidpersona" id="hidpersona" value="0" runat="server"/>
                                    <input type="hidden" name="hestado" id="hestado" value="0" runat="server"/>
                                    <input type="hidden" name="hmoneda" id="hmoneda"  runat="server" value="PEN"/>
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
                                    <input type="hidden" name="htotal" id="htotal" runat="server" value="0"/>
                                    <input type="hidden" name="htipopago" id="htipopago" runat="server" value="Contado"/>
                                    <input type="hidden" name="htipo" id="htipo" runat="server" value=""/>
                                    <input type="hidden" name="hcolumnaizquierdapedido" id="hcolumnaizquierdapedido" runat="server" value="6"/>
                                    <input type="hidden" name="hcolumnaderechapedido" id="hcolumnaderechapedido" runat="server" value="6"/> 
                            </div>

                            <div class="row">
                                <div class="col-lg-<%=this.ViewState["columnaizquierdapedido"].ToString()%>">
                                    <div id="divtipos" class="row"></div>
                                    <div id="divfamilias" class="row"></div>
                                    <div id="divcategorias" class="row"></div>
                                    <br />
                                    <div id="divbusqueda" class="row">
                                        <div class="col-2 text-right"></div>
                                        <div class="col-8 text-right">
                                            <input type="text" id="qproducto" name="qproducto" class="form-control"  placeholder="Producto" />
                                        </div>
                                        <div class="col-2 float-right">
                                            <button type="button" class="btn btn-outline-info" id="btnbuscar" title="Buscar">
										        <i class="fas fa-search fa-lg"></i>
									        </button>
                                        </div>
                                    </div>
                                    <br />
                                    <div id="divproductos" class="row"></div>
                                    <div id="divimagen" class="row"></div>
                                </div>

                                <div class="col-lg-<%=this.ViewState["columnaderechapedido"].ToString()%>">
                                    <table id="tbldetalle" class="table table-bordered table-hover"></table>
                                </div>                     
                            </div>

                        </div>
                       
                    </div>
                    <!-- /.card -->
                </div>
            </section>
            <!-- /.content -->
        </div>
        
        <div class="modal" id="dialogcantidad" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Producto Cantidad</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <span style="font-size:24px;font-weight:bold" id="nombre"></span>
                            </div>
                        </div>               
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-4"><span style="font-size:24px">Cantidad</span></div>
                            <div class="col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="cantidad" id="cantidad" maxlength="7" onkeypress="return isNumberKey(event)" runat="server" class="form-control" value="1" style="text-align:right;font-size:28px;width:140px" />
                            </div>
                        </div>

                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelarcantidad();" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarcantidad();" value="Grabar" title="Grabar"   />
                       
                       <input type="hidden" name="hidproducto" id="hidproducto"/>
                       <input type="hidden" name="hiddetalle" id="hiddetalle"/>
                       <input type="hidden" name="hprecio" id="hprecio"/>
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogprecio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Precio</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <span style="font-size:24px;font-weight:bold" id="nombre_precio"></span>
                            </div>
                        </div>               
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-4"><span style="font-size:24px">Precio</span></div>
                            <div class="col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="precio" id="precio" maxlength="7" onkeypress="return isNumberKey(event)" runat="server" class="form-control" autocomplete="off" style="text-align:right;font-size:28px;width:140px" />
                            </div>
                        </div>

                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelarprecio();" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarprecio();" value="Grabar" title="Grabar"   />
                       
                   </div>
                </div>
            </div>
        </div>

      
        
        <div class="modal" id="dialograbar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        Esta seguro de generar la Nota de Crédito?
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="btngrabar" class="btn btn-success" onclick="this.disabled='true';grabar('07');" value="Confirmar" title="Confirmar"   />
                       
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialoganulacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body" id="mbody_anulacion">
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" title="Cancelar"  />
                       <input type="button" id="btnactualizar_anulacion" class="btn btn-success" onclick="this.disabled='true';anulacion_grabar();" value="Confirmar" title="Eliminar"   />
                       
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialoganticipada" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
				   <div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				   </div>
				   <div class="modal-body" id="mbody_anticipada">
                   </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" title="Cancelar"  />                       
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
<script src="../../../plugins/jquery/puntoventa/PuntoAN03/jquery.nuevoweb-3.0.0.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>

<style>
    .ui-keyboard div {
        font-size: 1.7em;
    }

    .thumbnail-container {
      max-width:400px;
      max-height:400px;
    }

    .btn-bold {
         font-family: "Arial Bold", Gadget, sans-serif !important;
         font-style: normal !important;
         font-size: 15px !important;
         font-weight:bold !important;
    }

    tfoot td {
	    font-size: 16px !important;
        font-weight:bold;
    }

</style>

</body>
</html>