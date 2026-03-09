<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index2FA.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.AlmacenTomador.Acceso.Index2FA" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, shrink-to-fit=no, user-scalable=0">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Acceso</title>


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
  </head>


  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="container">
        <div class="row flex-center min-vh-100 py-5">
          <div class="col-sm-10 col-md-8 col-lg-5 col-xxl-4"><a class="d-flex flex-center text-decoration-none mb-4" href="../../../index.html">
              <div class="d-flex align-items-center fw-bolder fs-3 d-inline-block">
                  <%--<img src="../../../Themes/phoenix-v1.22.0/assets/img/icons/logo.png" alt="phoenix" width="58" />--%>

                  <img src="../Img/<%=this.ViewState["empresacodigo"].ToString()%>.png" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />

              </div>
            </a>
            <div class="px-xxl-5">
              <div class="text-center mb-4">
                <h4 class="text-body-highlight">Ingrese el codigo de verificacion</h4>
                <p class="text-body-tertiary mb-0">Un correo conteniendo 4-digitos de verificacion a sido enviado a <%=this.ViewState["correo"].ToString()%> </p>
                <%--<P class="fs-10 mb-5">No tiene  acceso? <a href="#!">consulte a su administrador</a></P>--%>
                <p class="text-body-tertiary mb-0" id="psolicitar"></p>

                <form id="formdocument" runat="server">

                  <asp:ScriptManager runat="server"></asp:ScriptManager>

                  <asp:HiddenField runat="server" ID="hid" />
                  <asp:HiddenField runat="server" ID="hnoemple" />
                  <asp:HiddenField runat="server" ID="hciacod" />
                  <asp:HiddenField runat="server" ID="htracod" />
                  <asp:HiddenField runat="server" ID="htranom" />
                  <asp:HiddenField runat="server" ID="halmcod" />

                  <div class="d-flex align-items-center gap-2 mb-2">
                    <input class="form-control px-2 text-center" type="number" runat="server" id="caracter1" name="caracter1" min="0" maxlength="1" tabindex="100" onkeypress="return isNumber(event)" inputmode="numeric" pattern="[0-9]*"/>
                    <input class="form-control px-2 text-center" type="number" runat="server" id="caracter2" name="caracter2" min="0" maxlength="1" tabindex="101" onkeypress="return isNumber(event)" inputmode="numeric" pattern="[0-9]*"/>
                    <input class="form-control px-2 text-center" type="number" runat="server" id="caracter3" name="caracter3" min="0" maxlength="1" tabindex="102" onkeypress="return isNumber(event)" inputmode="numeric" pattern="[0-9]*"/>
                    <input class="form-control px-2 text-center" type="number" runat="server" id="caracter4" name="caracter4" min="0" maxlength="1" tabindex="103" onkeypress="return isNumber(event)" inputmode="numeric" pattern="[0-9]*"/>
                  </div>
                  <div class="form-check text-start mb-2">
                    <br />
                  </div>
                  <div class="mb-3 d-flex flex-wrap gap-2">
                    <asp:Button ID="btnVolver" ClientIDMode="Static" runat="server" CssClass="btn btn-secondary flex-1" OnClick="btnVolver_Click" Text="Retornar"/>
                    <asp:Button ID="btnLogin" ClientIDMode="Static" runat="server" CssClass="btn btn-primary flex-1" OnClick="btnLogin_Click" Text="Verificar"  />
                  </div>
                  <div class="d-flex align-items-center gap-2 mb-3">
                      <asp:Label ID="lblrespuesta" runat="server" CssClass="text-danger"></asp:Label>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <script>
          var navbarTopStyle = window.config.config.phoenixNavbarTopStyle;
          var navbarTop = document.querySelector('.navbar-top');
          if (navbarTopStyle === 'darker') {
              navbarTop.setAttribute('data-navbar-appearance', 'darker');
          }

          var navbarVerticalStyle = window.config.config.phoenixNavbarVerticalStyle;
          var navbarVertical = document.querySelector('.navbar-vertical');
          if (navbarVertical && navbarVerticalStyle === 'darker') {
              navbarVertical.setAttribute('data-navbar-appearance', 'darker');
          }
      </script>
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->


  </body>
    
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
    <script src="../../../Themes/phoenix-v1.22.0/assets/js/phoenix.js"></script>
    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/almacentomador/acceso/jquery.nuevoweb-1.2.9.js"></script>

    
</html>