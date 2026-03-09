<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Reporte</title>

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
                                <div class="col-lg-12">
									<h1>
										Listado de Reporte
									</h1>

								</div>
							</div>
                             <div class="row">
                                 <br />
                             </div>
                            <div class="row">

                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-warning" onclick="view('Estatico01_Filtro')">Ventas Contabilidad</button>

<%--                                    <div class="btn-group group-dropdown">
                                        <a class="btn btn-outline-warning dropdown-toggle" data-toggle="dropdown" href="#" title="Ventas Contabilidad">
                                            Ventas Contabilidad
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="btnventacontabilidad">
                                            <li><a class="dropdown-item" href="#" onclick="view('Estatico01_Filtro')">Ir al Filtro Principal</a></li>
                                            <li><a class="dropdown-item" href="#" onclick="view('Estatico01_01','-1')">Mes Anterior</a></li>
                                            <li><a class="dropdown-item" href="#" onclick="view('Estatico01_02','0')">Mes Actual</a></li>
                                        </ul>
                                    </div>--%>
                                </div>

                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-warning" onclick="view('Estatico10_Filtro')">Ventas Gerencia</button>
                                </div>
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-warning" onclick="view('Estatico02_Filtro')">Ventas Documentos x Categoria</button>
                                </div>
                                <div class="col-lg-3">
                                </div>
                            </div>
                            <div class="row">
                                 <br />
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-secondary" onclick="view('Estatico20_Filtro')">Reporte Paloteo</button>
                                </div>
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-secondary" onclick="view('Estatico40_Filtro')">Reporte Propina</button>
                                </div>
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-secondary" onclick="view('Estatico50_Filtro')">Reporte Motorizados</button>
                                </div>
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-secondary" onclick="view('Estatico30_Filtro')">Reporte Egresos</button>
                                </div>
                            </div>
                            <div class="row">
                                 <br />
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-secondary" onclick="view('Estatico60_Filtro')">Reporte Ubicación</button>
                                </div>
                            </div>
                            <div class="row">
                                 <br />
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-primary" onclick="view('Estatico03_Filtro')">Kardex de Venta</button>
                                </div>
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-primary" onclick="view('Estatico04_Filtro')">Cuentas x Cobrar</button>
                                </div>
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-primary" onclick="view('Estatico05_Filtro')">Vales de Consumo</button>
                                </div>
                                <div class="col-lg-3">
                                    
                                </div>
                            </div>
                            <div class="row">
                                 <br />
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-danger" onclick="view('Dinamico01_Filtro')">Venta x Producto</button>
                                </div>
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-danger" onclick="view('Dinamico02_Filtro')">Venta Total</button>
                                </div>
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-outline-danger" onclick="viewgerencial('01')">Ventas y Ganacias Mes Actual</button>
                                </div>
                                <div class="col-lg-3">
                                    
                                </div>
                            </div>
                            <div class="row">
                                 <br />
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
	<script src="../../../plugins/jquery/puntoventa/Reporte/jquery.listadoweb-1.9.1.js"></script>
	<script src="../../../Scripts/jquery.table2excel.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../../dist/js/adminlte.min.js"></script>

</body>
</html>