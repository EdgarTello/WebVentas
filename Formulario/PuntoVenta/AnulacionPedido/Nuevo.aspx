<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.AnulacionPedido.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Anulación de Pedido</title>

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
	<link rel="stylesheet" href="../../../Content/keyboard.css"/>
	<link rel="stylesheet" href="../../../dist/css/adminlte.min.css" />
	<link rel="stylesheet" href="../../../Content/style_custom_v50.5.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" autocomplete="off">
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
										Anulación Pedido - Usuario Autorizador
									</h1>
									<input type="hidden" name="hmobile" id="hmobile" value="0" runat="server"/>
									<input type="hidden" name="hid" id="hid" runat="server"/>
									<input type="hidden" name="hpagina" id="hpagina" runat="server"/>
									<input type="hidden" name="hautorizadovalido" id="hautorizadovalido" value="0" runat="server"/>
									<input type="hidden" name="hruc" id="hruc" value="" runat="server"/>
									<input type="hidden" name="hlocalcodigo" id="hlocalcodigo" value="" runat="server"/>

									<input type="hidden" name="hentrega" id="hentrega" runat="server"/>
									<input type="hidden" name="hpagado" id="hpagado" runat="server"/>
									<input type="hidden" name="hidubicacion" id="hidubicacion" runat="server"/>
									<input type="hidden" name="htecladovisualiza" id="htecladovisualiza" runat="server"/>
								</div>
								<div class="col-4">
                                    <div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                            <div class="btn-group mr-2" role="group" aria-label="First group">
                                                <asp:Button ID="btnAutorizar" runat="server" CssClass="btn btn-success" OnClick="btnAutorizar_Click" Text="Autorizar"  OnClientClick="this.disabled='true';"  UseSubmitBehavior="false"/>
											</div>
											<div class="btn-group mr-2" role="group" aria-label="First group">
												<button type="button" class="btn btn-secondary" id="btnretornar" title="Retornar">
													<i class="fas fa-undo"></i>
												</button>
											</div>
										</div>
									</div>
						        </div>
							</div>
					
							<div class="row">
								<div class="col-lg-2"></div>
								<div class="col-lg-4">
									<span style="font-size:24px">Roles</span>
								</div>
								<div class="col-lg-4">
									<input type="text" name="rol_anulacion" id="rol_anulacion" class="form-control" style="font-size:20px;" readonly="readonly" runat="server"/>
								</div>
								<div class="col-lg-2"></div>
							</div>               
							<div class="row">
								<br />
							</div>
							<div class="row">
								<div class="col-lg-2"></div>
								<div class="col-lg-4"><span style="font-size:24px">Usuario</span></div>
								<div class="col-lg-4">
									<asp:DropDownList ID="cbousuarios" CssClass="form-control" runat="server" style="font-size:20px;"></asp:DropDownList>
								</div>
								<div class="col-lg-2"></div>
							</div>
							<div class="row">
								<br />
							</div>
							<div class="row">
								<div class="col-lg-2"></div>
								<div class="col-lg-4"><span style="font-size:24px">Clave</span></div>
								<div class="col-lg-4">
									<input type="password" name="clave" id="clave" autocomplete="off" maxlength="20" required="required" class="form-control" style="font-size:20px;" runat="server"/>
								</div>
								<div class="col-lg-2"></div>
							</div>
							<div class="row">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-8" style="display:flex;justify-content:flex-end">
                                    <asp:Label ID="lblmensaje" CssClass="text-danger" runat="server"></asp:Label>                        
                                </div>
                                <div class="col-lg-2"></div>
                            </div>
                            <div class="row">
                                <br />
                            </div>
							<div class="row">
								<div class="col-lg-2"></div>
								<div class="col-lg-4"><span style="font-size:24px">Observación</span></div>
								<div class="col-lg-4">
									<textarea id="observacion" name="observacion" style="resize:none;" rows="3" class="form-control" maxlength="100" required="required" placeholder="Max 100 caracteres" runat="server"></textarea>
								</div>
								<div class="col-lg-2"></div>
							</div>
							<div class="row">
								<br />
							</div>
							
						
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
	<script src="../../../plugins/jquery/puntoventa/anulacionpedido/jquery.nuevoweb-1.1.4.js"></script>
	<script src="../../../Scripts/jquery.table2excel.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../../dist/js/adminlte.min.js"></script>

    <style>
    .ui-keyboard div {
        font-size: 1.7em;
    }
    </style>

</body>
</html>