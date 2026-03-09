<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Persona.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Edición de Persona</title>

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
  <link href="../../../Content/style_custom_v50.5.css" rel="stylesheet" />
  <%--<link rel="stylesheet" href="../../../Content/style_custom_v3.4.css" />
  <link rel="stylesheet" href="../../../Content/style_custom_number.css" />--%>

</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem">
                <asp:Literal ID="lblubicacion" runat="server"></asp:Literal>|
                <asp:Literal ID="lblempleado" runat="server"></asp:Literal>
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card">

                    <div class="card-body">

                        <div class="container-fluid">
                            <div class="row">                               
                                <div class="col-6">
                                    <input type="hidden" name="hmobile" id="hmobile" value="" runat="server"/>
                                    <input type="hidden" name="hid" id="hid" runat="server"/>
                                    <input type="hidden" name="hempleado" id="hempleado" runat="server"/>
                                    <input type="hidden" name="hidubicacion" id="hidubicacion" runat="server"/>
                                    <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                                    <input type="hidden" name="hidcaja" id="hidcaja" runat="server"/>
                                    <input type="hidden" name="hacceso" id="hacceso" runat="server"/>
                                    <input type="hidden" name="hcaja" id="hcaja" runat="server"/>
                                    <input type="hidden" name="hserie" id="hserie" runat="server"/>
                                    <input type="hidden" name="himpresora" id="himpresora" runat="server"/>
                                    <input type="hidden" name="hentrega" id="hentrega" runat="server"/>
                                    <input type="hidden" name="hpagado" id="hpagado" runat="server"/>
                                    <input type="hidden" name="hpedidocomensales" id="hpedidocomensales" runat="server"/>
                                    <input type="hidden" name="hpagina" id="hpagina" runat="server"/>
                                    <input type="hidden" name="hvalido" id="hvalido" runat="server"/>
                                    <input type="hidden" name="htecladovisualiza" id="htecladovisualiza" runat="server"/>
                                    <input type="hidden" name="haperturacaja" id="haperturacaja" runat="server"/>

                                </div>

                                <div class="col-6">
									<div class="d-flex flex-row justify-content-end p-1">
										<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                            <div class="btn-group mr-2" role="group" aria-label="First group">
												<button type="button" class="btn btn-success" id="btngrabar" title="Grabar">
													<i class="fas fa-save"></i> Grabar
												</button>
											</div>
											<div class="btn-group mr-2" role="group" aria-label="First group">
												<button type="button" class="btn btn-secondary" id="btncancelar" title="Retornar">
													<i class="fas fa-undo"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
                            </div>
                            <div class="row">
                                <br />
                            </div>

							<div class="row">
                                <div class="col-lg-4"></div>
                                <div class="col-lg-4 d-flex justify-content-center">
                                    <h4>
                                        <strong>Personas
                                        </strong>
                                    </h4>
                                </div>
                                <div class="col-lg-4"></div>
                            </div>

                            <div class="row">
                                <div class="col-lg-5"></div>
                                <div class="col-lg-2 d-flex justify-content-center">
                                    <input type="text" autofocus="autofocus" name="personas" id="personas" onkeypress="return isNumberEnter(event)" class="form-control" style="font-size:48px;height:60px !important; text-align:center"  placeholder="0" />
                                </div>
                                <div class="col-lg-5"></div>
                            </div>

                            <br />

                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-header" id="headingThree">
                                        <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            Extendido
                                        </button>
                                        </h5>
                                    </div>
                                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <h4>
                                                    <strong>Sexo
                                                    </strong>
                                                </h4>
                                            </div>
                               
                                            <div class="col-lg-3">
                                                <label class="form-label">Hombres</label>
                                                <input type="text" id="hombres" onkeypress="return isNumber(event)" runat="server" class="form-control" placeholder="0" />
                                            </div>
                                            <div class="col-lg-3">
                                                <label class="form-label">Mujeres</label>
                                                <input type="text" id="mujeres" onkeypress="return isNumber(event)" runat="server" class="form-control"  placeholder="0" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <h4>
                                                    <strong>Edades
                                                    </strong>
                                                </h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <label class="form-label">Niños</label>
                                                <input type="text" id="ninos" onkeypress="return isNumber(event)" runat="server" class="form-control" placeholder="0" />
                                            </div>
                                            <div class="col-lg-3">
                                                <label class="form-label">Adultos</label>
                                                <input type="text" id="adultos" onkeypress="return isNumber(event)" runat="server" class="form-control"  placeholder="0" />
                                            </div>
                                            <div class="col-lg-3">
                                                <label class="form-label">Ancianos</label>
                                                <input type="text" id="ancianos" onkeypress="return isNumber(event)" runat="server" class="form-control"  placeholder="0" />
                                            </div>  
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- /.card-body -->

                        <!-- /.card-footer-->
                    </div>
                    <!-- /.card -->
                </div>
				
            </section>
            <!-- /.content -->
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
	<!-- SweetAlert2 -->
	<script src="../../../plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- Toastr -->
	<script src="../../../plugins/toastr/toastr.min.js"></script>

    <script src="../../../Scripts/jquery.keyboard.js"></script>
    <script src="../../../Scripts/jquery.keyboard.extension-all.js"></script>

	<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
	<script src="../../../plugins/jquery/puntoventa/Persona/jquery.nuevoweb-1.1.8.js"></script>

	<!-- AdminLTE App -->
	<script src="../../../dist/js/adminlte.min.js"></script>

    <style>
        .ui-widget{font-size:1.5em !important;}
    </style>
</body>
</html> 