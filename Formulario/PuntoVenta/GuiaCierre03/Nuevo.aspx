<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaCierre03.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Guia Cierre</title>

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
  <link rel="stylesheet" href="../../../Content/style_custom_v3.2.css" />

  <link rel="stylesheet" href="../../../plugins/bootstrap-select/css/bootstrap-select.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem"> 
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>||
                        
                        <a href="#"><img src="../../../Img/VolverF40.png" title="Volver" class="img-thumbnail float-right" onclick="retornar();" /></a>
                        <a href="#"><img src="../../../Img/Actualizar40.png" title="Actualizar" class="img-thumbnail float-right" onclick="actualizar();" /></a>
                        <a href="#"><img src="../../../Img/Grabar40.png" title="Grabar" class="img-thumbnail float-right" onclick="generar();" /></a>

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
                                <input type="hidden" name="hid" id="hid" runat="server"/>
                                <input type="hidden" name="htipo" id="htipo" runat="server"/>

                               <input type="hidden" name="hidcliente" id="hidcliente" runat="server"/>
                               <input type="hidden" name="hidtransportista" id="hidtransportista" runat="server"/>
                               <input type="hidden" name="hidproveedor" id="hidproveedor" runat="server"/>
                            </div>
                          
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4>
                                        <strong>Principal
                                        </strong>
                                    </h4>
                                </div>
                            </div>

                             <div class="row">

                                <div class="col-lg-2">
                                    <label class="form-label">Fecha Traslado</label>
									<div class="input-group date" id="fechatraslado" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" data-target="#fechaentrega" id="dfechatraslado" name="dfechatraslado" readonly="readonly" />
										<div class="input-group-append">
											<div class="input-group-text"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
                                    
								</div>
                                <div class="col-lg-1">
                                    <label class="form-label">Hora</label>
                                    <input type="time" id="horatraslado" name="horatraslado" min="00:00" max="23:59" value="00:00" class="form-control" required="required" />
                                </div>

                                <div class="col-lg-2">
                                    <label class="form-label">Fecha Destino</label>
									<div class="input-group date" id="fechaentrega" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" data-target="#fechaentrega" id="dfechaentrega" name="dfechaentrega" readonly="readonly" />
										<div class="input-group-append">
											<div class="input-group-text"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
                                    
								</div>
                                <div class="col-lg-1">
                                    <label class="form-label">Hora</label>
                                    <input type="time" id="horaentrega" name="horaentrega" min="00:00" max="23:59" value="00:00" class="form-control" />
                                </div>

                                <div class="col-lg-3">
                                    <label class="form-label">Parámetros</label>
                                    <select id="cboparametros"  class="form-control selectpicker" multiple data-live-search="true">
                                        <option value="SUNAT_Envio_IndicadorRetornoVehiculoVacio">Retorno de Vehículo Vacío</option>
                                        <option value="SUNAT_Envio_IndicadorRetornoVehiculoEnvaseVacio">Retorno con Envases Vacíos</option>
                                        <option value="SUNAT_Envio_IndicadorTransbordoProgramado">Transbordo Programado</option>
                                        <option value="SUNAT_Envio_IndicadorTrasladoVehiculoM1L">Vehículos Categoría M1 o L</option>
                                        <option value="SUNAT_Envio_IndicadorTrasladoTotalDAMoDS">Traslado total (DAM o DS)</option>
                                        <option value="SUNAT_Envio_IndicadorVehiculoConductoresTransp">Datos del Transportista</option>
                                    </select>
                                </div>
                                
                                <div class="col-lg-3">
                                    <label class="form-label">Motivo</label>
                                    <select id="cbomotivo" class="form-control" runat="server" required="required"></select>
                                </div>

                                 <div class="col-lg-3">
                                    <label class="form-label">Traslado</label>
                                    <select id="cbotraslado" class="form-control" runat="server" required="required">    
                                        <option value="0">[Ninguno]</option>
                                        <option value="02">Transporte privado</option>
                                        <option value="01">Transporte público</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <br />
                            </div>

                            <div class="row" id="divcliente">
                                <div class="col-lg-12">
                                    <h4>
                                        <strong>Cliente
                                        </strong>
                                    </h4>
                                 </div>
                                 <div class="col-lg-3">
                                    <label for="cbotipodocumento">Tipo</label>
                                    <select class="form-control" id="cbotipodocumento" name="cbotipodocumento" runat="server"></select>
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Numero</label>
                                    <input type="text" id="numero" class="form-control" maxlength="15" runat="server"/>
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" id="nombre" class="form-control" runat="server"/>
                                </div>

                                <div class="col-lg-3">
                                    <label class="form-label">Entrega</label>
                                    <select id="cboentrega" class="form-control" runat="server">                                       
                                    </select>
                                </div>
                            </div>

                            <div class="row" id="divproveedor">
                                <div class="col-lg-12">
                                    <h4>
                                        <strong>Proveedor
                                        </strong>
                                    </h4>
                                 </div>
                                 <div class="col-lg-3">
                                    <label for="cbotipodocumento">Tipo</label>
                                    <select class="form-control" id="cbotipodocumentop" name="cbotipodocumentop" runat="server"></select>
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Numero</label>
                                    <input type="text" id="numerop" class="form-control" maxlength="15" runat="server" />
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" id="nombrep" class="form-control" runat="server" />
                                </div>

                                <div class="col-lg-3">
                                    <label class="form-label">Recojo</label>
                                    <select id="cboentregar" class="form-control" runat="server" >                                       
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <br />
                            </div>

                            <div class="row" id="divtransporte">
                                <div class="col-lg-12">
                                    <h4>
                                        <strong>Transporte
                                        </strong>
                                    </h4>
                                </div>


                                <div class="col-lg-3">
                                    <label class="form-label">Transporte</label>
                                    <select id="cbotransporte" class="form-control" runat="server" required="required">
                                       
                                    </select>
                                </div>
                            
                                <div class="col-lg-3">
                                    <label class="form-label">Conductor</label>
                                    <select id="cboconductor" class="form-control" runat="server" required="required">                                       
                                    </select>
                                </div>
                            </div>
                           
                            <div class="row" id="divtransportista">
                                <div class="col-lg-12">
                                    <h4>
                                        <strong>Transportista
                                        </strong>
                                    </h4>
                                </div>

                                <div class="col-lg-3">
                                    <label for="cbotipodocumentot">Tipo</label>
                                    <select class="form-control" id="cbotipodocumentot" name="cbotipodocumentot" runat="server"></select>
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Numero</label>
                                    <input type="text" id="numerot" class="form-control"  maxlength="15" runat="server"/>
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Nombre</label>
                                    <input type="text" id="nombret" class="form-control" runat="server"/>
                                </div>

                                 <div class="col-lg-3">
                                    <label class="form-label">Entrega</label>
                                    <select id="cboentregat" class="form-control" runat="server" >                                       
                                    </select>
                                </div>

                                <div class="col-lg-3">
                                    <label class="form-label">Registro MTC</label>
                                    <input type="text" id="registromtct" class="form-control" runat="server"/>
                                </div>
                                
                            </div>
                            <div class="row">
                                <br />
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4>
                                        <strong>Carga
                                        </strong>
                                    </h4>
                                </div>
                                 
                                <div class="col-lg-3" id="divalmaceno">
                                    <label class="form-label">Almacen Origen</label>
                                    <select id="cboalmaceno" name="cboalmacen" class="form-control"></select>
                                </div>

                                <div class="col-lg-3" id="divalmacend">
                                    <label class="form-label">Almacen Destino</label>
                                    <select id="cboalmacend" name="cboalmacen" class="form-control"></select>
                                </div>

                                <div class="col-lg-3">
                                    <label class="form-label">Unidad</label>
                                    <select id="cbounidad" class="form-control" runat="server" required="required">
                                       
                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label class="form-label">Peso Bruto</label>
                                    <input type="text" name="cantidad" id="cantidad" value="" maxlength="7" class="form-control" onkeypress="return isNumberKey(event)" required="required" runat="server"/>
                                </div>
                            
                                <div class="col-lg-3">
                                    <label class="form-label">N° Bultos</label>
                                    <input type="text" name="bultos" id="bultos" value=""  maxlength="7" class="form-control" onkeypress="return isNumber(event)" required="required" runat="server"/>
                                </div>

                                

                                <div class="col-lg-12">
                                    <label class="form-label">Observación</label>
                                    <input type="text" name="observacion" id="observacion" value="" maxlength="250" class="form-control" runat="server"/>
                                </div>
                            </div>

                         

                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </section>
            <!-- /.content -->
        </div>

        <div class="modal" id="dialoggenerar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
					    <h3 class="modal-title" style="color:black">Guias de Remisión</h3>
					    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				    </div>
				    <div class="modal-body">
                        Esta seguro de generar la guía de remisión?
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                        <input type="button" class="btn btn-success" id="btngenerar" onclick="this.disabled='true';grabar();" value="Generar" title="Generar"   />
                       
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
    <script src="../../../plugins/jquery/puntoventa/guiacierre03/jquery.nuevoweb-1.1.1.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html>     