<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta31.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Pedidos</title>

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
            <section class="content">
                <!-- Default box -->
                <div class="card">
					<div class="card-body">
						<div class="container-fluid">
							<div class="row">
                                <div class="col-lg-8">
									<h1>
										Pedidos <span id="spandi"></span>
									</h1>

									<input type="hidden" name="hid" id="hid" value="0"/>
									<input type="hidden" name="htipo" id="htipo" value="0" runat="server"/>
									<input type="hidden" name="hnombre" id="hnombre"/>
									<input type="hidden" name="hdocumento" id="hdocumento"/>
									<input type="hidden" name="hdias" id="hdias"/>
									<input type="hidden" name="hidlocal" id="hidlocal"/>
									<input type="hidden" name="hidcaja" id="hidcaja"/>
									<input type="hidden" name="hcaja" id="hcaja"/>
									<input type="hidden" name="hserie" id="hserie"/>
									<input type="hidden" name="hempleado" id="hempleado"/>
									<input type="hidden" name="hidalmacen" id="hidalmacen"/>
									<input type="hidden" name="hidubicacion" id="hidubicacion"/>
									<input type="hidden" name="hubicaciones" id="hubicaciones"/>
									<input type="hidden" name="hdocumentointerno" id="hdocumentointerno" value="0"/>

									<input type="hidden" name="hticket" id="hticket" value="0" runat="server"/>
									<input type="hidden" name="ha4" id="ha4" value="0" runat="server"/>
									<input type="hidden" name="hmm58" id="hmm58" value="0" runat="server"/>
									<input type="hidden" name="hmm80" id="hmm80" value="0" runat="server"/>
								</div>
								<div class="col-lg-4">
									
									
								</div>
							</div>
							<div class="row">
								<div class="col-lg-3">
									<div class="row">
										<div class="col-lg-6">
											<div class="input-group date" id="fechainicio" data-target-input="nearest">
												<input type="text" class="form-control datetimepicker-input" data-target="#fechainicio" id="dfechainicio" name="dfechainicio" readonly="readonly" />
												<div class="input-group-append">
													<div class="input-group-text"><i class="fa fa-calendar"></i></div>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="input-group date" id="fechafin" data-target-input="nearest">
												<input type="text" class="form-control datetimepicker-input" data-target="#fechafin" id="dfechafin" name="dfechafin" readonly="readonly"/>
												<div class="input-group-append">
													<div class="input-group-text"><i class="fa fa-calendar"></i></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-2">
									 <select id="cbodocumento" name="cbodocumento" class="form-control input-normal" >
										<option value="" selected="selected">[Documento]</option>
										<option value="01">Factura</option>
										<option value="03">Boleta</option>
										<option value="07">Nota Credito</option>
									</select>
								</div>
								<div class="col-lg-1">
									<select id="cboestado" name="cboestado" class="form-control input-normal" >
										<option value="" selected="selected">[Estados]</option>
										<option value="0">Pendiente</option>
										<option value="2">Por Cobrar</option>
										<option value="1">Pagado</option>
									</select>
								</div>
								<div class="col-lg-1">
									<select id="cboanulado" name="cboanulado" class="form-control input-normal" >
										<option value="" selected="selected">[Anulados]</option>
										<option value="0">NO</option>
										<option value="1">SI</option>
									</select>
								</div>
								<div class="col-lg-2">
									<input id="documento" name="documento" class="form-control input-normal"  placeholder="Documento o Placa"/>
								</div>
								<div class="col-lg-3">
									<button type="button" class="float-right" id="btnexportar">
										<i class="fas fa-file-excel"></i>Exportar
									</button>


									<a href="#" onclick="buscar();">
											<img src="../../../icons/normal/search32.png" />
									</a>
								</div>
							</div>
					
							<br />
							<table id="tbldetalle" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>N°</th>
									<th>Pedido</th>
									<th>Entrega</th>
									<th>Documento</th>
									<th>Caja</th>
									<th>Empleado</th>
									<th>Cliente</th>
									<th>Fecha</th>
									<th>Monto</th>
									<%if (this.ViewState["ticket"].ToString() == "1" )
									  { %>
										<th>PDF</th>
								     <%}
									 else{%>
									<th>58mm</th>
									<th>80mm</th>
									<th>A4</th>
									<%}%>
									<th>Estado</th>
									<th></th>
									<th></th>
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

	<script src="../../../dist/js/jquery.keyboard.min.js"></script>
	<script src="../../../dist/js/jquery.keyboard.extension-all.min.js"></script>


	<script src="../../../dist/js/jquery.mousewheel.min.js"></script>
	<script src="../../../dist/js/jquery.keyboard.extension-typing.min.js"></script>
	<script src="../../../dist/js/jquery.keyboard.extension-previewkeyset.min.js"></script>
	<script src="../../../dist/layouts/keyboard-layouts-greywyvern.min.js"></script>

	<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
	<script src="../../../plugins/jquery/puntoventa/PuntoVenta31/jquery.listadoweb-3.0.0.js"></script>
	<script src="../../../Scripts/jquery.table2excel.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html>