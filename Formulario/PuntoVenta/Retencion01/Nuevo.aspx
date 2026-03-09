<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Retencion01.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Nuevo Pedido</title>

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

    
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="row margin-top-05">
            <div class="col-sm-1">
                <select  name="cboindicador" id="cboindicador" class="form-control">
                </select>
            </div>
            <div class="col-sm-1">
                <select  name="cboserie" id="cboserie" class="form-control" ></select>
            </div>
            <div class="col-sm-1">
                <input type="text" name="correlativo" id="correlativo" maxlength="8" value="0" class="form-control" placeholder="CORRELATIVO" onkeypress="return isNumberKeyOnly(event);" />
            </div>
            <div class="col-sm-1">
                 Moneda
            </div>
            <div class="col-sm-2">
                <select  name="cbomoneda" id="cbomoneda" class="form-control">
                    <option value="PEN">Soles</option>
                    <option value="USD">Dolares</option>
                </select>
             </div>

            <div class="col-sm-1">
                <input type="hidden" name="hidcliente" id="hidcliente" runat="server"/>
                <input type="hidden" name="htipo" id="htipo" runat="server"/>
                <input type="hidden" name="husuario" id="husuario" runat="server"/>
                <input type="text" name="idcliente" id="idcliente" style="width:100px" maxlength="11" value="99999999" class="form-control" placeholder="RUC/DNI" />
            </div>
            <div class="col-sm-2">
                <input type="text" name="cliente" id="cliente" readonly="readonly" class="form-control" placeholder="Nombre" />
            </div>
            <div class="col-sm-1">
                Fecha
            </div>
            <div class="col-sm-1">
                <input name="fecha" id="fecha" style="width:100px;text-align:center" maxlength="10" class="form-control input-normal" />
            </div>
            <div class="col-sm-1">
                <input type="button" id="btnnuevo" name="btnnuevo" class="btn btn-warning" value="Nuevo" />
            </div>
         </div>
        <div class="row margin-top-05">
            <div class="col-sm-1">
                Vendedor
                <input type="hidden" name="idempleado" id="idempleado" value="<%:this.ViewState["usuario_documento"].ToString()%>" />
            </div>
            <div class="col-sm-2">
                <select  name="cbovendedor" id="cbovendedor" class="form-control">
                </select>
            </div>
            <div class="col-sm-1">
                Forma Pago
            </div>
            <div class="col-sm-2">
                <select  name="cboformapago" id="cboformapago" class="form-control">
                    <option value="Contado">Contado</option>
                    <option value="Credito">Credito</option>
                </select>
            </div>
            <div class="col-sm-1">
                 <select  name="cbomediopago" id="cbomediopago" class="form-control" >
                     <option value="Efectivo">Efectivo</option>
                     <option value="Visa">Visa</option>
                     <option value="Mastercard">Mastercard</option>
                 </select>
            </div>
            <div class="col-sm-2">
                <input type="text" name="numerooperacion" id="numerooperacion" maxlength="10" class="form-control input-normal" placeholder="Numero de Operación" readonly="readonly"  />
            </div>
            <div class="col-sm-1">
                T.C
            </div>
            <div class="col-sm-1">
                <input type="text" name="cambio_venta" id="cambio_venta" readonly="readonly" style="width:100px;text-align:right" maxlength="10" class="form-control input-normal"  />
            </div>
            <div class="col-sm-1">
                <input type="button" id="btngrabar" name="btngrabar" class="btn btn-success" value="Grabar" disabled="disabled"/>
            </div>
        </div>

        

        <div class="row margin-top-05">
             <div class="col-sm-1">
                Impresora   
             </div>
            <div class="col-sm-2">
                <select  name="cboimpresora" id="cboimpresora" class="form-control" ></select>
            </div>
             <div class="col-sm-1">
                <p id="cuota1" style="color:red;font-weight:bold">Cuota 1</p>
             </div>
             <div class="col-sm-2">
                <div class="row">
                    <div class="col-sm-6">
                        <input type="text" name="cuota001" id="cuota001" style="width:80px ;text-align:right" value="0" class="form-control" onkeypress="return isNumberKey(event,this)" placeholder="Cuota 1"/>
                    </div>
                    <div class="col-sm-6">
                        <input name="fecha001" id="fecha001" style="width:100px;text-align:center" maxlength="10" class="form-control input-normal" />
                    </div>
                </div>
              </div>
              <div class="col-sm-1">
                  <p id="cuota2" style="color:red;font-weight:bold">Cuota 2</p>
              </div>
              <div class="col-sm-2"> 
                  <div class="row">
                    <div class="col-sm-6">
                        <input type="text" name="cuota002" id="cuota002" style="width:80px ;text-align:right" value="0" class="form-control" onkeypress="return isNumberKey(event,this)" placeholder="Cuota 2"/>
                    </div>
                    <div class="col-sm-6">
                        <input name="fecha002" id="fecha002" style="width:100px;text-align:center" maxlength="10" class="form-control input-normal" />
                    </div>
                   </div>
              </div>
              <div class="col-sm-1">
                
              </div>
              <div class="col-sm-1" style="text-align:right">
                  <a href="#" onclick="imprimir();">
                    <img src="../../../icons/normal/printer.png" title="Imprimir" alt="Imprimir"/>
                  </a>
                  <input type="hidden" name="higv" id="higv"/>
                  <input type="hidden" name="id" id="id" value="0"/>
                  <input type="hidden" name="documento" id="documento" value="0"/>
              </div>
              <div class="col-sm-1">
                  <input type="button" id="btncancelar" name="btncancelar" class="btn btn-danger"  value="Volver"/>
              </div>
        </div>

        <div class="row margin-top-05" id="divnc">
              <div class="col-sm-3">
                  <p id="P1" style="color:red;font-weight:bold">Documento Afecto</p>
              </div>
              <div class="col-sm-2">
                <select  name="cbotipo_referencia" id="cbotipo_referencia" class="form-control" style="border-color:red" >
                    <option value="0">[Seleccionar]</option>
                    <option value="03">Boleta</option>
                    <option value="01">Factura</option>
                </select>
              </div>
              <div class="col-sm-2">
                <input type="text" name="dreferencia" id="dreferencia" style="width:100px;border-color:red" maxlength="10" class="form-control" placeholder="Referencia"  />
              </div>
              <div class="col-sm-2"> 
                <select  name="cbomotivo_referencia" id="cbomotivo_referencia" class="form-control" style="border-color:red" >
                    <option value='0'>[Seleccionar]</option>
                    <option value='01'>Anulación de la operación</option>
                    <option value='02'>Anulación por error en el RUC</option>
                    <option value='03'>Corrección por error en la descripción</option>
                    <option value='04'>Descuento global</option>
                    <option value='05'>Descuento por ítem</option>
                    <option value='06'>Devolución total</option>
                    <option value='07'>Devolución por ítem</option>
                    <option value='08'>Bonificación</option>
                    <option value='09'>Disminución en el valor</option>
                    <option value='10'>Otros Conceptos </option>
                    <option value='11'>Ajustes de operaciones de exportación</option>
                    <option value='12'>Ajustes afectos al IVAP</option>
                    <option value='13'>Ajustes – montos y/o fechas de pago</option>
                </select>
              </div> 
              <div class="col-sm-3"></div>
        </div>

        <div class="row margin-top-05">
            <div class="col-sm-12">
                <table id="tbldetalle" class="table table-bordered table-hover"></table>
            </div>
        </div>
        
       
    </form>

    <!-- jQuery -->
    <script src="../../../plugins/jquery/jquery.min.js"></script>
    <script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../../../plugins/jquery-blockuid/jquery.blockUI.min.js"></script>

    <!-- Bootstrap 4 -->
    <script src="../../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../../plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="../../../plugins/jquery-validation/additional-methods.min.js"></script>


    <link href="../../../Content/table.css" rel="stylesheet" type="text/css" />
    <link href="../../../dataTables/datatables.min.css" type="text/css" rel="stylesheet"/>
    <link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <script type="text/javascript" src="../../../dataTables/datatables.min.js"></script>
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
    <script src="../../../plugins/jquery/puntoventa/puntoventa01/jquery.nuevoweb-1.3.3.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>

<style>
    .form-control {
        height: 24px;
        padding:1px;
    }

    .btn
    {
        padding:3px;
    }

    table.dataTable td {
      font-size: .8em;
      /*padding: .25rem;*/
    }

    .table td
    {
        padding: 1px;
    }

    .table th
    {
        padding: 1px;
    }

    table.dataTable th {
      font-size: .8em;
      text-align:center;
      padding: .25rem;
	  background:#FFC312;
    }

    .dataTables_info {
        font-size: .8em;
    }

    .paginate_button {
        font-size: .8em;
    }

    .addNewRecord {
        background-color: white !important;
    }

	.btn-secondary{
		margin-right :20px;
	}
</style>
</body>
</html>