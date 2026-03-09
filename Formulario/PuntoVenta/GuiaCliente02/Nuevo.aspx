<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaCliente02.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Edición de Clientes</title>

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
                                <div class="col-lg-4">
                                    <h1>Edición de Cliente
                                    </h1>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="float-righ" id="btngrabar">
							            <i class="fas fa-save"></i>Grabar
						            </button>
						            
									<button type="button" class="float-righ" id="btnguia">
										<i class="fas fa-truck"></i>Guía
									</button>
                                    
									

                                    <input type="hidden" id="hid" name="hid"  runat="server"/>
						            <input type="hidden" id="hidcliente" name="hidcliente"  runat="server"/>
                                    <input type="hidden" name="hacceso" id="hacceso" value="" runat="server"/>
									<input type="hidden" name="hempleado" id="hempleado" value="" runat="server"/>
									<input type="hidden" name="hidlocal" id="hidlocal" value="0" runat="server"/>
									<input type="hidden" name="hidcaja" id="hidcaja" value="0" runat="server"/>
									<input type="hidden" name="hcaja" id="hcaja" value="" runat="server"/>
									<input type="hidden" name="himpresora" id="himpresora" value="" runat="server"/>
									
								</div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn-sm btn-default rounded-pill float-righ" style="background:#ff0000;color:white" id="btncancelar">
										<i class="fas fa-undo"></i>Retornar
									</button>
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
                                        <label for="cbotipodocumento">Tipo</label>
										<select class="form-control form-control-sm" id="cbotipodocumento" name="cbotipodocumento"></select>
									</div>
								</div>
							   <div class="col-lg-3">
                                    <div class="form-group">
                                        <label class="form-label">Numero</label>
                                        <input type="text" id="numero" class="form-control" required="required" maxlength="15" />
                                    </div>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label class="form-label">Nombre</label>
                                        <input type="text" id="nombre" class="form-control" required="required" />
                                    </div>
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Sexo</label>
                                    <select name="cbosexo" id="cbosexo" class="form-control">
                                        <option value="M">Masculino</option>
                                        <option value="F">Femenino</option>
                                    </select>
                                </div>					


                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Fecha Nac.</label>
                                    <input name="fecha_nacimiento" id="fecha_nacimiento" class="form-control" readonly="readonly" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <h4>
                                        <strong>Dirección
                                        </strong>
                                    </h4>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label class="form-label">Depar</label>
                                        <select id="cbodepartamento" name="cbodepartamento" class="form-control"></select>
                                    </div>
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Prov</label>
                                    <select id="cboprovincia" name="cboprovincia" class="form-control"></select>
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Distrito</label>
                                    <select id="cbodistrito" name="cbodistrito" class="form-control"></select>
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Ubigeo</label>
                                    <input type="text" name="ubigeo" id="ubigeo" maxlength="6" class="form-control" onkeypress="return isNumberKey(event);" />
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Direcc</label>
                                    <input name="direccion" id="direccion" class="form-control" maxlength="200" placeholder="Máximo 200 Caracteres" required="required" />
                                </div>


                                

                                
                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Ref</label>
                                    <textarea id="referencia" class="form-control form-control-sm" style="resize: none" rows="2" cols="20" runat="server" maxlength="200" placeholder="Máximo 200 Caracteres" required="required"></textarea>
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Latitud</label>
                                    <input name="latitud" id="latitud" class="form-control" maxlength="50" placeholder="Máximo 50 Caracteres" />
                                </div>

                                <div class="col-lg-3">
                                    <label class="form-label">Longitud</label>
                                    <input name="longitud" id="longitud" class="form-control" maxlength="50" placeholder="Máximo 50 Caracteres" />
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 form-group">
                                    <h4>
                                        <strong>Datos de Contacto
                                        </strong>
                                    </h4>
                                </div>

                                <div class="col-lg-3">
                                    <label class="form-label">Contacto</label>
                                    <input name="contacto" id="contacto" class="form-control" maxlength="100" placeholder="Máximo 100 Caracteres" />
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Telf Fijo</label>
                                    <input type="text" name="telefonofijo" id="telefonofijo" maxlength="9" class="form-control" onkeypress="return isNumberKey(event);" />
                                </div>

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Celular</label>
                                    <input type="text" name="telefonocelular" id="telefonocelular" maxlength="9" class="form-control" onkeypress="return isNumberKey(event);" />
                                </div>

                                

                                

                                <div class="col-lg-3 form-group">
                                    <label class="form-label">Correo</label>
                                    <input type="email" name="email" id="email" maxlength="50" class="form-control" />
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
                        <p>Esta seguro de generar el GuiaCliente02  <span id="scaja"></span></p>
                        <p>Desea proceder?</p>
                        <p class="debug-url"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <a class="btn btn-success btn-ok" onclick="GuiaCliente02grabar();">Aceptar</a>
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
<script src="../../../plugins/jquery/puntoventa/GuiaCliente02/jquery.nuevoweb-4.0.4.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>

</body>
</html> 