<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.MesaPartes.Contrasena.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Cambio de contraseña</title>

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
    <link rel="stylesheet" href="../../../Content/style_custom_v32.css" />
</head>
<body>
	<form id="formdocument" asp-antiforgery="false" runat="server">
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
						<div class="card-body" style="padding: 0.5rem !important;">
							<div class="container-fluid">
								<div class="row">
									<div class="col-lg-4"></div>
									<div class="col-lg-4">
										<h1>
											Cambio clave
										</h1>
									</div>
									<div class="col-lg-4">
										<input type="hidden" name="hempresaruc" id="hempresaruc" value="" runat="server" />
										<input type="hidden" name="husuariocodigo" id="husuariocodigo" value="" runat="server" />
										<input type="hidden" name="hpagina" id="hpagina" value="" runat="server" />
									</div>
								</div>
								<div class="row">
									<br />
								</div>
								<div class="row">
									<div class="col-lg-4"></div>
									<div class="col-lg-4">
										<div class="input-group form-group">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="fas fa-key"></i></span>
											</div>
											<input type="password" id="CurrentPassword" name="CurrentPassword" onkeypress="return AvoidSpace(event)" class="form-control" placeholder="Nueva Clave" runat="server" required="required" pattern=".{6,12}" title="Ingrese entre 7 a 12 caracteres"/>
										</div>
									</div>
									<div class="col-lg-4"></div>
								</div>
								<div class="row">
									<div class="col-lg-4"></div>
									<div class="col-lg-4">
										<div class="input-group form-group">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="fas fa-key"></i></span>
											</div>
											<input type="password" id="NewPassword" name="NewPassword"  onkeypress="return AvoidSpace(event)" class="form-control" placeholder="Confirmar Clave" runat="server" required="required" pattern=".{6,12}" title="Ingrese entre 7 a 12 caracteres" />
										</div>
									</div>
									<div class="col-lg-4"></div>
								</div>
								<div class="row">
									<div class="col-lg-4"></div>
									<div class="col-lg-4" style="text-align:right">
										<asp:Button ID="btnCambio" runat="server" CssClass="btn btn-success" OnClick="btnCambio_Click" Text="Aceptar"  />
									</div>
									<div class="col-lg-4"></div>
								</div>
								<div class="row">
									<div class="col-lg-4"></div>
									<div class="col-lg-4">
										<asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
											<p class="text-danger">
												<asp:Literal runat="server" ID="FailureText" />
											</p>
										</asp:PlaceHolder> 
									</div>
									<div class="col-lg-4"></div>
								</div>
							</div>
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
    <script src="../../../plugins/jquery/mesapartes/contrasena/jquery.listadoweb-1.1.4.js"></script>
	
	
	<%--<script src="../../../plugins/jquery-bootstrap-confirm-modal/js/jquery.confirmModal.min.js"></script>--%>
	<!-- AdminLTE App -->
	<script src="../../../dist/js/adminlte.min.js"></script>

    <style>
        .ui-keyboard div {
            font-size: 1.7em;
        }
    </style>
</body>
</html>
