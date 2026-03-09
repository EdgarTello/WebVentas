<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Rendicion.Documentos.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Rendición</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css" />
    <link rel="stylesheet" href="../../fonts/font-awesome-4.7.0/css/font-awesome.min.css"  />
    <link rel="stylesheet" href="../../plugins/jquery-ui/jquery-ui.min.css"  />

    <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="../../plugins/select2/css/select2.min.css" />
    <link rel="stylesheet" href="../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />
    <link rel="stylesheet" href="../../plugins/toastr/toastr.min.css"  />
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/keyboard.min.css" />
    <link rel="stylesheet" href="../../dist/css/keyboard-previewkeyset.min.css" />

    <link rel="stylesheet" href="../../dist/css/adminlte.min.css" />
    <link rel="stylesheet" href="../../Content/style_custom_v50.4.css" />
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
                                <div class="col-5">
                                    <div class="row">
                                        <div class="col-8">
                                            <span id="sdimension" style="color:black;font-weight:bold">Archivo:</span>
                                        </div>
                                        <div class="col-4">
                                            <button type="button" class="btn btn-outline-warning" id="btnimportar" title="Importar Plantilla">
												<i class="fas fa-cogs"></i>
											</button>
                                        </div>
                                    </div>
                                    <div class="row"><br /></div>
                                    <div class="row">
                                        <asp:FileUpload id="file" runat="server" class="form-control input-normal" accept=".png" onchange="showpreview(this);"  />                                                        
                                    </div>
                                    <div class="row">
                                        <br />
                                    </div>
                                    <div class="row justify-content-md-center">
                                        <img id="img" runat="server" height="400" width="400" src="" style="border-width: 0px; visibility: hidden;" />
                                    </div>
                                </div>
                                <div class="col-1"></div>
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-6">
                                            <h1>Registro de  Gastos</h1>
                                            <input type="hidden" id="hid" name="hid" runat="server" />
                                            <input type="hidden" id="hempresaruc" name="hempresaruc" runat="server" />
                                            <input type="hidden" id="hempresanombre" name="hempresanombre" runat="server" />
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
                                        <div class="col-lg-3">
                                            <label class="form-label">Emisor</label>
                                            <select class="form-control" id="cboproveedortipo" name="cboproveedortipo"></select>
                                        </div>
                                        <div class="col-lg-3">
                                            <label class="form-label">Documento</label>
                                            <input type="text" id="proveedordocumento" class="form-control" required="required" maxlength="11" onkeypress="return isNumber(event);"/>
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-label">Nombre</label>
                                            <input type="text" id="proveedornombre" class="form-control" required="required" maxlength="100"/>
                                        </div>
                                    </div>


                                    <div class="border-top my-3"></div>
                                    <div class="row">
                                        
                                        <div class="col-lg-3">
                                            <label class="form-label">Motivo</label>
                                            <select class="form-control" id="cbotipogasto" name="cbotipogasto">
                                            </select>
                                        </div>

                                        <div class="col-lg-3">
                                            <label class="form-label">Documento</label>
                                            <select class="form-control" id="cbotipodocumento" name="cbotipodocumento">
                                                <option value="">[Seleccionar]</option>
                                                <option value="01">FACTURA</option>
                                                <option value="03">BOLETA</option>
                                            </select>
                                        </div>
                                
                                        <div class="col-lg-3">
                                            <label class="form-label">Fecha</label>
                                    
                                            <div class="input-group date" data-target-input="nearest">
										        <input type="text" class="form-control datetimepicker-input" id="fecha" name="fecha" readonly="readonly"/>
										        <div class="input-group-append">
											        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
										        </div>
									        </div>
                                        </div>

                                        <div class="col-lg-3">
                                            <label class="form-label">Monto</label>
                                            <input type="text" name="monto" id="monto" maxlength="12" class="form-control" style="text-align:right"  onkeypress="return isNumberKey(event);" value="0.00"/>
                                        </div>
                            
                                         <div class="col-lg-3">
                                            <label class="form-label">Serie</label>
                                            <input type="text" id="serie" class="form-control" required="required" maxlength="4" onkeypress="return isAlphanumericKey(event);" />
                                        </div>

                                        <div class="col-lg-3">
                                            <label class="form-label">Correlativo</label>
                                            <input type="text" id="correlativo" class="form-control" required="required" maxlength="8" onkeypress="return isNumber(event);"/>
                                        </div>
                                    </div>


                                    <div class="border-top my-3"></div>
                           
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <label class="form-label">Emitido a</label>
                                            <select class="form-control" id="cboclientetipo" name="cboclientetipo"></select>
                                        </div>
                                        <div class="col-lg-3">
                                            <label class="form-label">Documento</label>
                                            <input type="text" id="clientedocumento" class="form-control" required="required" maxlength="11"  />
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="form-label">Nombre</label>
                                            <input type="text" id="clientenombre" class="form-control" required="required" maxlength="100" />
                                        </div>
                                    </div>
                         
                                    

                            

                                    <div class="row">
                                        <br />
                                    </div>
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
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../../plugins/jquery-blockuid/jquery.blockUI.min.js"></script>

    <!-- Bootstrap 4 -->
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="../../plugins/jquery-validation/additional-methods.min.js"></script>
    <!-- DataTables  & Plugins -->
    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
    <script src="../../plugins/jszip/jszip.min.js"></script>
    <script src="../../plugins/pdfmake/pdfmake.min.js"></script>
    <script src="../../plugins/pdfmake/vfs_fonts.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
    <!-- bs-custom-file-input -->
    <script src="../../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
    <!-- InputMask -->
    <script src="../../plugins/moment/moment.min.js"></script>
    <script src="../../plugins/inputmask/jquery.inputmask.min.js"></script>
    <!-- date-range-picker -->
    <script src="../../plugins/daterangepicker/daterangepicker.js"></script>
    <script src="../../plugins/moment/locale/es.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="../../plugins/jquery-bootstrap-confirm-modal/js/jquery.confirmModal.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="../../plugins/sweetalert2/sweetalert2.min.js"></script>
    <!-- Toastr -->
    <script src="../../plugins/toastr/toastr.min.js"></script>

    <script src="../../dist/js/jquery.keyboard.min.js"></script>
    <script src="../../dist/js/jquery.keyboard.extension-all.min.js"></script>

    <script src="../../dist/js/jquery.mousewheel.min.js"></script>
    <script src="../../dist/js/jquery.keyboard.extension-typing.min.js"></script>
    <script src="../../dist/js/jquery.keyboard.extension-previewkeyset.min.js"></script>
    <script src="../../dist/layouts/keyboard-layouts-greywyvern.min.js"></script>

    <script src="../../plugins/jquery/jquery.general-2.5.8.js"></script>
    <script src="../../plugins/jquery/rendicion/documentos/jquery.nuevoweb-2.9.2.js"></script>
    <script src="../../../Scripts/jquery.table2excel.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/adminlte.min.js"></script>

</body>
</html>