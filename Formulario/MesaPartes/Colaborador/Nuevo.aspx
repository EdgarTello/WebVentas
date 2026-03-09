<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.MesaPartes.Colaborador.Nuevo" %>

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
                                <div class="col-lg-6">
                                    <h1>Edición de Colaborador</h1>
                                    <input type="hidden" id="hid" name="hid" runat="server" />
                                    <input type="hidden" id="hidempleado" name="hidempleado" value="0" runat="server" />
                                </div>
                                <div class="col-lg-6">
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

                            
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8 col-lg-offset-8">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-label">Local</label>
                                            <select id="cbolocal" name="cbolocal" class="form-control"></select>
                                        </div>
                            
                                        <div class="col-lg-6">
                                            <label class="form-label">Area</label>
                                            <select id="cboarea" name="cboarea" class="form-control"></select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8 col-lg-offset-8">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-label">Nombres</label>
                                            <input type="text" name="nombre" id="nombre" maxlength="40" class="form-control" required="required" />
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-label">Apellidos</label>
                                            <input type="text" name="apellidos" id="apellidos" maxlength="40" class="form-control" required="required" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8 col-lg-offset-8">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-label">Usuario</label>
                                            <input type="text" name="usuario" id="usuario" maxlength="80" class="form-control" required="required" />
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-label">Clave</label>
                                            <input type="text" name="password" id="password" maxlength="12" class="form-control" required="required" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8 col-lg-offset-8">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-label">Flujo</label>
                                            <select id="cboflujo" name="cboflujo" class="form-control">
                                                <option value="0">Flujo 2</option>
                                                <option value="1">Flujo 1 y 2</option>
                                            </select>
                                        </div>

                                        <div class="col-lg-6">
                                            <label class="form-label">Directo</label>
                                            <select id="cboflujo2_aprobacion_directa" name="cboflujo2_aprobacion_directa" class="form-control">
                                                <option value="0">Ninguno</option>
                                                <option value="1">Flujo 2 - Aprobación Directa</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8 col-lg-offset-8">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-label">Perfil</label>
                                            <select id="cboacceso" name="cboacceso" class="form-control">
                                                <option value="">[Accesos]</option>
                                                <option value="Administrador">Administrador</option>
                                                <option value="Gerencia">Gerencia</option>
                                                <option value="Operador">Operador</option>
                                                <option value="Derivador">Derivador</option>                                                
                                                <option value="Recepcion">Recepcion</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-label">Correo</label>
                                            <input type="email" name="email" id="email" maxlength="100" class="form-control" required="required" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8 col-lg-offset-8">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label class="form-label">¿Esta bloqueado?</label>
                                            <select  name="cbobloqueo" id="cbobloqueo" class="form-control">
                                                <option value="0">NO</option>
                                                <option value="1">SI</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-label">¿Es o tiene una jefatura?</label>
                                            <select id="cbotienejefatura" name="cbotienejefatura" class="form-control">
                                                <option value="0">NO</option>
                                                <option value="1">SI</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row d-flex justify-content-center" id="divjefatura" name="divjefatura" style="visibility:hidden">
                                <div class="col-lg-8 col-lg-offset-8">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <label class="form-label">Seleccione la  jefatura</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <select id="cboareajefatura" name="cboareajefatura" class="form-control"></select>
                                        </div>
                                        <div class="col-lg-6">
                                            <select id="cboareaempleado" name="cboareaempleado" class="form-control"></select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <br />
                            </div>

                        </div>
                    </div>
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

    <script src="../../../plugins/select2/js/select2.min.js"></script>

    <script src="../../../Scripts/jquery.keyboard.js"></script>
    <script src="../../../Scripts/jquery.keyboard.extension-all.js"></script>

    <script src="../../../plugins/bootstrap-select/js/bootstrap-select.min.js"></script>

    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/mesapartes/colaborador/jquery.nuevoweb-1.2.1.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html>