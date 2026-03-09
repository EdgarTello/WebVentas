<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Delivery.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Delivery Cliente</title>

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

                    <div class="card-body" style="padding: 0.5rem !important;">

                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-6">
                                    <h1>Edición de Delivery</h1>

                                    <input type="hidden" id="hid" name="hid"  runat="server"/>
						            <input type="hidden" id="hidcliente" name="hidcliente"  runat="server"/>
                                    <input type="hidden" name="hacceso" id="hacceso" value="" runat="server"/>
									<input type="hidden" name="hempleado" id="hempleado" value="" runat="server"/>
									<input type="hidden" name="hidlocal" id="hidlocal" value="0" runat="server"/>
									<input type="hidden" name="hidcaja" id="hidcaja" value="0" runat="server"/>
									<input type="hidden" name="hcaja" id="hcaja" value="" runat="server"/>
									<input type="hidden" name="himpresora" id="himpresora" value="" runat="server"/>
                                    <input type="hidden" name="hubigeo" id="hubigeo" value="" runat="server"/>
                                </div>
                                <div class="col-6">
									<div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                            <div class="btn-group mr-2" role="group" aria-label="First group">
												<button type="button" class="btn btn-warning" id="btndelivery" title="Delivery">
													<i class="fas fa-truck"></i> Delivery
												</button>
											</div>

                                            <div class="btn-group mr-2" role="group" aria-label="Second group">
												<button type="button" class="btn btn-success" id="btngrabar" title="Grabar">
													<i class="fas fa-save"></i> Grabar
												</button>
											</div>
											<div class="btn-group mr-2" role="group" aria-label="Tree group">
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
                                    <h4>
                                        <strong>Datos Personales
                                        </strong>
                                    </h4>
                                </div>

								<div class="col-lg-3">
                                    <div class="form-group">
                                        <label class="form-label">Tipo</label>
										<select class="form-control" style="background-color:mistyrose" id="cbotipodocumento" name="cbotipodocumento"></select>
									</div>
								</div>
							   <div class="col-lg-3">
                                    <div class="form-group">
                                        <label class="form-label">Numero</label>
                                        <input type="text" id="numero" style="background-color:mistyrose" class="form-control" required="required" maxlength="15" />
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label class="form-label">Nombre</label>
                                        <input type="text" id="nombre" style="background-color:mistyrose" class="form-control" required="required" />
                                    </div>
                                </div>
                             
                            </div>

                            <div class="row">
                                <div class="col-lg-12 form-group">
                                    <h4>
                                        <strong>Datos de Contacto
                                        </strong>
                                    </h4>
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Celular</label>
                                    <input type="text" name="telefonocelular" id="telefonocelular" maxlength="9" class="form-control" onkeypress="return isNumberKey(event);" style="background-color:mistyrose"/>
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Telf Fijo</label>
                                    <input type="text" name="telefonofijo" id="telefonofijo" maxlength="9" class="form-control" onkeypress="return isNumberKey(event);"/>
                                </div>

                                

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Contacto</label>
                                    <input type="text" name="contacto" id="contacto" maxlength="100" class="form-control"  />
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <h4>
                                        <strong>Dirección
                                        </strong>
                                    </h4>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label class="form-label">Direcc</label>
                                    <input name="direccion" id="direccion" class="form-control" maxlength="200" placeholder="Máximo 200 Caracteres" required="required" style="background-color:mistyrose"/>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label class="form-label">Ref</label>
                                    <textarea id="referencia" class="form-control" style="resize:none" rows="2" cols="20" runat="server" maxlength="200" placeholder="Máximo 200 Caracteres"></textarea>
                                </div>

                                
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label class="form-label">Depar</label>
                                        <select id="cbodepartamento"  name="cbodepartamento" class="form-control" style="background-color:mistyrose"></select>
                                    </div>
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Prov</label>
                                    <select id="cboprovincia" name="cboprovincia" class="form-control" style="background-color:mistyrose"></select>
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Distrito</label>
                                    <select id="cbodistrito" name="cbodistrito" class="form-control" style="background-color:mistyrose"></select>
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Ubigeo</label>
                                    <input type="text" name="ubigeo" id="ubigeo" maxlength="6" class="form-control" onkeypress="return isNumberKey(event);" />
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
        <div class="modal fade" id="confirm-nuevo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="myModalLabel">Confirmar Cierre</h3>
					    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Esta seguro de generar el delivery  <span id="scaja"></span></p>
                        <p>Desea proceder?</p>
                        <p class="debug-url"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancelar</button>
                        <a class="btn btn-success" onclick="deliverygrabar();">Aceptar</a>
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

    <script src="../../../dist/js/jquery.keyboard.min.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-all.min.js"></script>


    <script src="../../../dist/js/jquery.mousewheel.min.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-typing.min.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-previewkeyset.min.js"></script>
    <script src="../../../dist/layouts/keyboard-layouts-greywyvern.min.js"></script>

    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/puntoventa/Delivery/jquery.nuevoweb-4.0.6.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>

</body>
</html>