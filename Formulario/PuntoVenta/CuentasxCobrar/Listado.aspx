<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.CuentasxCobrar.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Cuentas x Cobrar</title>

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
                <!-- /.container-fluid -->
            </section>
            <section class="content">
                <!-- Default box -->
                <div class="card">
					<div class="card-body" style="padding: 0.5rem !important;">
						<div class="container-fluid">
							<div class="row">
                                <div class="col-lg-12">
									<h1>
										Cuentas x Cobrar <span id="spandi"></span>
									</h1>

									<input type="hidden" name="hid" id="hid" value="0"/>
									<input type="hidden" name="hentrega" id="hentrega" value="0"/>
									<input type="hidden" name="htipo" id="htipo" value="0" runat="server"/>
									<input type="hidden" name="hnombre" id="hnombre"/>
									<input type="hidden" name="hdocumento" id="hdocumento"/>
									<input type="hidden" name="hdias" id="hdias"/>
									<input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
									<input type="hidden" name="hidcaja" id="hidcaja"/>
									<input type="hidden" name="hcaja" id="hcaja"/>
									<input type="hidden" name="hserie" id="hserie"/>
									<input type="hidden" name="hempleado" id="hempleado"/>
									<input type="hidden" name="hidalmacen" id="hidalmacen"/>
									<input type="hidden" name="hidubicacion" id="hidubicacion"/>
									<input type="hidden" name="hubicaciones" id="hubicaciones"/>
									<input type="hidden" name="hdocumentointerno" id="hdocumentointerno" value="0"/>

									<input type="hidden" name="hticket" id="hticket" value="0" runat="server"/>
									<input type="hidden" name="ha4" id="ha4" value="0" runat="server"/>
									<input type="hidden" name="hmm58" id="hmm58" value="0" runat="server"/>
									<input type="hidden" name="hmm80" id="hmm80" value="0" runat="server"/>

									<input type="hidden" name="hdocumentoimpresoras" id="hdocumentoimpresoras" runat="server"/>
									<input type="hidden" name="hdocumentoimpresoraip" id="hdocumentoimpresoraip" runat="server"/>
									<input type="hidden" name="htieneimpresora" id="htieneimpresora" runat="server" value="0"/>
                                    <input type="hidden" name="hcajerogavetatecla" id="hcajerogavetatecla" runat="server" value="0"/>

									<input type="hidden" name="hid1" id="hid1" value="0" runat="server"/>
									<input type="hidden" name="hid2" id="hid2" value="0" runat="server"/>
									<input type="hidden" name="hid3" id="hid3" value="0" runat="server"/>

									<input type="hidden" name="hpagado1" id="hpagado1" value="0" runat="server"/>
									<input type="hidden" name="hpagado2" id="hpagado2" value="0" runat="server"/>
									<input type="hidden" name="hpagado3" id="hpagado3" value="0" runat="server"/>


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
								<div class="col-lg-2">
									 <select id="cbodocumento" name="cbodocumento" class="form-control input-normal" >
										<option value="" selected="selected">[Documento]</option>
										<option value="01">Factura</option>
										<option value="03">Boleta</option>
										<option value="07">Nota Credito</option>
									</select>
								</div>
								
								<div class="col-lg-1">
									<select id="cboestado" name="cboestado" class="form-control input-normal" >
										<option value="" selected="selected">[Estados]</option>
										<option value="2">Por Cobrar</option>
										<option value="1">Pagado</option>
									</select>
								</div>
							
								<div class="col-lg-2">
									<select id="cboanulado" name="cboanulado" class="form-control input-normal" >
										<option value="0" selected="selected">ACTIVO</option>
										<option value="1">ANULADO(CLIENTE)</option>
										<option value="-1">ANULADO(SISTEMA)</option>
									</select>
								</div>
                               
								<div class="col-lg-2">
									<input id="documento" name="documento" class="form-control input-normal" maxlength="20" placeholder="Documento o Pedido o Cliente"/>
								</div>
								<div class="col-lg-2">
									<button type="button" class="btndefault float-right" id="btnexportar">
										<i class="fas fa-file-excel"></i>Exportar
									</button>


									<a href="#" onclick="buscar();">
										<img src="../../../icons/normal/search32.png" />
									</a>
								</div>
							</div>
					
							<br />
							<table id="tbldetalle" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>N°</th>
									<th>Pedido</th>
									<th>Documento</th>
									<th>Caja</th>
									<th>Cliente</th>
									<th>Fecha</th>
									<th>Monto</th>
									<th>Pdf</th>
									<th>Estado</th>
									<th></th>
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

		<div class="modal" id="dialogformapago" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Pagar Cuotas</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>

						<div class="row">
							<div class="col-lg-1">Cuota</div>
							<div class="col-lg-2">Fecha Promesa</div>
							<div class="col-lg-2">Monto de Deuda</div>

							<div class="col-lg-2">Fecha Pago</div>
							<div class="col-lg-2">Medio Pago</div>
							<div class="col-lg-2">Operación</div>
							<div class="col-lg-1 d-flex justify-content-center">Pagado</div>
						</div>

                        <div class="row" id="divcredito001" name="divcredito001">
                            <div class="col-lg-1">
                                <input name="cuota001" id="cuota001" class="form-control input-text-normal" value="001" readonly="readonly"/>
                            </div>
                            <div class="col-lg-2">
                                <input name="fecha001" id="fecha001" class="form-control input-date-normal" readonly="readonly" />
                            </div>
                            <div class="col-lg-2">
                                <input type="text" name="monto001" id="monto001" maxlength="12" class="form-control input-number" readonly="readonly" style="text-align:right" />
                            </div>
							<div class="col-lg-2">
                                <input name="pago001" id="pago001" class="form-control input-date-normal" readonly="readonly" />
                            </div>
							<div class="col-lg-2">
								<select id="cbotipopago001" name="cbotipopago001" class="form-control"></select>
							</div>
							<div class="col-lg-2">
                                <input name="operacion001" id="operacion001" class="form-control input-date-normal" maxlength="20"/>
                            </div>
							<div class="col-lg-1">
								<input type="checkbox" name="chk001" id="chk001" class="form-control input-date-normal"  />
							</div>
                        </div>
						<div class="row">
                            <br />
                        </div>
                        <div class="row" id="divcredito002" name="divcredito002">
                            <div class="col-lg-1">
                                <input name="cuota002" id="cuota002" class="form-control input-text-normal" value="002" readonly="readonly"/>
                            </div>
                            <div class="col-lg-2">
                                <input name="fecha002" id="fecha002" class="form-control input-date-normal"  readonly="readonly" />
                            </div>
                            <div class="col-lg-2">
                                <input type="text" name="monto002" id="monto002" maxlength="12" class="form-control input-number" readonly="readonly" style="text-align:right"/>
                            </div>
							<div class="col-lg-2">
                                <input name="pago002" id="pago002" class="form-control input-date-normal" readonly="readonly" />
                            </div>
							<div class="col-lg-2">
								<select id="cbotipopago002" name="cbotipopago002" class="form-control"></select>
							</div>
							<div class="col-lg-2">
                                <input name="operacion002" id="operacion002" class="form-control input-date-normal" maxlength="20" />
                            </div>
							<div class="col-lg-1">
								<input type="checkbox" name="chk002" id="chk002" class="form-control input-date-normal"  />
							</div>
                        </div>
						<div class="row">
                            <br />
                        </div>
                        <div class="row" id="divcredito003" name="divcredito003">
                            <div class="col-lg-1">
                                <input name="cuota003" id="cuota003" class="form-control input-text-normal" value="003" readonly="readonly" />
                            </div>
                            <div class="col-lg-2">
                                <input name="fecha003" id="fecha003" class="form-control input-date-normal"  readonly="readonly" />
                            </div>
                            <div class="col-lg-2">
                                <input type="text" name="monto003" id="monto003" maxlength="12" class="form-control input-number" readonly="readonly" style="text-align:right"/>
                            </div>
							<div class="col-lg-2">
                                <input name="pago003" id="pago003" class="form-control input-date-normal" readonly="readonly" />
                            </div>
							<div class="col-lg-2">
								<select id="cbotipopago003" name="cbotipopago003" class="form-control"></select>
							</div>
							<div class="col-lg-2">
                                <input name="operacion003" id="operacion003" class="form-control input-date-normal" maxlength="20"  />
                            </div>
							<div class="col-lg-1">
								<input type="checkbox" name="chk003" id="chk003" class="form-control input-date-normal"  />
							</div>
                        </div>
                        

                        <div class="row">
                            <br />
                        </div>

                    </div>
                    <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                       <input type="button" class="btn btn-success" onclick="actualizarformapago();" value="Grabar" title="Grabar"   />                       
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

	<script src="../../../dist/js/jquery.keyboard.min.js"></script>
	<script src="../../../dist/js/jquery.keyboard.extension-all.min.js"></script>

	<script src="../../../dist/js/jquery.mousewheel.min.js"></script>
	<script src="../../../dist/js/jquery.keyboard.extension-typing.min.js"></script>
	<script src="../../../dist/js/jquery.keyboard.extension-previewkeyset.min.js"></script>
	<script src="../../../dist/layouts/keyboard-layouts-greywyvern.min.js"></script>

	<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
	<script src="../../../plugins/jquery/puntoventa/cuentasxcobrar/jquery.listadoweb-2.1.5.js"></script>
	<script src="../../../Scripts/jquery.table2excel.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html> 