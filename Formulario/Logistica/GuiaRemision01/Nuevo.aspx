<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.Logistica.GuiaRemision01.Nuevo" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Listado</title>
        <!-- ===============================================-->
        <!--    Favicons-->
        <!-- ===============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="../../../assets/img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../../../assets/img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../../../assets/img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="../../../assets/img/favicons/favicon.ico">
        <link rel="manifest" href="../../../assets/img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="../../../assets/img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">
        <script src="../../../vendors/simplebar/simplebar.min.js"></script>
        <script src="../../../assets/js/config.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- ===============================================-->
        <!--    Stylesheets-->
        <!-- ===============================================-->
        <link href="../../../vendors/glightbox/glightbox.min.css" rel="stylesheet">
        <link href="../../../vendors/flatpickr/flatpickr.min.css" rel="stylesheet">
        <link href="../../../vendors/nouislider/nouislider.min.css" rel="stylesheet">
        <link href="../../../vendors/choices/choices.min.css" rel="stylesheet">
        <link href="../../../vendors/prism/prism-okaidia.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link href="../../../vendors/simplebar/simplebar.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
        <link href="../../../assets/css/theme.min.css" type="text/css" rel="stylesheet">
        <link href="../../../assets/css/user.min.css" type="text/css" rel="stylesheet">
        <style>
            @media (max-device-width: 800px) and (orientation: portrait) {
                .btn-agregar {
                    display:inline !important;
                }

                .btn-grabar {
                    display: none !important;
                }
            }

           
        </style>
    </head>
    <body>   
        <div class="card shadow-none border mb-3" data-component-card="data-component-card">
            <div class="card-header p-2 border-bottom bg-body">
                <div class="row g-3 justify-content-between align-items-end mb-1">
                   <div class="col-auto">
                       <h2 class="mb-0"></h2>
                       <input type="hidden" name="hruc" id="hruc" value="" runat="server"/>
                       <input type="hidden" name="hid" id="hid" value="0" runat="server"/>
                       <input type="hidden" name="hidcliente" id="hidcliente" value="0" runat="server"/>
                       <input type="hidden" name="hidpedido" id="hidpedido" value="0" runat="server"/>
                       <input type="hidden" name="hidentrega" id="hidentrega" value="0" runat="server"/>
                       <input type="hidden" name="hidalmacen" id="hidalmacen" value="0" runat="server"/>
                       <input type="hidden" name="hidmotivo" id="hidmotivo" value="0" runat="server"/>

                        <input type="hidden" name="hidlocal" id="hidlocal" value="0" runat="server"/>
                        <input type="hidden" name="hempleado" id="hempleado" value="0" runat="server"/>
                        <input type="hidden" name="hmuestratipo" id="hmuestratipo" value="" runat="server"/>
                        <input type="hidden" name="hmuestrafamilia" id="hmuestrafamilia" value="" runat="server"/>
                        <input type="hidden" name="hmuestracategoria" id="hmuestracategoria" value="" runat="server"/>
                        <input type="hidden" name="hmuestraproducto" id="hmuestraproducto" value="" runat="server"/>
                        <input type="hidden" name="hproductobusqueda" id="hproductobusqueda" value="" runat="server"/>
                        <input type="hidden" name="hproductoimagen" id="hproductoimagen" value="" runat="server"/>
                        <input type="hidden" name="hmoneda" id="hmoneda" value="" runat="server"/>
                        <input type="hidden" name="himpresora" id="himpresora" value="" runat="server"/>
                       
                        <input type="hidden" name="hfilasindividual" id="hfilasindividual" value="" runat="server"/>
                       
                        <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("GC23New") %>" />
                    </div>    

                    <div class="col-12 col-sm-auto">
                        <button id="btnagregar" class="btn btn-agregar d-none btn-success me-1 mb-1" type="button"><i class="fa-solid fa-save me-2"></i>Generar Orden</button>
                        <button class="btn btn-phoenix-secondary text-nowrap px-4" type="button" data-bs-toggle="modal" data-bs-target="#searchFilterModal"><span class="fa-solid fa-file me-md-2"></span><span class="d-none d-md-inline-block">Factura</span></button>
                        <button id="btnrefrescar" class="btn btn-phoenix-secondary me-1 mb-1" type="button"><i class="fa-solid fa-refresh me-2"></i></button>
                        <button id="btncancelar" class="btn btn-phoenix-secondary me-1 mb-1" type="button"><i class="fa-solid fa-undo me-2"></i></button>
                    </div>
                </div>
            </div>    
        </div>
        <div class="row gy-3 gx-5">            
             <div class="col-12 col-lg-8">
                <div class="mb-9">
                    <div id="cartTable">
                        <div class="table-responsive scrollbar mx-n1 px-1">
                         <table id="tbldetalle" class="table fs-9 mb-0 border-top border-translucent">
                            <thead>
                              <tr>
                                <th class="sort white-space-nowrap align-middle fs-10" scope="col"></th>
                                <th class="sort white-space-nowrap text-center" scope="col" >CODIGO</th>
                                <th class="sort white-space-nowrap align-middle" scope="col" >PRODUCTO</th>
                                <th class="sort align-middle ps-5 text-center" scope="col" style="width:20px;">UNID</th>
                                <th class="sort align-middle ps-5 text-center" scope="col" style="width:20px;">CANT</th>
                                <th class="sort text-end align-middle pe-0" scope="col" style="width:20px;"></th>
                              </tr>
                            </thead>
                            <tbody class="list" id="cart-table-body">             
                        
                            </tbody>
                          </table>
                        </div>
                    </div>
                </div>                
              </div>
              <div class="col-12 col-lg-4">
                  <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-between-center mb-3">
                            <h3 class="card-title mb-0">Detalle</h3>
                        </div>    
                        <div class="d-flex justify-content-between mb-1">
                            <div class="form-floating w-100">
                                <input class="form-control" type="text" id="clientenombre" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between mb-1">
                            <div class="form-floating w-100">
                                <select class="form-select" id="cboidentrega">
                                </select>
                                <label for="cboidentrega">Entrega</label>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between mb-1">
                            <div class="form-floating w-100">
                                <select class="form-select" id="cboalmacen">
                                </select>
                                <label for="cboalmacen">Almacen Origen</label>
                            </div>
                            <div class="form-floating w-100 px-1">
                                <select class="form-select" id="cboserie">
                                    <option value="0">[Ninguno]</option>
                                </select>
                                <label for="cboserie">Serie</label>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between mb-1">
                            <div class="form-floating w-100">
                                <select class="form-select" id="cbounidad">
                                </select>
                                <label for="cbounidad">Peso</label>
                            </div>
                            <div class="form-floating w-100 px-1">
                                <input  class="form-control input-monto text-center input-spin-none bg-transparent px-0"  id="inputq_peso" type="text" value="1" maxlength="8" style="min-width:40px" onkeypress="return isNumberKeyOnly(event);" />
                            </div>
                        </div>
                        <div class="d-flex justify-content-between mb-1">
                            <p class="text-body fw-semibold w-100"># Bultos</p>
                            <input  class="form-control input-monto text-center input-spin-none bg-transparent px-0"  id="inputq_bultos" type="text" value="1" maxlength="5" style="min-width:40px" onkeypress="return isNumber(event);" />
                        </div>
                        <div class="d-flex justify-content-between mb-1">
                            <div class="form-floating w-100">
                                <select class="form-select" id="cbotraslado">
                                    <option value="01" selected="selected">Publico</option>
                                    <option value="02">Privado</option>
                                </select>
                                <label for="cbotraslado">Traslado</label>
                            </div>
                        </div>

                        <div class="form-floating form-floating-advance-select d-transportista mb-3" >
                            <label for="cbotransportista">Transportista</label>
                            <select class="form-select" id="cbotransportista" >                                
                            </select>                                
                        </div>

                        <div class="d-flex justify-content-between d-traslado mb-1">
                            <div class="form-floating w-100">
                                <select class="form-select" id="cbovehiculo">
                                </select>
                                <label for="cbovehiculo">Vehiculo</label>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between d-traslado mb-1">
                            <div class="form-floating w-100">
                                <select class="form-select" id="cboconductor">
                                </select>
                                <label for="cboconductor">Conductor</label>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between border-y border-dashed py-3 mb-4">
                            <textarea  class="form-control"  id="inputq_onbseracion" type="text" value="1" maxlength="200" rows="2" cols="40"  style="resize:none" placeholder="Observaciones" ></textarea>
                        </div>
                        <button class="btn btn-success btn-grabar w-100" id="btngrabar">Generar Orden<span class="fas fa-chevron-right ms-1 fs-10"></span></button>
                    </div>
                 </div>
              </div>
         </div>

          <div class="modal fade" id="dialogDocumento" tabindex="-1" role="dialog" aria-labelledby="dialogDocumentoLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header justify-content-between">
                        <h5 class="modal-title" id="dialogDocumentoLabel">Logistica</h5>
                        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close
                        </button>
                    </div>
                    <div class="modal-body">
                        Esta seguro de generar la GRE?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" id="btn_documento_aceptar" onclick="documento_aceptar();"><b>G</b>rabar</button>
                    </div>
                </div>
            </div>
        </div>   

        <div class="modal fade" tabindex="-1" id="searchFilterModal" aria-labelledby="searchFilterModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable modal-fullscreen-md-down">
            <div class="modal-content">
              <div class="modal-header p-4 pb-3 align-items-start border-0">
                <div>
                  <h4 class="mb-2 text-body-highlight" id="searchFilterModalLabel">Filtro</h4>
                </div>
                <button class="btn btn-close fs-10" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body scrollbar px-4 py-1">
                <div class="row g-5">                     
                        <div class="col-12">
                            <div class="mb-1">
                                <div class="row g-2">
                                    <div class="form-floating">
                                        <select class="form-select" id="cbotipo">
                                            <option value="03">Boleta</option>
                                            <option value="01">Factura</option>
                                        </select>
                                        <label for="cbotipo">Estado</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-1">
                                <div class="row g-2">
                                    <div class="form-floating">
                                        <input class="form-control" type="text" id="serie" maxlength="4" onkeypress="return isAlphanumericKey(event);"/>
                                        <label class="form-label" for="serie">Serie</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-1">
                                <div class="row g-2">
                                    <div class="form-floating">
                                        <input class="form-control" type="text" id="correlativo" maxlength="8" onkeypress="return isNumber(event);"/>
                                        <label class="form-label" for="correlativo">Correlativo</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                </div>
              </div>
              <div class="modal-footer border-0 p-4 pt-0">
                <div class="w-100 d-flex flex-wrap gap-3 border-top border-translucent pt-4">
                  <button class="m-0 btn btn-lg btn-primary text-nowrap flex-1" id="btnsearch"> <span class="fa-solid fa-magnifying-glass me-2"></span>Actualizar Resultado</button>
                </div>
              </div>
            </div>
          </div>
        </div>
    </body>
    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <!-- jQuery -->
    <script src="../../../plugins/jquery/jquery.min.js"></script>
    <script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../../../plugins/jquery-blockuid/jquery.blockUI.min.js"></script>

    <script src="../../../vendors/popper/popper.min.js"></script>
    <script src="../../../vendors/bootstrap/bootstrap.min.js"></script>
    <script src="../../../vendors/anchorjs/anchor.min.js"></script>
    <script src="../../../vendors/is/is.min.js"></script>
    <script src="../../../vendors/fontawesome/all.min.js"></script>
    <script src="../../../vendors/lodash/lodash.min.js"></script>
    <script src="../../../vendors/list.js/list.min.js"></script>
    <script src="../../../vendors/feather-icons/feather.min.js"></script>
    <script src="../../../vendors/dayjs/dayjs.min.js"></script>
    <script src="../../../vendors/flatpickr/flatpickr.min.js"></script>
    <script src="../../../vendors/lottie/lottie.min.js"></script>
    <script src="../../../vendors/nouislider/nouislider.min.js"></script>
    <script src="../../../vendors/choices/choices.min.js"></script>
    <script src="../../../vendors/prism/prism.js"></script>
    <script src="../../../assets/js/phoenix.js"></script>
    <%--<script src="../../../assets/js/pages/advance-ajax-table.js"></script>--%>

    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/logistica/guiaremision01/jquery.nuevoweb-3.0.9.js"></script>
    
    

</html>