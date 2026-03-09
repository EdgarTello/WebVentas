<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.AlmacenTomador.Acceso.Index" %>

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


  <body onload="diabledBack();">

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="container">

        <form id="formdocument" class="row g-3 needs-validation" novalidate="" runat="server">
	    <asp:ScriptManager runat="server"></asp:ScriptManager>

        <div class="row flex-center min-vh-100 py-5">
          <div class="col-sm-10 col-md-8 col-lg-5 col-xl-5 col-xxl-3">
            <div class="text-center mb-7">
              <h3 class="text-body-highlight">Autenticacion</h3>
              <p class="text-body-tertiary">Obtener acceso a su cuenta</p>
            </div>
            <div class="mb-3 text-start">
              <label class="form-label" for="txtemployee">Empleado</label>
              <div class="form-icon-container">
                <input class="form-control form-icon-input" id="txtemployee" type="text" runat="server" placeholder="Document Number" onkeypress="return isNumberKeyOnly(event)" required="required"  maxlength="8" inputmode="numeric" pattern="[0-9]*"/><span class="fas fa-user text-body fs-9 form-icon"></span>
                <div class="invalid-feedback">Please provide a Document Number.</div>
              </div>
            </div>
           
            <div class="row flex-between-center mb-7">
              <div class="col-auto">
                <div class="form-check mb-0">
                  <input class="form-check-input" id="basic_checkbox" type="checkbox" checked="checked" runat="server" />
                  <label class="form-check-label mb-0" for="basic_checkbox">Recordarme</label>
                </div>
              </div>
            </div>
            <asp:Button ID="btnLogin" ClientIDMode="Static" runat="server" CssClass="btn btn-primary w-100 mb-3" OnClick="btnLogin_Click" Text="Ingresar"  />
          </div>
        </div>
      
      
        </form>
      </div>
      
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
  
   <script>
       $(function () {

           $("input").focus(function () {
               $(this).on("click.a keyup.a", function (e) {
                   $(this).off("click.a keyup.a").select();
               });
           });

       });

       

       function diabledBack(){
            window.location.hash="no-back-button";
            window.location.hash="Again-No-back-button" //chrome
            window.onhashchange=function(){window.location.hash="";}
        }
   </script>

</html>