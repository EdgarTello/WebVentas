<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.Recibos.Documentos.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Recibos</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css" />
    <link rel="stylesheet" href="../../../fonts/font-awesome-4.7.0/css/font-awesome.min.css"  />
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
                                <div class="col-7">   
                                    <div class="row">
                                        <div class="col-6">  
                                            <p class="text-primary"><span class="badge rounded-circle bg-info">1°</span> CARGAR EL DOCUMENTO</p>
                                        </div>
                                        <div class="col-6">  
                                            <asp:FileUpload id="FileUpload1" runat="server" class="form-control" accept=".jpg" onchange="showpreview(this);"/>                                    
                                            <input type="hidden" id="hid" name="hid" runat="server" />
                                            <input type="hidden" id="hidarchivo" name="hidarchivo" runat="server" />
                                            <input type="hidden" id="hempresaruc" name="hempresaruc" runat="server" />
                                            <input type="hidden" id="hempresanombre" name="hempresanombre" runat="server" />
                                            <input type="hidden" id="hpagina" name="hpagina" runat="server" />
                                            
                                            <input type="hidden" id="hfechainicio" name="hfechainicio" runat="server" />
                                            <input type="hidden" id="hfechafin" name="hfechafin" runat="server" />
                                            <input type="hidden" id="hestado" name="hestado" runat="server" />
                                            
                                        </div>
                                    </div>
                                    <div class="row justify-content-md-center">
                                        <br />
                                    </div>
                                    <div class="row justify-content-md-center">
                                        <img id="img1" runat="server" height="600" width="500" src="" style="border-width: 0px; visibility: hidden;" />
                                    </div>
                                </div>
                                <div class="col-5 pl-5">
                                    <div class="row">
                                        <div class="col-6">
                                            <h1>Datos del Recibo</h1>
                                            
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
                                        <div class="col-lg-12">
                                            <label class="form-label">Emisor</label>
                                            <input type="text" id="proveedornombre" class="form-control" required="required" maxlength="100"/>
                                        </div>
                                    </div>

                                    <div class="border-top my-3"></div>
                                    <div class="row">

                                        <div class="col-lg-4">
                                            <label class="form-label">Recibo</label>
                                            <input type="text" name="recibo" id="recibo" required="required" maxlength="50" class="form-control" onkeypress="return isAlphanumericKey(event);"/>
                                        </div>
                            
                                         <div class="col-lg-4">
                                            <label class="form-label">Medidor</label>
                                            <input type="text" id="medidor" class="form-control" required="required" maxlength="50" onkeypress="return isAlphanumericKey(event);" />
                                        </div>

                                        <div class="col-lg-4">
                                            <label class="form-label">Suministro</label>
                                            <input type="text" id="suministro" class="form-control" required="required" maxlength="50" onkeypress="return isAlphanumericKey(event);"/>
                                        </div>
                                    </div>

                                    <div class="border-top my-3"></div>
                                    <div class="row">
                                        
                                        <div class="col-lg-4">
                                            <label class="form-label">Monto</label>
                                            <input type="text" id="monto" class="form-control" required="required" maxlength="12" value="0.00" style="text-align:right" onkeypress="return isNumberKey(event)" />
                                        </div>

                                        <div class="col-lg-4">
                                            <label class="form-label">Fecha Emi</label>
                                    
                                            <div class="input-group date" data-target-input="nearest">
										        <input type="text" class="form-control datetimepicker-input" id="fechaemision" name="fechaemision" readonly="readonly"/>
										        <div class="input-group-append">
											        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
										        </div>
									        </div>
                                        </div>

                                        
                                        <div class="col-lg-4">
                                            <label class="form-label">Fecha Ven</label>
                                    
                                            <div class="input-group date" data-target-input="nearest">
										        <input type="text" class="form-control datetimepicker-input" id="fechavencimiento" name="fechavencimiento" readonly="readonly"/>
										        <div class="input-group-append">
											        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
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
    <script src="../../../plugins/jquery/recibos/documentos/jquery.nuevoweb-2.9.2.js"></script>
    <script src="../../../Scripts/jquery.table2excel.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>

</body>
</html>