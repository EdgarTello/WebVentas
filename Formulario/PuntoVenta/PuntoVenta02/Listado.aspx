<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta02.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Pedidos</title>

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
				<!-- /.container-fluid -->
			</section>
            <section class="content">
				<!-- Default box -->
				<div class="card">
					<div class="card-body" style="padding: 0.5rem !important;">
						<div class="container-fluid">
							<div class="row">
                                <div class="col-8">
									<h1>
										Pedidos <span id="spandi"></span>
									</h1>
									<input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("PuntoVenta02List") %>" />
									<input type="hidden" name="hid" id="hid" value="0"  runat="server"/>
									<input type="hidden" name="htipo" id="htipo" value="0" runat="server"/>
									<input type="hidden" name="hnombre" id="hnombre"  runat="server"/>
									<input type="hidden" name="hdocumento" id="hdocumento"  runat="server"/>
									<input type="hidden" name="hdias" id="hdias"  runat="server"/>
									<input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
									<input type="hidden" name="hidcaja" id="hidcaja"  runat="server"/>
									<input type="hidden" name="hcaja" id="hcaja"  runat="server"/>
									<input type="hidden" name="hacceso" id="hacceso"  runat="server"/>
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

									<input type="hidden" name="haperturacaja" id="haperturacaja" runat="server" value="0"/>
									<input type="hidden" name="haperturatipocambio" id="haperturatipocambio" runat="server" value="0"/>
									<input type="hidden" name="hnotacreditoexterna" id="hnotacreditoexterna" runat="server" value="0"/>
								</div>
								<div class="col-4">
									<div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
											<%if (this.ViewState["acceso"].ToString() == "Vendedor")
											{ %> 
											<div class="dropdown">
												<button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													<i class="fas fa-ellipsis-v fa-lg"></i>
												</button>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#" onclick="location.href='../Cliente/Listado.aspx?pagina=24';"><i class="fas fa-user"></i> Clientes</a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#" onclick="location.href='../Contrasena/Listado.aspx?pagina=23';"><i class="fas fa-key"></i> Contraseña</a>
													<a class="dropdown-item" href="#" onclick="location.href='../Menu/Salir.aspx?pagina=23';"><i class='fas fa-sign-out-alt'></i> Salir</a>
												</div>
											</div>
											<%}%>		
										</div>
									</div>
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
								<div class="col-lg-1">
									 <select id="cbodocumento" name="cbodocumento" class="form-control input-normal" >
										<option value="-1" selected="selected">[Documento]</option>
										<option value="01">Factura</option>
										<option value="03">Boleta</option>
										<option value="101">Anticipo</option>
										<option value="102">Deducción Anticipos</option>
										<option value="07">Nota Credito</option>
									</select>
								</div>
								<div class="col-lg-1">
									<select id="cboestado" name="cboestado" class="form-control input-normal" >
										<option value="-1" selected="selected">[Estados]</option>
										<option value="0">Pendiente</option>
										<option value="2">Por Cobrar</option>
										<option value="1">Pagado</option>
									</select>
								</div>
								<div class="col-lg-1">
									<select id="cboanulado" name="cboanulado" class="form-control input-normal" >
										<option value="-1">[Anulados]</option>
										<%--<option value="-1">AUTOMATICO</option>--%>
										<option value="0" selected="selected">NO</option>
										<option value="1">SI</option>
									</select>
								</div>
								<div class="col-lg-2">
									<input id="documento" name="documento" class="form-control input-normal"  placeholder="Documento"/>
								</div>
								<div class="col-lg-1">
									<button type="button" class="btn btn-outline-info" id="btnbuscar" title="Buscar">
										<i class="fas fa-search fa-lg"></i>
									</button>
								</div>
								<div class="col-lg-2">
									<div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
											
											<div class="btn-group mr-3" role="group" aria-label="Tree group">
												<div class="dropdown">
													<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
														<img src="../../../Img/procesar32.png" style="width:20px;height:20px" />
													</button>
													<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
														<a class="dropdown-item" href="#" style="color:#545454" id="btnexportar">
															<i class="fas fa-file-excel"></i> Excel
														</a>
														<%if (this.ViewState["notacreditoexterna"].ToString() == "1")
														{ %>
														<a class="dropdown-item" href="#" style="color:#545454" id="btnncexterno">
															<b>Nota de Credito</b>
														</a>
														<%}%>
														<a class="dropdown-item" href="#" style="color:#545454" id="btnanticipada">
															<b>D</b>educción
														</a>
														<a class="dropdown-item" href="#" style="color:#545454" id="btnmasivo">
															<i class="fas fa-file"></i> Masivo
														</a>
													</div>
												</div>
											</div>

											<div class="btn-group mr-2" role="group" aria-label="Second group">
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
									<th><i class="fa fa-download" aria-hidden="true"></i> SUNAT</th>
									<th>PEDIDO</th>
									<th>DOCUMENTO</th>
									<th>CAJA</th>
									<th>CLIENTE</th>
									<th>FECHA</th>
									<th>MONTO</th>
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
						  <div class="container">
								<div class="row">
									<div class="col-md-6">
										(*) Precio Original
									</div>
									<div class="col-md-6 text-right">
										<input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />                       
									</div>
								</div>
						</div>
                   </div>
                </div>
            </div>
        </div>

		<div class="modal" id="dialognc_externo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body" id="mbody_nc_externo">
						<div class="row p-3">
							<div class="col-12">
								<select id="cbodocumento_externo" name="cbodocumento_externo" class="form-control input-normal">
									<option value="01" selected="selected">Factura</option>
									<option value="03">Boleta</option>
								</select>
							</div>		
						</div>
						<div class="row p-3">
							<div class="col-4">
								<input id="serie_nc_externo" name="serie_nc_externo" maxlength="4" class="form-control input-normal"  placeholder="Serie"/>
							</div>
							<div class="col-4">
								<input id="documento_nc_externo" name="documento_nc_externo" maxlength="8" class="form-control input-normal"  placeholder="Documento"/>
							</div>
							<div class="col-4">
								<button type="button" class="btn btn-outline-info" onclick="nc_buscar_externo();">
									<i class="fas fa-search fa-lg"></i>
								</button>
							</div>
						</div>
						<div class="row p-3" id="mbody_nc_row_externo">

						</div>
					</div>
				    <div class="modal-footer">
					   <input type="button" id="btnactualizarnc_externo" class="btn btn-success" onclick="this.disabled='true';nc_actualizar_externo();" value="Generar" title="Nota Crédito"   disabled="disabled" />
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
	<!-- <script src="../../../plugins/pdfmake/pdfmake.min.js"></script>-->
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
	<script src="../../../plugins/jquery/puntoventa/puntoventa02/jquery.listadoweb-3.0.7.js"></script>
	
	<!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>
</body>
</html>