<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.ProductoCombo.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Listado de Producto-Combo</title>

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
  <link rel="stylesheet" href="../../../dist/css/adminlte.min.css" />
  <link rel="stylesheet" href="../../../Content/style_custom_v3.4.css" />
  <link rel="stylesheet" href="../../../Content/keyboard.css"/>
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
			<!-- Content Header (Page header) -->
		<section class="content-header" style="padding: 5px .5rem">
			  
		</section>
		<section class="content">

			<!-- Default box -->
			<div class="card">
				<div class="card-body">
					<div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6">
						        <h1>
							        Combo - <span id="snombre"></span>
						        </h1>
                                <input type="hidden" id="hidproductofijo" name="hidproductofijo" value="0" runat="server" />
                                <input type="hidden" id="hidproducto" name="hidproducto" runat="server" />
                                <input type="hidden" id="hid" name="hid" runat="server" />
						    </div>
                            <div class="col-lg-6">
                               
								<button type="button" class="btndefault float-right" id="btnrefrescar">
									<i class="fas fa-reload"></i>Refrescar
								</button>

                                <button type="button" class="btndefault float-right" id="btncancelar">
                                    <i class="fas fa-undo"></i>Retornar
                                </button>
							</div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
						<div class="row">
                            <div class="col-lg-6">
                               <div class="row">
                                   <div class="col-9">
                                        <h5>Productos Fijos</h5>
                                   </div>
                                    <div class="col-3">
                                        <a href="#"><img src="../../../Img/mas.png" title="Seleccionar Producto" class="img-thumbnail float-right" onclick="seleccionarproducto();" /></a>
                                    </div>
                               </div>
                               <div class="row">
                                   <div class="col-12">
                                        <table id="tbldetalle_fijo" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>N°</th>
                                                    <th>Producto</th>
                                                    <th>Cantidad</th>
                                                    <th>Orden</th>
                                                    <th>Activo</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                         </table>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="row">
                                   <div class="col-12">
                                        <h5>Productos Variables</h5>
                                   </div>
                               </div>
                               <div class="row">
                                   <div class="col-12">
                                         <table id="tbldetalle_variable" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>N°</th>
                                                    <th>Seleccion</th>
                                                    <th>Grupo</th>
                                                    <th>Producto</th>
                                                    <th>Cantidad</th>
                                                    <th>Orden</th>
                                                    <th>Activo</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

				 </div>
			</div>
		</section>
	</div>

    <div class="modal" id="dialogagregarproducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Producto Fijo</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3><span id="sproductoeditarfijo"></span></h3>
                        </div>
                        <div class="col-lg-6" id="divcategoria">
                            <label for="cbocatagoria">Categoría</label>
                            <select class="form-control" id="cbocatagoria" name="cbocatagoria" runat="server"></select>
                        </div>
                        <div class="col-lg-6" id="divproducto">
                            <label for="cboproducto">Producto</label>
                            <select class="form-control" id="cboproducto" name="cboproducto" runat="server"></select>
                        </div>
                        <div class="col-lg-6">
                            <label class="form-label">Cantidad</label>
                            <input type="text" id="cantidad" maxlength="5" class="form-control" value="1" runat="server" onkeypress="return isNumber(event)" required="required" style="text-align:right"/>
                        </div>
                        <div class="col-lg-6">
                            <label class="form-label">Orden</label>
                            <input type="text" id="orden" maxlength="5" class="form-control" value="1" runat="server" onkeypress="return isNumber(event)" required="required" style="text-align:right"/>
                        </div>
                        <div class="col-lg-6">
                            <label for="cboactivo">Activo</label>
                            <select class="form-control" id="cboactivo" name="cboactivo" runat="server">
                                <option value="1">SI</option>
                                <option value="0">NO</option>
                            </select>
                        </div>
                    </div>
                        
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                    <input type="button" id="btnagregarproducto" class="btn btn-success" onclick="grabarproducto_fijo();" value="Agregar" title="Agregar"   />
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="dialoeliminarproducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Eliminar Producto Fijo</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    Esta seguro de eliminar el producto <span id="sproductofijo"></span>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                    <input type="button" id="btneliminarproducto" class="btn btn-success" onclick="eliminarproducto_fijo();" value="Eliminar" title="Eliminar"   />
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
<script src="../../../plugins/jquery/puntoventa/productocombo/jquery.listadoweb-1.0.5.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>

</body>
</html>