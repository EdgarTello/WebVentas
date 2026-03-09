<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.General.LocalSerie.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Edición de LocalSeries</title>

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
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-6">
                                    <h1>Edición de Serie Local:<span id="slocalnombre"></span> - <span id="sserienombre"></span></h1>
                                    <input type="hidden" id="hid" name="hid" runat="server" />
                                    <input type="hidden" id="hidlocal" name="hidlocal" runat="server" />
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
                                <div class="col-lg-12">
                                    <h4>Datos</h4>                                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <label class="form-label">Tipo</label>
                                    <select  name="cbotipo" id="cbotipo" class="form-control">
                                        <option value="01">Factura</option>
                                        <option value="03">Boleta</option>
                                        <option value="07">Nota Credito</option>
                                        <option value="08">Nota Debito</option>
                                        <option value="99">Doc Interno</option>
                                        <option value="50">Cotización</option>
                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Indicador</label>
                                    <select  name="cboindicador" id="cboindicador" class="form-control">
                                        <option value="F">F (Electrónico)</option>
                                        <option value="B">B (Electrónico)</option>
                                        <option value="0">0 (Contingencia)</option>
                                        <option value="I">I (Interno)</option>
                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Serie</label>
                                    <input type="text" name="serie" id="serie" value="001" maxlength="3" class="form-control" onkeypress="return isNumberKey(event);"  required="required"/>
                                </div>
                                <div class="col-lg-1">
                                    <label class="form-label">Correlativo</label>
                                    <input type="text" name="correlativo" id="correlativo" maxlength="7" value="1" class="form-control" onkeypress="return isNumberKey(event);" required="required"/>
                                </div>
                                <div class="col-lg-1">
                                    <label class="form-label">Orden</label>
                                    <input type="text" name="orden" id="orden" value="1" maxlength="2" class="form-control" onkeypress="return isNumberKey(event);"  required="required"/>
                                </div>
                            </div>
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
<script src="../../../plugins/jquery/general/localserie/jquery.nuevoweb-1.0.6.js"></script>
                      
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html>