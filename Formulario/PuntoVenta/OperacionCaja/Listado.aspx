<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.OperacionCaja.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Operación de Caja</title>

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
	<link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
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
							<div class="col-12">
								<h1>
									Caja<span id="spandi"></span>
								</h1>
								<input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
								<input type="hidden" name="hid" id="hid" value="" runat="server"/>
								<input type="hidden" name="hidcaja" id="hidcaja" value="" runat="server"/>
                                <input type="hidden" name="hfecha" id="hfecha" value="" runat="server"/>
								<input type="hidden" name="hcaja" id="hcaja" value="" runat="server"/>
								<input type="hidden" name="htipo" id="htipo" value="0" runat="server"/>
								<input type="hidden" name="hhabil" id="hhabil" value="0" runat="server"/>
								<input type="hidden" name="hdocumentointerno" id="hdocumentointerno" value="0" runat="server"/>

                                <input type="hidden" name="husuarioacceso" id="husuarioacceso" value="" runat="server"/>

                                <input type="hidden" name="hpreviewcaja" id="hpreviewcaja" value="" runat="server"/>
                                <input type="hidden" name="hreportecaja" id="hreportecaja" value="" runat="server"/>
								<input type="hidden" name="hempleadocaja" id="hempleadocaja" value="" runat="server"/>
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
							<div class="col-lg-2">
								<select id="cboestado" name="cboestado" class="form-control input-normal">
									<option value="" selected="selected">[Estado]</option>
									<option value="0">Abierto</option>
									<option value="1">Cerrado</option>
								</select>
							</div>
							<div class="col-lg-2">
								<select id="cbocaja" name="cbocaja" class="form-control input-normal"></select>
							</div>
							<div class="col-4">							

								<div class="d-flex flex-row justify-content-end p-1">
									<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
										<div class="btn-group mr-2" role="group" aria-label="First group">
											<button type="button" class="btn btn-outline-info" id="btnbuscar" title="Buscar">
												<i class="fas fa-search fa-lg"></i>
											</button>
										</div>
										<div class="btn-group mr-2" role="group" aria-label="Second group">
											<button type="button" class="btn btn-outline-success" id="btnexportar" title="Exportar Excel">
												<i class="fas fa-file-excel"></i>
											</button>
										</div>
										<div class="btn-group mr-2" role="group" aria-label="Tree group">
											<button type="button" class="btn btn-primary active" id="btnnuevo" title="Nuevo">
												<i class="fas fa-file"></i> Nuevo
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					
						<br />
						<table id="tbldetalle" class="table table-bordered table-hover">
							<thead>
							<tr>
								<th>N°</th>
								<th></th>
								<th>CÓDIGO</th>
								<th>CAJA</th>
								<th>SERIE</th>
								<th>EMPLEADO</th>
                                <th>MONTO APERTURA</th>
								<th>IMPRESORA</th>
								<th>FECHA APERTURA</th>
								<th>FECHA CIERRE</th>
								<th></th>
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
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel">Confirmar Cierre</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Esta seguro de realizar el cierre de caja <span id="scaja"></span></p>
                    <%--<p>Desea proceder?</p>--%>
                    <p class="debug-url"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" id="btn_cierre_cancelar" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success" id="btn_cierre_grabar" onclick="this.disabled='true';cierre(); " title="Grabar">Grabar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="dialogticket" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Configurar Impresión</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<br />
					</div>
					<div class="row">
						<div class="col-lg-3">
							<input type="checkbox" runat="server" id="chkdocumentos" class="form-control input-normal"/>
						</div>
						<div class="col-lg-9">
							Agregar Documentos
						</div>
					</div>
					<div class="row">
						<br />
					</div>
					<div class="row">
						<div class="col-lg-3">
							<input type="checkbox" runat="server" id="chkproductos" class="form-control input-normal"/>
						</div>
						<div class="col-lg-9">
							Agregar Productos
						</div>
					</div>
					<div class="row">
						<br />
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-warning" onclick="cancelarticket();" value="Cancelar" title="Cancelar"  />
					<input type="button" class="btn btn-success" onclick="actualizarticket();" value="Imprimir" title="Imprimir"   />
                       
				</div>
			</div>
		</div>
	</div>


	<div class="modal" id="dialogempleado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Empleado</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="col-lg-12">
						<table id="tblempleado" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>N°</th>
									<th>USUARIO</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							</tbody> 
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-success" onclick="actualizarempleado();" value="Grabar" title="Seleccionar"   />
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
	<%--<script src="../../../plugins/pdfmake/pdfmake.min.js"></script>
	<script src="../../../plugins/pdfmake/vfs_fonts.js"></script>--%>
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
	<script src="../../../plugins/jquery/puntoventa/operacioncaja/jquery.listadoweb-3.5.4.js"></script>
	<%--<script src="../../../plugins/jquery-bootstrap-confirm-modal/js/jquery.confirmModal.min.js"></script>--%>
	<!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.10.3/xlsx.full.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/file-saver@2.0.2/dist/FileSaver.min.js"></script>
</body>
</html>