<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recovery.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.Corporativo.Login.Recovery" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>ERP|Autenticacion</title>
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
        <form id="formdocument" asp-antiforgery="false" runat="server">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:HiddenField runat="server" ID="husuario" />
            <asp:HiddenField runat="server" ID="hruc" />
            <asp:HiddenField runat="server" ID="hlocal" />
            <asp:HiddenField runat="server" ID="hismobile" />
            <main class="main" id="top">
              <div class="container">
                <div class="row flex-center min-vh-100 py-5">
                  <div class="col-sm-10 col-md-8 col-lg-5 col-xxl-4"><a class="d-flex flex-center text-decoration-none mb-4" href="../../../index.html">
                      <div class="d-flex align-items-center fw-bolder fs-3 d-inline-block"><img src="../../../assets/img/icons/logo.png" alt="phoenix" width="58" />
                      </div>
                    </a>
                    <div class="px-xxl-5">
                      <div class="text-center mb-6">
                        <h4 class="text-body-highlight">Forgot your password?</h4>
                        <p class="text-body-tertiary mb-5">Enter your email below and we will send <br class="d-sm-none" />you a reset link</p>
                        <div class="d-flex align-items-center mb-5">
                          <input class="form-control flex-1" id="email" type="email" placeholder="Email" />
                          <asp:Button runat="server" class="btn btn-primary ms-2" Text="Enviar" ID="btnLogin" OnClick="btnLogin_Click"/><span class="fas fa-chevron-right ms-2"></span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                    <div class="col align-self-center">
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder> 
                    </div>
                </div>
              </div>
            </main>
        </form>
        <!-- ===============================================-->
        <!--    JavaScripts-->
        <!-- ===============================================-->
        <script src="../../../plugins/jquery/jquery.min.js"></script>
        <script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="../../../plugins/jquery-blockuid/jquery.blockUI.min.js"></script>

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
        <script src="../../../plugins/jquery/corporativo/recovery/jquery.listadoweb-1.0.0.js"></script>
  </body>
</html>