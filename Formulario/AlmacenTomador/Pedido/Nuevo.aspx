<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.AlmacenTomador.Pedido.Nuevo" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, shrink-to-fit=no, user-scalable=0">

    <title>Pedidos</title>


    <link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="manifest" href="../../../Themes/phoenix-v1.22.0/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="../../../Themes/phoenix-v1.22.0/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="../../../Themes/phoenix-v1.22.0/vendors/simplebar/simplebar.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/assets/js/config.js"></script>

    <!-- ===============================================-->
    <link href="../../../Themes/phoenix-v1.22.0/vendors/choices/choices.min.css" rel="stylesheet">
    <link href="../../../Themes/phoenix-v1.22.0/vendors/flatpickr/flatpickr.min.css" rel="stylesheet">
    <link href="../../../Themes/phoenix-v1.22.0/vendors/prism/prism-okaidia.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link href="../../../Themes/phoenix-v1.22.0/vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link href="../../../Themes/phoenix-v1.22.0/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
    <link href="../../../Themes/phoenix-v1.22.0/assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    <link href="../../../Themes/phoenix-v1.22.0/assets/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl">
    <link href="../../../Themes/phoenix-v1.22.0/assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
    <script>
        var phoenixIsRTL = window.config.config.phoenixIsRTL;
        if (phoenixIsRTL) {
            var linkDefault = document.getElementById('style-default');
            var userLinkDefault = document.getElementById('user-style-default');
            linkDefault.setAttribute('disabled', true);
            userLinkDefault.setAttribute('disabled', true);
            document.querySelector('html').setAttribute('dir', 'rtl');
        } else {
            var linkRTL = document.getElementById('style-rtl');
            var userLinkRTL = document.getElementById('user-style-rtl');
            linkRTL.setAttribute('disabled', true);
            userLinkRTL.setAttribute('disabled', true);
        }
    </script>
  </head>


  <body>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    
    <div class="row mb-4 d-none d-sm-inline-block">
        <div class="col-auto">
            <h1 class="mb-1">Nuevo Pedido</h1>
            <input type="hidden" id="hbodega" name="hbodega" runat="server" />
            <input type="hidden" id="hid" name="hid" runat="server" />
        </div>
    </div>
    <div class="row mb-1">
        <div class="col-6">
            <div class="d-flex flex-row">
                <button class="btn btn-phoenix-secondary me-2" id="btnvolver" name="btnvolver">
                    <span class="fas fa-arrow-left me-2"></span>
                    <span class="d-none d-sm-inline-block">Retornar</span>
                </button>
            </div>
        </div>
        <div class="col-6">
            <div class="d-flex flex-row-reverse">
                <button class="btn btn-phoenix-success me-2" id="add-n-pedido" name="add-n-pedido">
                    <span class="fas fa-save me-2"></span>Grabar
                </button>
                <input type="hidden" id="Hidden1" name="hbodega" runat="server" />
            </div>
        </div>
    </div>
    <div class="row mb-1">
        <div class="mb-1">
            <select class="form-select" id="cbobodega" name="cbobodega">
            </select>
        </div>

        <div class="mb-1">
            <select class="form-select" id="cbotipo" name="cbotipo">
                <option value="1" selected="selected">TIPO NORMAL A+</option>
                <option value="2">TIPO TEXTO LIBRE</option>
                <%--<option value="3">[TIPO PLANTILLA ESTANDAR]</option>--%>
            </select>
        </div>
        <div class="mb-1 d-flex flex-wrap gap-2" id="div-nomal" name="div-nomal">
            <select class="form-select flex-1" id="cbomaquina" name="cbomaquina"></select>
        </div>
        <div class="mb-1 d-flex flex-wrap gap-2" id="div-standar" name="div-standar" style="display:none !important">
            <select class="form-select flex-1" id="cboestandar" name="cboestandar"></select>
            <button class="btn btn-sm btn-phoenix-secondary" id="add-n-estandar"><span class="fas fa-plus me-2"></span></button>
        </div>
            
        <div class="mb-1">
            <input class="form-control" id="txt-n-articulo" name="txt-n-articulo" type="text" placeholder="ARTICULO ..." />
        </div>
        <div class="mb-1 d-flex flex-wrap gap-2">
            <input class="form-control flex-1" id="txt-n-cantidad" name="txt-n-cantidad" inputmode="numeric" pattern="[0-9]*" type="number" value="1" min="1" onkeypress="return isNumber(event)"/>
            <button class="btn btn-sm btn-phoenix-secondary" id="add-n-producto"><span class="fas fa-plus me-2"></span></button>
            <button class="btn btn-sm btn-phoenix-secondary" id="clear-n-producto"><span class="fas fa-trash me-2"></span></button>
        </div>
        <div class="mb-1">
            <table id="n-dynatable" name="n-dynatable" class="table fs-9 mb-0">
                <thead>
                <tr>
                    <th class="sort white-space-nowrap align-middle ps-4" scope="col">NOMBRE</th>
                    <th class="sort align-middle ps-4" scope="col">Q</th>
                    <th class="sort text-end align-middle pe-0 ps-4" scope="col"></th>
                </tr>
                </thead>
                <tbody class="list" id="products-n-table-body">
                </tbody>
            </table>
        </div>
    </div>        
    
    <style>
        
        @media screen and (max-width: 600px) {
            .ui-menu {
                width: 90% !important;
                max-width: 600px !important;
            }

            .content {
               padding-top: 70px;
               margin-top: 0;
               margin-bottom: 0;
            }
        }

        .ui-helper-hidden-accessible{
            display:none;
        }

        .ui-autocomplete { z-index:9999 !important; 
                           background-color:white !important;
                           color: black !important;
        }

        
    </style>
        
    <!-- jQuery -->
    <script src="../../../plugins/jquery/jquery.min.js"></script>
    <script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../../../plugins/jquery-blockuid/jquery.blockUI.min.js"></script>
    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->

    <script src="../../../Themes/phoenix-v1.22.0/vendors/popper/popper.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/anchorjs/anchor.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/is/is.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/fontawesome/all.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/lodash/lodash.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/list.js/list.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/feather-icons/feather.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/dayjs/dayjs.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/prism/prism.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/choices/choices.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/flatpickr/flatpickr.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/assets/js/phoenix.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/almacentomador/pedido/jquery.nuevoweb-1.3.1.js"></script>

  </body>

</html>