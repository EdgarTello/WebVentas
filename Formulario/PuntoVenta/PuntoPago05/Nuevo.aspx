<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoPago05.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Pago</title>

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
    <link rel="stylesheet" href="../../../Content/style_custom_v3.4.css" />
    <link rel="stylesheet" href="../../../Content/style_custom_number.css"  />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem"> 
                <div class="row">
                    <div class="col-6">
                       
                        <asp:Literal ID="lbltipocambio" runat="server"></asp:Literal>||
                        <a href="#" style="color:black" id="fechadiferencia"></a>||
                        <asp:Literal ID="lblubicacion" runat="server"></asp:Literal>||
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>||
                        <asp:Literal ID="lblmotorizado" runat="server"></asp:Literal>||
                        <asp:Literal ID="lblpedido" runat="server"></asp:Literal>||
                        <a href="#" style="color:black"  id="datos"></a>
                    </div>
                    <div class="col-6">
                        <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">

                                <div class="btn-group mr-2" role="group" aria-label="Six group">
			                        <b>SHIFT</b>
		                        </div>

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
										<i class="fas fa-undo" aria-hidden="true"></i>
									</button>
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

                    <div class="card-body">
                        <div class="container-fluid">

                            <div class="row">
                                <input type="hidden" name="hmobile" id="hmobile" value="0" runat="server"/>
                                <input type="hidden" name="hid" id="hid" runat="server"/>
                                <input type="hidden" name="hpagina" id="hpagina" runat="server"/>
                                <input type="hidden" name="hentrega" id="hentrega" runat="server"/>
                                <input type="hidden" name="htipo" id="htipo" runat="server"/>
                                <input type="hidden" name="htipodocumento" id="htipodocumento" runat="server"/>
                                <input type="hidden" name="htipocambio" id="htipocambio" runat="server"/>
                                <input type="hidden" name="hconfigtipocambio" id="hconfigtipocambio" runat="server"/>
                                <input type="hidden" name="htotal" id="htotal" runat="server"/>
                                <input type="hidden" name="hpropina" id="hpropina" runat="server" value="0"/>
                                <input type="hidden" name="hmotorizado" id="hmotorizado" runat="server"/>
                                <input type="hidden" name="htecladovisualiza" id="htecladovisualiza" runat="server"/>
                                <input type="hidden" name="hmoneda" id="hmoneda" runat="server"/>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">                                    
                                    <div class="row">
                                        <div class="col-lg-4"><span>Por Pagar (</span><span id="smoneda01"></span>)</div>
                                        <div class="col-lg-4"><span>Vuelto (</span><span id="smoneda02"></span>)</div>
                                        <div class="col-lg-4"><span>Total a Pagar (</span><span id="smoneda03"></span>)</div>
                                    </div>
                    
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <input type="text" name="porpagar" id="porpagar" disabled="disabled" class="form-control input-number-pago-red" value="0.00" runat="server"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="vuelto" id="vuelto" disabled="disabled" class="form-control input-number-pago-black" value="0.00" runat="server"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="totalpago" id="totalpago" disabled="disabled" class="form-control input-number-pago-black" value="0.00" runat="server"/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col"><hr /></div>
                                    </div>

                                    <div class="row" id="dcontadofila01">
                                        <div class="col-lg-4">
                                            <span>Efectivo</span>
                                        </div>
                                        <div class="col-lg-4">
                                        </div>
                                        <div class="col-lg-4">
                                            <span>Monto por pagar (</span><span id="smoneda04"></span>)
                                        </div>
                                    </div>
                                    <div class="row" id="dcontadofila02">
                                        <div class="col-lg-4">
                                            <input type="button" id="btndel" name="btndel" value="DEL" class="btn btn-danger btn-tot"/>
                                            <input type="button" id="btntot" name="btntot" value="(T)OT" class="btn btn-dark btn-tot"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <%--<input type="text" name="efectivousdmonto" id="efectivousdmonto" maxlength="12" class="form-control requerido" value="0.00" style="font-size:28px;text-align:right" runat="server" onkeypress="return isNumberKey(event)"/>--%>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="efectivolocalmonto" id="efectivolocalmonto" maxlength="12" class="form-control requerido input-number-pago-black" value="0.00" runat="server" onkeypress="return isNumberKey(event)"/>
                                            <p class="card-text"><small class="text-red">(1) Ingrese el monto a pagar</small></p>
                                        </div>
                                    </div>
                                    <div class="row" id="dcontadofila03">
                                        <div class="col-lg-12">
                                            <input type="button" id="btn1" name="btn1" value="1" class="btn btn-secondary btn-billete" />
                                                
                                            <input type="button" id="btn2" name="btn2" value="2" class="btn btn-secondary btn-billete" />
                                                
                                            <input type="button" id="btn5" name="btn5" value="5" class="btn btn-secondary btn-billete" />
                                                
                                            <input type="button" id="btn10" name="btn10" value="10" class="btn btn-success btn-billete" />
                                                
                                            <input type="button" id="btn20" name="btn20" value="20" class="btn btn-success btn-billete" />
                                                
                                            <input type="button" id="btn50" name="btn50" value="50" class="btn btn-success btn-billete" />

                                            <input type="button" id="btn100" name="btn100" value="100" class="btn btn-success btn-billete" />

                                            <input type="button" id="btn200" name="btn200" value="200" class="btn btn-success btn-billete" />
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col"><hr /></div>
                                    </div>

                                    <div class="row" id="dcontadofila04">
                                        <div class="col-lg-4">
                                            <span>Otro Medio de Pago</span>
                                        </div>
                                        <div class="col-lg-4">
                                            <span>Num Operación</span>
                                        </div>
                                        <div class="col-lg-4">
                                            <span>Monto</span>
                                        </div>
                                    </div>

                                    <div class="row" id="dcontadofila05">
                                        <div class="col-lg-4">
                                            <select id="cbotipopago1" name="cbotipopago1" class="form-control"></select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="numerooperacion1" id="numerooperacion1" class="form-control input-number-pago-black" style="font-size:28px;width:140px"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="montootro1" id="montootro1" class="form-control input-number-pago-black" value="0.00" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>
                                    <div class="row" id="dcontadofila06">
                                        <div class="col-lg-4">
                                            <select id="cbotipopago2" name="cbotipopago2" class="form-control"></select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="numerooperacion2" id="numerooperacion2" class="form-control input-number-pago-black" style="font-size:28px;width:140px"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="montootro2" id="montootro2" class="form-control input-number-pago-black" value="0.00" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>

                    
                                    <div class="row" id="dcontadofila07">
                                        <div class="col-lg-4">
                                            <select id="cbotipopago3" name="cbotipopago3" class="form-control"></select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="numerooperacion3" id="numerooperacion3" class="form-control input-number-pago-black" style="font-size:28px;width:140px"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="montootro3" id="montootro3" class="form-control input-number-pago-black" value="0.00" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>
                                    <div class="row" id="dcontadofila08">
                                        <div class="col-lg-4">
                                            <select id="cbotipopago4" name="cbotipopago4" class="form-control"></select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="numerooperacion4" id="numerooperacion4" class="form-control input-number-pago-black" style="font-size:28px;width:140px"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="montootro4" id="montootro4" class="form-control input-number-pago-black" value="0.00" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Documento</span>
                                        </div>
                                        <div class="col-lg-8">
                                            <input type="text" name="numerodocumento" id="numerodocumento" readonly="readonly" runat="server"  class="form-control"  />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Nombre</span>
                                        </div>
                                        <div class="col-lg-8">
                                            <input type="text" name="nombre" id="nombre" readonly="readonly"  runat="server" class="form-control"  />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Dirección</span>
                                        </div>
                                        <div class="col-lg-8">
                                            <input type="text" name="direccion" id="direccion" readonly="readonly"  class="form-control" runat="server" />
                                        </div>
                                    </div>
                   
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Ubigeo</span>
                                        </div>
                                        <div class="col-lg-8">
                                            <input type="text" name="ubigeo" id="ubigeo" readonly="readonly"  class="form-control" runat="server" />
                                        </div>
                                    </div>
                   
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Fijo</span>
                                        </div>
                                        <div class="col-lg-8">
                                            <input type="text" name="telefonofijo" id="telefonofijo" readonly="readonly" runat="server" class="form-control" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Celular</span>
                                        </div>
                                        <div class="col-lg-8">
                                            <input type="text" name="telefonocelular" id="telefonocelular" readonly="readonly" runat="server" class="form-control" />
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>
                       
                    </div>
                    <!-- /.card -->
                </div>
            </section>
            <!-- /.content -->
        </div>

        <div class="modal" id="dialogmotorizado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Cambio de Motorizado</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <select id="cbomotorizado" name="cbomotorizado" class="form-control"></select>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelarcambiomotorizado();" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarcambiomotorizado();" value="Grabar" title="Grabar"   />
                       
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
    <script src="../../../plugins/jquery/puntoventa/PuntoPago05/jquery.nuevoweb-3.0.0.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html>