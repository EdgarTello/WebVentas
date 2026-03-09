<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.OperacionCajaEgreso.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Listado de Egresos</title>

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
  <link rel="stylesheet" href="../../../Content/style_custom.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
       <div class="content-wrapper" style="margin-left: 0px">
			<!-- Content Header (Page header) -->
			<section class="content-header" style="padding: 5px .5rem">
				<!-- /.container-fluid -->
			  </section>
            <br />
			<section class="content">
		    <!-- Default box -->
			<div class="card">
				<div class="card-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-6">
								<h1>
									Listado de Egresos
								</h1>
								<input type="hidden" name="hid" id="hid" value=""/>
							</div>
							<div class="col-lg-6">
								<button type="button" class="float-right" id="btncancelar">
									<i class="fas fa-undo"></i>Retornar
								</button>

								<button type="button" class="float-right" id="btnbuscar">
									<i class="fas fa-search"></i>Actualiza
								</button>
							
								<button type="button" class="float-right" id="btnnuevo">
									<i class="fas fa-file"></i>Nuevo
								</button>
						
								
								<input type="hidden" id="hidcajaoperacion" name="hidcajaoperacion" runat="server"  value="0"/>
							</div>
						</div>
						<br />
						<table id="tbldetalle" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>N°</th>
									<th>TIPO OPERACIÓN</th>
									<th>MONEDA</th>
									<th>MONTO</th>
									<th>DESCRIPCIÓN</th>
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
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel">Confirmar Cierre</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Esta seguro de realizar el egreso de caja <span id="scaja"></span></p>
                    <p>Desea proceder?</p>
                    <p class="debug-url"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-success btn-ok" onclick="eliminar();">Aceptar</a>
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
<script src="../../../plugins/jquery/puntoventa/operacioncajaegreso/jquery.listadoweb-3.0.5.js"></script>
<%--<script src="../../../plugins/jquery-bootstrap-confirm-modal/js/jquery.confirmModal.min.js"></script>--%>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>

<%--<style>
    table.dataTable td {
      font-size: .8em;
      padding: .25rem;
    }
    table.dataTable th {
      font-size: .8em;
      text-align:center;
      padding: .25rem;
	  background:#FFC312;
    }

    .dataTables_info {
        font-size: .8em;
    }

    .paginate_button {
        font-size: .8em;
    }

    .addNewRecord {
        background-color: white !important;
    }
</style>--%>
</body>
</html>