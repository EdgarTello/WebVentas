<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoPago22.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Pago</title>

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
  <link rel="stylesheet" href="../../../Content/style_custom_number.css"  />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem"> 
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Literal ID="lblentrega" runat="server"></asp:Literal>|||
                        <asp:Literal ID="lblcliente" runat="server"></asp:Literal>|||
                        <asp:Literal ID="lbltipocambio" runat="server"></asp:Literal>|||
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>|||
                        <a href="#" style="color:black"  id="datos"></a>
                        <a href="#"><img src="../../../Img/VolverF40.png" title="Volver" class="img-thumbnail float-right" onclick="retornar();" /></a>
                        <a href="#"><img src="../../../Img/Actualizar40.png" title="Actualizar" class="img-thumbnail float-right" onclick="actualizar();" /></a>
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
                                <div class="col-lg-6">
                                    <div class="row">
                                        <h3>Forma Pago</h3>
                                        <input type="hidden" name="hmobile" id="hmobile" value="0" runat="server"/>
                                        <input type="hidden" name="hid" id="hid" runat="server"/>
                                        <input type="hidden" name="hentrega" id="hentrega" runat="server"/>
                                        <input type="hidden" name="hpagina" id="hpagina" runat="server"/>
                                        <input type="hidden" name="htipo" id="htipo" runat="server"/>
                                        <input type="hidden" name="htipodocumento" id="htipodocumento" runat="server"/>
                                        <input type="hidden" name="htipocambio" id="htipocambio" runat="server"/>
                                        <input type="hidden" name="htotal" id="htotal" runat="server"/>
                                        <input type="hidden" name="hfechanac" id="hfechanac" runat="server"/>
                                        <input type="hidden" name="hfecha" id="hfecha" runat="server"/>
                                        <input type="hidden" name="hmoneda" id="hmoneda" runat="server"/>

                                        <input type="hidden" name="hclientenombre" id="hclientenombre" runat="server"/>
                                        <input type="hidden" name="hclienteemail" id="hclienteemail" runat="server"/>
                                        <input type="hidden" name="hidentrega" id="hidentrega" runat="server"/>
                                        <input type="hidden" name="hdireccion" id="hdireccion" runat="server"/>
                                        <input type="hidden" name="hreferencia" id="hreferencia" runat="server"/>
                                        <input type="hidden" name="hdistrito" id="hdistrito" runat="server"/>
                                        <input type="hidden" name="hprovincia" id="hprovincia" runat="server"/>
                                        <input type="hidden" name="hdepartamento" id="hdepartamento" runat="server"/>
                                        <input type="hidden" name="htelefonofijo" id="htelefonofijo" runat="server"/>
                                        <input type="hidden" name="htelefonocelular" id="htelefonocelular" runat="server"/>
                                        <input type="hidden" name="hefectivosolesmonto" id="hefectivosolesmonto" runat="server"/>

                                        <input type="hidden" name="hdocumentoimpresionfisico" id="hdocumentoimpresionfisico" runat="server"/>
                                        <input type="hidden" name="hdocumentoimpresionweb" id="hdocumentoimpresionweb" runat="server"/>
                                        <input type="hidden" name="hcolumnasimpresionticket" id="hcolumnasimpresionticket" runat="server"/>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6"><span>Total A Pagar (</span><span id="smoneda02"></span>)</div>
                                        <div class="col-lg-6">
                                            <input type="text" name="totalpago" id="totalpago" disabled="disabled" class="form-control" value="0.00" style="font-size:28px;text-align:right" runat="server"/>
                                        </div>
                                    </div>
                                    <div class="row" id="dcontadofila01">
                                        <div class="col-lg-4">
                                        </div>
                                        <div class="col-lg-4">
                                            
                                        </div>
                                        <div class="col-lg-4">
                                            <span>Efectivo(</span><span id="smoneda04"></span>)
                                        </div>
                                    </div>
                                    <div class="row" id="dcontadofila02">
                                        <div class="col-lg-4">
                                            
                                        </div>
                                        <div class="col-lg-4">
                                            
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="efectivosolesmonto" id="efectivosolesmonto" maxlength="12" class="form-control" style="font-size:28px;background-color:darksalmon;text-align:right" runat="server" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>
                                    <div class="row" id="dcontadofila03">
                                        <div class="col-lg-12">
                                            <input type="button" id="btndel" name="btndel" value="DEL" class="btn btn-danger float-left" style="width:70px; padding:0.75rem; height:50px;font-size:22px" />
                                       
                                            <input type="button" id="btn10" name="btn10" value="10" class="btn btn-secondary float-right" style="width:70px; padding:0.75rem; height:50px;font-size:22px" />
                                            
                                            <input type="button" id="btn20" name="btn20" value="20" class="btn btn-info float-right" style="width:70px; padding:0.75rem; height:50px;font-size:22px" />
                                        
                                            <input type="button" id="btn50" name="btn50" value="50" class="btn btn-secondary float-right" style="width:70px; padding:0.75rem; height:50px;font-size:22px" />
                                        
                                            <input type="button" id="btn100" name="btn100" value="100" class="btn btn-info float-right" style="width:70px; padding:0.75rem; height:50px;font-size:22px" />
                                        
                                            <input type="button" id="btn200" name="btn200" value="200" class="btn btn-secondary float-right" style="width:70px; padding:0.75rem; height:50px;font-size:22px" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <br />
                                    </div>
                                    <div class="row" id="dcontadofila04">
                                        <div class="col-lg-4">
                                            <span>Medio de pago</span>
                                        </div>
                                    </div>
                                    <div class="row" id="dcontadofila05">
                                        <div class="col-lg-6">
                                            <select id="cbotipopago1" name="cbotipopago1" class="form-control"></select>
                                        </div>
                                        <div class="col-lg-6">
                                            <input type="text" name="montootro1" id="montootro1" class="form-control" placeholder="0.00" style="font-size:28px;text-align:right" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>
                                    
                                    <div class="row"><br /></div>
                    
                                    <div class="row" id="dcontadofila07">
                                        <div class="col-lg-6">
                                            <select id="cbotipopago3" name="cbotipopago3" class="form-control"></select>
                                        </div>
                                        <div class="col-lg-6">
                                            <input type="text" name="montootro3" id="montootro3" class="form-control" placeholder="0.00" style="font-size:28px;text-align:right" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>
                                    
                                    <div class="row"><br /></div>

                                    <div class="row">
                                        <div class="col-lg-6"><span>Total General (</span><span id="smoneda01"></span>)</div>
                                       <div class="col-lg-6">
                                            <input type="text" name="totalefectivo" id="totalefectivo" disabled="disabled" class="form-control" value="0.00" style="font-size:28px;text-align:right" />
                                        </div>
                                   </div>

                                    

                                    <div class="row">
                                        <div class="col-lg-6"><span>Vuelto (</span><span id="smoneda03"></span>)</div>
                                        <div class="col-lg-6">
                                            <input type="text" name="vuelto" id="vuelto" disabled="disabled" class="form-control" value="0.00" style="font-size:28px;text-align:right" />
                                        </div>
                                    </div>
                                    <div class="row"><br /></div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="row">
                                        <h3>Cliente</h3>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Tipo</span>
                                        </div>
                                        <div class="col-lg-8">
                                            <select id="cbotipodocumento" name="cbotipodocumento" class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Documento</span>
                                        </div>
                                        <div class="col-lg-8">
                                            <input type="hidden" name="hidcliente" id="hidcliente" runat="server" value="0"/>
                                            <input type="text" name="numerodocumento" id="numerodocumento" runat="server"  onkeypress="return isNumberKey(event)" class="form-control"  />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Nombre</span>
                                        </div>
                                        <div class="col-lg-8">
                                            <input type="text" name="nombre" id="nombre"  runat="server" class="form-control"  />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Celular</span>
                                        </div>
                                        <div class="col-lg-8">
                                            <input type="text" name="telefonocelular" id="telefonocelular" maxlength="9"  class="form-control" onkeypress="return isNumberKey(event);" placeholder="999999999"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Correo</span>
                                        </div>
                                        <div class="col-lg-8">
                                             <input type="text" name="email" id="email" maxlength="100" class="form-control" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <br />
                                    </div>
                                    <div class="row justify-content-center">
                                        <input type="button" id="btngrabar" name="btngrabar" class="btn btn-primary" onclick="grabar();" value="Pagar" title="Grabar" style="height:60px;font-size:30px" />
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
    <script src="../../../plugins/jquery/puntoventa/PuntoPago22/jquery.nuevoweb-3.0.0.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>


</body>
</html>