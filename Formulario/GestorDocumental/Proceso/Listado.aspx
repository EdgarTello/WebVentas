<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.GestorDocumental.Proceso.Listado" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Proceso</title>

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

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
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
            <div class="row g-3 justify-content-between align-items-center">
                <div class="col-12 col-md">
                    <h4 class="text-body mb-0" data-anchor="data-anchor">Listado de Archivos</h4>
                    <input type="hidden" name="hreserva" id="hreserva"/>
		            <input type="hidden" name="hgrupo" id="hgrupo"/>
                    <input type="hidden" name="haccion" id="haccion"/>
                    <input type="hidden" name="hnumero" id="hnumero"/>
                    <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("ProcesoList") %>" />
                </div>
                <div class="col col-md-auto">                
                    <nav class="nav justify-content-end doc-tab-nav align-items-center" role="tablist">
                        <button id="btn_completado" class="btn btn-success me-1 mb-1" type="button">COMPLETADO</button>
                        <button id="btn_pendiente" class="btn btn-danger  me-1 mb-1" type="button">PENDIENTE</button>
                        <input id="busqueda" class="form-control-sm"  type="text" maxlength="8" onkeypress="return isNumber(event)" placeholder="COD IND o GRUPAL"  />
                        <button id="btnbuscar" class="btn me-1 mb-1" type="button">
                            <span data-feather="search" style="height:19px;width:19px;margin-bottom: 2px;"></span>
                        </button>
                    </nav>
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
                        <table id="tbldetalle" class="table table-sm fs-9 mb-0 overflow-hidden">
                            <thead class="text-body bg-body-highlight">
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
    
    <div class="modal" id="dialogCantidad" tabindex="-1" role="dialog" aria-labelledby="dialogLoginLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header justify-content-between">
                    <h5 class="modal-title" id="dialogCantidadLabel">Administrador</h5>
                    <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close</button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label" for="cantidad">Cantidad</label>
                        <input runat="server" class="form-control text-end" id="cantidad"  maxlength="3" onkeypress="return isNumber(event)" type="text" placeholder="Cantidad"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btncantidad">GRABAR</button>
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
    <script src="../../../vendors/prism/prism.js"></script>
    <script src="../../../assets/js/phoenix.js"></script>
    <%--<script src="../../../assets/js/pages/advance-ajax-table.js"></script>--%>

    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/gestordocumental/proceso/jquery.listadoweb-2.2.4.js"></script>
  </body>

</html>