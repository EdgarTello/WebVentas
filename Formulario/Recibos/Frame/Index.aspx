<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.Recibos.Frame.Index" %>

<!DOCTYPE html>
<html lang="en" class="js-focus-visible" data-js-focus-visible="" style="height: auto;">
<head>
  <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	<title>Recibos de Suministros</title>	
    <meta name="apple-itunes-app" content="app-id=378649517" />
    <meta name="description" content="Nos preocupamos por ti.  En la banca por internet de Interbank encontrarás todo para tus necesidades financieras. ¡Maneja tu dinero de manera segura!" />
	<meta name="robots" content="index, follow"/>
    <meta name="viewport" content="initial-scale=1, minimum-scale=1, shrink-to-fit=no, width=device-width" />

	<meta property="og:type" content="website" />
	<meta property="og:title" content="ERP: un pago rápido - TwoTecnology" />
	<meta property="og:description" content="Nos preocupamos por darle un mejor soporte!" />
	<meta property="og:url" content="http://twotecnology.online/" />

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../../dist/css/adminlte.min.css?v=3.2.0">
  <link rel="stylesheet" href="../../../plugins/overlayScrollbars/css/OverlayScrollbars.min.css" />
  <link href="../../favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>
<body class="hold-transition sidebar-mini layout-fixed" data-panel-auto-height-mode="height">
<!-- Site wrapper -->
<form id="formdocument" asp-antiforgery="false" runat="server">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light" >
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button" id="pushmenu"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item">
            <a class="nav-link">
                <asp:Literal runat="server" ID="lblruc"></asp:Literal>
            </a>    
        </li>

        <li class="nav-item">
            <a class="nav-link">
                <asp:Literal runat="server" ID="lblempresa"></asp:Literal>
            </a>    
        </li>
        
        <li class="nav-item">
            <a class="nav-link">
                <i class="fas fa-industry"></i>
            </a>
        </li>
        <li class="nav-item">
              <asp:DropDownList ID="local" CssClass="form-control" runat="server"></asp:DropDownList> 
        </li>
        
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
     

      <li class="nav-item">
        <a class="nav-link">           
            <i class="fas fa-user"></i>                       
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link">           
            <b><asp:Literal runat="server" ID="lblnombres"></asp:Literal></b>
        </a>
      </li>
      <li class="nav-item">
        <a id="fechavista" class="nav-link"></a>
      </li>
      <li class="nav-item">
        <a href="#" class="nav-link" onclick="openclave();">
            <i class="fas fa-key"></i>
        </a>
      </li> 
      <li class="nav-item">
        <asp:LoginStatus ID="LoginStatus1" runat="server" 
            LogoutAction="Redirect"
            onclick="$('#dialogLogin').modal('show'); return false;"
            LogoutText="<span class='nav-link'><i class='fas fa-sign-out-alt'></i></span>" 
            LogoutPageUrl="~/"  />
      </li> 
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-light-primary elevation-4 custom_sidebar">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
        <center>
            <img src="../../../img/Empresa/<% =ViewState["empresa_imagen"] %>" class="img-thumbnail" style="opacity:.8;width:140px;height:60px"/>
            <input type="hidden" id="hempresatipo" name="hempresatipo" runat="server" />
            <input type="hidden" id="husuarioacceso" name="husuarioacceso" runat="server" />

            
        </center>
    </a>

    <!-- Sidebar -->
    <div class="sidebar os-host os-theme-light os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition">
     
      <!-- Sidebar Frame -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <% if (ViewState["empresa_tipo"].ToString()=="104")
        {%>
                <%if ( this.ViewState["acceso"].ToString() == "SuperAdmin" || this.ViewState["acceso"].ToString() == "Administrador")
                {%>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i><p>Dashboard</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../Documentos/Listado.aspx" class="nav-link" id="frmlistado">
                            <i class="nav-icon fas fa-file-alt"></i>
                            <p>Recibos</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-line"></i>
                            <p>Reporte</p>
                        </a>
                    </li>
                <%}%>
        <%}%>
        </ul>
      </nav>
      <!-- /.sidebar-Frame -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper iframe-mode" data-widget="iframe" data-loading-screen="750">
    <div class="nav navbar navbar-expand navbar-white navbar-light border-bottom p-0">
        <a class="nav-link bg-light" href="#" data-widget="iframe-scrollleft"><i class="fas fa-angle-double-left"></i></a>
        <ul class="navbar-nav overflow-hidden" role="tablist"></ul>
        <a class="nav-link bg-light" href="#" data-widget="iframe-scrollright"><i class="fas fa-angle-double-right"></i></a>
        <a class="nav-link bg-light" href="#" data-widget="iframe-fullscreen"><i class="fas fa-expand"></i></a>
    </div>
   <div class="tab-content">
      <div class="tab-empty">
        <img src="../../../img/Empresa/196-menu.png" class="img-fluid" />
      </div>
      <div class="tab-loading">
        <div>
          <h2 class="display-4">Cargando ... <i class="fa fa-sync fa-spin"></i></h2>
        </div>
      </div>
    </div>
  </div>
<div class="modal fade" id="dialogLogin" tabindex="-1" role="dialog" aria-labelledby="dialogLoginLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="dialogLoginLabel">Administrador</h5>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">
            ¿Esta seguro de salir del aplicativo? 
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <button type="button" class="btn btn-danger" id="btncontinuar" onclick="logout()">Salir</button>
        </div>
        </div>
    </div>
</div>    
  <!-- /.content-wrapper -->

  <%--<footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.1.0
    </div>
    <strong>Copyright &copy; 2020-2021 <a href="https://www.twotecnology.com" target="_blank">Two Tecnology</a>.</strong> All rights reserved.
  </footer>--%>
</div>
</form>
<!-- jQuery -->
<script src="../../../plugins/jquery/jquery.min.js"></script>
<script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>

<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
<!-- Bootstrap 4 -->
<script src="../../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.js?v=3.2.0"></script>
<script src="../../../dist/js/demo.js"></script>


<script>
    $(function () {


        setInterval(
            function () {
                $("#fechavista").text(getDateTime());
            }, 1000);

        var pagina = getParameterByName('pagina');
        var tipo = $("#hempresatipo").val();
        //$('#pushmenu').click();

        
        setTimeout(
            function () {
                $('#frmlistado').click();
            }, 500);
          

        setTimeout(
            function () {
                $('#pushmenu').click();
            }, 2000);

        
    });

    function openclave() {
        $('#mcontrasena').click();
    }

    function openchat() {

        var telefonosoporte = $("#htelefonosoporte").val();
        var url = "https://wa.me/" + telefonosoporte + "?text=Hola deseo contactarme con ustedes";
        window.open(url, "_blank");
        //window.location.href = url;
    }
   
    function logout() {
        window.location.href = '../Frame/Salir.aspx';
    }
   

    function getParameterByName(name) {
        var regexS = "[\\?&]" + name + "=([^&#]*)",
            regex = new RegExp(regexS),
            results = regex.exec(window.location.search);
        if (results == null) {
            return "";
        } else {
            return decodeURIComponent(results[1].replace(/\+/g, " "));
        }
    }
</script>
<style>
    navbar {
        padding: 0.1rem 0.1rem !important;
    }

    .menu-item {
        padding-left:1rem !important;
    }
</style>
</body>
</html>

