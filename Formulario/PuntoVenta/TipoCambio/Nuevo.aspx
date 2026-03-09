<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.TipoCambio.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Edición de Tipo de Cambio</title>

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
  <!--
  <link rel="stylesheet" href="../../../Content/style_custom_v3.4.css" />
  <link rel="stylesheet" href="../../../Content/style_custom_number.css" />-->
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
                                    <h1>Edición de Tipo de Cambio
                                    </h1>
                                    <input type="hidden" id="hid" name="hid" runat="server" />
                                    <input type="hidden" name="hsolicitud" id="hsolicitud" value="0" />
                                    <input type="hidden" name="hventa" id="hventa" runat="server" value="0.00" />
                                    <input type="hidden" name="hcompra" id="hcompra" runat="server" value="0.00" />
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

                            <div class="row">
                                <br />
                            </div>
                            <div class="row">
                                <div class="col-lg-4"></div>
                                <div class="col-lg-2">
                                    <label class="form-label" style="font-size:1.75rem">Fecha</label>
                                </div>
                                <div class="col-lg-2">
                                    <div class="input-group">
                                        <input name="fecha" id="fecha" class="form-control input-normal" style="text-align: center; font-size: 2rem" readonly="readonly" required="required" />
                                        <%--                                        <input name="fecha" id="fecha" class="form-control input-normal" style="text-align: center; font-size: 2rem" readonly="readonly" required="required" />--%>
                                    </div>
                                </div>
                                <div class="col-lg-4"></div>
                            </div>
                            <div class="row">
                                <br />
                            </div>
                            <div class="row">
                                <div class="col-lg-4"></div>
                                <div class="col-lg-2">
                                    <label class="form-label" style="font-size: 1.75rem">Compra</label>
                                </div>
                                <div class="col-lg-2">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="far fa-money-bill-alt"></i>
                                            </span>
                                        </div>
                                        <input type="text" name="compra" id="compra" maxlength="6" style="font-size:34px;height:40px;" class="form-control input-number" value=""  required="required" placeholder="0.00" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                                <div class="col-lg-4"></div>
                            </div>
                            <div class="row">
                                <br />
                            </div>
                            <div class="row">
                                <div class="col-lg-4"></div>
                                <div class="col-lg-2">
                                    <label class="form-label" style="font-size:1.75rem">Venta</label>
                                </div>
                                <div class="col-lg-2">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="far fa-money-bill-alt"></i>
                                            </span>
                                        </div>
                                        <input type="text" name="venta" id="venta" maxlength="6" style="font-size:34px;height:40px;" class="form-control input-number" value="" placeholder="0.00" onkeypress="return isNumberKey(event);" />
                                    </div>
                                </div>
                                <div class="col-lg-4"></div>
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
    <script src="../../../plugins/jquery-bootstrap-confirm-modal/js/jquery.confirmModal.min.js"></script>
	<!-- SweetAlert2 -->
	<script src="../../../plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- Toastr -->
	<script src="../../../plugins/toastr/toastr.min.js"></script>

    <script src="../../../dist/js/jquery.keyboard.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-all.js"></script>

    <script src="../../../dist/js/jquery.mousewheel.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-typing.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-previewkeyset.js"></script>

    <script src="../../../dist/layouts/keyboard-layouts-combined.min.js"></script>

	<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
	<script src="../../../plugins/jquery/puntoventa/TipoCambio/jquery.nuevoweb-1.4.1.js"></script>

	<!-- AdminLTE App -->
	<script src="../../../dist/js/adminlte.min.js"></script>
</body>
</html>