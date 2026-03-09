<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.S10.OrdenPago.Nuevo" %>

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

            .cbody {
                height: 600px;
                /*overflow-y: auto;*/
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
                       
                        <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("OrdenPedidoNew") %>" />
                    </div>    

                    <div class="col-12 col-sm-auto">
                        <button id="btnagregar" class="btn btn-agregar d-none btn-success me-1 mb-1" type="button"><i class="fa-solid fa-save me-2"></i>Generar Orden</button>
                        <button class="btn btn-phoenix-secondary text-nowrap px-4" type="button" data-bs-toggle="modal" data-bs-target="#searchFilterModal"><span class="fa-solid fa-cart-plus me-md-2"></span><span class="d-none d-md-inline-block">Productos</span></button>
                        <button id="btncliente" class="btn btn-phoenix-secondary me-1 mb-1" type="button"><i class="fa-solid fa-user me-2"></i></button>
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
                        <th class="sort align-middle ps-5 text-center" scope="col" style="width:20px;">PREC</th>
                        <th class="sort align-middle ps-5 text-end" scope="col" style="width:20px;">SUBT</th>
                        <th class="sort align-middle ps-5 text-end" scope="col" style="width:20px;">DESC</th>
                        <th class="sort align-middle ps-5 text-end" scope="col" style="width:20px;">TOTAL</th>
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
                    <h3 class="card-title mb-0">Resumen</h3>
                  </div>                
               
                  <div class="d-flex justify-content-between">
                    <p class="text-body fw-semibold">Descuento :</p>
                    <p class="text-danger fw-semibold">
                        <label id="sdescuento"></label>
                    </p>
                  </div>
                  <div class="d-flex justify-content-between border-y border-dashed py-3 mb-4">
                    <h4 class="mb-0">Total :</h4>
                    <h4 class="mb-">
                        <label id="stotal"></label>
                    </h4>
                  </div>
                  <button class="btn btn-success btn-grabar w-100" id="btngrabar">Generar Orden<span class="fas fa-chevron-right ms-1 fs-10"></span></button>
                </div>
              </div>
            </div>
        </div>

        <div class="modal fade cmodal" id="dialogCliente" tabindex="-1" role="dialog" aria-labelledby="dialogClienteLabel" aria-hidden="true">
            <div class="modal-dialog cmodaldialog modal-xl modal-dialog-centered" role="document">
                <div class="modal-content ccontent">
                    <div class="modal-header justify-content-between">
                        <h5 class="modal-title" id="dialogClienteLabel">Cliente</h5>
                        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close
                        </button>
                    </div>
                    <div class="modal-body cbody" id="modalcliente">
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="dialogDocumento" tabindex="-1" role="dialog" aria-labelledby="dialogDocumentoLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header justify-content-between">
                        <h5 class="modal-title" id="dialogDocumentoLabel">Orden Pedido</h5>
                        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="divmediopago">
                            <div class="row">
                                <div class="col-12">
                                    <span>Medio de pago</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <select id="cbotipopago" name="cbotipopago" class="form-select"></select>
                                </div>
                            </div>
                        </div>
                        <div id="divpagodetalle">
                            <div class="row">
                                <div class="col-12">
                                    <span>Cliente</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="row top5">
                                        <div class="col-4">
                                            <select id="cbotipodocumento" name="cbotipodocumento" class="form-select"></select>
                                        </div>
                                        <div class="col-8">
                                            <input type="hidden" name="hidcliente" id="hidcliente" runat="server" value="0"/>
                                            <input type="text" name="numerodocumento" id="numerodocumento" runat="server"  class="form-control requerido input-number-documento-black"  placeholder="Documento" />
                                            <p class="card-text"><small class="text-red">(1) Ingrese el documento y luego de <a href="#" onclick="buscar_cliente();">Enter o Click</a></small></p>                                            
                                        </div>
                                    </div>
                                    <div class="row top5">
                                        <div class="col-12">
                                            <input type="text" name="nombrecliente" id="nombrecliente" runat="server" class="form-control" placeholder="Nombre" maxlength="100" disabled="disabled" />
                                        </div>
                                    </div>
                                  
                                     <div class="row">
                                        <div class="col-12">
                                            <span>Entrega</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <select id="cboclienteentrega" name="cboclienteentrega" class="form-select">
                                                <option value="0">[Ninguno]</option>
                                            </select>
                                        </div>
                                    </div>        
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" id="btn_documento_aceptar" onclick="documento_aceptar();"><b>G</b>rabar</button>
                    </div>
                </div>
            </div>
        </div>   

        <div class="modal fade" tabindex="-1" id="searchFilterModal" aria-labelledby="searchFilterModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable modal-fullscreen-md-down">
            <div class="modal-content">
              <div class="modal-header justify-content-between border-0 px-6">
                
                <ul class="navbar-nav navbar-nav-icons flex-row me-n2">
                    <li class="nav-item d-flex align-items-center">
                        <h3 class="mb-0">Productos</h3>
                    </li>
                    <li class="nav-item d-flex align-items-center">
                        <a class="nav-link px-2 icon-indicator text-star icon-indicator-primary" href="#!" role="button">
                            <span class="text-body-tertiary" data-feather="shopping-cart" style="height:20px;width:20px;"></span>
                            <span class="icon-indicator-number">0</span>
                        </a>
                    </li>
                    <li class="nav-item d-flex align-items-center">
                        <span class="d-inline-block text-body-emphasis fw-bold ms-4 indicator-monto">0.00</span>
                    </li>
                </ul>
                <button class="btn btn-sm btn-phoenix-secondary" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times text-danger"></span></button>
              </div>
              <div class="modal-body scrollbar px-4 py-3">
                <div class="mx-n4 px-4 mx-lg-n6 px-lg-6 py-5 border-top mt-4">
                    <div class="row gx-5">
                        <div class="d-flex align-items-center gap-2 mb-2">
                            <input class="form-control search-input search" id="qproducto" type="search" placeholder="codigo de producto" aria-label="Search" />
                            <button class="btn btn-sm btn-phoenix-secondary" id="btnbuscar"><span class="fas fa-search"></span></button>
                        </div>
                        <div class="col-12 col-xl-2 col-xxl-2 mb-4 mb-xl-0 top-stock-card-container" id="contenedorfamilia">
                            <div class="scrollbar top-stock-tab w-100 pe-xl-3">
                                <ul id="listfamilia" class="nav gap-3 gap-xl-2 flex-nowrap flex-xl-column" role="tablist"></ul>
                           </div>
                        </div>
                        
                       <div class="col-12 col-xl-2 col-xxl-2 scrollbar top-stock-tab"  id="contenedorcategoria">
                            <ul class="nav gap-3 gap-xl-2 flex-nowrap flex-xl-column" role="tablist" id="listcategoria">
                            </ul>
                        </div>
                        <div class="col-12 col-xl-8 col-xxl-8 ps-xl-0 flex-1">
                            <div class="row" id="contenedorproducto">
                            </div>
                        </div>
                    </div>                 
                </div>
              </div>
              <div class="modal-footer border-0 p-4 pt-0"></div>
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
    <script src="../../../plugins/jquery/s10/ordenpago/jquery.nuevoweb-3.1.2.js"></script>
    

</html>