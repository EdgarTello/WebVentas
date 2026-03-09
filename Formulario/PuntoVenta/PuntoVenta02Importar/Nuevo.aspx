<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta02Importar.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html"/>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Masivo Pedidos</title>

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
<body id="objbody" name="objbody">
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
                                <div class="col-4">
                                    <h1>Masivo ctrl+v</h1>
                                    <input type="hidden" name="hidlocal" id="hidlocal" value="" runat="server" />
                                    <input type="hidden" name="hidcaja" id="hidcaja" runat="server"/>    
                                    <input type="hidden" name="hserie" id="hserie" runat="server"/>
                                </div>
                                <div class="col-4">
                                    <div class="progress">
                                        <div class="progress-bar bg-success" id="progress_si" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                        <div class="progress-bar bg-danger" id="progress_no" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-4">
									<div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                            
                                            <div class="btn-group mr-2" role="group" aria-label="First group">
												<button type="button" class="btn btn-primary" id="btnverificar" title="Verificar" disabled="disabled">
													<i class="fas fa-clipboard"></i>(1)
												</button>
											</div>
                                            <div class="btn-group mr-2" role="group" aria-label="Second group">
												<button type="button" class="btn btn-warning" id="btnreniec" title="Reniec" disabled="disabled">
													<i class="fas fa-user"></i>(2)
												</button>
											</div>
                                            <div class="btn-group mr-2" role="group" aria-label="Six group">
                                                <div class="input-group date" id="fechainicio" data-target-input="nearest">
										            <input type="text" class="form-control datetimepicker-input" data-target="#fecha" id="dfecha" name="dfecha" readonly="readonly" />
										            <div class="input-group-append">
											            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
										            </div>
									            </div>
                                            </div>
                                            <div class="btn-group mr-2" role="group" aria-label="Tree group">
												<button type="button" class="btn btn-success" id="btngrabar" title="Procesar" disabled="disabled">
													<i class="fas fa-spinner"></i>(3)
												</button>
											</div>

                                            <div class="btn-group mr-2" role="group" aria-label="Five group">
												<button type="button" class="btn btn-primary" id="btnexportar" title="Exportar" disabled="disabled">
													<i class="fas fa-file-excel"></i> Excel
												</button>
											</div>

											<div class="btn-group mr-2" role="group" aria-label="Four group">
												<button type="button" class="btn btn-secondary" id="btncancelar" title="Retornar">
													<i class="fas fa-undo"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
                            </div>
                            <div class="col-md-12 container-fluid overflow-scroll">
                                <table id="tbldetalle" class="table table-bordered table-hover" style="height:200px;">
                                    <thead>
                                        <tr>
                                            <th>Nª</th>
                                            <th>Cliente</th>
                                            <th>Licencia</th>
                                            <th>Monto</th>
                                            <th>Correo</th>
                                            <th>Valido</th>
                                            <th>Proceso</th>
                                            <th>Mensaje</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
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

        <div class="modal" id="dialoggrabar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                       Esta seguro generar los pedidos?
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="grabar();" value="Procesar" title="Procesar"   />
                       
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
        <script src="../../../plugins/jquery/puntoventa/PuntoVenta02Importar/jquery.nuevoweb-1.1.7.js"></script>
        <!-- AdminLTE App -->
        <script src="../../../dist/js/adminlte.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.10.3/xlsx.full.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/file-saver@2.0.2/dist/FileSaver.min.js"></script>

</body>
</html>