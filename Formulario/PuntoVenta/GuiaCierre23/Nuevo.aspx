<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaCierre23.Nuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Guia Cierre</title>

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

    <link rel="stylesheet" href="../../../plugins/bootstrap-select/css/bootstrap-select.css" />
    <link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem"> 
                <div class="row">
                    <div class="col-lg-6">
                        <asp:Literal ID="lblempleado" runat="server"></asp:Literal>                        
                    </div>
                    <div class="col-lg-6">                         
                        <div class="d-flex flex-row justify-content-end p-1">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="First group">
                                    <button type="button" class="btn btn-primary" id="btngrabar1" title="Generar Guía Electrónica" onclick="generar('1');">
										<i class="fas fa-handshake-o"></i> 
									</button>
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Second group">
                                    <button type="button" class="btn btn-success" id="btngrabar0" title="Grabar" onclick="generar('0');">
										<i class="fas fa-save"></i>Grabar
									</button>
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Tree group">
                                    <button type="button" class="btn btn-warning" id="btncargapdf" title="Ver Documento" onclick="viewpdf_documento();">
										<i class="fas fa-file-pdf-o"></i>
									</button>
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Four group">
                                    <button type="button" class="btn btn-outline-warning" id="btnactualizar" title="Actualizar"  onclick="actualizar();">
										<i class="fa fa-refresh" aria-hidden="true"></i>
									</button>
                                </div>
                            </div>
                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                <div class="btn-group mr-2" role="group" aria-label="Five group">
                                    <button type="button" class="btn btn-secondary" id="btncancelar" title="Retornar" onclick="retornar();">
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
                                <input type="hidden" name="hid" id="hid" runat="server"/>
                               <input type="hidden" name="hruc" id="hruc" runat="server"/>
                                <input type="hidden" name="htipo" id="htipo" runat="server"/>

                               <input type="hidden" name="hidlocal" id="hidlocal" runat="server" value="0"/>
                               <input type="hidden" name="hidcliente" id="hidcliente" runat="server" value="0"/>
                               <input type="hidden" name="hidtransportista" id="hidtransportista" runat="server" value="0"/>
                               <input type="hidden" name="hidproveedor" id="hidproveedor" runat="server" value="0"/>
                               <input type="hidden" name="hidcomprador" id="hidcomprador" runat="server" value="0"/>
                               <input type="hidden" name="hgenerar" id="hgenerar" runat="server" value="0"/>

                               <input type="hidden" name="hguiaauditor" id="hguiaauditor" runat="server"/>
						       <input type="hidden" name="hguiavalidador" id="hguiavalidador" runat="server"/>

                               <input type="hidden" name="hanulado" id="hanulado" runat="server"/>
                               <input type="hidden" name="hestado" id="hestado" runat="server"/>

                               <input type="hidden" name="hguiageneracionotros" id="hguiageneracionotros" runat="server"/>
                               <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("GC23New") %>" />


                            </div>
                          
                             <div class="d-block p-1 bg-secondary text-white">
                                <h4>Principal</h4>
                             </div>
                            
                             <div class="row">

                                <div class="col-lg-2">
                                    <label class="form-label">Fecha traslado</label>
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
                                    <label class="form-label">Fecha en destinatario</label>
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

                                <div class="col-lg-3" id="divparametos">
                                    <label class="form-label">Indicador</label>
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
                                    <label class="form-label">Motivo de traslado</label>
                                    <select id="cbomotivo" class="form-control" runat="server" required="required"></select>
                                </div>

                                 <div class="col-lg-3" id="divmotivootro" name="divmotivootro">
                                    <label class="form-label">Otro(texto)</label>
                                    <input type="text" id="motivo" class="form-control" maxlength="100" placeholder="max 100 caracteres" runat="server"/>
                                </div>

                                 <div class="col-lg-3">
                                    <label class="form-label">Modalidad de transporte</label>
                                    <select id="cbomodalidad" class="form-control" runat="server" required="required">    
                                        <option value="0">[Ninguno]</option>
                                        <option value="02">Transporte privado</option>
                                        <option value="01">Transporte público</option>
                                    </select>
                                </div>

                                 

                                 <div class="col-lg-6" id="divtransportista" style="display:none">
                                     <div class="row">
                                         <div class="col-lg-12">
                                             <label class="form-label">Transportista</label>
                                         </div>
                                     </div>
                                     <div class="row">
                                         <div class="col-lg-10" id ="divtransportista_select">
                                            <select class="form-control selectpicker" data-live-search="true" id="cbotransportista"></select>
                                         </div>
                                         <div class="col-lg-2">
                                             <button type="button" class="btn btn btn-success" onclick="agregartransportista();" title="Agregar Transportista">
										        <i class="fas fa-plus" aria-hidden="true"></i>
									        </button>
                                         </div>
                                     </div>
                                </div>
                            </div>
                            <div class="border-top my-3"></div>


                            <div id="divdocumento">
                                <div class="d-block p-1 bg-secondary text-white">
                                    <div class="row">
                                        <div class="col-6">
                                            <h4>Documentos relacionados</h4>
                                        </div>
                                        <div class="col-6">

                                            <div class="d-flex flex-row justify-content-end p-1">
							                    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                                    <div class="btn-group mr-2" role="group" aria-label="First group">
                                                        <button type="button" class="btn btn-success" onclick="agregardocumento();" title="Agregar Información Documento">
										                    <i class="fas fa-plus" aria-hidden="true"></i>
									                    </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table id="tbldocumento" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Nombre</th>
                                            <th>Numero</th>
                                            <th>Emisor Tipo</th>
                                            <th>Emisor Número</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                                <div class="border-top my-3"></div>
                            </div>

                             <div id="divdireccionpartida" style="display:none">
                                <div class="d-block p-1 bg-secondary text-white">
                                    <h4>Dirección Partida</h4>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
								        <div class="form-group">
									        <label class="form-label">Departamento</label>
									        <select id="cbodepartamentop" name="cbodepartamentop" class="form-control"></select>
								        </div>
							        </div>
							        <div class="col-lg-3">
								        <div class="form-group">
									        <label class="form-label">Provincia</label>
									        <select id="cboprovinciap" name="cboprovinciap" class="form-control"></select>
								        </div>
							        </div>
					
							        <div class="col-lg-3">
								        <div class="form-group">
									        <label class="form-label">Distrito</label>
									        <select id="cbodistritop" name="cbodistritop" class="form-control"></select>
								        </div>
							        </div>
							        <div class="col-lg-3">
								        <div class="form-group">
									        <label class="form-label">Ubigeo</label>
									        <input type="text" name="ubigeop" id="ubigeop" maxlength="6" class="form-control"  disabled="disabled" />
								        </div>
							        </div>
							        <div class="col-lg-12">
								        <div class="form-group">
									        <label class="form-label">Dirección</label>
									        <input name="direccionp" id="direccionp" class="form-control" maxlength="200" placeholder="MÁXIMO 200 CARACTERES" required="required" />
								        </div>
							        </div>
                                </div>
                                <div class="border-top my-3"></div>
                            </div>

                           <div id="divcliente">
                              <div class="d-block p-1 bg-secondary text-white">
                                  <div class="row">
                                    <div class="col-6">
                                        <h4><span id="scliente">Destinatario</span></h4>
                                    </div>
                                    <div class="col-6">

                                        <div class="d-flex flex-row justify-content-end p-1">
							                <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                                <div class="btn-group mr-2" role="group" aria-label="First group">
                                                    <button type="button" class="btn btn-success" onclick="agregarcliente();" title="Agregar Cliente">
										                <i class="fas fa-plus" aria-hidden="true"></i>
									                </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              </div>
                              <div class="row">
                                    <div class="col-lg-3">
                                        <label for="cbotipodocumento">Tipo</label>
                                        <select class="form-control" id="cbotipodocumento" name="cbotipodocumento" runat="server"></select>
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Numero</label>
                                        <label class="form-label" style="color:blue;text-decoration:underline;cursor: pointer;" onclick="buscar_numero();">(click)</label>
                                        <input type="text" id="numero" class="form-control" maxlength="15" runat="server" placeholder="Enter luego de ingresar"/>
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Nombre</label>
                                        <input type="text" id="nombre" class="form-control" disabled="disabled" runat="server"/>
                                    </div>

                                    <div class="col-lg-2">
                                        <label class="form-label">
                                            <span id="spandireccion">Enviar a</span>
                                        </label>
                                        <select id="cboentrega" class="form-control" runat="server">                                       
                                        </select>
                                    </div>
                                    <div class="col-lg-1">
                                        <div class="row">
                                            <br />
                                        </div>
                                        <div class="row">
                                            <button type="button" class="btn btn-warning" onclick="agregardireccion();" title="Agregar Dirección">
										        <i class="fas fa-map" aria-hidden="true"></i>
									        </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="border-top my-3"></div>
                            </div>

                            

                            <div id="divproveedor">
                                <div class="d-block p-1 bg-secondary text-white">
                                    <div class="row">
                                        <div class="col-6">
                                            <h4>Proveedor</h4>
                                        </div>
                                        <div class="col-6">

                                            <div class="d-flex flex-row justify-content-end p-1">
							                    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">                                
                                                    <div class="btn-group mr-2" role="group" aria-label="First group">
                                                        <button type="button" class="btn btn-success" onclick="agregarproveedor();" title="Agregar Proveedor">
										                    <i class="fas fa-plus" aria-hidden="true"></i>
									                    </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                     <div class="col-lg-3">
                                        <label for="cbotipodocumentop">Tipo</label>
                                        <select class="form-control" id="cbotipodocumentop" name="cbotipodocumentop" runat="server"></select>
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Numero</label>
                                        <label class="form-label" style="color:blue;text-decoration:underline;cursor: pointer;" onclick="buscar_numerop();">(click)</label>
                                        <input type="text" id="numerop" class="form-control" maxlength="15" runat="server" placeholder="Enter luego de ingresar"/>
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Nombre</label>
                                        <input type="text" id="nombrep" class="form-control" disabled="disabled" runat="server"  />
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">Recojo</label>
                                        <select id="cborecojop" class="form-control" runat="server" >                                       
                                        </select>
                                    </div>
                                </div>
                                <div class="border-top my-3"></div>
                            </div>




                            <div id="divdireccions" style="display:none">
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <h4><strong><p class="text-primary">Dirección Secundaria</p></strong></h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
								        <div class="form-group">
									        <label class="form-label">Departamento</label>
									        <select id="cbodepartamentot" name="cbodepartamentot" class="form-control"></select>
								        </div>
							        </div>
							        <div class="col-lg-3">
								        <div class="form-group">
									        <label class="form-label">Provincia</label>
									        <select id="cboprovinciat" name="cboprovinciat" class="form-control"></select>
								        </div>
							        </div>
					
							        <div class="col-lg-3">
								        <div class="form-group">
									        <label class="form-label">Distrito</label>
									        <select id="cbodistritot" name="cbodistritot" class="form-control"></select>
								        </div>
							        </div>
							        <div class="col-lg-3">
								        <div class="form-group">
									        <label class="form-label">Ubigeo</label>
									        <input type="text" name="ubigeot" id="ubigeot" maxlength="6" class="form-control"  disabled="disabled" />
								        </div>
							        </div>
							        <div class="col-lg-12">
								        <div class="form-group">
									        <label class="form-label">Dirección Destino</label>
									        <input name="direcciont" id="direcciont" class="form-control" maxlength="200" placeholder="MÁXIMO 200 CARACTERES" required="required" />
								        </div>
							        </div>
                                </div>
                                <div class="border-top my-3"></div>
                            </div>

                            <div id="divcomprador">
                                <div class="d-block p-1 bg-secondary text-white">
                                    <h4>Comprador</h4>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <label for="cbotipodocumento_comprador">Tipo</label>
                                        <select class="form-control" id="cbotipodocumento_comprador" name="cbotipodocumento_comprador" runat="server"></select>
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Numero</label>
                                        <label class="form-label" style="color:blue;text-decoration:underline;cursor: pointer;" onclick="buscar_numero_comprador();">(click)</label>
                                        <input type="text" id="numero_comprador" class="form-control" maxlength="15" runat="server" placeholder="Enter luego de ingresar" />
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Nombre</label>
                                        <input type="text" id="nombre_comprador" class="form-control" disabled="disabled" runat="server"  />
                                    </div>
                                </div>
                                <div class="border-top my-3"></div>
                            </div>
                           
                            <div id="divtransporte">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="d-block p-1 bg-secondary text-white">
                                            <div class="row">
                                                <div class="col-6">
                                                    <h4>Vehículo</h4>
                                                </div>
                                                <div class="col-6">
                                                    <div class="d-flex flex-row justify-content-end p-1">
							                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">   
                                                            <div class="btn-group mr-2" role="group" aria-label="Firdt group">
                                                                <button type="button" class="btn btn-warning" onclick="agregarvehiculo();" title="Agregar Vehiculo">
										                            <i class="fas fa-truck" aria-hidden="true"></i>
									                            </button>
                                                            </div>
                                                            <div class="btn-group mr-2" role="group" aria-label="Second group">
                                                                <button type="button" class="btn btn-success" onclick="Seleccionarvehiculo();" title="Seleccionar Vehiculo">
										                            <i class="fas fa-plus" aria-hidden="true"></i>
									                            </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                     
                                        <table id="tblvehiculo" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Datos</th>
                                                    <th>Nivel</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="d-block p-1 bg-secondary text-white disabled">
                                            <div class="row">
                                                <div class="col-6">
                                                    <h4>Conductor</h4>
                                                </div>
                                                <div class="col-6">
                                                    <div class="d-flex flex-row justify-content-end p-1">
							                            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">   
                                                            <div class="btn-group mr-2" role="group" aria-label="Firdt group">
                                                                <button type="button" class="btn btn-warning" onclick="agregarconductor();" title="Agregar Conductor">
										                            <i class="fas fa-user" aria-hidden="true"></i>
									                            </button>
                                                            </div>
                                                            <div class="btn-group mr-2" role="group" aria-label="Second group">
                                                                <button type="button" class="btn btn-success" onclick="Seleccionarconductor();" title="Seleccionar Conductor">
										                            <i class="fas fa-plus" aria-hidden="true"></i>
									                            </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                        <table id="tblconductor" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Datos</th>
                                                    <th>Nivel</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="border-top my-3"></div>
                            </div>
                           
                            
                            <div>
                                <div class="d-block p-1 bg-secondary text-white">
                                    <h4>Carga</h4>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3" id="divalmaceno">
                                        <label class="form-label">Almacen Origen</label>
                                        <select id="cboalmaceno" name="cboalmaceno" class="form-control"></select>
                                    </div>

                                    <div class="col-lg-3" id="divserieo">
                                        <label class="form-label">Serie</label>
                                        <select id="cboserieo" name="cboserieo" class="form-control"></select>
                                    </div>

                                    <div class="col-lg-3" id="divalmacend">
                                        <label class="form-label">Almacen Destino</label>
                                        <select id="cboalmacend" name="cboalmacend" class="form-control"></select>
                                    </div>

                                    <div class="col-lg-3" id="divseried">
                                        <label class="form-label">Serie</label>
                                        <select id="cboseried" name="cboseried" class="form-control"></select>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">Unidad</label>
                                        <select id="cbounidad" class="form-control" runat="server" required="required">
                                       
                                        </select>
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Peso Bruto</label>
                                        <input type="text" name="peso" id="peso" value="" maxlength="15" class="form-control" onkeypress="return filterFloat3(event,this);" required="required" runat="server"/>
                                    </div>
                            
                                    <div class="col-lg-3">
                                        <label class="form-label">N° Bultos</label>
                                        <input type="text" name="bultos" id="bultos" value=""  maxlength="7" class="form-control" onkeypress="return isNumber(event)" required="required" runat="server"/>
                                    </div>

                                

                                    <div class="col-lg-12">
                                        <label class="form-label">Observación</label>
                                        <textarea name="observacion" id="observacion" value="" maxlength="250" placeholder="Máximo 250 caracteres" class="form-control" rows="2" style="resize:none;"></textarea>
                                    </div>
                                </div>
                                <div class="border-top my-3"></div>
                            </div>

                            <div id="divaduanas" style="display:none">
                                <div class="row">
                                    <div class="col-lg-6">

                                        <div class="d-block p-1 bg-secondary text-white">
                                            <h4>Contenedor
                                                <a href="#"><img src="../../../Img/mas.png" title="Agregar Información Contenedor" class="img-thumbnail float-sm-end" onclick="agregarcontenedor();" /></a>
                                            </h4>
                                        </div>                                       
                                        <table id="tblcontenedor" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Contenedor</th>
                                                    <th>Precinto</th>
                                                    <th>Referencia</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="d-block p-1 bg-secondary text-white">
                                            <h4>Puerto
                                                <a href="#"><img src="../../../Img/mas.png" title="Agregar Información Puerto/Aeropueto" class="img-thumbnail float-sm-end" onclick="agregarpuerto();" /></a>
                                            </h4>
                                        </div>
                                        <table id="tblpuerto" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                  <th>Codigo</th>
                                                  <th>Nombre</th>
                                                  <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="border-top my-3"></div>
                            </div>

                            <div id="divproductos" style="display:none">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="row">
                                            <h4><strong><p class="text-primary">Detalle de Productos Exportación/Importación</p></strong></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <table id="tblproducto" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                  <th>Codigo</th>
                                                  <th>Nombre</th>
                                                  <th>Cantidad</th>
                                                  <th>
                                                      <input type="text" maxlength="50" placeholder="7020-Subpartida nacional"  name="e7020" id="e7020" runat="server"  class="form-control" style="background-color: rgb(255, 255, 0);"  />
                                                  </th>
                                                  <th>
                                                      <input type="text" maxlength="50" placeholder="7021-Numeracion de la DAM o DS"  name="e7021" id="e7021" runat="server"  class="form-control" style="background-color: rgb(255, 255, 0);"  />
                                                  </th>
                                                  <th>
                                                      <input type="text" maxlength="1" placeholder="7022-Indicador de bien regulado por SUNAT"  name="e7022" id="e7022" runat="server" onkeypress='return isNumber(event)' class="form-control" style="background-color: rgb(255, 255, 0);"  />
                                                  </th>
                                                  <th>
                                                      <input type="text" maxlength="4" placeholder="7023-Numero de serie en la DAM o DS"  name="e7023" id="e7023" runat="server" onkeypress='return isNumber(event)'  class="form-control"  style="background-color: rgb(255, 255, 0);"  />
                                                  </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="border-top my-3"></div>
                            </div>
                            

                            <div id="divotros" style="display:none">
                                <div class="d-block p-1 bg-secondary text-white">
                                    <h4>Otros Datos</h4>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <label class="form-label">N° Salida Almacen</label>
                                        <input type="text" name="salidaalmacen" id="salidaalmacen" value=""  maxlength="20" class="form-control" runat="server"/>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">N° Orden Trabajo</label>
                                        <input type="text" name="ordentrabajo" id="ordentrabajo" value=""  maxlength="20" class="form-control" runat="server"/>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">N° Pedido</label>
                                        <input type="text" name="numeropedido" id="numeropedido" value=""  maxlength="20" class="form-control" runat="server"/>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">N° Orden Compra</label>
                                        <input type="text" name="ordencompra" id="ordencompra" value=""  maxlength="20" class="form-control" runat="server"/>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">N° Orden Interno</label>
                                        <input type="text" name="ordeninterno" id="ordeninterno" value=""  maxlength="20" class="form-control" runat="server"/>
                                    </div>

                                    <div class="col-lg-3">
                                        <label class="form-label">N° OutbondDelivery</label>
                                        <input type="text" name="outbonddelivery" id="outbonddelivery" value=""  maxlength="20" class="form-control" runat="server"/>
                                    </div>
                                </div>
                                <div class="border-top my-3"></div>
                            </div>

                            <div id="divauditoria" style="display:none">
                                <div class="d-block p-1 bg-secondary text-white">
                                    <h4>Auditoría</h4>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <label class="form-label">Validación</label>
                                        <select id="cboauditoria" name="cboauditoria" class="form-control">
                                            <option value="">[Ninguno]</option>
                                            <option value="1">Requerido</option>
                                        </select>
                                    </div>
                                 
                                    <div class="col-lg-3">
                                        <label class="form-label">Usuario</label>
                                        <select id="cbousuarios" name="cbousuarios" class="form-control"></select>
                                    </div>
                                </div>
                                <div class="border-top my-3"></div>                                
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
                        <input type="button" class="btn btn-success" id="btngenerar" onclick="this.disabled='true';grabar('');" value="Generar" title="Generar"   />
                       
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogagregarvehiculo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Vehículo</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label class="form-label">Placa</label>
                                <input type="text" id="placa" maxlength="6" class="form-control" runat="server" onkeypress="return isAlphanumericKey(event);"  required="required"/>
                            </div>
                            <div class="col-lg-6"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <label class="form-label">Marca</label>
                                <input type="text" id="marca" maxlength="20" class="form-control" runat="server" required="required"/>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Modelo</label>
                                <input type="text" id="modelo" maxlength="20" class="form-control" runat="server"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <label class="form-label">Entidad</label>
                                <select id="cboentidadautorizacion" class="form-control" runat="server"></select>
                            </div>
                             <div class="col-lg-6">
                                <label class="form-label">Autorización</label>
                                <input type="text" id="numeroautorizacion" maxlength="50" class="form-control" runat="server"/>
                            </div>
                        </div>
                        
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="btnagregarvehiculo" class="btn btn-success" onclick="grabarvehiculo();" value="Agregar" title="Agregar"   />
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogagregarconductor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Conductor</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="cbotipodocumento_ac">Tipo</label>
                                <select class="form-control" id="cbotipodocumento_ac" name="cbotipodocumento_ac" runat="server"></select>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Numero</label>
                                <label class="form-label" style="color:blue;text-decoration:underline;cursor: pointer;" onclick="buscar_numero_ac();">(click)</label>
                                <input type="text" id="numero_ac" class="form-control" runat="server" required="required" maxlength="11" onkeypress="return isNumberKeyOnly(event);" placeholder="Documento (Enter)"/>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Nombre</label>
                                <input type="text" id="nombre_ac" maxlength="100" class="form-control" runat="server"/>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Apellidos</label>
                                <input type="text" id="apellido_ac" maxlength="100" class="form-control" runat="server"/>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Licencia</label>
                                <input type="text" id="licencia_ac" maxlength="10" class="form-control" runat="server" onkeypress="return isAlphanumericKey(event);"  required="required"/>
                            </div>
                        </div>
                        
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="btnagregarconductor" class="btn btn-success" onclick="grabarconductor();" value="Agregar" title="Agregar"   />
                   </div>
                </div>
            </div>
        </div>


        <div class="modal" id="dialogcliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Cliente</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="cbotipodocumentoc">Tipo</label>
                                <select class="form-control" id="cbotipodocumentoc" name="cbotipodocumentoc" runat="server"></select>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Numero</label>
                                <label class="form-label" style="color:blue;text-decoration:underline;cursor: pointer;" onclick="buscar_numeroc();">(click)</label>
                                <input type="text" id="numeroc" class="form-control" maxlength="15" runat="server" placeholder="Enter luego de ingresar"/>
                            </div>
                            <div class="col-lg-12">
                                <label class="form-label">Nombre</label>
                                <input type="text" id="nombrec" maxlength="100" class="form-control" runat="server"/>
                            </div>
                        </div>
                        
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="btnactualizarcliente" class="btn btn-success" onclick="actualizarcliente();" value="Agregar" title="Agregar"   />
                   </div>
                </div>
            </div>
        </div>


        <div class="modal" id="dialogtransportista" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Transportista</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="cbotipodocumentoc">Tipo</label>
                                <select class="form-control" id="cbotipodocumentot" name="cbotipodocumentot" runat="server"></select>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Numero</label>
                                <label class="form-label" style="color:blue;text-decoration:underline;cursor: pointer;" onclick="buscar_numerot();">(click)</label>
                                <input type="text" id="numerot" class="form-control" maxlength="15" runat="server" placeholder="Enter luego de ingresar"/>
                            </div>
                            <div class="col-lg-12">
                                <label class="form-label">Nombre</label>
                                <input type="text" id="nombret" maxlength="100" class="form-control" runat="server"/>
                            </div>
                        </div>
                        
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="Button1" class="btn btn-success" onclick="actualizartransportista();" value="Agregar" title="Agregar"   />
                   </div>
                </div>
            </div>
        </div>



        <div class="modal" id="dialogdireccion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Direcciones</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-3">
								<div class="form-group">
									<label class="form-label">Departamento</label>
									<select id="cbodepartamento" name="cbodepartamento" class="form-control"></select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label class="form-label">Provincia</label>
									<select id="cboprovincia" name="cboprovincia" class="form-control"></select>
								</div>
							</div>
					
							<div class="col-lg-3">
								<div class="form-group">
									<label class="form-label">Distrito</label>
									<select id="cbodistrito" name="cbodistrito" class="form-control"></select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label class="form-label">Ubigeo</label>
									<input type="text" name="ubigeo" id="ubigeo" maxlength="6" class="form-control" onkeypress="return isNumberKey(event);"/>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label class="form-label">Dirección</label>
									<input name="direccion" id="direccion" class="form-control" maxlength="200" placeholder="MÁXIMO 200 CARACTERES" required="required" />
								</div>
							</div>
                        </div>                        
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="btnactualizardireccion" class="btn btn-success" onclick="actualizardireccion();" value="Agregar" title="Agregar"   />
                   </div>
                </div>
            </div>
        </div>


        <div class="modal" id="dialogdocumento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Documento</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <label for="form-label">Documento</label>    
                                <select id="cbodocumento"  class="form-control">
                                    <option value='01'>Factura</option>
                                    <option value='03'>Boleta de Venta</option>
                                    <option value='04'>Liquidación de Compra</option>
                                    <option value='09'>Guía de Remisión Remitente</option>
                                    <option value='12'>Ticket o cinta emitido por máquina registradora</option>
                                    <option value='48'>Comprobante de Operaciones – Ley N° 29972</option>
                                    <option value='49'>Constancia de Depósito - IVAP (Ley 28211)</option>
                                    <option value='50'>Declaración Aduanera de Mercancías</option>
                                    <option value='52'>Declaración Simplificada (DS)</option>
                                    <option value='71'>Resolución de Adjudicación de bienes – SUNAT</option>
                                    <option value='72'>Resolución de Comiso de bienes – SUNAT</option>
                                    <option value='73'>Guía de Transporte Forestal o de Fauna - SERFOR</option>
                                    <option value='74'>Guía de Tránsito – SUCAMEC</option>
                                    <option value='75'>Autorización para operar como empresa de Saneamiento Ambiental – MINSA - </option>
                                    <option value='76'>Autorización para manejo y recojo de residuos sólidos peligrosos y no peligrosos</option>
                                    <option value='77'>Certificado fitosanitario la movilización de plantas, productos vegetales, y otros artículos reglamentados </option>
                                    <option value='78'>Registro Único de Usuarios y Transportistas de Alcohol Etílico</option>
                                    <option value='80'>Constancia de Depósito – Detracción</option>
                                    <option value='81'>Código de autorización emitida por el SCOP</option>
                                </select>
                            </div>
                            <div class="col-lg-8">
                                <label class="form-label">Documento</label>
                                <input type="text" id="numerodocumento" class="form-control" maxlength="20" placeholder="Maximo 50 caracteres" runat="server"/>
                            </div>
                            <div class="col-lg-12">
                                <br />
                            </div>
                            <div class="col-lg-12">
                                <h4>Emisor</h4>
                            </div>
                            <div class="col-lg-4">
                                <label for="cbotipodocumentod">Tipo</label>
                                <select class="form-control" id="cbotipodocumentod" name="cbotipodocumentod" runat="server"></select>
                            </div>
                            <div class="col-lg-8">
                                <label class="form-label">Numero</label>
                                <input type="text" id="numerod" class="form-control" maxlength="15" runat="server"/>
                            </div>
                        </div>
                        
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="btnactualizardocumento" class="btn btn-success" onclick="actualizardocumento();" value="Agregar" title="Agregar"   />
                   </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogcontenedor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Contenedor</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="form-label">Contenedor</label>
                                <input type="text" id="contenedor" class="form-control" maxlength="20" placeholder="Maximo 20 caracteres" runat="server"/>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Precinto</label>
                                <input type="text" id="precinto" class="form-control" maxlength="20" placeholder="Maximo 20 caracteres" runat="server"/>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Referencia</label>
                                <select id="cboreferencia"  class="form-control">
                                    <option value=''>[Ninguno]</option>
                                    <option value='Aduana'>Aduana</option>            
                                </select>
                            </div>
                        </div>
                        
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="btnactualizarcontenedor" class="btn btn-success" onclick="actualizarcontenedor();" value="Agregar" title="Agregar"   />
                   </div>
                </div>
            </div>
        </div>
      

        <div class="modal" id="dialogvehiculo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Transporte</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="form-label">Vehículo</label>
                                <select id="cbovehiculo" name="cbovehiculo" class="form-control selectpicker" data-live-search="true" runat="server"></select>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Nivel</label>
                                <select id="cbonivelv" name="cbonivelv" class="form-control" runat="server">
                                    <option value="Principal">Principal</option>
                                    <option value="Secundario">Secundario</option>
                                </select>
                            </div>
                        </div>
                        
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="btnactualizarvehiculo" class="btn btn-success" onclick="actualizarvehiculo();" value="Agregar" title="Agregar"   />
                   </div>
                </div>
            </div>
        </div>


        <div class="modal" id="dialogconductor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Conductor</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="form-label">Conductor</label>
                                <select id="cboconductor" class="form-control selectpicker" data-live-search="true" runat="server"></select>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Nivel</label>
                                <select id="cbonivelc" name="cbonivelc" class="form-control" runat="server">
                                    <option value="Principal">Principal</option>
                                    <option value="Secundario">Secundario</option>
                                </select>
                            </div>
                        </div>
                        
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="btnactualizarconductor" class="btn btn-success" onclick="actualizarconductor();" value="Agregar" title="Agregar"   />
                   </div>
                </div>
            </div>
        </div>


        <div class="modal" id="dialogpuerto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Puerto/Aeropuerto</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="form-label">Tipo</label>
                                <select id="cbotipopuerto" class="form-control" runat="server">
                                    <option value="0">[Seleccionar]</option>
                                    <option value="1">Puerto</option>
                                    <option value="2">Aeropuerto</option>
                                </select>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-label">Item</label>
                                <select id="cbopuerto" name="cbopuerto" class="form-control" runat="server">
                                </select>
                            </div>
                        </div>
                        
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancelar" title="Cancelar"  />
                       <input type="button" id="btnactualizarpuerto" class="btn btn-success" onclick="actualizarpuerto();" value="Agregar" title="Agregar"   />
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
    <!-- Toastr -->
    <script src="../../../plugins/toastr/toastr.min.js"></script>

    <script src="../../../plugins/select2/js/select2.min.js"></script>

    <script src="../../../dist/js/jquery.keyboard.min.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-all.min.js"></script>
    
    <script src="../../../plugins/bootstrap-select/js/bootstrap-select.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/puntoventa/guiacierre23/jquery.nuevoweb-2.0.2.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../dist/js/adminlte.min.js"></script>

    <style>
        .error {
            border: solid 2px #FF0000;  
            border-bottom: 1px solid red !important;
            box-shadow: 0 1px 0 0 red !important;
        }
    </style>

</body>
</html>     