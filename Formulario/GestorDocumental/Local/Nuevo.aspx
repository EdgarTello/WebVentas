<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.GestorDocumental.Local.Nuevo" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Nuevo</title>
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
        
        <div class="row gy-2 gx-3 align-items-center">
            <div class="col-md-12">
                <div class="row g-3 justify-content-between align-items-center">
                    <div class="col-12 col-md">
                        <h4 class="text-body mb-0" data-anchor="data-anchor">Local</h4>
                        <input type="hidden" name="hruc" id="hruc" value="" runat="server"/>
                        <input type="hidden" id="hid" name="hid" runat="server" />
				        <input type="hidden" name="hlocalcodigo" id="hlocalcodigo" value="" runat="server"/>
                        <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("LocalNew") %>" />
                    </div>
                    <div class="col col-md-auto">                
                        <nav class="nav justify-content-end doc-tab-nav align-items-center" role="tablist">
                            <button id="btnagregar" class="btn btn-success me-1 mb-1" type="button"><i class="fa-solid fa-save me-2"></i>Grabar</button>
                            <button id="btncancelar" class="btn btn-secondary me-1 mb-1" type="button">
                                <i class="fa-solid fa-undo me-2"></i>
                            </button>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="nombre">Nombre</label>
                <input class="form-control" id="nombre" type="text" maxlength="100" required="required"/>
                <div class="invalid-feedback"></div>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="telefono">Telefono</label>
                <input class="form-control" id="telefono" type="text" maxlength="50"/>
            </div>
            <div class="col-md-3">
                <div class="form-check mb-0">
                    <input class="form-check-input" id="activo" type="checkbox" />
                    <label class="form-check-label mb-0" for="activo">Activo</label>
                </div>
            </div>
            <div class="col-12">
                <label class="form-label" for="rutadocumento">Ruta Documento</label>
                <input class="form-control" id="rutadocumento" type="text" maxlength="200"/>
                <div class="invalid-feedback"></div>
            </div>
            <div class="col-12">
                <label class="form-label" for="rutaprincipal">Ruta Principal</label>
                <input class="form-control" id="rutaprincipal" type="text" maxlength="200"/>
                <div class="invalid-feedback"></div>
            </div>

            <div class="col-md-3">
                <label class="form-label" for="cbodepartamento">Departamento</label>
                <select class="form-select" id="cbodepartamento"></select>
                <div class="invalid-feedback"></div>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="cboprovincia">Provincia</label>
                <select class="form-select" id="cboprovincia"></select>
                <div class="invalid-feedback"></div>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="cbodistrito">Distrito</label>
                <select class="form-select" id="cbodistrito"></select>
                <div class="invalid-feedback"></div>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="ubigeo">Ubigeo</label>
                <input class="form-control" id="ubigeo" type="text" maxlength="6" onkeypress="return isNumberKeyOnly(event)"/>
            </div>


            <div class="col-12">
                <label class="form-label" for="direccion">Direccion</label>
                <input class="form-control" id="direccion" type="text" maxlength="200"/>
                <div class="invalid-feedback"></div>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="latitud">Latitud</label>
                <input class="form-control" id="latitud" type="text" maxlength="50"/>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="longitud">Longitud</label>
                <input class="form-control" id="longitud" type="text" maxlength="50"/>
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
        <script src="../../../plugins/jquery/gestordocumental/local/jquery.nuevoweb-1.2.0.js"></script>
    </body>

</html>