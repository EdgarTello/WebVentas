<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.MesaPartes.OperadorSalida.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Edición de Documentos</title>

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
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-7">                                    
                                    <div class="row">
                                        <div class="col-6">  
                                            <p class="text-primary"><span class="badge rounded-circle bg-info">1°</span> CARGAR EL DOCUMENTO</p>
                                        </div>
                                        <div class="col-6">  
                                            <asp:FileUpload id="file" runat="server" class="form-control" accept=".pdf" onchange="showpreview(this);"/>                                    
                                            <input type="hidden" id="hid" name="hid" runat="server" />
                                            <input type="hidden" id="hpagina" name="hpagina" runat="server" />
                                            <input type="hidden" id="hidarchivo" name="hidarchivo" runat="server" value="0" />
                                            
                                            <input type="hidden" id="hfechainicio" name="hfechainicio" runat="server" />
                                            <input type="hidden" id="hfechafin" name="hfechafin" runat="server" />
                                            <input type="hidden" id="hoperacion" name="hoperacion" runat="server" />
                                            <input type="hidden" id="hetapa" name="hetapa" runat="server" />
                                            <input type="hidden" id="hidarea" name="hidarea" runat="server" />
                                            <input type="hidden" id="hbusqueda" name="hbusqueda" runat="server" />
                                        </div>
                                    </div>  
                                    <div class="row justify-content-md-center">
                                        <object id="objpdf" name="objpdf" data="" type="application/pdf" width="100%" height="440px"></object>
                                    </div>
                                </div>
                                <div class="col-5 pl-5">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="row">
                                                <label class="form-label" id="soperador" runat="server"></label>
                                                <input type="hidden" id="hflujo2_aprobacion_directa" name="hflujo2_aprobacion_directa" runat="server" value="0" />
                                                <input type="hidden" id="hoperador" name="hoperador" runat="server" value="0" />
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="d-flex flex-row justify-content-end p-1">
										        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                                    <div class="btn-group mr-2" role="group" aria-label="First group" style="display:none">
                                                        <button type="button" class="btn btn-warning " id="btnetiqueta"  title="Etiquetas">
                                                            <i class="fa fa-tags"></i>
                                                        </button>
                                                    </div>
                                                    <div class="btn-group mr-2" role="group" aria-label="Tre group">
												        <button type="button" class="btn btn-success" id="btngrabar" title="Grabar">
													        <i class="fas fa-save"></i> Grabar
												        </button>
											        </div>
											        <div class="btn-group mr-2" role="group" aria-label="For group">
												        <button type="button" class="btn btn-secondary" id="btncancelar" title="Retornar">
													        <i class="fas fa-undo"></i>
												        </button>
											        </div>
										        </div>
                                            </div>
									    </div>                                        
                                    </div>
                                
                                    <div class="row">
                                        <p class="text-primary"><span class="badge rounded-circle bg-info">2°</span> REGISTRAR LOS DATOS DEL RECEPTOR</p>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <select class="form-control" id="clientetipodoc" name="clientetipodoc"></select>
                                        </div>
                                        <div class="col-lg-6">
                                            <input type="text" id="clientedocumento" class="form-control" required="required" maxlength="15" placeholder="Numero" />                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <p class="card-text"><small class="text-red">(2) Ingrese el numero y luego presione ENTER (RUC, DNI)</small></p>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-lg-12">
                                            <input type="text" id="clientenombre" class="form-control" required="required" placeholder="Nombre"/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <p class="text-primary"><span class="badge rounded-circle bg-info">3°</span> REGISTRAR LOS DATOS DEL DOCUMENTO</p>
                                    </div>

                                    <div class="row mb-4">
                                        <div class="col-lg-12">
                                            <input type="text" id="asunto" class="form-control" required="required" maxlength="200" placeholder="Asunto" />                                        
                                        </div>
                                    </div>
                                                                        
                                    <div class="row mb-4">
                                        <div class="col-lg-6">
                                            <select id="cbotipo" name="cbotipo" class="form-control">
                                            </select>
                                        </div>
                                        <div class="col-lg-6">                                            
                                            <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="" id="chkconfidencial" />
                                              <label class="form-check-label text-danger" for="chkconfidencial">
                                                Confidencial
                                              </label>
                                            </div>
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
        </div>

        <div class="modal" id="dialoggrabar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
					    <h3 class="modal-title" style="color:black">Operador</h3>
					    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				    </div>
				    <div class="modal-body" id="mbody_grabar">
                       ¿Esta seguro de grabar los datos?
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                        <input type="button" class="btn btn-success" id="btn_pup_grabar" name="btn_pup_grabar" onclick="this.disabled='true';actualizar_grabar();" value="Confirmar" title="Grabar"   />
                       
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="dialogetiqueta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
					    <h3 class="modal-title" style="color:black">Etiquetas</h3>
					    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				    </div>
				    <div class="modal-body">
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                               <select class="form-select" id="cboetiqueta" data-placeholder="Seleccione una etiqueta" multiple="multiple">
                               </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-success" onclick="etiqueta_grabar();" value="Confirmar" title="Grabar"/>                       
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

    <script src="../../../plugins/select2/js/select2.min.js"></script>

    <script src="../../../Scripts/jquery.keyboard.js"></script>
    <script src="../../../Scripts/jquery.keyboard.extension-all.js"></script>

    <script src="../../../plugins/bootstrap-select/js/bootstrap-select.min.js"></script>

    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/mesapartes/operadorsalida/jquery.nuevoweb-1.2.8.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>

    <style>
        .error {
            border: solid 2px #FF0000;  
            border-bottom: 1px solid red !important;
            box-shadow: 0 1px 0 0 red !important;
        }
    </style>

</body>
</html>