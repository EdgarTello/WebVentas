<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Configuracion.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Edición de Configuracion</title>
    
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css" />
  <link rel="stylesheet" href="../../../plugins/jquery-ui/jquery-ui.min.css" />

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
				<div class="container-fluid">
                    <div class="row">
					    <div class="col-6">
					        <%--<h5>Edición de Configuración</h5>--%>
                            <input type="hidden" id="hruc" name="hruc"  runat="server"/>
                            <input type="hidden" id="hlocalcodigo" name="hlocalcodigo"  runat="server"/>
						    <input type="hidden" id="hid" name="hid"  runat="server"/>
					    </div>
                        <div class="col-6">
							<div class="d-flex flex-row justify-content-end p-1">
								<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
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
								</div>
							</div>
						</div>
				    </div>
				</div><!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">                
                        
				<div class="row">
                    <div class="col-sm-6">
                        <div class="accordion" id="accordionacceso">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingacceso">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseacceso" aria-expanded="true" aria-controls="collapseOne">
                                        <h4>Acceso</h4>
                                    </button>
                                </div>

                                <div id="collapseacceso" class="collapse show" aria-labelledby="headingacceso" data-parent="#accordionacceso">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sloginclave" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="loginclave" id="loginclave" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hloginclave" id="hloginclave" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                                          

                        <div class="accordion" id="accordioncajero">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingcajero">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsecajero" aria-expanded="true" aria-controls="collapsecajero">
                                        <h4>Cajero</h4>
                                    </button>
                                </div>

                                <div id="collapsecajero" class="collapse show" aria-labelledby="headingcajero" data-parent="#accordioncajero">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scajerodashboard" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cajerodashboard" id="cajerodashboard" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcajerodashboard" id="hcajerodashboard" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scajerodelivery" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cajerodelivery" id="cajerodelivery" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcajerodelivery" id="hcajerodelivery" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scajeroparallevar" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cajeroparallevar" id="cajeroparallevar" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcajeroparallevar" id="hcajeroparallevar" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scajeroreporte" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cajeroreporte" id="cajeroreporte" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcajeroreporte" id="hcajeroreporte" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scajeroproducto" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cajeroproducto" id="cajeroproducto" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcajeroproducto" id="hcajeroproducto" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scajerogavetaapertura" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cajerogavetaapertura" id="cajerogavetaapertura" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcajerogavetaapertura" id="hcajerogavetaapertura" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scajerogavetatecla" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cajerogavetatecla" id="cajerogavetatecla" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcajerogavetatecla" id="hcajerogavetatecla" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scajeroformapago" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cajeroformapago" id="cajeroformapago" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcajeroformapago" id="hcajeroformapago" runat="server" />                                        
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordioncomision">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingcomision">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsecomision" aria-expanded="true" aria-controls="collapsecomision">
                                        <h4>Comision</h4>
                                    </button>
                                </div>

                                <div id="collapsecomision" class="collapse show" aria-labelledby="headingcomision" data-parent="#accordioncomision">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scomisionalcance" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="comisionalcance" id="comisionalcance" class="form-control">
                                                    <option value="vendedor">Vendedor</option>
                                                    <option value="producto">Producto</option>
                                                </select>
                                                <input type="hidden" name="hcomisionalcance" id="hcomisionalcance" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scomisiontipo" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="comisiontipo" id="comisiontipo" class="form-control">
                                                    <option value="porcentaje">Porcentaje</option>
                                                    <option value="monto">Monto</option>
                                                </select>
                                                <input type="hidden" name="hcomisiontipo" id="hcomisiontipo" />
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scomisionrolpedido" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="comisionrolpedido" id="comisionrolpedido" class="form-control">
                                                </select>
                                                <input type="hidden" name="hcomisionrolpedido" id="hcomisionrolpedido" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scomisioncantidadpedido" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="comisioncantidadpedido" id="comisioncantidadpedido" value="0" maxlength="1" class="form-control" onkeypress="return isNumberKeyOnly(event);"  required="required"/>
                                                <input type="hidden" name="hcomisioncantidadpedido" id="hcomisioncantidadpedido" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="accordion" id="accordioncaja">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingcaja">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsecaja" aria-expanded="true" aria-controls="collapsecaja">
                                        <h4>Caja</h4>
                                    </button>
                                </div>

                                <div id="collapsecaja" class="collapse show" aria-labelledby="headingcaja" data-parent="#accordioncaja">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scajarapida" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cajarapida" id="cajarapida" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcajarapida" id="hcajarapida" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="saperturacaja" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="aperturacaja" id="aperturacaja" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="haperturacaja" id="haperturacaja" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="saperturaprint" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="aperturaprint" id="aperturaprint" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="haperturaprint" id="haperturaprint" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smonedacaja" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="monedacaja" id="monedacaja" class="form-control">
                                                </select>
                                                <input type="hidden" name="hmonedacaja" id="hmonedacaja" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="stipocambio" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="tipocambio" id="tipocambio" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="htipocambio" id="htipocambio" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="spreviewcaja" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="previewcaja" id="previewcaja" class="form-control">
                                                    <option value="" selected="selected">Ninguno</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Cajero">Cajero</option>
                                                </select>
                                                <input type="hidden" name="hpreviewcaja" id="hpreviewcaja" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sreportecaja" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="reportecaja" id="reportecaja" class="form-control">
                                                    <option value="" selected="selected">Ninguno</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Cajero">Cajero</option>
                                                </select>
                                                <input type="hidden" name="hreportecaja" id="hreportecaja" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sempleadocaja" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="empleadocaja" id="empleadocaja" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hempleadocaja" id="hempleadocaja" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="accordion" id="accordionordenpedido">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingordenpedido">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseordenpedido" aria-expanded="true" aria-controls="collapseordenpedido">
                                        <h4>Orden de Pedido</h4>
                                    </button>
                                </div>

                                <div id="collapseordenpedido" class="collapse show" aria-labelledby="headingordenpedido" data-parent="#accordionordenpedido">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sopcambioprecio" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="opcambioprecio" id="opcambioprecio" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hopcambioprecio" id="hopcambioprecio" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordionpedido">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingpedido">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsepedido" aria-expanded="true" aria-controls="collapsepedido">
                                        <h4>Pedido</h4>
                                    </button>
                                </div>

                                <div id="collapsepedido" class="collapse show" aria-labelledby="headingpedido" data-parent="#accordionpedido">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="simpuestopedido" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="impuestopedido" id="impuestopedido" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="himpuestopedido" id="himpuestopedido" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smuestraalmacenexterno" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="muestraalmacenexterno" id="muestraalmacenexterno" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hmuestraalmacenexterno" id="hmuestraalmacenexterno" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smuestracodigoproducto" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="muestracodigoproducto" id="muestracodigoproducto" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hmuestracodigoproducto" id="hmuestracodigoproducto" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sfilasindividual" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="filasindividual" id="filasindividual" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hfilasindividual" id="hfilasindividual" />
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scambiopreciototal" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cambiopreciototal" id="cambiopreciototal" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcambiopreciototal" id="hcambiopreciototal" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="spagoconsumo" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="pagoconsumo" id="pagoconsumo" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hpagoconsumo" id="hpagoconsumo" />
                                            </div>
                                        </div>

                                        

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sstock" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="stock" id="stock" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hstock" id="hstock" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sstockver" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="stockver" id="stockver" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hstockver" id="hstockver" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdescuentoitem_permitir" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="descuentoitem_permitir" id="descuentoitem_permitir" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdescuentoitem_permitir" id="hdescuentoitem_permitir" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdescuentoitem_pormonto" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="descuentoitem_pormonto" id="descuentoitem_pormonto" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdescuentoitem_pormonto" id="hdescuentoitem_pormonto" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdescuentoitem_porporcentaje" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="descuentoitem_porporcentaje" id="descuentoitem_porporcentaje" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdescuentoitem_porporcentaje" id="hdescuentoitem_porporcentaje" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdescuentoitem_porporcentaje_lista" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="descuentoitem_porporcentaje_lista" id="descuentoitem_porporcentaje_lista" value="0" maxlength="20" class="form-control" placeholder="10,20,30" />
                                                <input type="hidden" name="hdescuentoitem_porporcentaje_lista" id="hdescuentoitem_porporcentaje_lista" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdescuentoglobal_permitir" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="descuentoglobal_permitir" id="descuentoglobal_permitir" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdescuentoglobal_permitir" id="hdescuentoglobal_permitir" />
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdescuento" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="descuento" id="descuento" class="form-control">
                                                    <option value="" selected="selected">Ninguno</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Cajero">Cajero</option>
                                                </select>
                                                <input type="hidden" name="hdescuento" id="hdescuento" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scambioprecio" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="cambioprecio" id="cambioprecio" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcambioprecio" id="hcambioprecio" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sautorizacioncambioprecio" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="autorizacioncambioprecio" id="autorizacioncambioprecio" class="form-control">
                                                    <option value="" selected="selected">Ninguno</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Cajero">Cajero</option>
                                                </select>
                                                <input type="hidden" name="hautorizacioncambioprecio" id="hautorizacioncambioprecio" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="spedidocortesia" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="pedidocortesia" id="pedidocortesia" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hpedidocortesia" id="hpedidocortesia" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sautorizacionpedidocortesia" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="autorizacionpedidocortesia" id="autorizacionpedidocortesia" class="form-control">
                                                    <option value="" selected="selected">Ninguno</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Cajero">Cajero</option>
                                                </select>
                                                <input type="hidden" name="hautorizacionpedidocortesia" id="hautorizacionpedidocortesia" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sanulacion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="anulacion" id="anulacion" class="form-control">
                                                    <option value="" selected="selected">Ninguno</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Cajero">Cajero</option>
                                                </select>
                                                <input type="hidden" name="hanulacion" id="hanulacion" />
                                            </div>
                                        </div>

                                            <div class="row">
                                            <div class="col-sm-9">
                                                <span id="spedidocomensales" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="precuentaimpresion" id="pedidocomensales" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hprecuentaimpresion" id="hpedidocomensales" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sprecuentaimpresion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="precuentaimpresion" id="precuentaimpresion" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hprecuentaimpresion" id="hprecuentaimpresion" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scomandaimpresion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="comandaimpresion" id="comandaimpresion" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcomandaimpresion" id="hcomandaimpresion" />
                                            </div>
                                        </div>

                                        

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdcpermitido" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="dcpermitido" id="dcpermitido" class="form-control">                                            
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdcpermitido" id="hdcpermitido" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="senviardetraccion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="enviardetraccion" id="enviardetraccion" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="henviardetraccion" id="henviardetraccion" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="senviarretencion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="enviarretencion" id="enviarretencion" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="henviarretencion" id="henviarretencion" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sgeneraranticipo" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="generaranticipo" id="generaranticipo" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hgeneraranticipo" id="hgeneraranticipo" />
                                            </div>
                                        </div>
                                        

                                        

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordionparallevar">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingparallevar">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseparallevar" aria-expanded="true" aria-controls="collapseparallevar">
                                        <h4>Para Llevar</h4>
                                    </button>
                                </div>

                                <div id="collapseparallevar" class="collapse show" aria-labelledby="headingparallevar" data-parent="#accordionparallevar">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sllevaralias" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="llevaralias" id="llevaralias" class="form-control">
                                                    <option value="1">SI</option>
                                                    <option value="0">NO</option>
                                                </select>
                                                <input type="hidden" name="hllevaralias" id="hllevaralias" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sllevarcomanda" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="llevarcomanda" id="llevarcomanda" class="form-control">
                                                    <option value="1">SI</option>
                                                    <option value="0">NO</option>
                                                </select>
                                                <input type="hidden" name="hllevarcomanda" id="hllevarcomanda" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sllevarcategoria" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="llevarcategoria" id="llevarcategoria" class="form-control">
                                                </select>
                                                <input type="hidden" name="hllevarcategoria" id="hllevarcategoria" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smozoparallevar" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="mozoparallevar" id="mozoparallevar" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hmozoparallevar" id="hmozoparallevar" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordionvaleconsumo">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingvaleconsumo">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsevaleconsumo" aria-expanded="true" aria-controls="collapsevaleconsumo">
                                        <h4>Vale Consumo</h4>
                                    </button>
                                </div>

                                <div id="collapsevaleconsumo" class="collapse show" aria-labelledby="headingvaleconsumo" data-parent="#accordionvaleconsumo">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="svaleconsumogratuito" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="valeconsumogratuito" id="valeconsumogratuito" class="form-control">
                                                    <option value="1">SI</option>
                                                    <option value="0">NO</option>
                                                </select>
                                                <input type="hidden" name="hvaleconsumogratuito" id="hvaleconsumogratuito" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordionsamlsso">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingsamlsso">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsesamlsso" aria-expanded="true" aria-controls="collapsesamlsso">
                                        <h4>SAML SSO</h4>
                                    </button>
                                </div>

                                <div id="collapsesamlsso" class="collapse show" aria-labelledby="headingsamlsso" data-parent="#accordionsamlsso">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="ssamlssohabillitar" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="samlssohabillitar" id="samlssohabillitar" class="form-control">
                                                    <option value="1">SI</option>
                                                    <option value="0">NO</option>
                                                </select>
                                                <input type="hidden" name="hsamlssohabillitar" id="hsamlssohabillitar" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="ssamlssologin" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="samlssologin" id="samlssologin" class="form-control">
                                                    <option value="">[Todos]</option>
                                                    <option value="usuario">Usuario</option>
                                                    <option value="correo">Correo</option>
                                                </select>
                                                <input type="hidden" name="hsamlssologin" id="hsamlssologin" />
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-6">
                                                <span id="ssamlssocertificado" class="label4"></span>
                                            </div>
                                            <div class="col-sm-6">
                                                <textarea name="samlssocertificado" id="samlssocertificado" rows="4"  style="resize:none" maxlength="2000" class="form-control"></textarea>
                                                <input type="hidden" name="hsamlssocertificado" id="hsamlssocertificado" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <span id="ssamlssourlcliente" class="label4"></span>
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" name="samlssourlcliente" id="samlssourlcliente" value="" maxlength="800" class="form-control" />
                                                <input type="hidden" name="hsamlssourlcliente" id="hsamlssourlcliente" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordionseguridad">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingseguridad">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseseguridad" aria-expanded="true" aria-controls="collapseseguridad">
                                        <h4>Seguridad</h4>
                                    </button>
                                </div>
                                <div id="collapseseguridad" class="collapse show" aria-labelledby="headingseguridad" data-parent="#accordionseguridad">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smacadresshabillitar" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="macadresshabillitar" id="macadresshabillitar" class="form-control">
                                                    <option value="1">SI</option>
                                                    <option value="0">NO</option>
                                                </select>
                                                <input type="hidden" name="hmacadresshabillitar" id="hmacadresshabillitar" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-sm-6">

                        <div class="accordion" id="accordioncomanda">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingcomanda">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsecomanda" aria-expanded="true" aria-controls="collapsecomanda">
                                        <h4>Comanda</h4>
                                    </button>
                                </div>

                                <div id="collapsecomanda" class="collapse show" aria-labelledby="headingcomanda" data-parent="#accordioncomanda">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scomandavolver" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="comandavolver" id="comandavolver" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcomandavolver" id="hcomandavolver" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sanulacioncomanda" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="anulacioncomanda" id="anulacioncomanda" class="form-control">
                                                    <option value="" selected="selected">Ninguno</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Cajero">Cajero</option>
                                                </select>
                                                <input type="hidden" name="hanulacioncomanda" id="hanulacioncomanda" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sglosaprecuenta" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="glosaprecuenta" id="glosaprecuenta" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hglosaprecuenta" id="hglosaprecuenta" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scomandavisor" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="comandavisor" id="comandavisor" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcomandavisor" id="hcomandavisor" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdirecciondeliverycomanda" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="direcciondeliverycomanda" id="direcciondeliverycomanda" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdirecciondeliverycomanda" id="hdirecciondeliverycomanda" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scomandadescimpresion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="comandadescimpresion" id="comandadescimpresion" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcomandadescimpresion" id="hcomandadescimpresion" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scomandamesaimpresion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="comandamesaimpresion" id="comandamesaimpresion" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcomandamesaimpresion" id="hcomandamesaimpresion" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordionimpresion">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingimpresion">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseimpresion" aria-expanded="true" aria-controls="collapseimpresion">
                                        <h4>Impresión</h4>
                                    </button>
                                </div>

                                <div id="collapseimpresion" class="collapse show" aria-labelledby="headingimpresion" data-parent="#accordionimpresion">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="shashimpresionticket" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="hashimpresionticket" id="hashimpresionticket" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hhashimpresionticket" id="hhashimpresionticket" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sqrimpresionticket" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="qrimpresionticket" id="qrimpresionticket" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hqrimpresionticket" id="hqrimpresionticket" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scolumnasimpresionticket" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="columnasimpresionticket" id="columnasimpresionticket" value="0" maxlength="2" class="form-control" onkeypress="return isNumberKeyOnly(event);"  required="required"/>
                                                <input type="hidden" name="hcolumnasimpresionticket" id="hcolumnasimpresionticket" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scompuestoimpresionticket" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="compuestoimpresionticket" id="compuestoimpresionticket" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcompuestoimpresionticket" id="hcompuestoimpresionticket" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sguiaimpresion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="guiaimpresion" id="guiaimpresion" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hguiaimpresion" id="hguiaimpresion" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdocumentoimpresionfisico" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="documentoimpresionfisico" id="documentoimpresionfisico" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdocumentoimpresionfisico" id="hdocumentoimpresionfisico" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdocumentoimpresionweb" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="documentoimpresionweb" id="documentoimpresionweb" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdocumentoimpresionweb" id="hdocumentoimpresionweb" />
                                            </div>
                                        </div>
                    
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdocumentologoimpresion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="documentologoimpresion" id="documentologoimpresion" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdocumentologoimpresion" id="hdocumentologoimpresion" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdocumentodescimpresion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="documentodescimpresion" id="documentodescimpresion" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdocumentodescimpresion" id="hdocumentodescimpresion" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sprecuentaimpresionagrupada" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="precuentaimpresionagrupada" id="precuentaimpresionagrupada" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hprecuentaimpresionagrupada" id="hprecuentaimpresionagrupada" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                                
                        <div class="accordion" id="accordiondi">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingdi">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsedi" aria-expanded="true" aria-controls="collapsedi">
                                        <h4>Documento Interno</h4>
                                    </button>
                                </div>

                                <div id="collapsedi" class="collapse show" aria-labelledby="headingdi" data-parent="#accordiondi">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sgenerardi" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="generardi" id="generardi" class="form-control">
                                                    <option value="" selected="selected">Ninguno</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Cajero">Cajero</option>
                                                </select>
                                                <input type="hidden" name="hgenerardi" id="hgenerardi" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="srapidodi" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="rapidodi" id="rapidodi" class="form-control">
                                                    <option value="1">SI</option>
                                                    <option value="0">NO</option>
                                                </select>
                                                <input type="hidden" name="hrapidodi" id="hrapidodi" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="simprimedi" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="imprimedi" id="imprimedi" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="himprimedi" id="himprimedi" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                                
                        <div class="accordion" id="accordionkardex">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingkardex">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsekardex" aria-expanded="true" aria-controls="collapsekardex">
                                        <h4>Kardex</h4>
                                    </button>
                                </div>

                                <div id="collapsekardex" class="collapse show" aria-labelledby="headingkardex" data-parent="#accordionkardex">
                                    <div class="card-body">

                                            <div class="row">
                                            <div class="col-sm-9">
                                                <span id="skardex" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="kardex" id="kardex" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hkardex" id="hkardex" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="accordion" id="accordioninterfaz">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headinginterfaz">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseinterfaz" aria-expanded="true" aria-controls="collapseinterfaz">
                                        <h4>Interfaz</h4>
                                    </button>
                                </div>

                                <div id="collapseinterfaz" class="collapse show" aria-labelledby="headinginterfaz" data-parent="#accordioninterfaz">
                                    <div class="card-body">
                                
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="spaginatab" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="paginatab" id="paginatab" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hpaginatab" id="hpaginatab" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sglosa" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="glosa" id="glosa" value="0" maxlength="2" class="form-control" onkeypress="return isNumberKeyOnly(event);"  required="required"/>
                                                <input type="hidden" name="hglosa" id="hglosa" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="stecladovisualiza" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="tecladovisualiza" id="tecladovisualiza" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="htecladovisualiza" id="htecladovisualiza" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sjefemozosession" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="jefemozosession" id="jefemozosession" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hjefemozosession" id="hjefemozosession" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sfamiliapedido" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="familiapedido" id="familiapedido" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hfamiliapedido" id="hfamiliapedido" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smeseromovil" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="meseromovil" id="meseromovil" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hmeseromovil" id="hmeseromovil" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdashboardopcion" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="dashboardopcion" id="dashboardopcion" class="form-control">
                                                    <option value="0">Ninguno</option>
                                                    <option value="1" selected="selected">Hoy</option>
                                                    <option value="3">Semana actual</option>
                                                    <option value="4">Mes actual</option>
                                                    <option value="6">Año actual</option>
                                                </select>
                                                <input type="hidden" name="hdashboardopcion" id="hdashboardopcion" />
                                            </div>
                                        </div>

                                        
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sdashboarddi" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="dashboardopcion" id="dashboarddi" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hdashboarddi" id="hdashboarddi" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordionnc">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingnc">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsenc" aria-expanded="true" aria-controls="collapsenc">
                                        <h4>Nota de Credito</h4>
                                    </button>
                                </div>

                                <div id="collapsenc" class="collapse show" aria-labelledby="headingnc" data-parent="#accordionnc">
                                    <div class="card-body">
        
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="snotacreditoexterna" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="notacreditoexterna" id="notacreditoexterna" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hnotacreditoexterna" id="hnotacreditoexterna" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordiongr">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headinggr">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsegr" aria-expanded="true" aria-controls="collapsegr">
                                        <h4>Guía Remisión</h4>
                                    </button>
                                </div>

                                <div id="collapsegr" class="collapse show" aria-labelledby="headinggr" data-parent="#accordiongr">
                                    <div class="card-body">
                                
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sguiaauditor" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="guiaauditor" id="guiaauditor" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hguiaauditor" id="hguiaauditor" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sguiavalidador" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="guiavalidador" id="guiavalidador" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hguiavalidador" id="hguiavalidador" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sguiaupload" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="guiaupload" id="guiaupload" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hguiaupload" id="hguiaupload" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sguiageneracionotros" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="guiageneracionotros" id="guiageneracionotros" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hguiageneracionotros" id="hguiageneracionotros" />
                                            </div>
                                        </div>
                                
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sguiaproductows" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="guiaproductows" id="guiaproductows" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hguiaproductows" id="hguiaproductows" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sguiafiltros" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="guiafiltros" id="guiafiltros" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hguiafiltros" id="hguiafiltros" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordionpe">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingpe">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsepe" aria-expanded="true" aria-controls="collapsepe">
                                        <h4>Pantalla Pedido</h4>
                                    </button>
                                </div>

                                <div id="collapsepe" class="collapse show" aria-labelledby="headingpe" data-parent="#accordionpe">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scolumnaizquierdapedido" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="columnaizquierdapedido" id="columnaizquierdapedido" value="0" maxlength="2" class="form-control" onkeypress="return isNumberKeyOnly(event);"  required="required"/>
                                                <input type="hidden" name="hcolumnaizquierdapedido" id="hcolumnaizquierdapedido" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scolumnaderechapedido" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="columnaderechapedido" id="columnaderechapedido" value="0" maxlength="2" class="form-control" onkeypress="return isNumberKeyOnly(event);"  required="required"/>
                                                <input type="hidden" name="hcolumnaderechapedido" id="hcolumnaderechapedido" />
                                            </div>
                                        </div>

                                        
                                
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smuestratipo" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="muestratipo" id="muestratipo" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hmuestratipo" id="hmuestratipo" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="spedidotipo" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="pedidotipo" id="pedidotipo" class="form-control">
                                                </select>
                                                <input type="hidden" name="hpedidotipo" id="hpedidotipo" />
                                            </div>
                                        </div>

                                        
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smuestrafamilia" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="muestrafamilia" id="muestrafamilia" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hmuestrafamilia" id="hmuestrafamilia" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="spedidofamilia" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="pedidofamilia" id="pedidofamilia" class="form-control">
                                                </select>
                                                <input type="hidden" name="hpedidofamilia" id="hpedidofamilia" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smuestracategoria" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="muestracategoria" id="muestracategoria" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hmuestracategoria" id="hmuestracategoria" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="spedidocategoria" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="pedidocategoria" id="pedidocategoria" class="form-control">
                                                </select>
                                                <input type="hidden" name="hpedidocategoria" id="hpedidocategoria" />
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smuestraproducto" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="muestraproducto" id="muestraproducto" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hmuestraproducto" id="hmuestraproducto" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sproductobusqueda" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="productobusqueda" id="productobusqueda" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hproductobusqueda" id="hproductobusqueda" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sproductoimagen" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="productoimagen" id="productoimagen" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hproductoimagen" id="hproductoimagen" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="ssoloimagen" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="soloimagen" id="soloimagen" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hsoloimagen" id="hsoloimagen" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sscanerbusca" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="scanerbusca" id="scanerbusca" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hscanerbusca" id="hscanerbusca" />
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sscanneragrega" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                    <select  name="scanneragrega" id="scanneragrega" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hscanneragrega" id="hscanneragrega" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordionpp">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingpp">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsepp" aria-expanded="true" aria-controls="collapsepp">
                                        <h4>Pantalla Pago</h4>
                                    </button>
                                </div>

                                <div id="collapsepp" class="collapse show" aria-labelledby="headingpp" data-parent="#accordionpp">
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="sglosaformato" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="glosaformato" id="glosaformato" value="0" maxlength="200" class="form-control" />
                                                <input type="hidden" name="hglosaformato" id="hglosaformato" />
                                            </div>
                                        </div>
                                
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smaximoefectivosoles" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="maximoefectivosoles" id="maximoefectivosoles" value="0" maxlength="3" class="form-control" onkeypress="return isNumberKeyOnly(event);"  required="required"/>
                                                <input type="hidden" name="hmaximoefectivosoles" id="hmaximoefectivosoles" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="smaximoefectivodolares" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="maximoefectivodolares" id="maximoefectivodolares" value="0" maxlength="3" class="form-control" onkeypress="return isNumberKeyOnly(event);"  required="required"/>
                                                <input type="hidden" name="hmaximoefectivodolares" id="hmaximoefectivodolares" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="scorrelativoexterno" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="correlativoexterno" id="correlativoexterno" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hcorrelativoexterno" id="hcorrelativoexterno" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="accordion" id="accordionpr">
                            <div class="card" style="margin-bottom:0.5rem !important">
                                <div class="card-header" style="padding:0px !important" id="headingpr">                                          
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapsepr" aria-expanded="true" aria-controls="collapsepr">
                                        <h4>Pago Rápido</h4>
                                    </button>
                                </div>

                                <div id="collapsepr" class="collapse show" aria-labelledby="headingpr" data-parent="#accordionpr">
                                    <div class="card-body">
                                
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="spagorapidodetalle" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="pagorapidodetalle" id="pagorapidodetalle" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hpagorapidodetalle" id="hpagorapidodetalle" />
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-9">
                                                <span id="spagorapidoglosa" class="label4"></span>
                                            </div>
                                            <div class="col-sm-3">
                                                <select  name="pagorapidoglosa" id="pagorapidoglosa" class="form-control">
                                                    <option value="0">NO</option>
                                                    <option value="1">SI</option>
                                                </select>
                                                <input type="hidden" name="hpagorapidoglosa" id="hpagorapidoglosa" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
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
    <script src="../../../plugins/jquery/puntoventa/Configuracion/jquery.nuevoweb-1.8.6.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>

    <style>
        .label3 {
		    font-weight:bold;
	    }
    </style>
</body>
</html>