<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Rendicion.Documentos.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Rendición</title>

	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<!-- Font Awesome -->
	<link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css" />
	<link rel="stylesheet" href="../../plugins/jquery-ui/jquery-ui.min.css"  />

	<link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css" />
	<link rel="stylesheet" href="../../plugins/select2/css/select2.min.css" />
	<link rel="stylesheet" href="../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />
	<link rel="stylesheet" href="../../plugins/toastr/toastr.min.css"  />
	<!-- Theme style -->
	<link rel="stylesheet" href="../../dist/css/keyboard.min.css" />
	<link rel="stylesheet" href="../../dist/css/adminlte.min.css" />
	<link rel="stylesheet" href="../../Content/style_custom_v50.4.css" />
	<link href="../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
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
					<div class="card-body">
						<div class="container-fluid">
							<div class="row">
                                <div class="col-12">
									<h1>
										Rendición
									</h1>
									<input type="hidden" name="hid" id="hid" value="0"  runat="server"/>
									<input type="hidden" name="htipo" id="htipo" value="0" runat="server"/>
									<input type="hidden" name="hnombre" id="hnombre"  runat="server"/>
									<input type="hidden" name="hdocumento" id="hdocumento"  runat="server"/>
									<input type="hidden" name="hdias" id="hdias"  runat="server"/>
									<input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
									<input type="hidden" name="hidcaja" id="hidcaja"  runat="server"/>
									<input type="hidden" name="hcaja" id="hcaja"  runat="server"/>
									<input type="hidden" name="hserie" id="hserie"  runat="server"/>
									<input type="hidden" name="hempleado" id="hempleado"  runat="server"/>
									<input type="hidden" name="hidalmacen" id="hidalmacen"  runat="server"/>
									<input type="hidden" name="hidubicacion" id="hidubicacion"  runat="server"/>
									<input type="hidden" name="hubicaciones" id="hubicaciones"  runat="server"/>
									<input type="hidden" name="hdocumentointerno" id="hdocumentointerno" value="0"  runat="server"/>

									<input type="hidden" name="ha4" id="ha4" value="0" runat="server"/>
									<input type="hidden" name="hmm58" id="hmm58" value="0" runat="server"/>
									<input type="hidden" name="hmm80" id="hmm80" value="0" runat="server"/>

                                    <input type="hidden" name="hcajerogavetatecla" id="hcajerogavetatecla" runat="server" value="0"/>
									<input type="hidden" name="hcajarapida" id="hcajarapida" runat="server" value="0"/>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-2">
									<div class="input-group date" id="fechainicio" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" data-target="#fechainicio" id="dfechainicio" name="dfechainicio" readonly="readonly" />
										<div class="input-group-append">
											<div class="input-group-text"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
								</div>
								<div class="col-lg-2">
									<div class="input-group date" id="fechafin" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" data-target="#fechafin" id="dfechafin" name="dfechafin" readonly="readonly"/>
										<div class="input-group-append">
											<div class="input-group-text"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
								</div>
								
								<div class="col-lg-2">
									<select id="cboestado" name="cboestado" class="form-control input-normal" >
										<option value="" selected="selected">[Estados]</option>
										<option value="0">Registrado</option>
										<option value="1">Enviado</option>
										<option value="2">Rechazado</option>
										<option value="3">Aceptado</option>
									</select>
								</div>
								<div class="col-lg-6">
									<div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
											<div class="btn-group mr-2" role="group" aria-label="First group">
												<button type="button" class="btn btn-outline-info" id="btnbuscar" title="Buscar">
													<i class="fas fa-search fa-lg"></i>
												</button>
											</div>
											<div class="btn-group mr-2" role="group" aria-label="Second group">
												<button type="button" class="btn btn-outline-success" id="btnexportar" title="Exportar Excel">
													<i class="fas fa-file-excel"></i>
												</button>
											</div>
											<div class="btn-group mr-2" role="group" aria-label="Tree group">
												<button type="button" class="btn btn-primary active" id="btnnuevo" title="Nuevo">
													<i class="fas fa-file"></i> <b>N</b>uevo
												</button>
											</div>

										</div>
									</div>
								</div>
							</div>
					
							<br />
							<table id="tbldetalle" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>N°</th>
									<th></th>
									<th>USUARIO</th>
									<th>PROVEEDOR</th>
									<th>DOCUMENTO</th>
									<th>MONTO</th>
									<th>FECHA</th>
									<th>ESTADO</th>
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

		<div class="modal" id="dialoganticipo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body" id="mbody_anticipo">
                    </div>
                    <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" title="Cancelar"  />
                       <input type="button" id="btnactualizar_anticipo" class="btn btn-success" onclick="this.disabled='true';anticipo_grabar();" value="Confirmar" title="Anticipo"   />                       
                    </div>
                </div>
            </div>
        </div>

		<div class="modal" id="dialogimprimir" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body" id="mbody_imprimir">
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" title="Cancelar"  />
                       <input type="button" id="btnactualizar_imprimir" class="btn btn-success" onclick="this.disabled='true';imprimir_grabar();" value="Confirmar" title="Impresión"   />
                       
                   </div>
                </div>
            </div>
        </div>
		

		<div class="modal" id="dialogeliminar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body" id="mbody_eliminar">
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" title="Cancelar"  />
                       <input type="button" id="btnactualizar_eliminar" class="btn btn-success" onclick="this.disabled='true';eliminar_grabar();" value="Confirmar" title="Eliminar"   />
                       
                   </div>
                </div>
            </div>
        </div>

		<div class="modal" id="dialoganticipada" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
				   <div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				   </div>
				   <div class="modal-body">
					   <div class="row">
						   <div class="col-2">
							   <select id="cbodocumento_a" name="cbodocumento_a" class="form-control input-normal">
									<option value="01" selected="selected">Factura</option>
									<option value="03">Boleta</option>
							   </select>
						   </div>
						   <div class="col-8">
							<input id="documento_a" name="documento_a" class="form-control input-normal"  placeholder="Documento"/>
						   </div>
						   <div class="col-2">
								<input type="button" class="btn btn-secondary" onclick="anticipada_generar(0);" value="Buscar" title="Buscar"  />
						   </div>
					   </div>
					   <div class="row">
						   <br />
					   </div>
					   <div class="row" id="mbody_anticipada">

					   </div>
                   </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" title="Cancelar"  />
                       <input type="button" id="btnactualizar_anticipada" class="btn btn-success" onclick="this.disabled='true';anticipada_actualizar();" value="Confirmar" title="Generar"   />
                       
                   </div>
                </div>
            </div>
        </div>

		<div class="modal" id="dialognc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body" id="mbody_nc">
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" title="Cancelar"  />
                       <input type="button" id="btnactualizarnc" class="btn btn-success" onclick="this.disabled='true';nc_actualizar();" value="Confirmar" title="Nota Crédito"   />
                       
                   </div>
                </div>
            </div>
        </div>

		<div class="modal" id="dialogdetalle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body" id="mbody_detalle">
                       
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />                       
                   </div>
                </div>
            </div>
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
	<script src="../../plugins/jquery/rendicion/documentos/jquery.listadoweb-1.9.9.js"></script>
	
	<!-- AdminLTE App -->
    <script src="../../dist/js/adminlte.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.10.3/xlsx.full.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/file-saver@2.0.2/dist/FileSaver.min.js"></script>
</body>
</html>