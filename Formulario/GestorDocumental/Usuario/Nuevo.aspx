<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.GestorDocumental.Usuario.Nuevo" %>

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
                        <h4 class="text-body mb-0" data-anchor="data-anchor">Usuario</h4>
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
                <input class="form-control" id="nombre" type="text" maxlength="50" required="required"/>
                <div class="invalid-feedback"></div>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="apellidos">Apellidos</label>
                <input class="form-control" id="apellidos" type="text" maxlength="50"/>
            </div>
            
            <div class="col-3">
                <label class="form-label" for="email">Correo</label>
                <input class="form-control" id="email" type="email" maxlength="50"/>
                <div class="invalid-feedback"></div>
            </div>
          
            <div class="col-md-3">
                <label class="form-label" for="cborol">Rol</label>
                <select class="form-select" id="cborol"></select>
                <div class="invalid-feedback"></div>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="cbolocal">Local</label>
                <select class="form-select" id="cbolocal"></select>
                <div class="invalid-feedback"></div>
            </div>
            <div class="col-md-3">
                <label class="form-label" for="cboperfil">Perfil</label>
                <select class="form-select" id="cboperfil"></select>
                <div class="invalid-feedback"></div>
            </div>

            <div class="col-md-3">
                <label class="form-label" for="usuario">Usuario</label>
                <input class="form-control" id="usuario" type="text" maxlength="50"/>
            </div>

            <div class="col-md-3">
                <label class="form-label" for="password">Clave</label>
                <input class="form-control" id="password" type="text" maxlength="12"/>
            </div>


            

            <div class="col-md-3">
                <div class="form-check mb-0">
                    <input class="form-check-input" id="bloqueado" type="checkbox" />
                    <label class="form-check-label mb-0" for="bloqueado">Bloqueado</label>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-check mb-0">
                    <input class="form-check-input" id="logueo" type="checkbox" />
                    <label class="form-check-label mb-0" for="logueo">Logueo</label>
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
        <script src="../../../plugins/jquery/gestordocumental/usuario/jquery.nuevoweb-1.2.0.js"></script>
    </body>

</html>