<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta03.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Pedido Nuevo</title>

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
  <link rel="stylesheet" href="../../../Content/style_custom_v50.5.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem;"> 
                <div class="row">
                    <div class="col-lg-4">
                        <asp:Literal ID="lblentrega" runat="server"></asp:Literal>||
                        <asp:Literal ID="lblpedido" runat="server"></asp:Literal>||
                        <a href="#" style="color:black" id="fechadiferencia"></a>||
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>||
                        <a href="#" style="color:black"  id="datos"></a>

                        <asp:LoginStatus ID="LoginStatus1" runat="server" 
                        LogoutAction="Redirect"
                        onclick="return true;"
                        LogoutText="<i class='fas fa-sign-out-alt'></i>" 
                        LogoutPageUrl="~/" 
                        OnLoggingOut="Unnamed_LoggingOut" ToolTip="Salir" />
                        
                    </div>
                    <div class="col-lg-4">
                        <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                <div class="btn-group mr-2" role="group" aria-label="For group" id="lanulacion">
									<button type="button" class="btn btn-outline-danger btn-bold" onclick="anulacion();" title="Eliminar">
                                        <i class="fa fa-trash" aria-hidden="true"></i><b>E</b>
									</button>
								</div>
                                <div class="btn-group mr-2" role="group" aria-label="For group" id="ltransferencia" style="visibility:hidden">
									<a href="#"><img src="../../../Img/transferencia32.png" title="Transferencia" class="img-thumbnail" onclick="transferencia();" /></a>
								</div>
                             </div>
                        </div>
                    </div>
                    <div class="col-lg-4">                         
                        <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="First group">
									<button type="button" class="btn btn-outline-primary btn-bold" onclick="comanda();" title="Comanda"><b>C</b></button>
								</div>
								<div class="btn-group mr-2" role="group" aria-label="Second group">
									<button type="button" class="btn btn-outline-secondary btn-bold" onclick="precuenta();" title="Precuenta"><b>P</b></button>
								</div>
                                <div class="btn-group mr-2" role="group" aria-label="First group">
									<button type="button" class="btn btn-outline-warning" id="btnactualizar" title="Actualizar">
										<i class="fa fa-refresh" aria-hidden="true"></i>
									</button>
								</div>
								<div class="btn-group mr-2" role="group" aria-label="Second group" id="divretornar">
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

                    <div class="card-body" style="padding:0.5rem !important">
                        <div class="container-fluid">

                            <div class="row">
                                <input type="hidden" name="hmobile" id="hmobile" value="0" runat="server"/>
                                <input type="hidden" name="hid" id="hid" value="0" runat="server"/>
                                <input type="hidden" name="hidpersona" id="hidpersona" value="0" runat="server"/>
                                <input type="hidden" name="hestado" id="hestado" value="0" runat="server"/>
                                <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                                <input type="hidden" name="hmoneda" id="hmoneda"  runat="server" value="PEN"/>
                                
                                <input type="hidden" name="himpresora" id="himpresora" runat="server"/>
                                <input type="hidden" name="hacceso" id="hacceso" runat="server"/>
                                <input type="hidden" name="hcaja" id="hcaja" runat="server"/>
                                
                                <input type="hidden" name="hidcaja" id="hidcaja" runat="server"/>    
                                <input type="hidden" name="hserie" id="hserie" runat="server"/>

                                <input type="hidden" name="hempleado" id="hempleado" runat="server"/>
                                <input type="hidden" name="hmesero" id="hmesero" runat="server"/>
                                <input type="hidden" name="hstock" id="hstock" runat="server"/>
                                <input type="hidden" name="hstockver" id="hstockver" runat="server"/>
                                <input type="hidden" name="hcomandaimpresion" id="hcomandaimpresion" runat="server"/>
                                <input type="hidden" name="hidalmacen" id="hidalmacen" runat="server"/>
                                <input type="hidden" name="hidubicacion" id="hidubicacion" runat="server"/>
                                <input type="hidden" name="hubicaciones" id="hubicaciones" runat="server"/>
                                <input type="hidden" name="htipocambio" id="htipocambio" runat="server"/>
                                <input type="hidden" name="hfecha" id="hfecha" runat="server"/>
                                <input type="hidden" name="hidpedidodetalle" id="hidpedidodetalle" runat="server"/>
                                <input type="hidden" name="hcomnadapermiso" id="hcomnadapermiso" runat="server" value="0"/>
                                <input type="hidden" name="hcomandapendiente" id="hcomandapendiente" runat="server" value="1"/>
                                <input type="hidden" name="hcomandaenviada" id="hcomandaenviada" runat="server" value="0"/>
                                <input type="hidden" name="hentrega" id="hentrega" runat="server"/>
                                <input type="hidden" name="hpagina" id="hpagina"  runat="server"/>
                                <input type="hidden" name="hpagado" id="hpagado" runat="server"/>

                                <input type="hidden" name="hprecuentaimpresoras" id="hprecuentaimpresoras" runat="server"/>
                                <input type="hidden" name="hprecuentaimpresoraip" id="hprecuentaimpresoraip" runat="server"/>
                                

                                <input type="hidden" name="hmoneda1" id="hmoneda1" runat="server" value="0"/>
                                <input type="hidden" name="hmoneda2" id="hmoneda2" runat="server" value="0"/>

                                <input type="hidden" name="hmotorizado" id="hmotorizado" runat="server"/>
                                <input type="hidden" name="hcategoriascantidad" id="hcategoriascantidad" runat="server"/>

                                <input type="hidden" name="htecladovisualiza" id="htecladovisualiza" runat="server"/>
                                <input type="hidden" name="hdcpermitido" id="hdcpermitido" runat="server"/>
                                <input type="hidden" name="hfamiliapedido" id="hfamiliapedido" runat="server"/>
                                <input type="hidden" name="hcomandavolver" id="hcomandavolver" runat="server"/>

                                <input type="hidden" name="hpagoporplato" id="hpagoporplato" runat="server"/>
                                    
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div id="divcategorias" class="row"></div>
                                    <div class="row"><br /></div>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8">
                                            <input type="text" class="form-control" id="qproducto" name="qproducto"  placeholder="Producto" />
                                        </div>
                                        <div class="col-2 float-left">
                                            <button type="button" class="btn btn-outline-info" id="hbuscar" title="hbuscar" onclick="buscarproducto();">
												<i class="fas fa-search fa-lg"></i>
											</button>
                                        </div>
                                    </div>
                                    <div class="row"><br /></div>
                                    <div id="divproductos" class="row"></div>
                                </div>

                                <div class="col-lg-6">
                                    <table id="tbldetalle" class="table table-bordered table-hover">
                                        <thead>
								            <tr>
									            <th>PRODUCTO</th>
									            <th></th>
									            <th>CANT</th>
									            <th></th>
									            <th>PRECIO</th>
									            <th id="amonto">TOTAL</th>
									            <th id="th_personas"></th>
                                                <th><input type="checkbox"id="chk_todos" name="chk_todos" style="width: 30px !important;height: 30px!important;"  onclick="seleccionartodos();" /></th>
								            </tr>
								        </thead>
                                        <tbody>
								        </tbody> 
                                        <tfoot id="tbfootid">
								            <tr>
									            <td></td>
									            <td></td>
									            <td></td>
									            <td></td>
									            <td></td>
									            <td style="text-align:right">0.00</td>
									            <td></td>
                                                <td></td>
								            </tr>
                                        </tfoot>
                                    </table>
                                </div>            
                            </div>

                        </div>
                       
                    </div>
                    <!-- /.card -->
                </div>
            </section>
            <!-- /.content -->
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
        
        <div class="modal" id="dialogpersonas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Persona</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">        
                        <div class="row">
                            <div class="col-lg-6">
                                <span>Personas</span>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" maxlength="2"  name="personas" id="personas" runat="server" onkeypress="return isNumber(event)" class="form-control" style="font-size:34px;height:40px;text-align:right" value="0"  />
                            </div>
                        </div>
                    
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
                                    <div class="card-body">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <h5 class="card-title">Edades</h5>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <span>Niños</span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <input type="text" maxlength="2"  name="ninos" id="ninos" onkeypress="return isNumber(event)" runat="server"  class="form-control" style="font-size:34px;height:40px;text-align:right" value="0"  />
                                                    </div>
                                                </div>
                       
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <span>Adultos</span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <input type="text" maxlength="2"  name="adultos" id="adultos" onkeypress="return isNumber(event)" runat="server"  class="form-control" style="font-size:34px;height:40px;text-align:right" value="0" />
                                                    </div>
                                                </div>
                       
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <span>Ancianos</span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <input type="text" maxlength="2"  name="ancianos" id="ancianos" onkeypress="return isNumber(event)" runat="server"  class="form-control" style="font-size:34px;height:40px;text-align:right" value="0" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                      
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <h5 class="card-title">Sexo</h5>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <span>Hombres</span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <input type="text" maxlength="2" name="hombres" id="hombres" onkeypress="return isNumber(event)" runat="server"  class="form-control" style="font-size:34px;height:40px;text-align:right" value="0" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <span>Mujeres</span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <input type="text" maxlength="2" name="mujeres" id="mujeres" onkeypress="return isNumber(event)" runat="server"  class="form-control" style="font-size:34px;height:40px;text-align:right" value="0"  />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                          
                                    </div>
                                </div>
                              </div>
                        </div>
                    </div>
                   <div class="modal-footer">
                       
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                       <input type="button" class="btn btn-success" onclick="actualizarpersonas();" value="Grabar" title="Grabar"   />
                       
                   </div>
                </div>
            </div>
        </div>


        <div class="modal" id="dialogpersonalizar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-xl modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Personalizar</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">      
                        <div class="row">
                            <div class="col-lg-2">
                                <span style="font-size:24px">Entrada</span>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" id="pentrada" name="pentrada" style="width:30px !important;height:30px !important;"/>
                            </div>
                            <div class="col-lg-2">
                                <span style="font-size:24px" id="spobservacion">Observación</span>
                            </div>
                            <div class="col-lg-4">
                                <input type="text" name="pobservacion" id="pobservacion" maxlength="100" class="form-control" />
                            </div>
                        </div>
                        <br />      
                        <table id="tblpersonalizar" class="table table-bordered table-hover">
                        </table>

                        <table id="tblcombo" class="table table-bordered table-hover">
						</table>
                    </div>
                    <div class="modal-footer">
                        
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <input type="button" class="btn btn-success" id="btnactualizarpersonalizar" name="btnactualizarpersonalizar" onclick="actualizarpersonalizar();" value="Grabar" title="Grabar"   />
                   </div>
                </div>
            </div>
        </div>

       <div class="modal" id="dialogprecuentaimpresora" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Seleccione Impresora Precuenta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-12" style="text-align:center" id="dprecuentaimpresora" name="dprecuentaimpresora">
                                
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" onclick="cancelarprecuentaimpresora();" value="Cancelar" title="Cancelar"  />
                       
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
                                <input type="text" name="cantidad" id="cantidad" maxlength="7" onkeypress="return isNumberKey(event)" runat="server" class="form-control" value="1" style="text-align:right;font-size:28px;width:140px" />
                            </div>
                        </div>

                    </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                       <input type="button" class="btn btn-success" onclick="actualizarcantidad();" value="Grabar" title="Grabar"   />
                       
                       <input type="hidden" name="hidproducto" id="hidproducto"/>
                       <input type="hidden" name="hiddetalle" id="hiddetalle"/>
                       <input type="hidden" name="hprecio" id="hprecio"/>
                   </div>
                </div>
            </div>
        </div>

        
        <div class="modal fade" id="dialogAnular" tabindex="-1" role="dialog" aria-labelledby="dialogAnularLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="dialogAnularLabel">Punto de Venta</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    Esta seguro de eliminar el pedido ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success" onclick="anular_aceptar()">Aceptar</button>
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
                    Esta seguro de eliminar el item ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success" onclick="anular_item_aceptar()">Aceptar</button>
                </div>
                </div>
            </div>
        </div>    

        <div class="modal" id="dialogtransferencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Producto Transferencia</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <span style="font-size:24px;font-weight:bold" id="tnombre"></span>
                            </div>
                        </div>               
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <select id="cboarea" name="cboarea" class="form-control"></select>
                            </div>
                            <div class="col-lg-6">
                                <select id="cboubicacion" name="cboubicacion" class="form-control"></select>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-warning" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizartransferencia();" value="Grabar" title="Grabar"   />
                       
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogmesero" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Cambio de Mozo</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <select id="cboempleado" name="cboempleado" class="form-control"></select>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizarcambiomesero();" value="Grabar" title="Grabar"   />
                       
                   </div>
                </div>
            </div>
        </div>


        <div class="modal" id="dialogreimpresion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Punto de Venta</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                       Esta seguro de generar la reimpresión de comandas?
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" class="btn btn-success" onclick="actualizar_reimpresion();" value="Grabar" title="Reimpresión"   />
                       
                   </div>
                </div>
            </div>
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
<script src="../../../plugins/jquery/puntoventa/puntoventa03/jquery.nuevoweb-3.0.0.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>

<style>
    .ui-keyboard div {
        font-size: 1.7em;
    }

    tfoot td {
	    font-size: 16px !important;
        font-weight:bold;
    }
</style>

</body>
</html>