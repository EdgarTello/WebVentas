<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.Logistica.Producto.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Edición de Productos</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
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
                                <div class="col-6">
                                    <h1>Edición de Productos
                                    </h1>
                                    <input type="hidden" id="hid" name="hid" runat="server" />
                                    <input type="hidden" name="hacceso" id="hacceso" value="" runat="server" />
                                    <input type="hidden" name="hempleado" id="hempleado" value="" runat="server" />
                                    <input type="hidden" name="hidlocal" id="hidlocal" value="0" runat="server" />
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
									            <button type="button" class="btn btn-outline-warning" id="btnactualizar" title="Actualizar">
										            <i class="fa fa-refresh" aria-hidden="true"></i>
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
                            <br />


                            <div class="row">
                                <div class="col-lg-3">
                                    <label class="form-label">Codigo Interno</label>
                                    <input name="codigointerno" id="codigointerno" maxlength="50"  placeholder="Max(50)" class="form-control" />
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Nombre</label>
                                    <input name="nombre" id="nombre" maxlength="50" placeholder="Max(50)" required="required" class="form-control"/>
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Codigo Barra</label>
                                    <input name="codigobarra" id="codigobarra" maxlength="50" placeholder="Max(50)" class="form-control" />
                                </div>

                                <div class="col-lg-1">
                                    <label class="form-label">Activo</label>
                                    <select id="cboactivo" name="cboactivo" class="form-control">
                                        <option value="1" selected="selected" >SI</option>
                                        <option value="0">NO</option>
                                    </select>
                                </div>

                                <div class="col-lg-1">
                                    <label class="form-label">Compuesto</label>
                                    <select id="cbocompuesto" name="cbocompuesto" class="form-control">
                                        <option value="0" selected="selected">NO</option>
                                        <option value="1">SI</option>
                                    </select>
                                </div>

                                <div class="col-lg-1">
                                    <label class="form-label">FSC</label>
                                    <select id="cbofsc" name="cbofsc" class="form-control">
                                        <option value="0" selected="selected">NO</option>
                                        <option value="1">SI</option>
                                    </select>
                                </div>

                                <div class="col-lg-3">
                                    <label class="form-label">Descripción</label>
                                    <input name="descripcion" id="descripcion" maxlength="400" placeholder="Max(400)" class="form-control" />
                                    
                                </div>

                                <div class="col-lg-3">
                                    <label class="form-label">Familia</label>
                                    <select id="cbofamilia" name="cbofamilia" class="form-control"></select>
                                    
                                </div>

                               
                                <div class="col-lg-3">
                                    <label class="form-label">Categoria</label>
                                    <select id="cbocategoria" name="cbocategoria" class="form-control"></select>
                                    
                                </div>

                                <div class="col-lg-2">
                                    <label class="form-label">Presentación</label>
                                    <select id="cbopresentacion" name="cbopresentacion" class="form-control"></select>
                                    
                                </div>

                                <div class="col-lg-1">
                                    <label class="form-label">Combo</label>
                                    <select id="cbocombo" name="cbocombo" class="form-control">
                                        <option value="0" selected="selected">NO</option>
                                        <option value="1">SI</option>
                                    </select>
                                </div>

                                <div class="col-lg-2">
                                    <label class="form-label">Empaque</label>
                                    <select id="cbopresentacion1" name="cbopresentacion1" class="form-control"></select>                                    
                                </div>

                                <div class="col-lg-1">
                                    <label class="form-label">Unid</label>
                                    <input name="unidades1" id="unidades1" class="form-control"  value="0" onkeypress="return isNumberKeyOnly(event)"/>
                                </div>
                                
                                <div class="col-lg-1">
                                    <label class="form-label">Topping</label>
                                    <select id="cbotopping" name="cbotopping" class="form-control">
                                        <option value="0" selected="selected">NO</option>
                                        <option value="1">SI</option>
                                    </select>
                                </div>

                                <div class="col-lg-1">
                                    <label class="form-label">Cobro</label>
                                    <select id="cbotipocobro" name="cbotipocobro" class="form-control">
                                        <option value="0" selected="selected">Por Precio</option>
                                        <option value="1">Por Hora o Fracción</option>
                                    </select>
                                </div>
                                <div class="col-lg-2">
                                    <label class="form-label">Tolerancia (Minutos)</label>
                                    <input name="tolerancia" id="tolerancia" maxlength="2"  placeholder="Tolerancia Minutos" class="form-control" required="required" value="0" onkeypress="return isNumberKey(event)" />
                                </div>
                                <div class="col-lg-1 m-4">                                    
                                    <button type="button" class="btn btn-outline-primary" id="btnimagen" title="Imagen">
									    <i class="fa fa-image" aria-hidden="true"></i>
								    </button>
                                </div>
                                <div class="col-lg-2">
                                    <img id="imagen" runat="server" height="80" width="100" src="" style="border-width: 1px;" />
                                </div>

                            </div>

                            <br />

                            <table id="tbldetalle" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Almacén</th>
                                        <th>Presentación</th>
                                        <th>Valor</th>
                                        <th>Precio LLevar</th>
                                        <th>Precio Mesa</th>
                                        <th>Precio Delivery</th>
                                        <th>Stock</th>
                                        <th>Comision%</th>
                                        <th>Area 1</th>
                                        <th>Area 2</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
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

        <div class="modal" id="dialogarchivo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Seleccione Imagen</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row"><br /></div>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:FileUpload id="fileimagen" runat="server" class="form-control input-normal" accept=".png" onchange="showpreview01(this);"  />                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <img id="img1" runat="server" height="100" width="100" src="" style="border-width: 0px; visibility: hidden;" />
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <span id="sdimension1" style="color:black;font-weight:bold"></span>
                            </div>
                        </div>
                        <div class="row"><br /></div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelararchivo();" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizararchivo();" value="Grabar" title="Grabar"   />
                       
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
<script src="../../../plugins/jquery/logistica/Producto/jquery.nuevoweb-1.4.3.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html>