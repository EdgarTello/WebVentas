<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.AlmacenTomador.Local.Listado" %>

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
    
    <div class="mb-1">
        <div class="row mb-4 d-none d-sm-inline-block">
            <div class="col-auto">
                <h2 class="mb-1">Lista de Pedidos</h2>
                <input type="hidden" id="hbodega" name="hbodega" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="d-flex flex-row">
                    <button class="btn btn-phoenix-secondary me-2" id="btnrefrescar" name="btnrefrescar">
                        <span class="fas fa-refresh me-2"></span>
                        <span class="d-none d-sm-inline-block">Actualizar</span>
                    </button>
                </div>
            </div>
            <div class="col-6">
                <div class="d-flex flex-row-reverse">
                    <button class="btn btn-phoenix-success me-2" id="btnnuevo" name="btnnuevo">
                        <span class="fas fa-plus me-2"></span>Nuevo
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="mb-1 todo-list" id="divrows">
    </div>
    
    <style>

        @media screen and (max-width: 600px) {
            
            .content {
               padding-top: 70px;
               margin-top: 0;
               margin-bottom: 0;
            }
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
    <script src="../../../plugins/jquery/almacentomador/pedido/jquery.listadoweb-1.3.1.js"></script>

  </body>

</html>