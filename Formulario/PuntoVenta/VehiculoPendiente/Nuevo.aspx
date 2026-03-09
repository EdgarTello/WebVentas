<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.VehiculoPendiente.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Vehiculo Placa</title>

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
  <link rel="stylesheet" href="../../../Content/style_custom_v3.4.css" />
  
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem">
                <div class="container-fluid">
                    
                </div>
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card">

                    <div class="card-body">

                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-lg-6">
                                    <h1>Vehiculo
                                    </h1>
                                </div>
                                <div class="col-lg-6">
                                    <button type="button" class="btndefault float-right"  id="btncancelar">
										<i class="fas fa-undo"></i>Retornar
									</button>

                                    <button type="button" class="btndefault float-right"  id="btngrabar">
							            <i class="fas fa-save"></i>Grabar
						            </button>
						       
                                    <input type="hidden" name="hmobile" id="hmobile" value="" runat="server"/>
                                    <input type="hidden" name="hid" id="hid" runat="server"/>
                                    <input type="hidden" name="hempleado" id="hempleado" runat="server"/>
                                    <input type="hidden" name="hidubicacion" id="hidubicacion" runat="server"/>
                                    <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                                    <input type="hidden" name="hidcaja" id="hidcaja" runat="server"/>
                                    <input type="hidden" name="hacceso" id="hacceso" runat="server"/>
                                    <input type="hidden" name="hcaja" id="hcaja" runat="server"/> 
                                    <input type="hidden" name="hserie" id="hserie" runat="server"/> 
                                    <input type="hidden" name="himpresora" id="himpresora" runat="server"/> 
									
                                </div>  
                            </div>



                            <div class="row">			
								<div class="col-lg-3">
								</div>
							    <div class="col-lg-5">
                                        <label for="alias">Placa</label>
                                        <input type="text" name="alias" id="alias" runat="server"  class="form-control" style="font-size:34px;height:40px;" maxlength="10" placeholder="Placa max 10 caracteres" />
                                </div>
                                <div class="col-lg-4">
                                </div>
						    </div>

                            <div class="row">
                                <br />
                            </div>

                            <div class="row">			
								<div class="col-lg-3">
								</div>
							    <div class="col-lg-5">
                                        <label for="alias">Nombre</label>
                                        <input type="text" name="nombre" id="nombre" runat="server"  class="form-control" style="font-size:34px;height:40px;" maxlength="20" placeholder="Nombre max 20 caracteres" />
                                </div>
                                <div class="col-lg-4">
                                </div>
						    </div>

                            <div class="row">
                                <br />
                            </div>

                            <div class="row">			
								<div class="col-lg-3">
								</div>
							    <div class="col-lg-5">
                                        <label for="alias">Celular</label>
                                        <input type="text" name="celular" id="celular" runat="server"  class="form-control" style="font-size:34px;height:40px;" maxlength="20" placeholder="Celular max 20 caracteres" />
                                </div>
                                <div class="col-lg-4">
                                </div>
						    </div>

                            <div class="row">
                                <br />
                            </div>

                            <div class="row">			
								<div class="col-lg-3">
								</div>
							    <div class="col-lg-2">
                                        <label for="alias">Hora</label>
                                        <input type="text" name="hora" id="hora" runat="server"  class="form-control" style="font-size:34px;height:40px;" maxlength="2" value="00" />
                                </div>
                                <div class="col-lg-1">
                                    <label></label>
                                </div>
                                <div class="col-lg-2">
                                        <label for="alias">Minutos</label>
                                        <input type="text" name="minuto" id="minuto" runat="server"  class="form-control" style="font-size:34px;height:40px;" maxlength="2" value="00" />
                                </div>
                                <div class="col-lg-4">
                                </div>
						    </div>

                            <div class="row">			
								<div class="col-lg-3">
								</div>
							    <div class="col-lg-5">
                                        <label for="alias">Observación</label>
                                        <input type="text" name="observacion" id="observacion" runat="server"  class="form-control" style="font-size:34px;height:40px;" maxlength="100" placeholder="Observación max 100 caracteres" />
                                </div>
                                <div class="col-lg-4">
                                </div>
						    </div>

                            <div class="row">
                                <br />
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

<script src="../../../dist/js/jquery.keyboard.min.js"></script>
<script src="../../../dist/js/jquery.keyboard.extension-all.min.js"></script>


<script src="../../../dist/js/jquery.mousewheel.min.js"></script>
<script src="../../../dist/js/jquery.keyboard.extension-typing.min.js"></script>
<script src="../../../dist/js/jquery.keyboard.extension-previewkeyset.min.js"></script>
<script src="../../../dist/layouts/keyboard-layouts-greywyvern.min.js"></script>

<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
<script src="../../../plugins/jquery/puntoventa/VehiculoPendiente/jquery.nuevoweb-2.1.5.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>

<style>
    .ui-keyboard div {
        font-size: 1.7em;
    }
</style>

</body>
</html>