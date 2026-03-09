<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Producto.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Listado de Producto</title>

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
<body id="bdocumento">
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem">
                <!-- /.container-fluid -->
            </section>
            <section class="content">
                <!-- Default box -->
                <div class="card">
                    <div class="card-body" style="padding: 0.5rem !important;">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-6">
                                    <h1>
                                        Productos
                                    </h1>
                                    <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("ProductoList") %>" />
                                    <input type="hidden" name="hacceso" id="hacceso" value="" runat="server" />
                                    <input type="hidden" name="hempleado" id="hempleado" value="" runat="server" />
                                    <input type="hidden" name="hidlocal" id="hidlocal" value="0" runat="server" />
                                    <input type="hidden" name="hidcaja" id="hidcaja" value="0" runat="server" />
                                    <input type="hidden" name="hcaja" id="hcaja" value="" runat="server" />
                                    <input type="hidden" name="himpresora" id="himpresora" value="" runat="server" />
                                    <input type="hidden" name="hempresatipo" id="hempresatipo" value="" runat="server" />
                                </div>
                                <div class="col-6">
								    <div class="d-flex flex-row justify-content-end p-1">
									    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                            <div class="btn-group mr-2" role="group" aria-label="First group">
											    <button type="button" class="btn btn-outline-warning" id="btnimportar" title="Importar Plantilla">
												    <i class="fas fa-file-upload"></i>
											    </button>
										    </div>
										    <div class="btn-group mr-2" role="group" aria-label="First group">
											    <button type="button" class="btn btn-outline-success" id="btnexportar" title="Exportar Excel">
												    <i class="fas fa-file-excel"></i>
											    </button>
										    </div>
										    <div class="btn-group mr-2" role="group" aria-label="Second group">
											    <button type="button" class="btn btn-primary active" id="btnnuevo" title="Nuevo">
												    <i class="fas fa-file"></i> Nuevo
											    </button>
										    </div>
									    </div>
								    </div>
							    </div>
                            </div>
						    <div class="row">
                                <div class="col-lg-1">
                                    <select id="cboventa" name="cboventa" class="form-control">
                                        <option value="1" selected="selected">[Venta]</option>
                                        <option value="0">[NO Venta]</option>
                                    </select> 
                                </div>
                                <div class="col-lg-2">
                                    <select id="cbotipo" name="cbotipo" class="form-control">
                                        <option value="0">[Tipo]</option>
                                    </select> 
                                </div>
                                <div class="col-lg-2">
                                    <select id="cbofamilia" name="cbofamilia" class="form-control">
                                        <option value="0">[Familia]</option>
                                    </select> 
                                </div>
                                <div class="col-lg-2">
                                    <select id="cbocategoria" name="cbocategoria" class="form-control">
                                        <option value="0">[Categoria]</option>
                                    </select> 
                                </div>
                                <div class="col-lg-4">
                                    <div class="input-group input-group mb-3">
                                        <input type="text" id="busqueda" name="busqueda" class="form-control input-normal enter"  autocomplete="on" placeholder="Nombre, Código Barra, SKU" />                                       
                                    </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="d-flex flex-row justify-content-end p-1">
									    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                            <div class="btn-group mr-2" role="group" aria-label="First group">
                                                <button type="button" class="btn btn-outline-info" id="btnbuscar" title="Buscar">
									                <i class="fas fa-search fa-lg"></i>
								                </button>
                                            </div>
                                        </div>
                                    </div>
							    </div>  
                            </div>
                            <table id="tbldetalle" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>N°</th>
                                        <th></th>
                                        <th>CODIGO</th>
                                        <th>PRODUCTO</th>
                                        <th>DETALLE</th>
                                        <th>CONF</th>
                                        <th>IMP</th>
                                        <th>STOCK</th>
                                        <th>PRECIO</th>
                                        <th>AREA</th>                                    
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
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
    <script src="../../../plugins/jquery/puntoventa/producto/jquery.listadoweb-1.3.8.js"></script>
    <script src="../../../Scripts/jquery.table2excel.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>

</body>
</html>