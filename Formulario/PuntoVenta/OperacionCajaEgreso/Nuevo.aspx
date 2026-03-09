<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.OperacionCajaEgreso.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Registro de Egreso</title>

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
  <link rel="stylesheet" href="../../../Content/style_custom_v3.2.css" />
  <link rel="stylesheet" href="../../../Content/style_custom_number.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>

		<div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <%--	<div class="col-lg-8" style="text-align:center">
						<h5>Edición de Tipo Cambio</h5>
					</div>--%>
                        <div class="col-lg-2 col-lg-2 col-xs-2">
                            <input type="hidden" id="hid" name="hid"  runat="server" value="0"/>
							<input type="hidden" id="hidcajaoperacion" name="hidcajaoperacion" runat="server" value="0"/>
                        </div>
                        <div class="col-lg-2 col-lg-2 col-xs-2">
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>


			<!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card">

                    <div class="card-body">

                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h1>Edición de Egreso
                                    </h1>
                                </div>
                                <div class="col-lg-6">
									<button type="button" class="btndefault float-right" id="btncancelar">
                                        <i class="fas fa-undo"></i>Retorna
                                    </button>

                                    <button type="button" class="btndefault float-right" id="btngrabar">
                                        <i class="fas fa-save"></i>Grabar
                                    </button>
                                    

                                </div>
                            </div>

                            <div class="row">
                                <br />
                            </div>
                            <div class="row">
								<div class="col-lg-2"></div>
								<div class="col-lg-4">
									<label class="form-label" style="font-size:1.75rem">Tipo Operacion</label>
								</div>
								<div class="col-lg-4">
									<div class="input-group input-group-sm mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">
											<i class="far fa-file-alt"></i>
											</span>
										</div>
										<select id="cbotipooperacion" name="cbotipooperacion" class="form-control" style="font-size:1.2rem" required="required"></select>
									</div>
								</div>
								<div class="col-lg-2"></div>
							</div>
							<div class="row">
                                <br />
                            </div>
							<div class="row">
								<div class="col-lg-2"></div>
								<div class="col-lg-4">
									<label class="form-label" style="font-size:1.75rem">Moneda</label>
								</div>
								<div class="col-lg-4">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">
											<i class="far fa-file-alt"></i>
											</span>
										</div>
										<select id="cbomoneda" name="cbomoneda" class="form-control" style="font-size:1.2rem" required="required"></select>
									</div>
								</div>
								<div class="col-lg-2"></div>
							</div>
							<div class="row">
                                <br />
                            </div>
							<div class="row">
								<div class="col-lg-2"></div>
								<div class="col-lg-4">
									<label class="form-label" style="font-size:1.75rem">Monto</label>
								</div>
								<div class="col-lg-4">
									<div class="input-group input-group-sm mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">
											<i class="far fa-money-bill-alt"></i>
											</span>
										</div>
										<input type="text" name="monto" id="monto" maxlength="12" class="form-control form-control" style="text-align:right;font-size:1.2rem" placeholder="0.00" required="required" onkeypress="return isNumberKey(event);" />
									</div>
								</div>
								<div class="col-lg-2"></div>
							</div>
							<div class="row">
                                <br />
                            </div>
							<div class="row">
								<div class="col-lg-2"></div>
								<div class="col-lg-4">
									<label class="form-label" style="font-size:1.75rem">Descripción</label>
								</div>
								<div class="col-lg-4">
									<div class="input-group input-group-sm mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">
											<i class="far fa-file"></i>
											</span>
										</div>
										<textarea id="descripcion" class="form-control form-control" style="resize:none;font-size:1.2rem" rows="2" cols="20" runat="server" maxlength="200" placeholder="MÁXIMO 200 CARACTERES"></textarea>
									</div>
								</div>
								<div class="col-lg-2"></div>
							</div>
                        </div>


                        <!-- /.card-body -->

                        <!-- /.card-footer-->
                    </div>
                    <!-- /.card -->
                </div>
            </section>
            <!-- /.content -->
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
<!-- SweetAlert2 -->
<script src="../../../plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Toastr -->
<script src="../../../plugins/toastr/toastr.min.js"></script>

<script src="../../../Scripts/jquery.keyboard.js"></script>
<script src="../../../Scripts/jquery.keyboard.extension-all.js"></script>

<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
<script src="../../../plugins/jquery/puntoventa/operacioncajaegreso/jquery.nuevoweb-1.1.1.js"></script>

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