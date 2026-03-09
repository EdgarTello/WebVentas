<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta01.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">	
<head runat="server">	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Punto de Ventas | Pedidos</title>

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
					<div class="card-body">
						<div class="container-fluid">
							<div class="row">
                                <div class="col-lg-4">
									<h1>
										Pedidos <span id="spandi"></span>
									</h1>

									<input type="hidden" name="hacceso" id="hacceso" value="" runat="server"/>
									<input type="hidden" name="hempleado" id="hempleado" value="" runat="server"/>
									<input type="hidden" name="hidlocal" id="hidlocal" value="0" runat="server"/>
									<input type="hidden" name="hidcaja" id="hidcaja" value="0" runat="server"/>
									<input type="hidden" name="hcaja" id="hcaja" value="" runat="server"/>
									<input type="hidden" name="himpresora" id="himpresora" value="" runat="server"/>
									<input type="hidden" name="hdocumentointerno" id="hdocumentointerno" value="0" runat="server"/>
									<input type="hidden" name="htipo" id="htipo" value="0" runat="server"/>
									<input type="hidden" name="hpagina" id="hpagina" value="0" runat="server"/>

								</div>
								<div class="col-lg-8" >
									<div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">											

											<div class="btn-group mr-2" role="group" aria-label="First group">												
												<button type="button" class="btn btn-primary" id="btnfactura">
													<i class="fas fa-file"></i>FAC
												</button>
										    </div>

											<div class="btn-group mr-2" role="group" aria-label="Second group">												
												<button type="button" class="btn btn-secondary" id="btnboleta">
													<i class="fas fa-file"></i>BOL
												</button>
										    </div>

											<div class="btn-group mr-2" role="group" aria-label="Tree group">												
												<button type="button" class="btn btn-primary" id="btncredito">
													<i class="fas fa-file"></i>NC
												</button>
										    </div>

											<div class="btn-group mr-2" role="group" aria-label="Four group">												
												<button type="button" class="btn btn-secondary" id="btninterno">
													Interno
												</button>
										    </div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-2">
									<div class="input-group date" id="fechainicio" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input datetimepicker-short" data-target="#fechainicio" id="dfechainicio" name="dfechainicio" readonly="readonly" />
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
								<div class="col-lg-1">
									<input type="text" class="form-control input-normal" id="documento" name="documento" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Nombre, Documento, Telefono"  />
								</div>
								<div class="col-lg-1">
									 <select id="cbodocumento" name="cbodocumento" class="form-control input-normal" style="width:80px">
										<option value="" selected="selected">[Documento]</option>
										<option value="01">Factura</option>
										<option value="03">Boleta</option>
									</select>
								</div>
								<div class="col-lg-1">
									<select id="cboestado" name="cboestado" class="form-control input-normal" style="width:80px">
										<option value="" selected="selected">[Estado]</option>
										<option value="0">Pendiente</option>
										<option value="1">Pagado</option>
									</select>
								</div>
								<div class="col-lg-1">
									<select id="cboanulado" name="cboanulado" class="form-control input-normal" style="width:80px">
										<option value="" selected="selected">[Anulados]</option>
										<option value="0">NO</option>
										<option value="1">SI</option>
									</select>
								</div>
								
								<div class="col-lg-2">
									<button type="button" class="btn btn-outline-info" id="btnbuscar">
										<i class="fas fa-search"></i>Buscar
									</button>
								</div>
								<div class="col-lg-2">
									<div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">											

											<div class="btn-group mr-2" role="group" aria-label="First group">	
												<button type="button" class="btn btn-outline-success" id="btnexportar">
													<i class="fas fa-file-excel"></i>Exportar
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
									<th>Pedido</th>
									<th>Documento</th>
									<th>Local</th>
									<th>Empleado</th>
									<th>DNI/RUC</th>
									<th>Cliente</th>
									<th>Fecha</th>
									<th>Monto</th>
									<th>Pdf</th>
									<th>Anulado</th>
									<th>Estado</th>
									<th></th>
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
	<script src="../../../plugins/jquery/puntoventa/PuntoVenta01/jquery.listadoweb-3.0.0.js"></script>
	<script src="../../../Scripts/jquery.table2excel.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../../dist/js/adminlte.min.js"></script>

</body>
</html>