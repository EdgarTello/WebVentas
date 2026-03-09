<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaRemision23.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Guia Remision</title>

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
  <link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem"> 
                <div class="row">
                    <div class="col-lg-6">
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>
                    </div>
                    <div class="col-lg-6">                         
                        <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="First group">
                                    <%if (this.ViewState["guiaupload"].ToString() == "1")
						            { %> 
                                    <button type="button" class="btn btn-warning" id="btncargapdf" title="Cargar Pdf" onclick="loadfile();">
										<i class="fas fa-file-pdf-o"></i>
									</button>
                                    <%}%>
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Second group">
                                     <%if (this.ViewState["guiaproductows"].ToString() == "1")
						            { %> 
                                    <button type="button" class="btn btn-warning" id="btncargaaustral" title="Cargar Austral" onclick="loadaustral();">
										<i class="fas fa-spinner"></i>
									</button>
                                    <%}%>	
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Tree group">
                                    <button type="button" class="btn btn-outline-primary btn-bold" onclick="masivoproducto();" title="Masivo"><b>M</b></button>
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Four group">
                                    <button type="button" class="btn btn-outline-secondary btn-bold" onclick="agregarproducto();" title="Agregar Producto"><b>P</b></button>
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Five group">
                                    <button type="button" class="btn btn-success" id="btngrabar" title="Grabar" onclick="grabar('09');">
										<i class="fas fa-save"></i> Grabar
									</button>
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Six group">
                                    <button type="button" class="btn btn-outline-warning" id="btnactualizar" title="Actualizar"  onclick="actualizar();">
										<i class="fa fa-refresh" aria-hidden="true"></i>
									</button>
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Seven group">
                                    <button type="button" class="btn btn-secondary" id="btncancelar" title="Retornar" onclick="retornar();">
										<i class="fas fa-undo" aria-hidden="true"></i>
									</button>
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Eight group">
                                    <asp:Literal ID="lblbloqueo" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>

                        
                    </div>
                </div>
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card">

                    <div class="card-body" style="padding:0.25rem !important">
                        <div class="container-fluid">

                           <div class="row">
                                <input type="hidden" name="hmobile" id="hmobile" value="0" runat="server"/>
                                <input type="hidden" name="hid" id="hid" value="0" runat="server"/>
                                <input type="hidden" name="hstock" id="hstock" runat="server"/>
                                <input type="hidden" name="hstockver" id="hstockver" runat="server"/>
                                <input type="hidden" name="hestado" id="hestado" value="0" runat="server"/>
                                <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                                <input type="hidden" name="hserie" id="hserie"/>
                                <input type="hidden" name="hempleado" id="hempleado" runat="server"/>
                                <input type="hidden" name="hidalmacen" id="hidalmacen"/>
                                <input type="hidden" name="htipocambio" id="htipocambio" runat="server"/>
                               <input type="hidden" name="hfamiliapedido" id="hfamiliapedido" runat="server"/>
                               <input type="hidden" name="hguiaupload" id="hguiaupload" runat="server"/>
                               <input type="hidden" name="hguiaproductows" id="hguiaproductows" runat="server"/>
                               <input type="hidden" name="hguiafiltros" id="hguiafiltros" runat="server"/>
                               <input type="hidden" name="hproductobloqueo" id="hproductobloqueo" runat="server"/>

                               <input type="hidden" name="hmuestraalmacenexterno" id="hmuestraalmacenexterno" runat="server"/>
                               <input type="hidden" name="hmuestracodigoproducto" id="hmuestracodigoproducto" runat="server"/>

                               <input type="hidden" name="hanulado" id="hanulado" runat="server"/>
                               <input type="hidden" name="hestado" id="Hidden1" runat="server"/>

                               <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("GR23New") %>" />

                            </div>

                           <div class="row">
                                <div class="col-lg-6">
                                    <div class="row" id="dvfiltros" style="display:none;">
                                        <div class="col-lg-12">
                                            <div class="row">
                                                <select id="cbotipo" name="cbotipo" runat="server" class="form-control"></select>
                                            </div>
                                            <div class="row">
                                                <select id="cbofamilia" name="cbofamilia" runat="server" class="form-control">
                                                    <option value="">[Familia]</option>
                                                </select>
                                            </div>
                                            <div class="row">
                                                <select id="cbocategoria" name="cbocategoria" runat="server" class="form-control">
                                                    <option value="">[Categoria]</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="col-2 text-right"></div>
                                        <div class="col-8 text-right">
                                            <input type="text" id="qproducto" name="qproducto" class="form-control"  placeholder="Producto (comodin %)" />
                                         </div>
                                        <div class="col-2 float-right">
                                            <button type="button" class="btn btn-outline-info" id="btnbuscar" title="Buscar" onclick="buscarproducto();">
												<i class="fas fa-search fa-lg"></i>
											</button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <br />
                                    </div>
                                    <div id="divproductos" class="row"></div>
                                </div>
                                 <div class="col-lg-6">
                                     <table id="tbldetalle" class="table table-bordered table-hover">
                                     </table>
                                </div>   
                        </div>

                        </div>
                       
                    </div>
                    <!-- /.card -->
                </div>
            </section>
            <!-- /.content -->
        </div>
        
       <div class="modal fade" id="dialogAnularItem" tabindex="-1" role="dialog" aria-labelledby="dialogAnularItemLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" style="color:black">Eliminar Item</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body" id="divanularitem">
                    Esta seguro de eliminar el item ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success" onclick="anular_item_aceptar()">Aceptar</button>
                </div>
                </div>
            </div>
        </div>    

       <div class="modal" id="dialogcantidad" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Producto Cantidad</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <span style="font-size:20px;font-weight:bold" id="nombre"></span>
                            </div>
                        </div>               
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-4"><span style="font-size:24px">Cantidad</span></div>
                            <div class="col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="cantidad" id="cantidad" maxlength="7" onkeypress="return isNumberKey(event)" runat="server" class="form-control" value="1" style="text-align:right;font-size:28px;width:140px" />
                            </div>
                        </div>

                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarcantidad();" value="Grabar" title="Grabar"   />
                       
                       <input type="hidden" name="hidproducto" id="hidproducto"/>
                       <input type="hidden" name="hiddetalle" id="hiddetalle"/>
                       <input type="hidden" name="hprecio" id="hprecio"/>
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogdescripcion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Producto Descripción</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <span style="font-size:20px;font-weight:bold" id="nombred"></span>
                            </div>
                        </div>               
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-4">Descripción</div>
                            <div class="col-lg-12" style="display:flex;justify-content:flex-end">

                                <textarea name="descripcion" id="descripcion" placeholder="Producto Max(500)" maxlength="500" class="form-control" rows="3" style="resize:none"></textarea>
                            </div>
                        </div>     

                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizardescripcion();" value="Grabar" title="Grabar"   />
                       
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogproducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Agregar Producto</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body"> 
                        <div class="row">
                            <div class="col-lg-2">Codigo</div>
                            <div class="col-lg-10" style="display:flex;justify-content:flex-end">
                                <input type="text" name="productocodigo" id="productocodigo" placeholder="Codigo Max(20)" maxlength="20" class="form-control"></input>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-2">Nombre</div>
                            <div class="col-lg-10" style="display:flex;justify-content:flex-end">
                                <textarea name="productoinvidual" id="productoinvidual" placeholder="Producto Max(500)" maxlength="500" class="form-control" rows="3" style="resize:none"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-2">Descripción</div>
                            <div class="col-lg-10" style="display:flex;justify-content:flex-end">
                                <textarea name="descripcioninvidual" id="descripcioninvidual" placeholder="Producto Max(500)" maxlength="500" class="form-control" rows="3" style="resize:none"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-2">Unidad</div>
                            <div class="col-lg-4" style="display:flex;justify-content:flex-end">
                                <select id="cbounidadmedida" class="form-control" runat="server">
                                </select>
                            </div>
                
                            <div class="col-lg-2">Cant</div>
                            <div class="col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="cantidadinvidual" id="cantidadinvidual" style="text-align:right" maxlength="7" placeholder="Cantidad" onkeypress="return isNumberKey(event)" runat="server" class="form-control" value="1"  />
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarproducto_invidual();" value="Grabar" title="Grabar"   />
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogmasivo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Masivo Producto</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>               
                        <div class="row">
                            <textarea name="productomasivo" id="productomasivo" placeholder="Ctrl+c de un excel y Ctrl+v sobre la caja de texto (Formato: \tCodigo    \tProducto    \tDescripcion  \tUnidad    \tCantidad)!" runat="server" class="form-control" style="resize:none" rows="10"></textarea>
                            
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarproducto_masivo();" value="Grabar" title="Grabar"   />
                   </div>
                </div>
            </div>
        </div>


        <div class="modal" id="dialogfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Procesar PDF</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>               
                        <div class="row">
                            <div class="col-lg-6">
                                <label class="form-label">Motivo de traslado</label>
                                <select id="cbomotivo" class="form-control" runat="server" required="required"></select>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Archivo</label>
                                <br />
                                <input type="file" name="file" id="file" class="custom-file-inputc" runat="server" accept=".pdf" />
                            </div>

                            <div class="col-lg-12">
                                <br />
                                <div class="progress progress-striped active">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                    </div>
                                </div>
                            </div>                            
                            
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarfile();" value="Procesar" title="Procesar"   />
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogaustral" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Cargar Productos</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                                     
                        <div class="row">
                            <div class="col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="PERMAT" id="PERMAT" maxlength="4" runat="server" placeholder="PERMAT" class="form-control"   />
                            </div>

                            <div class="col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="DOCMAT" id="DOCMAT" maxlength="10" runat="server" placeholder="DOCMAT" class="form-control"   />
                            </div>

                            <div class="col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="button" class="btn btn-info" onclick="consultaraustral();" value="Consultar" title="Consultar"   />
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                        <table id="tblproducto" class="table table-bordered table-hover">
							<thead>
							<tr>
								<th>Código</th>
								<th>Producto</th>
								<th>UM</th>
								<th>Cantidad</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizaraustral();" value="Procesar" title="Procesar"   />
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
<script src="../../../plugins/jquery/puntoventa/guiaremision23/jquery.nuevoweb-2.0.5.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>

</body>
</html>     