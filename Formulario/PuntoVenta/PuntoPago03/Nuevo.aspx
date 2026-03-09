<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoPago03.Nuevo" %>

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
<body onhashchange="changebody(event)">
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem"> 
                <div class="row">
                    <div class="col-lg-4">
                        <asp:Literal ID="lblentrega" runat="server"></asp:Literal>||
                        <asp:Literal ID="lblcliente" runat="server"></asp:Literal>||
                        <asp:Literal ID="lbltipocambio" runat="server"></asp:Literal>||
                        <a href="#" style="color:black" id="fechadiferencia"></a>||
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>||
                        
                        <asp:Literal ID="lblpedido" runat="server"></asp:Literal>||
                        <a href="#" style="color:black"  id="datos"></a>
                    </div>
                    <div class="col-lg-4">
                        <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="First group" id="ldetraccion" style="visibility:hidden">
			                        <button type="button" class="btn btn-outline-info btn-bold" id="btndetraccion" title="Detracción">D</button>
		                        </div>

                                <div class="btn-group mr-2" role="group" aria-label="Second group" id="lformapago" style="visibility:hidden">
                                    <button type="button" class="btn btn-outline-info btn-bold" id="btnformapago" title="Forma de Pago">P</button>
                                </div>
							</div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                         <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="Five group">
									<button type="button" class="btn btn-success" id="btngrabar" title="Grabar">
										<i class="fas fa-save"></i> Grabar
									</button>
								</div>

                                <div class="btn-group mr-2" role="group" aria-label="Six group">
									<button type="button" class="btn btn-outline-warning" id="btnactualizar" title="Actualizar">
										<i class="fa fa-refresh" aria-hidden="true"></i>
									</button>
								</div>
								<div class="btn-group mr-2" role="group" aria-label="Seven group">
									<button type="button" class="btn btn-secondary" id="btncancelar" title="Retornar">
										<i class="fas fa-undo" aria-hidden="true"></i>
									</button>
								</div>
                            </div>
                         </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="d-flex flex-row justify-content-start">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="1Tree group" >
                                    <a href="#" style="color:black;font-size:14px;font-weight:bold" id="alineacredito" title="LN=LINEA DE CREDITO; DC=DEUDA CREDITO; NDC=NUEVA DEUDA CREDITO"></a>
                                </div>
							</div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex flex-row justify-content-end">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="0For group">
                                    <a href="#" style="color:black;font-size:14px;font-weight:bold" id="valeconsumo" title="VM=VALE MONTO TOTAL; VMC=VALE MONTO CONSUMIDO; NVMC=NUEVO VALE MONTO CONSUMIDO"></a>
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
                                <input type="hidden" name="hid2" id="hid2" runat="server"/>
                                <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                                <input type="hidden" name="hentrega" id="hentrega" runat="server"/>
                                <input type="hidden" name="hpagina" id="hpagina" runat="server"/>
                                <input type="hidden" name="htipo" id="htipo" runat="server"/>
                                <input type="hidden" name="htipodocumento" id="htipodocumento" runat="server"/>
                                <input type="hidden" name="htipocambio" id="htipocambio" runat="server"/>
                                <input type="hidden" name="hconfigtipocambio" id="hconfigtipocambio" runat="server"/>

                                <input type="hidden" name="htotal" id="htotal" runat="server"/>
                                <input type="hidden" name="hfechanac" id="hfechanac" runat="server"/>
                                <input type="hidden" name="hfecha" id="hfecha" runat="server"/>

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

                                <input type="hidden" name="hdocumentoimpresoras" id="hdocumentoimpresoras" runat="server"/>
                                <input type="hidden" name="hdocumentoimpresoraip" id="hdocumentoimpresoraip" runat="server"/>
                                <input type="hidden" name="htieneimpresora" id="htieneimpresora" runat="server" value="0"/>

                                <input type="hidden" name="hpropina" id="hpropina" runat="server" value="0"/>

                                <input type="hidden" name="hdocumentoimpresionfisico" id="hdocumentoimpresionfisico" runat="server"/>
                                <input type="hidden" name="hdocumentoimpresionweb" id="hdocumentoimpresionweb" runat="server"/>
                                <input type="hidden" name="hcolumnasimpresionticket" id="hcolumnasimpresionticket" runat="server"/>

                                <input type="hidden" name="hcajeroformapago" id="hcajeroformapago" runat="server" value="0"/>
                                <input type="hidden" name="hformapago" id="hformapago" runat="server" value="0"/>
                                <input type="hidden" name="henviardetraccion" id="henviardetraccion" runat="server"/>
                                <input type="hidden" name="hpagoconsumo" id="hpagoconsumo" runat="server"/>
                                <input type="hidden" name="hpagodolares" id="hpagodolares" runat="server"/>
                                <input type="hidden" name="htecladovisualiza" id="htecladovisualiza" runat="server"/>
                                <input type="hidden" name="hmoneda" id="hmoneda" runat="server"/>

                                <input type="hidden" name="hidcliente" id="hidcliente" runat="server" value="0"/>
                                <input type="hidden" name="hclientedefecto" id="hclientedefecto" runat="server" value="0"/>
                                <input type="hidden" name="hlineacredito" id="hlineacredito" runat="server" value="0"/>
                                <input type="hidden" name="hdeudacredito" id="hdeudacredito" runat="server" value="0"/>

                                <input type="hidden" name="hidvaleconsumo" id="hidvaleconsumo" runat="server" value=""/>
                                <input type="hidden" name="hvaleconsumo" id="hvaleconsumo" runat="server" value=""/>
                                <input type="hidden" name="hvalemonto" id="hvalemonto" runat="server" value="0"/>
                                <input type="hidden" name="hvalesaldo" id="hvalesaldo" runat="server" value="0"/>

                                <input type="hidden" name="hmaximoefectivosoles" id="hmaximoefectivosoles" runat="server" value="0"/>
                                <input type="hidden" name="hmaximoefectivodolares" id="hmaximoefectivodolares" runat="server" value="0"/>

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
                                            <input type="text" name="vuelto" id="vuelto" class="form-control input-number-pago-black" value="0.00" runat="server" readonly="readonly" />
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="totalpago" id="totalpago" disabled="disabled" class="form-control input-number-pago-black" value="0.00" runat="server"/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col"><hr /></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4">
                                            <span>Efectivo</span>
                                        </div>
                                        <div class="col-lg-4">Propina</div>
                                        <div class="col-lg-4">
                                            <span>Monto por pagar (</span><span id="smoneda04"></span>)
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4">
                                            <input type="button" id="btndel" name="btndel" value="DEL" class="btn btn-danger btn-tot" />
                                            <input type="button" id="btntot" name="btntot" value="(T)OT" class="btn btn-dark btn-tot"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="efectivolocalpropina" id="efectivolocalpropina" disabled="disabled" class="form-control input-number-pago-black" value="0.00" />
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" name="efectivolocalmonto" id="efectivolocalmonto" maxlength="12" class="form-control requerido input-number-pago-red" value="0.00" runat="server" onkeypress="return isNumberKey(event)"/>
                                            <p class="card-text"><small class="text-red">(1) Ingrese el monto a pagar</small></p>
                                        </div>
                                    </div>

                                    <div id="divefectivos">                                        
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <input type="button" id="btn1" name="btn1" value="1" class="btn btn-secondary btn-billete"  />
                                                
                                                <input type="button" id="btn2" name="btn2" value="2" class="btn btn-secondary btn-billete"  />
                                                
                                                <input type="button" id="btn5" name="btn5" value="5" class="btn btn-secondary btn-billete"  />
                                                
                                                <input type="button" id="btn10" name="btn10" value="10" class="btn btn-success btn-billete"  />
                                                
                                                <input type="button" id="btn20" name="btn20" value="20" class="btn btn-success btn-billete"  />
                                                
                                                <input type="button" id="btn50" name="btn50" value="50" class="btn btn-success btn-billete"  />

                                                <input type="button" id="btn100" name="btn100" value="100" class="btn btn-success btn-billete"  />

                                                <input type="button" id="btn200" name="btn200" value="200" class="btn btn-success btn-billete"  />                                                
                                            </div>
                                        </div>
                                    </div>

                                    <div id="divtarjetas" style="visibility:visible">     
                                        <div class="row">
                                            <div class="col"><hr /></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <span><b>Tarjeta</b></span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span>Num Operación</span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span>Propina</span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span>Monto</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3">
                                                <select id="cbotipopago1" name="cbotipopago1" class="form-control"></select>
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="numerooperacion1" id="numerooperacion1" class="form-control input-number-pago-black"/>
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montopropina1" id="montopropina1" class="form-control input-number-pago-black" value="0.00" onkeypress="return isNumberKey(event)"/>                                                    
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montootro1" id="montootro1" class="form-control input-number-pago-black" value="0.00"  onkeypress="return isNumberKey(event)"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3">
                                                <select id="cbotipopago2" name="cbotipopago2" class="form-control"></select>
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="numerooperacion2" id="numerooperacion2" class="form-control input-number-pago-black" />
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montopropina2" id="montopropina2" class="form-control input-number-pago-black" value="0.00"  onkeypress="return isNumberKey(event)"/>
                                                    
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montootro2" id="montootro2" class="form-control input-number-pago-black" value="0.00" onkeypress="return isNumberKey(event)"/>
                                            </div>
                                        </div>
                    
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <select id="cbotipopago3" name="cbotipopago3" class="form-control"></select>
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="numerooperacion3" id="numerooperacion3" class="form-control input-number-pago-black" />
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montopropina3" id="montopropina3" class="form-control input-number-pago-black" value="0.00"  onkeypress="return isNumberKey(event)"/>
                                                    
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montootro3" id="montootro3" class="form-control input-number-pago-black" value="0.00"  onkeypress="return isNumberKey(event)"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3">
                                                <select id="cbotipopago4" name="cbotipopago4" class="form-control"></select>
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="numerooperacion4" id="numerooperacion4" class="form-control input-number-pago-black" />
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montopropina4" id="montopropina4" class="form-control input-number-pago-black" value="0.00"  onkeypress="return isNumberKey(event)"/>
                                                    
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montootro4" id="montootro4" class="form-control input-number-pago-black" value="0.00" onkeypress="return isNumberKey(event)"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3">
                                                <select id="cbotipopago5" name="cbotipopago5" class="form-control"></select>
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="numerooperacion5" id="numerooperacion5" class="form-control input-number-pago-black" />
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montopropina5" id="montopropina5" class="form-control input-number-pago-black" value="0.00"  onkeypress="return isNumberKey(event)"/>
                                                    
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montootro5" id="montootro5" class="form-control input-number-pago-black" value="0.00"  onkeypress="return isNumberKey(event)"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3">
                                                <select id="cbotipopago6" name="cbotipopago6" class="form-control"></select>
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="numerooperacion6" id="numerooperacion6" class="form-control input-number-pago-black"/>
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montopropina6" id="montopropina6" class="form-control input-number-pago-black" value="0.00"  onkeypress="return isNumberKey(event)"/>
                                                    
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="montootro6" id="montootro6" class="form-control input-number-pago-black" value="0.00"  onkeypress="return isNumberKey(event)"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="divdolares" style="visibility:hidden">
                                        <div class="row">
                                            <div class="col"><hr /></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3"></div>
                                            <div class="col-lg-3"></div>
                                            <div class="col-lg-3">
                                                <span>Propina</span>
                                            </div>
                                            <div class="col-lg-3">
                                                <span>Monto</span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3">
                                                <span>Efectivo Dólares</span>
                                            </div>
                                            <div class="col-lg-3">
                                                    
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="efectivousdpropina" id="efectivousdpropina" class="form-control" value="0.00" style="background-color:#e9ecef;font-size:28px;width:140px;text-align:right" onkeypress="return isNumberKey(event)"/>
                                            </div>
                                            <div class="col-lg-3">
                                                <input type="text" name="efectivousdmonto" id="efectivousdmonto" class="form-control" value="0.00" style="background-color:#e9ecef;font-size:28px;width:140px;text-align:right" onkeypress="return isNumberKey(event)"/>
                                            </div>
                                                
                                        </div>
                                        <div class="row">
                                            <br />
                                        </div>

                                        <div class="row">
                                            <div class="col-4">
                                                <input type="button" id="btndeld" name="btndeld" value="DEL" class="btn btn-danger float-left" style="float:none!important;width:70px; height:50px;font-size:22px" />

                                                <input type="button" id="btntotd" name="btntotd" value="TOT" class="btn btn-dark float-left" style="float:none!important;width:70px; height:50px;font-size:22px" />
                                            </div>
                                            <div class="col-8">
                                                    
                                                <input type="button" id="btn1d" name="btn1d" value="1" class="btn btn-success float-right" style="float:none!important;width:70px; height:50px;font-size:22px" />

                                                <input type="button" id="btn2d" name="btn2d" value="2" class="btn btn-success float-right" style="float:none!important;width:70px; height:50px;font-size:22px" />
                                                    
                                                <input type="button" id="btn5d" name="btn5d" value="5" class="btn btn-success float-right" style="float:none!important;width:70px; height:50px;font-size:22px" />

                                                <input type="button" id="btn10d" name="btn10d" value="10" class="btn btn-success float-right" style="float:none!important;width:70px; height:50px;font-size:22px" />
                                        
                                                <input type="button" id="btn20d" name="btn20d" value="20" class="btn btn-success float-right" style="float:none!important;width:70px; height:50px;font-size:22px" />
                                        
                                            </div>
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
                                            <input type="text" name="direccion" id="direccion"  class="form-control" placeholder="Dirección" />
                                        </div>
                                    </div>

                                    <div class="row top5">
                                        <div class="col-lg-12">
                                            <textarea name="referencia" id="referencia" maxlength="200"  class="form-control" style="resize:none" placeholder="Referencia(Max 200 caracteres)"></textarea>
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
                                            <input type="text" name="email" id="email" maxlength="100" class="form-control" placeholder="Correo" />
                                        </div>
                                    </div>

                                    <div class="row top5">
                                        <div class="col-lg-12">
                                            <textarea name="glosa" id="glosa" maxlength="200" class="form-control" style="resize:none" placeholder="Observación Max 200 caracteres" ></textarea>
                                        </div>
                                    </div>
                                       
                                    <div class="row top5">
                                        <div class="col-lg-4">
                                            <select id="cboimprimir" name="cboimprimir" class="form-control">
                                                <option value="1">IMPRIMIR</option>
                                                <option value="0">NO IMPRIMIR</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <select id="cbopagoporconsumo" name="cbopagoporconsumo" class="form-control">
                                                <option value="0">PAGO INDIVIDUAL</option>
                                                <option value="1">POR CONSUMO</option>
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

        <div class="modal" id="dialogrevertir" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Revetir pago por plato</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        Esta seguro de revertir el pago por plato?
                    </div>
                   <div class="modal-footer">
                        <input type="button" class="btn btn-secondary" onclick="cancelarpagoporplato();" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarpagoporplato();" value="Grabar" title="Aceptar"   />
                   </div>
                </div>
            </div>
        </div>
        

        <div class="modal" id="dialogdocumentoimpresora" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Seleccione Impresora</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-12" style="text-align:center" id="ddocumentoimpresora" name="ddocumentoimpresora">
                                
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelardocumentoimpresora();" value="Cancelar" title="Cancelar"  />                       
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

        <div class="modal" id="dialogformapago" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Seleccione Forma Pago</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <select id="cboformapago" name="cboformapago" class="form-control">
                                    <option value="0">Contado</option>
                                    <option value="1">Credito</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                        

                        <div class="row" id="divcredito001" name="divcredito001" style="display:none">
                            <div class="col-lg-4">
                                <input name="cuota001" id="cuota001" class="form-control input-text-normal" value="Cuota001" readonly="readonly"/>
                            </div>
                            <div class="col-lg-4">
                                <input name="fecha001" id="fecha001" class="form-control input-date-normal" readonly="readonly" />
                            </div>
                            <div class="col-lg-4">
                                <input type="text" name="monto001" id="monto001" maxlength="12" class="form-control" value="" placeholder="0.00" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>

                        <div class="row" id="divcredito002" name="divcredito002" style="display:none">
                            <div class="col-lg-4">
                                <input name="cuota002" id="cuota002" class="form-control input-text-normal" value="Cuota002" readonly="readonly"/>
                            </div>
                            <div class="col-lg-4">
                                <input name="fecha002" id="fecha002" class="form-control input-date-normal"  readonly="readonly" />
                            </div>
                            <div class="col-lg-4">
                                <input type="text" name="monto002" id="monto002" maxlength="12" class="form-control" value="" placeholder="0.00" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>

                        <div class="row" id="divcredito003" name="divcredito003" style="display:none">
                            <div class="col-lg-4">
                                <input name="cuota003" id="cuota003" class="form-control input-text-normal" value="Cuota003" readonly="readonly" />
                            </div>
                            <div class="col-lg-4">
                                <input name="fecha003" id="fecha003" class="form-control input-date-normal"  readonly="readonly" />
                            </div>
                            <div class="col-lg-4">
                                <input type="text" name="monto003" id="monto003" maxlength="12" class="form-control" value="" placeholder="0.00" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>

                        <div class="row">
                            <br />
                        </div>

                    </div>
                    <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelarformapago();" value="Cancelar" title="Cancelar"  />
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
    <script src="../../../plugins/jquery/puntoventa/puntopago03/jquery.nuevoweb-3.0.0.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>
    <style>
        .ui-keyboard div 
        {
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