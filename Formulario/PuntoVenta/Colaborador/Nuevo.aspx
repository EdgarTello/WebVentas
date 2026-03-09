<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Colaborador.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Edición de Colaborador</title>

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
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card">

                    <div class="card-body" style="padding: 0.5rem !important;">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-6">
                                    <h1>Edición de Colaborador</h1>
                                    <input type="hidden" id="hid" name="hid" runat="server" />
                                    <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("ColaboradorNew") %>" />
                                </div>
                                <div class="col-6">
									<div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                            <div class="btn-group mr-2" role="group" aria-label="First group">
												<button type="button" class="btn btn-success" id="btngrabar" title="Grabar">
													<i class="fas fa-save"></i> Grabar
												</button>
											</div>
											<div class="btn-group mr-2" role="group" aria-label="Second group">
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
                            <div>
                                <div class="d-block p-1 bg-primary text-white">
                                    <h4>Datos Personales</h4>                         
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <label for="form-label">Tipo</label>
                                        <select class="form-control" id="cbotipodocumento" name="cbotipodocumento"></select>
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Numero</label>
                                        <input type="text" id="numero" class="form-control" required="required" maxlength="15" />
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Nombre</label>
                                        <input type="text" id="nombre" class="form-control" required="required" />
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Apellidos</label>
                                        <input type="text" id="apellidos" class="form-control" required="required" />
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Sexo</label>
                                        <select name="cbosexo" id="cbosexo" class="form-control">
                                            <option value="M">Masculino</option>
                                            <option value="F">Femenino</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Nac.</label>
                                        <input name="fecha_nacimiento" id="fecha_nacimiento" class="form-control" readonly="readonly" />
                                    </div>
                                    <div class="border-top my-3"></div>
                                </div>
                            </div>

                            <div class="row">
                                <br />
                            </div>
                           
                            <div>
                                <div class="d-block p-1 bg-primary text-white">
                                    <h4>Acceso</h4>                         
                                </div>
                                <div class="row">

                                    <div class="col-lg-3">
                                        <label class="form-label">Local</label>
                                        <select id="cbolocal" name="cbolocal" class="form-control"></select>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">Perfil</label>
                                        <select  name="cboacceso" id="cboacceso" class="form-control">
                                            <%if (this.ViewState["empresa_tipo"].ToString() == "23")
                                                { %> 
                                            <option value="Administrador">Administrador</option>
                                            <option value="Supervisor">Supervisor</option>
                                            <option value="Operador">Operador</option>
                                            <option value="Auditor">Auditor</option>
                                            <%}
                                            else
                                            {%>

                                            <option value="">[Ninguno]</option>
                                            <option value="Administrador">Administrador</option>
                                            <option value="Contador">Contador</option>
                                            <option value="Gerencia">Gerencia</option>
                                            <option value="J.Mozo">Jefatura Mesero</option>
                                            <option value="Cajero">Cajero</option>
                                            <option value="Mesero">Mesero</option>
                                            <option value="Anfitriona">Anfitriona</option>
                                            <option value="Vendedor">Vendedor</option>
                                            <option value="Motorizado">Motorizado</option>
                                            <option value="Visor">Visor</option>
                                            <%}%>
                                        </select>
                                    </div>

                                    

                                    <div class="col-lg-3">
                                        <label class="form-label">Usuario</label>
                                        <input type="text" name="usuario" id="usuario" maxlength="80" class="form-control" required="required" />
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">Clave</label>
                                        <input type="text" name="password" id="password" maxlength="12" class="form-control" required="required" />
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">Puede loguearse?</label>
                                        <select  name="cbologueo" id="cbologueo" class="form-control">
                                            <option value="1">SI</option>
                                            <option value="0">NO</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">Solo accede al dashboard?</label>
                                        <select  name="cbodashboard" id="cbodashboard" class="form-control">
                                            <option value="0" selected="selected">NO</option>
                                            <option value="1">SI</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">Tiene horario de acceso?</label>
                                        <select  name="cbohorario" id="cbohorario" class="form-control">
                                        </select>
                                    </div>

                                </div>
                                <div class="row" id="divcajero" style="display:none">
                                    <div class="col-lg-3">
                                        <label class="form-label">Caja</label>
                                        <select  name="cbocaja" id="cbocaja" class="form-control">
                                        </select>
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Serie</label>
                                        <select  name="cboserie" id="cboserie" class="form-control">
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <br />
                            </div>

                            <div>
                                <div class="d-block p-1 bg-primary text-white">
                                    <h4>Dirección</h4>                         
                                </div>
                                <div class="row">

                                    <div class="col-lg-3">
                                        <label class="form-label">Depar</label>
                                        <select id="cbodepartamento" name="cbodepartamento" class="form-control"></select>
                                    
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">Prov</label>
                                        <select id="cboprovincia" name="cboprovincia" class="form-control"></select>
                                    
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">Distrito</label>
                                        <select id="cbodistrito" name="cbodistrito" class="form-control"></select>
                                    </div>


                                    <div class="col-lg-3">
                                        <label class="form-label">Dirección</label>
                                        <input name="direccion" id="direccion" class="form-control" maxlength="200" placeholder="Máximo 200 Caracteres" required="required" />
                                    </div>
                        
                                    <div class="col-lg-3">
                                        <label class="form-label">Telefono</label>
                                        <input type="text" name="telefono" id="telefono" maxlength="9" class="form-control" onkeypress="return isNumberKey(event);" />
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">Correo</label>
                                        <input type="email" name="email" id="email" maxlength="50" class="form-control" />
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">MacAddress</label>
                                        <input type="text" name="macaddress" id="macaddress" maxlength="100" class="form-control" />
                                    </div>
                                    
                                    <div class="border-top my-3"></div>
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
    <script src="../../../plugins/jquery/puntoventa/colaborador/jquery.nuevoweb-1.1.8.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html>