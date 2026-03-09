<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.VTex.Recojo.Listado" %>

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
    </head>
    <body>   
        <div class="card shadow-none border mb-3" data-component-card="data-component-card">
            <div class="card-header p-2 border-bottom bg-body">
                <div class="row g-3 justify-content-between align-items-end mb-1">
                   <div class="col-auto">
                        <h4 class="text-body mb-0">Listado de Recojos en Tienda</h4>
                        <input type="hidden" name="hruc" id="hruc" value="" runat="server"/>
                        <input type="hidden" name="hid" id="hid" value="" runat="server"/>
                        <input type="hidden" name="hnuevo" id="hnuevo" value="" runat="server"/>
                        <input type="hidden" name="heliminar" id="heliminar" value="" runat="server"/>
                        <input type="hidden" name="hfiltrousuario" id="hfiltrousuario" value="" runat="server"/>
                        <input type="hidden" name="hfiltrolocal" id="hfiltrolocal" value="" runat="server"/>
                        <input type="hidden" name="hopciones" id="hopciones" value="" runat="server"/>
                        <input type="hidden" name="hidlocal" id="hidlocal" value="" runat="server"/>
                        <input type="hidden" name="hurlorder" id="hurlorder" value="" runat="server"/>
                        <input type="hidden" name="hguid" id="hguid" value="" runat="server"/>
                        <input type="hidden" name="hempleado" id="hempleado" value="" runat="server"/>
                        
                        <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("IpickupList") %>" />
                    </div>    

                    <div class="col-12 col-sm-auto">
                        <button id="btnagregar" class="btn btn-primary" type="button"><i class="fa-solid fa-plus me-2"></i>Agregar Orden</button>
                        <button class="btn btn-phoenix-secondary text-nowrap" type="button" data-bs-toggle="modal" data-bs-target="#searchFilterModal"><span class="fa-solid fa-filter me-md-2"></span><span class="d-none d-md-inline-block">Filtros</span></button>
                        <button id="btnrefrescar" class="btn btn-phoenix-secondary" type="button"><i class="fa-solid fa-refresh me-2"></i></button>
                    </div>
                </div>
            </div>            
            <div class="card-body p-0">                
                <div class="collapse code-collapse" id="ajax-table-code">
                    <pre class="scrollbar" style="max-height:420px"><code class="language-html"></code></pre>
                </div>
                <div class="p-4 code-to-copy">
                    <div class="table-list" id="advanceAjaxTable">
                        <div class="table-responsive scrollbar mb-3">
                            <div class="col-12">
                                <ul class="nav nav-links mx-n2">
                                    <li class="nav-item"><a class="sfilter nav-link px-2 py-1 active" aria-current="page" href="#" onclick="return filtrar(this, -1);"><span>Todos</span><span id="stodos" class="text-body-tertiary fw-semibold"></span></a></li>
                                    <li class="nav-item"><a class="sfilter nav-link px-2 py-1" href="#" onclick="return filtrar(this, 1);"><span>En Espera</span><span id="senespera" class="text-body-tertiary fw-semibold"></span></a></li>
                                    <li class="nav-item"><a class="sfilter nav-link px-2 py-1" href="#" onclick="return filtrar(this, 2);"><span>En Tienda</span><span id="sentienda" class="text-body-tertiary fw-semibold"></span></a></li>
                                    <li class="nav-item"><a class="sfilter nav-link px-2 py-1" href="#" onclick="return filtrar(this, 3);"><span>Entregado</span><span id="sentregado" class="text-body-tertiary fw-semibold"></span></a></li>
                                </ul>
                            </div>
                            <table id="tbldetalle" class="table table-sm fs-9 mb-0 overflow-hidden table-hover">
                                <thead class="text-body bg-body-highlight">
                                    <tr>
                                        <th class="white-space-nowrap fs-9 align-middle ps-0" style="max-width:20px; width:18px;">N</th>
                                        <th class="sort text-center align-middle pe-0 ps-4" scope="col"></th>
                                        <th class="sort text-center white-space-nowrap align-middle ps-4" scope="col"></th>
                                        <th class="sort text-center white-space-nowrap align-middle ps-4" scope="col" data-sort="orderid">ORDEN ID</th>                                        
                                        <th class="sort text-center white-space-nowrap align-middle ps-4" scope="col" data-sort="sequence">SECUENCIA</th>
                                        <th class="sort text-center white-space-nowrap align-middle ps-4" scope="col" data-sort="clientname">CLIENTE</th>                                        
                                        <th class="sort text-center white-space-nowrap align-middle ps-4" scope="col" data-sort="documentnumber">DOCUMENTO</th>                                        
                                        <th class="sort text-center white-space-nowrap align-middle ps-4" scope="col">LOCAL</th>
                                        <th class="sort text-center white-space-nowrap align-middle ps-4" scope="col" data-sort="datecreation">FECHA</th>
                                        <th class="sort text-center white-space-nowrap align-middle ps-4" scope="col" data-sort="pickupinstatus">ESTADO</th>
                                        <th class="sort text-center white-space-nowrap align-middle ps-4" scope="col" data-sort="pickupintime">TIEMPO</th>
                                    </tr>
                                </thead>
                                <tbody class="list"></tbody>
                            </table>
                        </div>
                        <div class="d-flex justify-content-center mt-3"><button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                            <ul class="mb-0 pagination"></ul><button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"> </span></button>
                        </div>
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
                  <div class="col-md-12">
                    <div class="row g-0">                      
                        <div class="col-12">
                            <div class="mb-1">
                                <div class="row g-2">
                                    <div class="form-floating">
                                        <input class="form-control search-input search" type="text" id="documento" />
                                        <label class="form-label" for="documento">Busqueda</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mb-1">
                                <div class="row g-2">
                                    <div class="form-floating">
                                        <select class="form-select" id="cboestado">
                                            <option value="-1">Todos</option>
                                            <option value="1">En Espera</option>
                                            <option value="2">En Tienda</option>
                                            <option value="3">Entregado</option>
                                        </select>
                                        <label for="cboestado">Estado</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                          <div class="mb-1">
                              <div class="row g-2">
                                  <div class="form-floating">
                                      <select class="form-select" id="cbotiempo">
                                          <option value="-1">Todos</option>
                                          <option value="0">Normal</option>
                                          <option value="1">Fuera de Fecha</option>
                                      </select>
                                      <label for="cbotiempo">Tiempo</label>
                                  </div>
                              </div>
                          </div>
                        </div>
                        <div class="col-12">
                            <div class="mb-1">
                                <div class="row g-2">
                                    <div class="col-sm-6">
                                        <div class="form-floating flex-1">
                                        <input class="form-control datetimepicker" id="fechainicio" type="text" placeholder="dd/mm/yyyy" data-options='{"disableMobile":true,"defaultDate":"today","dateFormat":"j M, Y"}' />
                                        <label class="form-label" for="fechainicio">Inicio</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-floating flex-1">
                                        <input class="form-control datetimepicker" id="fechafin" type="text" placeholder="dd/mm/yyyy" data-options='{"disableMobile":true,"defaultDate":"today","dateFormat":"j M, Y"}' />
                                        <label class="form-label" for="fechafin">Fin</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>                  
                </div>
              </div>
              <div class="modal-footer border-0 p-4 pt-0">
                <div class="w-100 d-flex flex-wrap gap-3 border-top border-translucent pt-4">
                  <button class="m-0 btn btn-lg btn-phoenix-primary text-nowrap" id="btnclear"> <span class="fa-solid fa-rotate me-sm-2"></span><span class="d-none d-sm-inline-block">Limpiar</span></button>
                  <button class="m-0 btn btn-lg btn-primary text-nowrap flex-1" id="btnsearch"> <span class="fa-solid fa-magnifying-glass me-2"></span>Actualizar Resultado</button>
                </div>
              </div>
            </div>
          </div>
        </div>

      

        <div class="modal" id="dialogDetalle" tabindex="-1" role="dialog" aria-labelledby="dialogDetalleLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header justify-content-between">
                        <h5 class="modal-title" id="dialogDetalleLabel"></h5>
						<button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                        <span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close
                    </button>
					</div>
					<div class="modal-body">           
                        <div class="container-small">
                          <div class="d-flex justify-content-between align-items-end mb-4">
                            <h2 class="mb-0">Orden de Pedido</h2>
                            <div>
                              <button class="btn btn-phoenix-secondary" onclick="viewpdf(0);"><span class="fa-solid fa-file-pdf me-sm-2"></span><span class="d-none d-sm-inline-block"></span></button>
                            </div>
                          </div>
                          <div class="bg-body dark__bg-gray-1100 p-4 mb-4 rounded-2">
                            <div class="row g-4">
                              <div class="col-12 col-lg-4">
                                <div class="row g-4 g-lg-2">
                                  <div class="col-12 col-sm-6 col-lg-12">
                                    <div class="row align-items-center g-0">
                                      <div class="col-auto col-lg-6 col-xl-4">
                                        <h6 class="mb-0 me-3">No :</h6>
                                      </div>
                                      <div class="col-auto col-lg-6 col-xl-8">
                                        <p class="fs-9 text-body-secondary fw-semibold mb-0" id="sordenpedido"></p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col-12 col-sm-6 col-lg-12">
                                    <div class="row align-items-center g-0">
                                      <div class="col-auto col-lg-6 col-xl-4">
                                        <h6 class="me-3">Fecha :</h6>
                                      </div>
                                      <div class="col-auto col-lg-6 col-xl-8">
                                        <p class="fs-9 text-body-secondary fw-semibold mb-0"id="sordenfecha"></p>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="col-12 col-sm-4 col-lg-8">
                                <div class="row g-4 gy-lg-5">
                                  <div class="col-12 col-lg-12">
                                    <h6 class="mb-2 me-3">Cliente :</h6>
                                    <p class="fs-9 text-body-secondary fw-semibold mb-0" id="sordencliente"></p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <div class="px-0">
                            <div class="table-responsive scrollbar">
                              <table class="table fs-9 text-body mb-0" id="tblsubdetalle">
                                <thead class="bg-body-secondary">
                                  <tr>
                                    <th scope="col" style="width: 24px;"></th>
                                    <th scope="col" style="width: 24px;">CODIGO</th>
                                    <th scope="col" style="min-width: 60px;">PRODUCTO</th>
                                    <th class="text-end" scope="col" style="width: 80px;">CANTIDAD</th>
                                    <th class="text-end" scope="col" style="width: 100px;">PRECIO</th>
                                    <th class="text-end" scope="col" style="min-width: 60px;">TOTAL</th>
                                    <th scope="col" style="width: 24px;"></th>
                                  </tr>
                                </thead>
                                <tbody id="tblbodysubdetalle">
                                </tbody>
                              </table>
                            </div>
                          </div>
                      
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="dialogSeguimiento" tabindex="-1" role="dialog" aria-labelledby="dialogSeguimientoLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header justify-content-between">
                        <h5 class="modal-title" id="dialogSeguimientoLabel">Administrador</h5>
                        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="col-12 col-lg-12">
                          <div class="timeline-vertical">
                            <div class="timeline-item">
                              <div class="row g-md-3 align-items-center mb-4 mb-lg-5">
                                <div class="col-12 col-md-auto d-flex">
                                  <div class="timeline-item-date text-end order-1 order-md-0 me-md-4">
                                    <p class="fs-10 fw-semibold text-body-tertiary mb-0" id="pfecha1">MM dd YYYY</p>
                                  </div>
                                  <div class="timeline-item-bar position-relative me-3 me-md-0" id="linea1">
                                    <div class="icon-item icon-item-sm bg-body-quaternary" data-bs-theme="light" id="dicono1">
                                        <span class="fa-solid fa-cubes text-white fs-10" id="sicono1"></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col">
                                  <div class="timeline-item-content ps-6 ps-md-3">
                                    <h4>En Espera</h4>
                                    <p class="fs-9 text-body-secondary mb-0" id="ptexto1">Pendiente</p>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="timeline-item">
                              <div class="row g-md-3 align-items-center mb-4 mb-lg-5">
                                <div class="col-12 col-md-auto d-flex">
                                  <div class="timeline-item-date text-end order-1 order-md-0 me-md-4">
                                    <p class="fs-10 fw-semibold text-body-tertiary mb-0" id="pfecha2">MM dd YYYY</p>
                                  </div>
                                  <div class="timeline-item-bar position-relative me-3 me-md-0" id="linea2">
                                    <div class="icon-item icon-item-sm bg-body-quaternary" data-bs-theme="light" id="dicono2">
                                        <span class="fa-solid fa-briefcase text-white fs-10" id="sicono2"></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col">
                                  <div class="timeline-item-content ps-6 ps-md-3">
                                    <h4>En Tienda</h4>
                                    <p class="fs-9 text-body-secondary mb-0" id="ptexto2">Pendiente</p>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="timeline-item">
                              <div class="row g-md-3 align-items-center mb-4 mb-lg-5">
                                <div class="col-12 col-md-auto d-flex">
                                  <div class="timeline-item-date text-end order-1 order-md-0 me-md-4">
                                    <p class="fs-10 fw-semibold text-body-tertiary mb-0" id="pfecha3">MM dd YYYY</p>
                                  </div>
                                  <div class="timeline-item-bar position-relative me-3 me-md-0" id="linea3">
                                    <div class="icon-item icon-item-sm bg-body-quaternary" data-bs-theme="light" id="dicono3">
                                        <span class="fa-solid fa-truck-ramp-box text-white fs-10" id="sicono3"></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col">
                                  <div class="timeline-item-content ps-6 ps-md-3">
                                    <h4>Entregado</h4>
                                    <p class="fs-9 text-body-secondary mb-0" id="ptexto3">Pendiente</p>
                                  </div>
                                </div>
                              </div>
                            </div>
                           
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="dialogCorreo" tabindex="-1" role="dialog" aria-labelledby="dialogCorreoLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header justify-content-between">
                        <h5 class="modal-title" id="dialogCorreoLabel">Administrador</h5>
                        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row g-3 mb-2">
                            <div class="col-4">
                            <input class="form-control" id="emailto" name="emailto" type="email" placeholder="To" />
                            </div>
                            <div class="col-8">
                            <input class="form-control" id="emailbcc" name="emailbcc" type="email" placeholder="BCC" value="atencionalcliente@ilariainternational.com;acristobal@ilariainternational.com"  readonly="readonly" disabled="disabled"/>
                            </div>
                            <div class="col-12">
                            <input class="form-control" id="emailsubject" name="emailsubject" type="text" placeholder="Subject" />
                            </div>
                        </div>
                        <div class="mb-3 flex-1">
                            <iframe id="emailcontent" src="" width="100%" height="340" style="border:none;">
                            </iframe>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex">

                            </div>
                            <div class="d-flex">
                                <button class="btn btn-primary fs-10" type="button" id="btnsendmail">Enviar<span class="fa-solid fa-paper-plane ms-1"></span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


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
        <script src="../../../vendors/tinymce/tinymce.min.js"></script>
        <script src="../../../vendors/flatpickr/flatpickr.min.js"></script>
        <script src="../../../vendors/lottie/lottie.min.js"></script>
        <script src="../../../vendors/nouislider/nouislider.min.js"></script>
        <script src="../../../vendors/choices/choices.min.js"></script>
        <script src="../../../vendors/prism/prism.js"></script>
        <script src="../../../assets/js/phoenix.js"></script>
        <%--<script src="../../../assets/js/pages/advance-ajax-table.js"></script>--%>

        <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
        <script src="../../../plugins/jquery/vtex/recojo/jquery.listadoweb-3.1.1.js"></script>
    </body>

</html>