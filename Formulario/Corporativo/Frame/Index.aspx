<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.Corporativo.Frame.Index" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>ERP|Modulos</title>
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
        <link href="../../../assets/css/frame.css" rel="stylesheet" />       
    </head>
    <body>
        <form id="formdocument01" asp-antiforgery="false" runat="server">
        <main class="main" id="top">
            <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("FrameIndex") %>" />
            <input type="hidden" id="htelefonosoporte" name="htelefonosoporte" runat="server" />
            <input type="hidden" id="hpaginadefecto" name="hpaginadefecto" runat="server" />
            <input type="hidden" id="hpaginatab" name="hpaginatab" runat="server" />
            <input type="hidden" id="hismobile" name="hismobile" runat="server" />
            <input type="hidden" id="hempleadoid" name="hempleadoid" runat="server" />
            <nav class="navbar navbar-vertical navbar-expand-lg">
            <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
                <!-- scrollbar removed-->
                <div class="navbar-vertical-content">
                    <ul class="navbar-nav flex-column" id="navbarVerticalNav">
                        <li class="nav-item">
                        <!-- parent pages-->
                            <div class="nav-item-wrapper" id="divmodule">
                                <a class="nav-link dropdown-indicator label-1" href="#nv-home" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-home">
                                    <div class="d-flex align-items-center">
                                        <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                        <span class="nav-link-icon"><span data-feather="pie-chart"></span></span><span class="nav-link-text">DashBoard</span>
                                    </div>
                                </a>
                                <div class="parent-wrapper label-1" id="listmodule"></div>
                            </div>
                        </li>
                        <li class="nav-item">
                        <!-- label-->
                        <p class="navbar-vertical-label">Modulos</p>
                        <hr class="navbar-vertical-line" />
                        <!-- parent pages-->
                        <div class="nav-item-wrapper d-none" id="divdocumentos">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-forms2" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-forms2">
                            <div class="d-flex align-items-center">
                                <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                <span class="nav-link-icon"><span data-feather="file-text"></span></span><span class="nav-link-text">Documentos</span>
                            </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listdocumentos"></div>
                        </div>

                        <div class="nav-item-wrapper d-none" id="divmaestros">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-maestros" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-maestros">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="tool"></span></span><span class="nav-link-text">Maestros</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listmaestros"></div>
                        </div>

                        <div class="nav-item-wrapper d-none" id="divventas">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-tables" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-tables">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="columns"></span></span><span class="nav-link-text">Ventas</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listventas"></div>
                        </div>

                        <div class="nav-item-wrapper d-none" id="divtesoreria">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-tesoreria" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-tesoreria">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="dollar-sign"></span></span><span class="nav-link-text">Tesoreria</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listtesoreria"></div>
                        </div>


                        <div class="nav-item-wrapper d-none" id="divpresupuesto">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-presupuesto" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-presupuesto">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="trello"></span></span><span class="nav-link-text">Presupuesto</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listpresupuesto"></div>
                        </div>

                        <div class="nav-item-wrapper d-none" id="divacceso">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-forms" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-forms">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="grid"></span></span><span class="nav-link-text">Acceso</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listacceso"></div>
                        </div>
                        
                        <div class="nav-item-wrapper d-none" id="divrrhh">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-forms" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-forms">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="grid"></span></span><span class="nav-link-text">RRHH</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listrrhh"></div>
                        </div>

                        <div class="nav-item-wrapper d-none" id="divlogistica">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-utilities" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-utilities">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="tool"></span></span><span class="nav-link-text">Logistica</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listlogistica"></div>
                        </div>

                        <div class="nav-item-wrapper d-none" id="divimportacion">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-landing" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-landing">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="globe"></span></span><span class="nav-link-text">Importacion</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listimportacion"></div>
                        </div>

                        <div class="nav-item-wrapper d-none" id="divempresa">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-customization" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-customization">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="settings"></span></span><span class="nav-link-text">Empresa</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listempresa"></div>
                        </div>

                        <div class="nav-item-wrapper d-none" id="divfinanzas">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-layouts-doc" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-layouts-doc">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="table"></span></span><span class="nav-link-text">Finanzas</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listfinanzas"></div>
                        </div>

                        
                        <div class="nav-item-wrapper d-none" id="divseguridad">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-authentication" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-authentication">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                    <span class="nav-link-icon"><span data-feather="lock"></span></span><span class="nav-link-text">Seguridad</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listseguridad"></div>
                        </div>


                        <div class="nav-item-wrapper d-none" id="divreportes">
                            <a class="nav-link dropdown-indicator label-1" href="#nv-ECharts" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-ECharts">
                                <div class="d-flex align-items-center">
                                    <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right"></span></div>
                                    <span class="nav-link-icon"><span data-feather="bar-chart-2"></span></span><span class="nav-link-text">Reportes</span>
                                </div>
                            </a>
                            <div class="parent-wrapper label-1" id="listreportes"></div>
                        </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="navbar-vertical-footer">
                <button class="btn navbar-vertical-toggle border-0 fw-semibold w-100 white-space-nowrap d-flex align-items-center"><span class="uil uil-left-arrow-to-left fs-8"></span><span class="uil uil-arrow-from-right fs-8"></span><span class="navbar-vertical-footer-text ms-2">Collapsed View</span></button>
            </div>
        </nav>
        <nav class="navbar navbar-top fixed-top navbar-expand" id="navbarDefault">
            <div class="collapse navbar-collapse justify-content-between">
                
                <div class="navbar-logo">
                    <button class="btn navbar-toggler navbar-toggler-humburger-icon hover-bg-transparent" type="button" data-bs-toggle="collapse" data-bs-target="#navbarVerticalCollapse" aria-controls="navbarVerticalCollapse" aria-expanded="false" aria-label="Toggle Navigation">
                        <span class="navbar-toggle-icon"><span class="toggle-line"></span></span>
                    </button>
                    <div class="d-flex align-items-center navbar-img">
                        <img src="../../../img/empresa/<% =ViewState["empresa_imagen"] %>" width="27" />
                    </div>
                </div>
                
                <ul class="navbar-nav">
                    <li class="nav-item nav-empresa">
                        <a class="nav-link">Bienvenido a la plataforma H2H</a>
                    </li>
                </ul>
                
                <ul class="navbar-nav navbar-nav-icons flex-row">
                    <li class="nav-item dropdown">
                        <a class="nav-link lh-1 pe-0" id="navbarDropdownUser" href="#!" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-haspopup="true" aria-expanded="false">
                        <div class="avatar avatar-l ">
                            <img class="rounded-circle " src="../../../assets/img/team/40x40/15.webp" alt="" />
                        </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end navbar-dropdown-caret py-0 dropdown-profile shadow border" aria-labelledby="navbarDropdownUser">
                        <div class="card position-relative border-0">
                            <div class="card-body p-0">
                                <div class="text-center pt-4 pb-3">
                                    <div class="avatar avatar-xl ">
                                    <img class="rounded-circle " src="../../../assets/img/team/72x72/15.webp" alt="" />
                                    </div>
                                    <h6 class="mt-2 text-body-emphasis">
                                    <asp:Literal runat="server" ID="lblnombres"></asp:Literal>
                                    <br />
                                    <asp:Literal runat="server" ID="lblrol"></asp:Literal>
                                    <a class="nav-link px-3 d-block" href="#!" id="fechavista"></a>
                                    </h6>
                                </div>
                            </div>
                            <!--
                            <div class="overflow-auto scrollbar">
                                <ul class="nav d-flex flex-column mb-2 pb-1">
                                    <li class="nav-item"><a class="nav-link px-3 d-block" href="#!" onclick="$('#dialogClave').modal('show'); $('input[type=\'password\']').val(''); return false;"><span class="me-2 text-body align-bottom" data-feather="key"></span>Contrasena</a></li>
                                    <li class="nav-item" id="lrefconfiguracion"><a class="nav-link px-3 d-block item-menu" href="#!" id="hrefconfiguracion"> <span class="me-2 text-body align-bottom" data-feather="settings"></span>Configuracion </a></li>
                                    <li class="nav-item"><a class="nav-link px-3 d-block" href="#!" onclick="openchat();"> <span class="me-2 text-body align-bottom" data-feather="help-circle"></span>Centro de Ayuda</a></li>
                                </ul>
                            </div>
                            -->
                            <div class="card-footer p-0 border-top border-translucent">
                                <div class="p-3"> <a class="btn btn-phoenix-secondary d-flex flex-center w-100" href="#!" onclick="$('#dialogLogin').modal('show'); return false;"> <span class="me-2" data-feather="log-out"> </span>Salir</a></div>
                                <div class="my-2 text-center fw-bold fs-10 text-body-quaternary"><a class="text-body-quaternary me-1" href="#!">Privacy policy</a>&bull;<a class="text-body-quaternary mx-1" href="#!">Terms</a>&bull;<a class="text-body-quaternary ms-1" href="#!">Cookies</a></div>
                            </div>
                        </div>
                        </div>
                    </li>
                </ul>
            </div>
            </nav>
        
            <div class="content">
                <ul class="nav nav-underline fs-9 tab-list" role="tablist">
                </ul>
                <div class="tab-content">                
                </div>
            </div>

        </main>
        <!-- ===============================================-->
        <!--    End of Main Content-->
        <!-- ===============================================-->
        <%--</form>--%>
        <div class="modal fade" id="dialogLogin" tabindex="-1" role="dialog" aria-labelledby="dialogLoginLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header justify-content-between">
                    <h5 class="modal-title" id="dialogLoginLabel">Administrador</h5>
                    <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                        <span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close
                    </button>
                </div>
                <div class="modal-body">
                    Esta seguro de salir del aplicativo? 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" id="btncontinuar" onclick="logout()">SALIR</button>
                </div>
            </div>
            </div>
        </div>
        </form>
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
        <script src="../../../assets/js/phoenix.js"></script>


        <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
        <script src="../../../plugins/jquery/corporativo/frame/jquery.indexweb-1.0.2.js"></script>

    </body>
</html>