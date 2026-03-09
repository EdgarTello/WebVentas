<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Documento.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Listado de Documentos</title>

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
	<link rel="stylesheet" href="../../../Content/style_custom_v50.5.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
			<!-- Content Header (Page header) -->
			<section class="content-header" style="padding: 5px .5rem">
				<!-- /.container-fluid -->
			</section>
            <section class="content">
				<!-- Default box -->
				<div class="card">
					<div class="card-body" style="padding: 0.5rem !important;">
						<div class="container-fluid">
							<div class="row">
                                <div class="col-lg-12">
									<h1>
										Documentos <span id="spandi"></span>
									</h1>
									<input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("DocumentoList") %>" />
									<input type="hidden" name="hid" id="hid" value="0" runat="server"/>
									<input type="hidden" name="hnombre" id="hnombre" runat="server"/>
									<input type="hidden" name="hdias" id="hdias" runat="server"/>
									<input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
									<input type="hidden" name="hidcaja" id="hidcaja" runat="server"/>
									<input type="hidden" name="hcaja" id="hcaja" runat="server"/>
									<input type="hidden" name="hserie" id="hserie" runat="server"/>
									<input type="hidden" name="hempleado" id="hempleado" runat="server"/>
									<input type="hidden" name="hidalmacen" id="hidalmacen" runat="server"/>
									<input type="hidden" name="hidubicacion" id="hidubicacion" runat="server"/>
									<input type="hidden" name="hubicaciones" id="hubicaciones" runat="server"/>
                                    <input type="hidden" name="hdocumento" id="hdocumento" value="" runat="server"/>
									<input type="hidden" name="hdocumentointerno" id="hdocumentointerno" value="0" runat="server"/>

									<input type="hidden" name="hdocumentoimpresoras" id="hdocumentoimpresoras" runat="server"/>
									<input type="hidden" name="hdocumentoimpresoraip" id="hdocumentoimpresoraip" runat="server"/>
									<input type="hidden" name="htieneimpresora" id="htieneimpresora" runat="server" value="0" runat="server"/>

									<input type="hidden" name="hticket" id="hticket" value="0" runat="server"/>
									<input type="hidden" name="ha4" id="ha4" value="0" runat="server"/>
									<input type="hidden" name="hmm58" id="hmm58" value="0" runat="server"/>
									<input type="hidden" name="hmm80" id="hmm80" value="0" runat="server"/>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-2">
									<div class="input-group date" id="fechainicio" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" data-target="#fechainicio" id="dfechainicio" name="dfechainicio" readonly="readonly" />
										<div class="input-group-append">
											<div class="input-group-text"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
								</div>
								<div class="col-lg-2">
									<div class="input-group date" id="fechafin" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" data-target="#fechafin" id="dfechafin" name="dfechafin" readonly="readonly"/>
										<div class="input-group-append">
											<div class="input-group-text"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
								</div>
								<%--<div class="col-lg-1">
									<select id="cbocaja" name="cbodocumento" class="form-control input-normal" >

									</select>
								</div>--%>
								<div class="col-lg-2">
									 <select id="cbodocumento" name="cbodocumento" class="form-control input-normal" >
										<option value="-1" selected="selected">[Documento]</option>
										<option value="01">Factura</option>
										<option value="03">Boleta</option>
										<option value="101">Anticipo</option>
										<option value="102">Deducción Anticipos</option>
										<option value="07">Nota Credito</option>
									</select>
								</div>
								<div class="col-lg-1">
									<select id="cboestado" name="cboestado" class="form-control input-normal" >
										<option value="-1" selected="selected">[Estados]</option>
										<option value="1">Pendiente</option>
										<option value="2">Pagado</option>
										<option value="3">Por Cobrar</option>
									</select>
								</div>
								<div class="col-lg-1">
									<select id="cboanulado" name="cboanulado" class="form-control input-normal" >
										<option value="-1">[Anulado]</option>
										<option value="0" selected="selected">NO</option>
										<option value="1">SI</option>
									</select>
								</div>
								<div class="col-lg-2">
									<input id="documento" name="documento" class="form-control input-normal" maxlength="20" placeholder="Documento o Pedido o Cliente"/>
								</div>
								<div class="col-lg-2">
									<button type="button" class="btn btn-outline-info" id="btnbuscar" title="Buscar">
										<i class="fas fa-search fa-lg"></i>
									</button>

									<button type="button" class="btn btn-outline-success" id="btnexportar" title="Exportar Excel">
										<i class="fas fa-file-excel"></i>
									</button>
								</div>
							</div>
					
							<br />
							<table id="tbldetalle" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>N°</th>
									<th></th>
									<th><i class="fa fa-download" aria-hidden="true"></i> SUNAT</th>
									<th>PEDIDO</th>
									<th>DOCUMENTO</th>
									<th>LOCAL</th>
									<th>CLIENTE</th>
									<th>FECHA</th>
									<th>MONTO</th>
									<th>ESTADO</th>
								</tr>
								</thead>
								<tbody>
								</tbody> 
							</table>
						</div>
				 </div>
			</div>
		</section>
	</div>

	<div class="modal" id="dialoganticipo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Punto de Venta</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" id="mbody_anticipo">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" title="Cancelar"  />
                    <input type="button" id="btnactualizar_anticipo" class="btn btn-success" onclick="this.disabled='true';anticipo_grabar();" value="Confirmar" title="Anticipo"   />                       
                </div>
            </div>
        </div>
    </div>

	<div class="modal" id="dialogdocumentoimpresora" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <div class="col-lg-12" style="text-align:center" id="ddocumentoimpresora" name="ddocumentoimpresora">
                                
                        </div>
                    </div>
                    <div class="row">
                        <br />
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-warning" onclick="cancelardocumentoimpresora();" value="Cancelar" title="Cancelar"  />                       
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="dialognc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Punto de Venta</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" id="mbody_nc">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                    <input type="button" class="btn btn-success" onclick="actualizar_nc();" value="Confirmar" title="Impresión"   />
                       
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="dialogimpresion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Punto de Venta</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" id="mbody_impresion">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                    <input type="button" class="btn btn-success" onclick="actualizar_impresion();" value="Confirmar" title="Impresión"   />
                       
                </div>
            </div>
        </div>
    </div>

	<div class="modal" id="dialogeliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Punto de Venta</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" id="mbody_anular">
                    Esta seguro de anular el documento?
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                    <input type="button" class="btn btn-success" onclick="actualizar_eliminar();" value="Confirmar" title="Eliminar"   />
                       
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="dialogdetalle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Punto de Venta</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" id="mbody_detalle">
                       
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       
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
	<script src="../../../plugins/jquery/puntoventa/documento/jquery.listadoweb-2.2.0.js"></script>
	<script src="../../../Scripts/jquery.table2excel.min.js"></script>
	<!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>
</body>
</html>