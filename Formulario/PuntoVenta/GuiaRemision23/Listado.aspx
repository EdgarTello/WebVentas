<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaRemision23.Listado" %>

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
    <link rel="stylesheet" href="../../../dist/css/adminlte.min.css" />
    <link rel="stylesheet" href="../../../Content/style_custom_v50.5.css" />

    <link rel="stylesheet" href="../../../plugins/bootstrap-select/css/bootstrap-select.css" />	
	<link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<style>
		.estado-gre {
			font-weight: 600;
			font-size: 16px;
			transition: all 0.3s ease;
		}

		/* ACTIVO */
		.estado-ok {
			color: #198754; /* verde bootstrap */
		}

		/* ERROR */
		.estado-error {
			color: #dc3545; /* rojo bootstrap */
		}

		/* Pulso SOLO cuando está en error */
		@keyframes pulseErrorText {
			0%   { opacity: 1; }
			50%  { opacity: 0.4; }
			100% { opacity: 1; }
		}

		.estado-error.pulse {
			animation: pulseErrorText 1.5s infinite;
		}

	</style>
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
					<div class="card-body" style="padding:0.50rem !important">
						<div class="container-fluid">
							<div class="row">
								<div class="col-3">
									<%if (this.ViewState["acceso"].ToString() == "Operador" || this.ViewState["acceso"].ToString() == "Supervisor" || this.ViewState["acceso"].ToString() == "Auditor")
									{ %> 
													<ul class="navbar-nav ml-auto">
														<li class="nav-item">
															<a class="nav-link">     
																<i class="fas fa-user"></i>
																<asp:Literal runat="server" ID="lblnombres"></asp:Literal>
															</a>
														</li>
													</ul>
									<%}%>	
				
									<input type="hidden" name="hid" id="hid" value="0"/>
									<input type="hidden" name="hnombre" id="hnombre"/>
									<input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
									<input type="hidden" name="htipo" id="htipo" runat="server"/>
									<input type="hidden" name="hempleado" id="hempleado" runat="server"/>
									<input type="hidden" name="hacceso" id="hacceso" runat="server"/>
									<input type="hidden" name="hidalmacen" id="hidalmacen" runat="server"/>

									<input type="hidden" name="hguiaauditor" id="hguiaauditor" runat="server"/>
									<input type="hidden" name="hguiavalidador" id="hguiavalidador" runat="server"/>
									<input type="hidden" name="hmobile" id="hmobile" runat="server" value="0"/>
									<input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("GR23List") %>" />
								</div>
                                <div class="col-6">
									<div id="estado-gre" class="alert d-none d-flex justify-content-center align-items-center text-center"></div>
								</div>
								<div class="col-3">
									<div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
											<div class="btn-group mr-2" role="group" aria-label="Tree group">
												<button type="button" class="btn btn-outline-danger" id="btneliminar" title="Eliminar">
													<i class="fas fa-trash"></i>
												</button>
											</div>
											<div class="btn-group mr-2" role="group" aria-label="Second group">
												<button type="button" class="btn btn-outline-success" id="btnexportar" title="Exportar Excel">
													<i class="fas fa-file-excel"></i>
												</button>
											</div>
											<div class="btn-group mr-2" role="group" aria-label="Tree group">
												<button type="button" class="btn btn-primary active" id="btnnuevo" title="Nuevo">
													<i class="fas fa-file"></i> Nuevo
												</button>
										    </div>
											<%if (this.ViewState["acceso"].ToString() == "Operador" || this.ViewState["acceso"].ToString() == "Supervisor" || this.ViewState["acceso"].ToString() == "Auditor")
											{ %> 
											<div class="dropdown">
												<button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													<i class="fas fa-ellipsis-v fa-lg"></i>
												</button>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" href="#" onclick="location.href='../Cliente/Listado.aspx?pagina=23';"><i class="fas fa-user"></i> Clientes</a>
													<a class="dropdown-item" href="#" onclick="location.href='../Local/Listado.aspx?pagina=23';"><i class="fas fa-city"></i> Locales</a>
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
								<div class="col-lg-3">
									<div class="row">
										<div class="col-lg-6">
											<div class="input-group date" id="fechainicio" data-target-input="nearest">
												<input type="text" class="form-control datetimepicker-input" data-target="#fechainicio" id="dfechainicio" name="dfechainicio" readonly="readonly" />
												<div class="input-group-append">
													<div class="input-group-text"><i class="fa fa-calendar"></i></div>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="input-group date" id="fechafin" data-target-input="nearest">
												<input type="text" class="form-control datetimepicker-input" data-target="#fechafin" id="dfechafin" name="dfechafin" readonly="readonly"/>
												<div class="input-group-append">
													<div class="input-group-text"><i class="fa fa-calendar"></i></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-1">
									<select id="cboestado" name="cboestado" class="form-control input-normal">
										<option value="-1" selected="selected">[Estados]</option>
										<option value="0">Pendiente</option>
										<option value="1">Generado</option>
										<option value="2">Procesado</option>
									</select>
								</div>
								<div class="col-lg-1">
									<select id="cboanulado" name="cboanulado" class="form-control input-normal">
										<option value="-1" selected="selected">[Anulado]</option>
										<option value="0">NO</option>
										<option value="1">SI</option>
									</select>
								</div>
                                <div class="col-lg-3">
                                    <select id="cboparametros"  class="form-control selectpicker" multiple="multiple">
                                        <option value="1">Incluir Externos</option>
										<option value="3">Solo Externos</option>
                                        <option value="2">Buscar en descripcion de productos</option>
                                    </select>
                                </div>
								<div class="col-lg-3">
									<div class="input-group input-group mb-3">
										<input type="text" id="documento" name="documento" class="form-control input-normal enter"  autocomplete="on" placeholder="Documento%"/>
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
									<th></th>
									<th><i class="fa fa-download" aria-hidden="true"></i> SUNAT</th>
									<th><button type="button" class="btn btn-secondary" id="btninvoice" title="Generar Pedido"><i class="fas fa-file-invoice"></i></button></th>
									<th>DOCUMENTO</th>
									<th>EMPLEADO</th>
									<th>CLIENTE</th>
									<th>FECHA</th>
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

	<div class="modal" id="dialoggenerar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Guias de Remisión</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    Esta seguro de generar el pedido de almacen?
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                    <input type="button" class="btn btn-success" id="btngenerar" onclick="this.disabled='true';generar_guia();" value="Generar" title="Generar"   />
                       
                </div>
            </div>
        </div>
    </div>

	<div class="modal" id="dialogvalidacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Ingrese los datos de validación </h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    <div class="rows">
						<br />
					</div>
					<div class="rows">
						<select id="cboconformidad" class="form-control" runat="server" required="required">    
                            <option value="1">Conforme</option>
                            <option value="0">NO Conforme</option>
                        </select>
					</div>
					<div class="rows">
						<br />
					</div>
					<div class="rows">
						<textarea name="observacion" id="observacion" value="" placeholder="Observación max(250)" maxlength="250" class="form-control" rows="2" style="resize:none;"></textarea>
					</div>
					<div class="rows">
						<br />
					</div>
                               
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                    <input type="button" class="btn btn-success" id="btnvalidar" onclick="this.disabled='true';actualizar_auditor();" value="Grabar" title="Grabar"   />
                       
                </div>
            </div>
        </div>
    </div>


	<div class="modal" id="dialogentrada" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Datos de Auditoría Entrada</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    <div class="rows">
						<br />
					</div>
					<div class="rows">
						<select id="cboconformidade" class="form-control" runat="server" required="required">    
                            <option value="1">Conforme</option>
                            <option value="0">NO Conforme</option>
                        </select>
					</div>
					<div class="rows">
						<br />
					</div>
					<div class="rows">
						<textarea name="observacione" id="observacione" value="" placeholder="Observación max(250)" maxlength="250" class="form-control" rows="2" style="resize:none;"></textarea>
					</div>
					<div class="rows">
						<br />
					</div>
                               
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                    <input type="button" class="btn btn-success" id="btnvalidare" onclick="this.disabled='true';actualizar_entrada();" value="Grabar" title="Grabar"   />
                       
                </div>
            </div>
        </div>
    </div>


	<div class="modal" id="dialogsalida" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color:black">Datos de Auditoría Salida</h3>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    <div class="rows">
						<br />
					</div>
					<div class="rows">
						<select id="cboconformidads" class="form-control" runat="server" required="required">    
                            <option value="1">Conforme</option>
                            <option value="0">NO Conforme</option>
                        </select>
					</div>
					<div class="rows">
						<br />
					</div>
					<div class="rows">
						<textarea name="observacions" id="observacions" value="" placeholder="Observación max(250)" maxlength="250" class="form-control" rows="2" style="resize:none;"></textarea>
					</div>
					<div class="rows">
						<br />
					</div>
                               
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                    <input type="button" class="btn btn-success" id="btnvalidars" onclick="this.disabled='true';actualizar_salida();" value="Grabar" title="Grabar"   />
                       
                </div>
            </div>
        </div>
    </div>


	<div class="modal" id="dialogpdf" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<embed id="embedpdf" name="embedpdf" src="../../../Img/loading.gif" frameborder="0" width="100%" height="400px" type="application/pdf" />
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
	<script src="../../../plugins/jquery/puntoventa/guiaremision23/jquery.listadoweb-2.0.7.js"></script>

	<!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>
</body>
</html>