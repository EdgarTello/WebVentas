<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoPago02.Nuevo" %>

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

    <link rel="stylesheet" href="../../../plugins/bootstrap-select/css/bootstrap-select.css" />
    <link rel="stylesheet" href="../../../Content/style_custom_number.css"  />
    <link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body onhashchange="changebody(event)">
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem"> 
                <div class="row">
                    <div class="col-6">
                        <asp:Literal ID="lblentrega" runat="server"></asp:Literal>||
                        <asp:Literal ID="lblcliente" runat="server"></asp:Literal>||
                        <asp:Literal ID="lbltipocambio" runat="server"></asp:Literal>||
                        <asp:Literal ID="lblpedido" runat="server"></asp:Literal>||
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>||
                        <a href="#" style="color:black"  id="datos"></a>
                    </div>
                    <div class="col-6">
                        <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">

                                <div class="btn-group mr-2" role="group" aria-label="Six group">
			                        <b>SHIFT</b>
		                        </div>

                                <button type="button" class="btn btn-outline-danger" id="btnfecha" title="Fecha">
									<i class="fa fa-calendar" aria-hidden="true"></i>
								</button>

                                <div class="btn-group mr-2" role="group" aria-label="Five group" id="ldetraccion" style="visibility:hidden">
			                        <button type="button" class="btn btn-outline-info btn-bold" id="btndetraccion" title="Detracción">D</button>
		                        </div>

                                <div class="btn-group mr-2" role="group" aria-label="Five group" id="lretencion" style="visibility:hidden">
			                        <button type="button" class="btn btn-outline-info btn-bold" id="btnretencion" title="Retención">R</button>
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
                                
                                <input type="hidden" name="hentrega" id="hentrega" runat="server"/>
                                <input type="hidden" name="hpagina" id="hpagina" runat="server"/>
                                <input type="hidden" name="htipo" id="htipo" runat="server"/>
                                <input type="hidden" name="htipodocumento" id="htipodocumento" runat="server"/>
                                <input type="hidden" name="htipocambio" id="htipocambio" runat="server"/>
                                <input type="hidden" name="hconfigtipocambio" id="hconfigtipocambio" runat="server"/>

                                <input type="hidden" name="htotal" id="htotal" runat="server"/>
                                <input type="hidden" name="hfechanac" id="hfechanac" runat="server"/>
                                <input type="hidden" name="hfecha" id="hfecha" runat="server"/>
                                <input type="hidden" name="hfechapedido" id="hfechapedido" runat="server"/>
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
                                <input type="hidden" name="hefectivolocalmonto" id="hefectivolocalmonto" runat="server"/>
                                <input type="hidden" name="hefectivousdmonto" id="hefectivousdmonto" runat="server"/>

                                <input type="hidden" name="hdocumentoimpresionfisico" id="hdocumentoimpresionfisico" runat="server"/>
                                <input type="hidden" name="hdocumentoimpresionweb" id="hdocumentoimpresionweb" runat="server"/>
                                <input type="hidden" name="hcolumnasimpresionticket" id="hcolumnasimpresionticket" runat="server"/>

                                <input type="hidden" name="henviardetraccion" id="henviardetraccion" runat="server"/>
                                <input type="hidden" name="henviarretencion" id="henviarretencion" runat="server"/>
                                <input type="hidden" name="htecladovisualiza" id="htecladovisualiza" runat="server"/>

                                <input type="hidden" name="hmonedacaja" id="hmonedacaja" runat="server"/>
                                <input type="hidden" name="hmonedadefault" id="hmonedadefault" runat="server"/>
                                <input type="hidden" name="hcajarapida" id="hcajarapida" runat="server" value="0"/>
                                <input type="hidden" name="hvendedor" id="hvendedor" runat="server" value="0"/>
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

                                    <div class="row" id="dcuota000" style="display:none">
                                        <div class="col-lg-4">
                                            <label>Días</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="dias" id="dias" class="form-control" maxlength="3" value="0" style="font-size:28px;text-align:right" onkeypress="return isNumber(event)"/>                                            
                                        </div>
                                        <div class="col-lg-4">
                                            <button type="button" class="btn btn-outline-danger" id="btndias" title="Calcular">
										        <i class="fa fa-calculator" aria-hidden="true"></i>
									        </button>
                                        </div>
                                    </div>

                                    <div class="row" id="dcuota001" style="display:none">
                                        <div class="col-lg-4">
                                            <select id="cbocuota1" name="cbocuota1" class="form-control">
                                                <option value="">[Ninguno]</option>
                                                <option value="Cuota001">Cuota001</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input id="fechacuota1" name="fechacuota1" class="form-control input-normal" readonly="readonly"/>
                                            
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="montocuota1" id="montocuota1" class="form-control" maxlength="12" value="0.00" style="font-size:28px;text-align:right" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>

                                    <div class="row" id="dcuota002" style="display:none">
                                        <div class="col-lg-4">
                                            <select id="cbocuota2" name="cbocuota2" class="form-control">
                                                <option value="">[Ninguno]</option>
                                                <option value="Cuota002">Cuota002</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input id="fechacuota2" name="fechacuota2" class="form-control input-normal" readonly="readonly"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="montocuota2" id="montocuota2" class="form-control" maxlength="12" value="0.00" style="font-size:28px;text-align:right" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>


                                    <div class="row" id="dcuota003" style="display:none">
                                        <div class="col-lg-4">
                                            <select id="cbocuota3" name="cbocuota3" class="form-control">
                                                <option value="">[Ninguno]</option>
                                                <option value="Cuota003">Cuota003</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input id="fechacuota3" name="fechacuota3" class="form-control input-normal" readonly="readonly"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="montocuota3" id="montocuota3" class="form-control" maxlength="12" value="0.00" style="font-size:28px;text-align:right" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>

                                    <div class="row" id="dcuota004" style="display:none">
                                        <div class="col-lg-4">
                                            <select id="cbocuota4" name="cbocuota4" class="form-control">
                                                <option value="">[Ninguno]</option>
                                                <option value="Cuota004">Cuota004</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input id="fechacuota4" name="fechacuota4" class="form-control input-normal" readonly="readonly"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="montocuota4" id="montocuota4" class="form-control" maxlength="12" value="0.00" style="font-size:28px;text-align:right" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>

                                    <div class="row" id="dcuota005" style="display:none">
                                        <div class="col-lg-4">
                                            <select id="cbocuota5" name="cbocuota5" class="form-control">
                                                <option value="">[Ninguno]</option>
                                                <option value="Cuota005">Cuota005</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input id="fechacuota5" name="fechacuota5" class="form-control input-normal" readonly="readonly"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="montocuota5" id="montocuota5" class="form-control" maxlength="12" value="0.00" style="font-size:28px;text-align:right" onkeypress="return isNumberKey(event)"/>
                                        </div>
                                    </div>

                                    <div class="row" id="dcuota006" style="display:none">
                                        <div class="col-lg-4">
                                            <select id="cbocuota6" name="cbocuota6" class="form-control">
                                                <option value="">[Ninguno]</option>
                                                <option value="Cuota006">Cuota006</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input id="fechacuota6" name="fechacuota6" class="form-control input-normal" readonly="readonly"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="montocuota6" id="montocuota6" class="form-control" maxlength="12" value="0.00" style="font-size:28px;text-align:right" onkeypress="return isNumberKey(event)"/>
                                        </div>
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
                                            <select id="cbotipodocumento" name="cbotipodocumento" class="form-control">
                                            </select>
                                        </div>
                                        <div class="col-lg-8">
                                            <input type="hidden" name="hidcliente" id="hidcliente" runat="server" value="0"/>
                                            <input type="text" name="numerodocumento" id="numerodocumento" runat="server"  class="form-control requerido input-number-documento-black"  placeholder="Documento" />
                                            <p class="card-text"><small class="text-red">(2) Ingrese el documento y luego de Enter</small></p>                                            
                                        </div>
                                    </div>
                                    <div class="row top5">
                                        <div class="col-lg-12">
                                            <input type="text" name="nombre" id="nombre"  runat="server" class="form-control" placeholder="Nombre" />
                                        </div>
                                    </div>
                                    <div class="row top5">
                                        <div class="col-lg-12">
                                            <input type="text" name="direccion" id="direccion"  class="form-control"  placeholder="Dirección"/>
                                        </div>
                                    </div>
                                    <div class="row top5 ">
                                        <div class="col-lg-12">
                                            <input type="text" name="referencia" id="referencia" maxlength="200"  class="form-control" placeholder="Referencia(Max 200 caracteres)" />
                                        </div>
                                    </div>
                                    <div class="row top5">
                                        <div class="col-lg-4">
                                            <select id="cbodepartamento" name="cbodepartamento" class="form-control"></select>
                                        </div>
                                        <div class="col-lg-4">
                                            <select id="cboprovincia" name="cboprovincia" class="form-control"></select>
                                        </div>
                                        <div class="col-lg-4">
                                            <select id="cbodistrito" name="cbodistrito" class="form-control" placeholder="Max 200 caracteres"></select>
                                        </div>
                                    </div>
                                    <div class="row top5">
                                        <div class="col-lg-6">
                                            <input type="text" name="telefonofijo" id="telefonofijo" maxlength="9"  class="form-control" onkeypress="return isNumberKey(event);" placeholder="Fijo 5555555"/>
                                        </div>
                                        <div class="col-lg-6">
                                            <input type="text" name="telefonocelular" id="telefonocelular" maxlength="9"  class="form-control" onkeypress="return isNumberKey(event);" placeholder="Celular 999999999"/>
                                        </div>
                                    </div>
                                    <div class="row top5">
                                        <div class="col-lg-12">
                                             <input type="text" name="email" id="email" maxlength="200" class="form-control" placeholder="Correo" />
                                        </div>
                                    </div>

                                    <div class="row top5">
                                        <div class="col-lg-12">
                                             <textarea name="glosa" id="glosa" maxlength="200" class="form-control" style="resize:none" placeholder="Observación Max 200 caracteres" ></textarea>
                                        </div>
                                    </div>
                                    <div class="row top5">
                                        <div class="col-lg-6">
                                            <input type="text" name="ordencompra" id="ordencompra"  class="form-control" maxlength="20" placeholder="Orden de Compra"/>
                                        </div>
                                        <div class="col-lg-6">
                                            <input type="text" name="numeroguia" id="numeroguia" class="form-control" maxlength="20" placeholder="Numero de Guia" />
                                        </div>
                                    </div>
                                    <div class="row top5">
                                        <div class="col-lg-4">
                                            <select id="cboformapago" name="cboformapago" class="form-control">
                                                <option value="Contado">Pago Contado</option>
                                                <option value="Credito">Pago Credito</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <select class="form-control selectpicker" data-live-search="true"  id="cbovendedor" name="cbovendedor">
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <select id="cboimprimir" name="cboimprimir" class="form-control">
                                                <option value="1">IMPRIMIR</option>
                                                <option value="0">NO IMPRIMIR</option>
                                            </select>
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
        <div class="modal" id="dialogfecha" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Seleccione Fecha</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <input name="fecha000" id="fecha000" class="form-control input-date-normal" readonly="readonly" />
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelarfecha();" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarfecha();" value="Grabar" title="Grabar"   />
                       
                   </div>
                </div>
            </div>
        </div>

         <div class="modal" id="dialogdetraccion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Seleccione Detracción</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <select id="cbodetraccion" name="cbodetraccion" class="form-control"></select>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelardetraccion();" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizardetraccion();" value="Grabar" title="Grabar"   />
                       
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogretencion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Seleccione Detracción</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <select id="cboretencion" name="cboretencion" class="form-control"></select>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelarretencion();" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarretencion();" value="Grabar" title="Grabar"   />
                       
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

    <script src="../../../dist/js/jquery.keyboard.min.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-all.min.js"></script>

    <script src="../../../plugins/bootstrap-select/js/bootstrap-select.min.js"></script>

    <script src="../../../dist/js/jquery.mousewheel.min.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-typing.min.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-previewkeyset.min.js"></script>
    <script src="../../../dist/layouts/keyboard-layouts-greywyvern.min.js"></script>

    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/puntoventa/puntopago02/jquery.nuevoweb-3.1.6.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>

    <style>
        .ui-keyboard div {
            font-size: 1.7em;
        }

        .top5 { 
            margin-top:5px; 
        }

        .requerido {
            border-color:#dc3545 !important;       
        }
    </style>
</body>
</html>