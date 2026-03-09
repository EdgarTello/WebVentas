<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.OperacionCaja.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Operación de Caja</title>

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

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div class="card">
	   
					<div class="card-body">
						
							<div class="container-fluid">
							    <div class="row">
								    <div class="col-6">
									    <h1>Operación Caja</h1>
                                        <input type="hidden" id="hid" name="hid"  runat="server"/>
									    <input type="hidden" name="hsolicitud" id="hsolicitud" value="0" runat="server"/>

										<input type="hidden" name="hidcaja" id="hidcaja" value="0" runat="server"/>
										<input type="hidden" name="hserie" id="hserie" value="0" runat="server"/>

										<input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
										<input type="hidden" name="hmonedacaja" id="hmonedacaja" runat="server"/>
										<input type="hidden" name="hmonedadefault" id="hmonedadefault" runat="server"/>
								    </div>
								    <div class="col-6">
										<div class="d-flex flex-row justify-content-end p-1">
											<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
												<div class="btn-group mr-2" role="group" aria-label="First group">
													<button type="button" class="btn btn-success" id="btngrabar" title="Grabar">
														<i class="fas fa-save"></i> Grabar
													</button>
												</div>
												<div class="btn-group mr-2" role="group" aria-label="First group">
													<button type="button" class="btn btn-secondary" id="btncancelar" title="Retornar">
														<i class="fas fa-undo"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
							    </div>
							    </div>
								    <div class="row">
									   
									    <div class="col-lg-3">
										    <label for="efectivoapertura" class="form-label">Efectivo</label>
										    <input type="text" name="efectivoapertura" id="efectivoapertura" class="form-control input-normal" style="text-align:center" onkeypress="return isNumberKey(event);" value="0"/>
									    </div>
									    <div class="col-lg-3">
										    <label for="impresora" class="form-label">Impresora</label>
										    <select id="cboimpresora" name="cboimpresora" class="form-control"></select>

									    </div>					
								    </div>	 
								    <br />
									
							<div class="col-lg-1"></div>
						</div>
				<!-- /.card-body -->
				<%-- <div class="card-footer">
			
				</div>--%>
				<!-- /.card-footer-->
				</div>
				<!-- /.card -->
				</div>
			</section>
			<!-- /.content -->
		</div>
        

		<div class="modal fade" id="confirm-Edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel">Confirmar</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Esta seguro de realizar <span id="scaja"></span></p>
						<p>Desea proceder?</p>
						<p class="debug-url"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" id="btn_cierre_cancelar" data-dismiss="modal">Cancelar</button>
						<button type="button" class="btn btn-success" id="btn_cierre_grabar" onclick="this.disabled='true';grabar();" title="Aceptar">Aceptar</button>
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
	<script src="../../../plugins/jquery/puntoventa/operacioncaja/jquery.editweb-1.4.7.js"></script>
	<!-- AdminLTE App -->
	<script src="../../../dist/js/adminlte.min.js"></script>	

</body>
</html>