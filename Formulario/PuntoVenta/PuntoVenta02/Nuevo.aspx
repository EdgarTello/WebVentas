<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta02.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Pedido</title>

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
	<link rel="stylesheet" href="../../../Content/style_custom_v51.4.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem"> 
                <div class="row">
                    <div class="col-4">
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>||
                        <a href="#" style="color:black"  id="datos"></a>

                        
                        <label id="listamoneda">
                            <select id="cbomoneda" name="cbomoneda" class="form-control input-normal"></select>
                        </label>
                    </div>
                    <div class="col-4">
                        <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="Seven group">
                                    <b>SHIFT</b>
                                </div>
                                <div class="btn-group mr-2" role="group" aria-label="First group">
									<button type="button" class="btn btn-outline-primary btn-bold" onclick="grabar('01');" title="Factura"><b>F</b></button>
								</div>
								<div class="btn-group mr-2" role="group" aria-label="Second group">
									<button type="button" class="btn btn-outline-secondary btn-bold" onclick="grabar('03');" title="Boleta"><b>B</b></button>
								</div>
                                <div class="btn-group mr-2" role="group" aria-label="Tree group">
									<button type="button" class="btn btn-outline-success btn-bold" onclick="grabar('91');" title="Pago Rápido"><b>R</b></button>
								</div>
                                <div class="btn-group mr-2" role="group" aria-label="Tree group">
				                    <button type="button" class="btn btn-outline-warning btn-bold" onclick="impuesto();" title="Impuesto"><b>I</b></button>
                                </div>
                                <div class="btn-group mr-2" role="group" aria-label="For group">
									<button type="button" class="btn btn-outline-danger btn-bold" onclick="anulacion();" title="Eliminar">
                                        <i class="fa fa-trash" aria-hidden="true"></i><b>E</b>
									</button>
								</div>
                                <div class="btn-group mr-2" role="group" aria-label="Five group" id="linterno" style="visibility:hidden">
									<button type="button" class="btn btn-outline-info btn-bold" onclick="grabar('99');" title="Documento Interno">DI</button>
								</div>
                                <div class="btn-group mr-2" role="group" aria-label="Six group" id="lcontingencia" style="visibility:hidden">
									<button type="button" class="btn btn-outline-dark btn-bold" title="Contingencia">DC</button>
								</div>
                                <div class="btn-group mr-2" role="group" aria-label="Five group" id="lanfitriona" style="visibility:hidden">
				                    <button type="button" class="btn btn-outline-danger btn-bold" onclick="veranfitriona();" title="Anfitriona">A</button>
                                </div>
							</div>
						</div>                        
                    </div>
                    <div class="col-4">
                        <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="First group">
									<button type="button" class="btn btn-outline-danger" id="btnreprocesarfe" title="Reprocesar FE">
										<i class="fa fa-spinner" aria-hidden="true"></i>
									</button>
								</div>
                                <div class="btn-group mr-2" role="group" aria-label="Second group">
									<button type="button" class="btn btn-outline-warning" id="btnactualizar" title="Actualizar">
										<i class="fa fa-refresh" aria-hidden="true"></i>
									</button>
								</div>
								<div class="btn-group mr-2" role="group" aria-label="Tree group" id="divretornar">
									<button type="button" class="btn btn-secondary" id="btncancelar" title="Retornar">
										<i class="fas fa-undo" aria-hidden="true"></i><b>M</b>
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

                    <div class="card-body" style="padding:0.5rem">
                        <div class="container-fluid">

                            <div class="row">
                                <input type="hidden" name="hmobile" id="hmobile" value="0" runat="server"/>
                                <input type="hidden" name="hid" id="hid" value="0" runat="server"/>
                                <input type="hidden" name="hidimpuesto" id="hidimpuesto" value="0" runat="server"/>
                                <input type="hidden" name="hentrega" id="Hidden1"  runat="server"/>
                                <input type="hidden" name="hclientetipo" id="hclientetipo"  runat="server"/>
                                <input type="hidden" name="hguiacreacion" id="hguiacreacion"  runat="server"/>
                                <input type="hidden" name="htipopago" id="htipopago"  runat="server"/>
                                <input type="hidden" name="hmoneda" id="hmoneda"  runat="server" value="PEN"/>
                                <input type="hidden" name="hpagina" id="hpagina"  runat="server"/>
                                <input type="hidden" name="hpagado" id="hpagado"  runat="server"/>
                                <input type="hidden" name="hidpersona" id="hidpersona" value="0" runat="server"/>
                                <input type="hidden" name="hestado" id="hestado" value="0" runat="server"/>
                                <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                                <input type="hidden" name="hidcaja" id="hidcaja" runat="server"/>
                                <input type="hidden" name="himpresora" id="himpresora" runat="server"/>
                                <input type="hidden" name="hacceso" id="hacceso" runat="server"/>
                                <input type="hidden" name="hcaja" id="hcaja" runat="server"/>
                                <input type="hidden" name="hserie" id="hserie" runat="server"/>
                                <input type="hidden" name="hempleado" id="hempleado" runat="server"/>
                                <input type="hidden" name="hstock" id="hstock" runat="server"/>
                                <input type="hidden" name="hanfitrionacaja" id="hanfitrionacaja" runat="server"/>
                                <input type="hidden" name="hstockver" id="hstockver" runat="server"/>
                                <input type="hidden" name="hprecuentaimpresion" id="hprecuentaimpresion" runat="server"/>
                                <input type="hidden" name="hcomandaimpresion" id="hcomandaimpresion" runat="server"/>
                                <input type="hidden" name="hanulacioncomanda" id="hanulacioncomanda" runat="server"/>
                                <input type="hidden" name="hidalmacen" id="hidalmacen" runat="server"/>
                                <input type="hidden" name="hidubicacion" id="hidubicacion" runat="server"/>
                                <input type="hidden" name="hprecuentacantidad" id="hprecuentacantidad" runat="server"/>
                                <input type="hidden" name="hubicaciones" id="hubicaciones" runat="server"/>
                                <input type="hidden" name="htipocambio" id="htipocambio" runat="server"/>
                                <input type="hidden" name="htipo" id="htipo" runat="server"/>
                                <input type="hidden" name="hfecha" id="hfecha" runat="server"/>
                                <input type="hidden" name="hidpedidodetalle" id="hidpedidodetalle" runat="server"/>
                                <input type="hidden" name="hcomnadapermiso" id="hcomnadapermiso" runat="server" value="0"/>
                                <input type="hidden" name="hcomandapendiente" id="hcomandapendiente" runat="server" value="1"/>
                                <input type="hidden" name="hcomandaenviada" id="hcomandaenviada" runat="server" value="0"/>
                                <input type="hidden" name="hcontingencia" id="hcontingencia" runat="server" value="0"/>
                                <input type="hidden" name="hcambioprecio" id="hcambioprecio" runat="server" value="0"/>

                                <input type="hidden" name="hmoneda1" id="hmoneda1" runat="server" value="0"/>
                                <input type="hidden" name="hmoneda2" id="hmoneda2" runat="server" value="0"/>

                                <input type="hidden" name="hcategoriascantidad" id="hcategoriascantidad" runat="server"/>
                                <input type="hidden" name="htecladovisualiza" id="htecladovisualiza" runat="server"/>
                                <input type="hidden" name="hdcpermitido" id="hdcpermitido" runat="server"/>

                                <input type="hidden" name="hsoloimagen" id="hsoloimagen" runat="server"/>
                                
                                <input type="hidden" name="hscanerbusca" id="hscanerbusca" runat="server"/>
                                <input type="hidden" name="hscanneragrega" id="hscanneragrega" runat="server"/>

                                <input type="hidden" name="hmuestraalmacenexterno" id="hmuestraalmacenexterno" runat="server" value="0"/>
                                <input type="hidden" name="hmuestracodigoproducto" id="hmuestracodigoproducto" runat="server" value="0"/>
                                <input type="hidden" name="hmuestratipo" id="hmuestratipo" runat="server" value="0"/>
                                <input type="hidden" name="hmuestrafamilia" id="hmuestrafamilia" runat="server" value="0"/>
                                <input type="hidden" name="hmuestracategoria" id="hmuestracategoria" runat="server" value="0"/>
                                <input type="hidden" name="hproductobusqueda" id="hproductobusqueda" runat="server" value="0"/>
                                <input type="hidden" name="hmuestraproducto" id="hmuestraproducto" runat="server" value="0"/>
                                <input type="hidden" name="hproductoimagen" id="hproductoimagen" runat="server" value="0"/>

                                <input type="hidden" name="hpedidotipo" id="hpedidotipo" runat="server"/>
                                <input type="hidden" name="hpedidofamilia" id="hpedidofamilia" runat="server"/>
                                <input type="hidden" name="hpedidocategoria" id="hpedidocategoria" runat="server"/>

                                <input type="hidden" name="hcolumnaizquierdapedido" id="hcolumnaizquierdapedido" runat="server" value="6"/>
                                <input type="hidden" name="hcolumnaderechapedido" id="hcolumnaderechapedido" runat="server" value="6"/>

                                <input type="hidden" name="hcajarapida" id="hcajarapida" runat="server"/>
                                <input type="hidden" name="hcambiopreciototal" id="hcambiopreciototal" runat="server"/>
                                <input type="hidden" name="hpagorapidodetalle" id="hpagorapidodetalle" runat="server"/>

                                <input type="hidden" name="hfilasindividual" id="hfilasindividual" runat="server"/>
                                <input type="hidden" name="hdescuentoglobal_permitir" id="hdescuentoglobal_permitir" runat="server"/>
                                <input type="hidden" name="hdescuentoitem_permitir" id="hdescuentoitem_permitir" runat="server"/>

                                <input type="hidden" name="hdescuentoitem_pormonto" id="hdescuentoitem_pormonto" runat="server"/>
                                <input type="hidden" name="hdescuentoitem_porporcentaje" id="hdescuentoitem_porporcentaje" runat="server"/>
                                <input type="hidden" name="hdescuentoitem_porporcentaje_lista" id="hdescuentoitem_porporcentaje_lista" runat="server"/>
                                <input type="hidden" name="hpagorapidoglosa" id="hpagorapidoglosa" runat="server"/>

                                <input type="hidden" name="hmonedacaja" id="hmonedacaja" runat="server"/>
                                <input type="hidden" name="hmonedadefault" id="hmonedadefault" runat="server"/>

                                <input type="hidden" name="hcomisionrolpedido" id="hcomisionrolpedido" runat="server"/>
                                <input type="hidden" name="hcomisioncantidadpedido" id="hcomisioncantidadpedido" runat="server"/>

                            </div>

                            <div class="row">
                                <div class="col-lg-<%=this.ViewState["columnaizquierdapedido"].ToString()%>">
                                    <div id="divtipos" class="row"></div>
                                    <div id="divfamilias" class="row"></div>
                                    <div id="divcategorias" class="row"></div>
                                    <br />
                                    <div id="divbusqueda" class="row">
                                        <div class="col-2 text-right"></div>
                                        <div class="col-8 text-right">
                                            <input type="text" id="qproducto" name="qproducto" class="form-control"  placeholder="Producto" />
                                        </div>
                                        <div class="col-2 float-right">
                                            <button type="button" class="btn btn-outline-info" id="btnbuscar" title="Buscar">
										        <i class="fas fa-search fa-lg"></i>
									        </button>
                                        </div>
                                    </div>
                                    <br />
                                    <div id="divproductos" class="row"></div>
                                    <div id="divimagen" class="row"></div>
                                </div>

                                <div class="col-lg-<%=this.ViewState["columnaderechapedido"].ToString()%>">
                                    <table id="tbldetalle" class="table table-bordered table-hover"></table>
                                </div>            
                            </div>

                        </div>
                       
                    </div>
                    <!-- /.card -->
                </div>
            </section>
            <!-- /.content -->
        </div>

        <div class="modal fade" id="dialogImpuesto" tabindex="-1" role="dialog" aria-labelledby="dialogImpuestoLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Impuesto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <select id="cboimpuesto" name="cboimpuesto" class="form-control"></select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn_impuesto_cancelar">Cancelar</button>
                    <button type="button" class="btn btn-success" id="btn_impuesto_aceptar" onclick="impuesto_aceptar();"><b>G</b>rabar</button>
                </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="dialogDocumento" tabindex="-1" role="dialog" aria-labelledby="dialogDocumentoLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H1">Punto de Venta</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="row" id="divdocumento">

                    </div>
                    <div class="row">
                        <br />
                    </div>
                    <div class="row" id="divmediopago">
                        <div class="col-4">
                            <span>Medio de pago</span>
                        </div>
                        <div class="col-8">
                            <select id="cbotipopago" name="cbotipopago" class="form-control"></select>
                        </div>
                    </div>
                    <div class="row" id="divpagodetalle">
                        <div class="col-12">
                            <div class="row top5">
                                <div class="col-4">
                                    <select id="cbotipodocumento" name="cbotipodocumento" class="form-control">
                                    </select>
                                </div>
                                <div class="col-8">
                                    <input type="hidden" name="hidcliente" id="hidcliente" runat="server" value="0"/>
                                    <input type="text" name="numerodocumento" id="numerodocumento" runat="server"  class="form-control requerido input-number-documento-black"  placeholder="Documento" />
                                    <p class="card-text"><small class="text-red">(1) Ingrese el documento y luego de Enter</small></p>                                            
                                </div>
                            </div>
                            <div class="row top5">
                                <div class="col-12">
                                    <input type="text" name="nombrecliente" id="nombrecliente"  runat="server" class="form-control" placeholder="Nombre" />
                                </div>
                            </div>
                            <div class="row top5">
                                <div class="col-12">
                                    <input type="text" name="direccion" id="direccion"  class="form-control"  placeholder="Dirección"/>
                                </div>
                            </div>
                            <div class="row top5">
                                <div class="col-4">
                                    <select id="cbodepartamento" name="cbodepartamento" class="form-control"></select>
                                </div>
                                <div class="col-4">
                                    <select id="cboprovincia" name="cboprovincia" class="form-control"></select>
                                </div>
                                <div class="col-4">
                                    <select id="cbodistrito" name="cbodistrito" class="form-control" placeholder="Max 200 caracteres"></select>
                                </div>
                            </div>
                            <div class="row top5">
                                <div class="col-6">
                                    <input type="text" name="telefonocelular" id="telefonocelular" maxlength="9"  class="form-control" onkeypress="return isNumberKey(event);" placeholder="Celular 999999999"/>
                                </div>
                                <div class="col-6">
                                    <input type="text" name="email" id="email" maxlength="200" class="form-control" placeholder="Correo" />
                                </div>
                            </div>

                            <div class="row top5">
                                <div class="col-12">
                                    <textarea name="glosa" id="glosa" maxlength="200" class="form-control" style="resize:none" placeholder="Observación Max 200 caracteres"></textarea>
                                </div>
                            </div>

                            <div class="row top5">
                                <div class="col-6">
                                    Imprimir?
                                </div>
                                <div class="col-6">
                                    <select id="cboimprimir" name="cboimprimir" class="form-control">
                                        <option value="0">SI</option>
                                        <option value="1">NO</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn_documento_cancelar">Cancelar</button>
                    <button type="button" class="btn btn-success" id="btn_documento_aceptar" onclick="documento_aceptar();"><b>G</b>rabar</button>
                </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogreferencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Referencia</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <span style="font-size:24px;font-weight:bold" id="sproductonombre"></span>
                            </div>
                        </div>               
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-4"><span style="font-size:24px">Referencia</span></div>
                            <div class="col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="referencia" id="referencia" maxlength="200" runat="server" class="form-control"/>
                            </div>
                        </div>         
                        <div id="divcomisiones" class="d-none">
                            <div class="mt-4 mb-4">
                                <hr /> 
                            </div>
                            <div class="row">
                                <h3 class="modal-title" style="color:black">Comisiones</h3>
                            </div>
                            <div class="row">
                                <br />
                            </div>
                            <div class="row mb-2 justify-content-center">
                                <div class="col-lg-12" id="divempleados">
                                </div>
                            </div>
                        </div>
                    </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-warning" data-dismiss="modal">Cancelar</button>
                       <button type="button" class="btn btn-success" onclick="actualizarreferencia();">Grabar</button>
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogcantidad" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Cantidad</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <span style="font-size:24px;font-weight:bold" id="nombre"></span>
                            </div>
                        </div>               
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-4"><span style="font-size:24px">Cantidad</span></div>
                            <div class="col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="cantidad" id="cantidad" maxlength="7" onkeypress="return isNumberKey(event)" runat="server" class="form-control" autocomplete="off" style="text-align:right;font-size:28px;width:140px" />
                            </div>
                        </div>

                    </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-warning" data-dismiss="modal">Cancelar</button>
                       <button type="button" class="btn btn-success" onclick="actualizarcantidad();">Grabar</button>
                       
                       <input type="hidden" name="hidproducto" id="hidproducto"/>
                       <input type="hidden" name="hiddetalle" id="hiddetalle"/>
                       <input type="hidden" name="hprecio" id="hprecio"/>
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogpreciototal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Modificar Total</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <span style="font-size:24px;font-weight:bold" id="nombretotal"></span>
                            </div>
                        </div>               
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-4"><span style="font-size:24px">Total</span></div>
                            <div class="col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="preciototal" id="preciototal" maxlength="7" onkeypress="return isNumberKey(event)" runat="server" class="form-control" autocomplete="off" style="text-align:right;font-size:28px;width:140px" />
                            </div>
                        </div>

                    </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-warning" data-dismiss="modal">Cancelar</button>
                       <button type="button" class="btn btn-success" onclick="actualizarpreciototal();">Grabar</button>
                       
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogprecio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Precio</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <span style="font-size:24px;font-weight:bold" id="nombre_precio"></span>
                            </div>
                        </div>               
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-4"><span style="font-size:24px">Precio</span></div>
                            <div class="col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="precio" id="precio" maxlength="9" onkeypress="return isNumberKey(event)" runat="server" class="form-control" autocomplete="off" style="text-align:right;font-size:28px;width:160px" />
                            </div>
                        </div>

                    </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                       <button type="button" class="btn btn-success" onclick="actualizarprecio();">Grabar</button>
                       
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogproducto_descuento_item" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel" style="color:black">Descuento Item</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                       <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <h3><label id="nombre_descuento_item"></label></h3>
                            </div>
                        </div>
                       <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <span style="font-size:24px">SubTotal</span>
                            </div>
                            <div class="col-sm-8 col-md-8 col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_item_submonto" id="descuento_item_submonto" class="form-control" style="text-align:right;font-size:28px; width:140px" readonly="readonly"/>
                            </div>
                        </div>        
                        <div class="row" id="div_descuento_item_monto">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-centered">
                                <input type="radio" name="descuento_item_opcion" value="1" checked="checked"/>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4"><span style="font-size:24px">Monto</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_item_monto" id="descuento_item_monto" class="form-control"  maxlength="7"  placeholder="0.00" onkeypress="return isNumberKey(event)"  style="text-align:right;font-size:28px;width:140px" />
                            </div>
                        </div>
                        <div class="row" id="div_descuento_item_porcentaje">
                           <div class="col-sm-4 col-md-4 col-lg-4 col-centered">
                                <input type="radio" name="descuento_item_opcion" value="0"  />
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4"><span style="font-size:24px" id="span_descuento_item_porcentaje">Porc(%)</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_item_porcentaje" id="descuento_item_porcentaje" class="form-control"  maxlength="7" placeholder="0.00" onkeypress="return isNumberKey(event)"  style="text-align:right;font-size:28px;width:140px" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-centered">
                                <input type="button" class="btn btn-export" onclick="calcularproducto_descuento_item();" value="(*)" title="Calcular"/>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4"><span style="font-size:24px">Total</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_item_total" id="descuento_item_total" class="form-control" value="0.00" style="text-align:right;font-size:28px;width:140px"  readonly="readonly"/>
                            </div>
                        </div>
                    </div>
					<div class="modal-footer">                     
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-success" onclick="actualizarproducto_descuento_item();">Grabar</button>

                        <input type="hidden" name="hidproducto_descuento_item" id="hidproducto_descuento_item"/>
                        <input type="hidden" name="hid_descuento_item" id="hid_descuento_item"/>
                        <input type="hidden" name="htotal_descuento_item" id="htotal_descuento_item"/>
                        <input type="hidden" name="hdescuento_varios" id="hdescuento_varios" value="0"/>
                    </div>
                </div>
           </div>
        </div>

        <div class="modal" id="dialogproducto_descuento_global" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel02" style="color:black">Descuento Global</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">                        
                       <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <span style="font-size:24px">SubTotal</span>
                            </div>
                            <div class="col-sm-8 col-md-8 col-lg-8" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_global_submonto" id="descuento_global_submonto" class="form-control" style="text-align:right;font-size:28px; width:140px" readonly="readonly"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="descuento_global_opcion" value="1" checked="checked"/>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4 col-centered"><span style="font-size:24px">Monto</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_global_monto" id="descuento_global_monto" class="form-control" maxlength="7" placeholder="0.00" onkeypress="return isNumberKey(event)" style="text-align:right;font-size:28px;width:140px" />
                            </div>
                            
                        </div>
                       <div class="row">
                           <div class="col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="descuento_global_opcion" value="0" />
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4 col-centered"><span style="font-size:24px">Porc(%)</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_global_porcentaje" id="descuento_global_porcentaje" class="form-control" maxlength="7" placeholder="0.00" onkeypress="return isNumberKey(event)" style="text-align:right;font-size:28px;width:140px" />
                            </div>
                            
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <input type="button" class="btn btn-export" onclick="calcularproducto_descuento_global();" value="(*)" title="Calcular"/>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4 col-centered"><span style="font-size:24px">Total</span></div>
                            <div class="col-sm-4 col-md-4 col-lg-4" style="display:flex;justify-content:flex-end">
                                <input type="text" name="descuento_global_total" id="descuento_global_total" class="form-control" maxlength="7" placeholder="0.00" onkeypress="return isNumberKey(event)" style="text-align:right;font-size:28px;width:140px" readonly="readonly" />
                            </div>
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-success" onclick="actualizarproducto_descuento_global();">Grabar</button>
                        
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogreprocesar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body" id="mbody_reprocesar">
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cerrar" title="Cancelar"  />
                       <input type="button" id="btnactualizar_reprocesar" class="btn btn-success" onclick="this.disabled='true';reprocesar_grabar();" value="Confirmar" title="Reprocesar"   />
                       
                   </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="dialogAnularItem" tabindex="-1" role="dialog" aria-labelledby="dialogAnularItemLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H2">Punto de Venta</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body" id="divanularitem">
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success" onclick="anular_item_aceptar()">Aceptar</button>
                </div>
                </div>
            </div>
        </div> 
        
       <%-- <div class="modal" id="dialoganfitriona" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog modal-dialog-centered" role="document">
		        <div class="modal-content">
			        <div class="modal-header">
				        <h3 class="modal-title" style="color:black">Anfitriona</h3>
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        </div>
			        <div class="modal-body">
				        <div class="col-lg-12">
					        <table id="tblanfitriona" class="table table-bordered table-hover">
						        <thead>
							        <tr>
								        <th>N°</th>
								        <th>NOMBRE</th>
								        <th></th>
							        </tr>
						        </thead>
						        <tbody>
						        </tbody> 
					        </table>
				        </div>
			        </div>
			        <div class="modal-footer">
				        <input type="button" class="btn btn-success" onclick="actualizaranfitriona();" value="Grabar" title="Seleccionar"   />
			        </div>
		        </div>
	        </div>
        </div>--%>
       
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

<script src="../../../dist/js/jquery.keyboard.min.js"></script>
<script src="../../../dist/js/jquery.keyboard.extension-all.min.js"></script>

<script src="../../../dist/js/jquery.mousewheel.min.js"></script>
<script src="../../../dist/js/jquery.keyboard.extension-typing.min.js"></script>
<script src="../../../dist/js/jquery.keyboard.extension-previewkeyset.min.js"></script>
<script src="../../../dist/layouts/keyboard-layouts-greywyvern.min.js"></script>

<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
<script src="../../../plugins/jquery/puntoventa/puntoventa02/jquery.nuevoweb-3.1.9.js"></script>

<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>

<style>
    .ui-keyboard div {
        font-size: 1.7em;
    }

    .thumbnail-container {
      max-width:400px;
      max-height:400px;
    }

    .btn-bold {
         font-family: "Arial Bold", Gadget, sans-serif !important;
         font-style: normal !important;
         font-size: 15px !important;
         font-weight:bold !important;
    }

    tfoot td {
	    font-size: 16px !important;
        font-weight:bold;
    }

    .ui-autocomplete {
      z-index:2147483647;
    }

</style>

</body>
</html>