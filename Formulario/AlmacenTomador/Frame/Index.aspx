<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.AlmacenTomador.Frame.Index" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Frame</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="manifest" href="../../../Themes/phoenix-v1.22.0/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="../../../Themes/phoenix-v1.22.0/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="../../../Themes/phoenix-v1.22.0/vendors/simplebar/simplebar.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/assets/js/config.js"></script>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
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
    <link href="../../../Themes/phoenix-v1.22.0/vendors/leaflet/leaflet.css" rel="stylesheet">
    <link href="../../../Themes/phoenix-v1.22.0/vendors/leaflet.markercluster/MarkerCluster.css" rel="stylesheet">
    <link href="../../../Themes/phoenix-v1.22.0/vendors/leaflet.markercluster/MarkerCluster.Default.css" rel="stylesheet">
  </head>
  <body>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <nav class="navbar navbar-vertical navbar-expand-lg">
        <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
          <!-- scrollbar removed-->
          <div class="navbar-vertical-content">
            <ul class="navbar-nav flex-column" id="navbarVerticalNav">
              <li class="nav-item">
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#nv-home" role="button" data-bs-toggle="collapse" aria-expanded="true" aria-controls="nv-home">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="pie-chart"></span></span><span class="nav-link-text">Home</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent show" data-bs-parent="#navbarVerticalCollapse" id="nv-home">
                      <li class="collapsed-nav-item-title d-none">Home</li>
                      <li class="nav-item"><a class="nav-link active" href="Index.aspx">
                          <div class="d-flex align-items-center"><span class="nav-link-text">DashBoard</span></div>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </li>
              <li class="nav-item">
                <!-- label-->
                <p class="navbar-vertical-label">Apps
                </p>
                <hr class="navbar-vertical-line" />
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#nv-e-pedido" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-e-pedido">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div><span class="nav-link-icon"><span data-feather="shopping-cart"></span></span><span class="nav-link-text">Logistica</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-e-pedido">
                      <li class="collapsed-nav-item-title d-none">Logistica</li>
                      <li class="nav-item">
                        <a class="nav-link itemclick" href="../Pedido/Listado.aspx" id="op_pedido_listado" name="op_pedido_listado">
                            <div class="d-flex align-items-center"><span class="nav-link-text">Pedidos</span></div>
                        </a>
                      </li>
                    </ul>
                  </div>
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

            <button class="btn navbar-toggler navbar-toggler-humburger-icon hover-bg-transparent" type="button" data-bs-toggle="collapse" data-bs-target="#navbarVerticalCollapse" aria-controls="navbarVerticalCollapse" aria-expanded="false" aria-label="Toggle Navigation"><span class="navbar-toggle-icon"><span class="toggle-line"></span></span></button>
            <a class="navbar-brand me-1 me-sm-3" href="index.html">
              <div class="d-flex align-items-center">
                <div class="d-flex align-items-center"><img src="../Img/<%=this.ViewState["empresacodigo"].ToString()%>.png" alt="phoenix" width="80" /></div>
              </div>
            </a>
          </div>

          <ul class="navbar-nav navbar-nav-icons flex-row">
            <li class="nav-item">
                <a class="nav-link" href="#"><%=this.ViewState["trabajadornombre"].ToString()%></a>
            </li>
            <%--<li class="nav-item">
                <span data-feather="clock"></span><a id="fechavista" class="nav-link"></a>
            </li>--%>
            <li class="nav-item dropdown">
              <a class="nav-link" href="Salir.aspx" title="Salir"><span data-feather="log-out"></span></a>	
            </li>
          </ul>
        </div>
      </nav>
      <div class="content content-wrapper iframe-mode" data-widget="iframe" data-loading-screen="750">
         <div class="tab-content">
             <div class="tab-loading">
                <h2 class="display-4">Cargando ... <i class="fa fa-sync fa-spin"></i></h2>
            </div>
          </div>
       </div>
    </main>
 
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
    <script src="../../../Themes/phoenix-v1.22.0/vendors/leaflet/leaflet.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/leaflet.markercluster/leaflet.markercluster.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/vendors/leaflet.tilelayer.colorfilter/leaflet-tilelayer-colorfilter.min.js"></script>
    <script src="../../../Themes/phoenix-v1.22.0/assets/js/phoenix.js"></script>
    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    
    <script>
        $(function () {

            //setInterval(
            //function () {
            //        $("#fechavista").text(getDateTime());
            //}, 1000);

            setTimeout(
                    function () {
                    $('#op_pedido_listado').click();
                }, 500);

            $(".itemclick").click(function (e) {
                e.preventDefault();
                $(".tab-content").load($(this).attr("href"));
                //$("#fcontent").attr("src", $(this).attr("href"));
                //$("#fcontent").height($(window).height());
                //$("#fcontent").width($(window).width());
            })
        });

    </script>
  </body>

</html>