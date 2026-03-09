<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Visor04.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Listado</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css" />
  <link rel="stylesheet" href="../../../plugins/jquery-ui/jquery-ui.min.css"  />

  <link rel="stylesheet" href="../../../plugins/daterangepicker/daterangepicker.css" />
  <link rel="stylesheet" href="../../../plugins/select2/css/select2.min.css" />
  <link rel="stylesheet" href="../../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />
  <link rel="stylesheet" href="../../../plugins/toastr/toastr.min.css"  />
  <!-- Theme style -->
  <link rel="stylesheet" href="../../../Content/keyboard.css"/>
  <link rel="stylesheet" href="../../../dist/css/adminlte.min.css" />
</head>
<body>
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper" style="margin-left: 0px">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="padding: 5px .5rem">

                <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin-left:0px !important">
                    <!-- Left navbar links -->
                    <ul class="navbar-nav">
                        <%if (this.ViewState["empresa_tipo"].ToString() != "21")
                        { %> 
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
                        <%}%>
        
                        <li class="nav-item">
                              <asp:DropDownList ID="local" CssClass="form-control" runat="server"></asp:DropDownList> 
                        </li>
                    </ul>

                    <!-- Right navbar links -->
                    <ul class="navbar-nav ml-auto">
                      <!-- Navbar Search -->
                      <li class="nav-item">
                        <a class="nav-link" style="text-decoration:underline !important;color: blue !important;" href="../Visor03/Listado.aspx">Principal</a>    
                      </li>
                     
                      <li class="nav-item">
                        <a class="nav-link">
                            <asp:Literal runat="server" ID="lblareas"></asp:Literal>
                        </a>    
                      </li>
                      <%if (this.ViewState["empresa_tipo"].ToString() != "21")
                      { %> 
                      <li class="nav-item">
                        <a class="nav-link">                           
                            <i class="fas fa-user"></i>                          
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link">                           
                            <asp:Literal runat="server" ID="lblnombres"></asp:Literal>
                        </a>
                      </li>
                      <%}%>
                      <li class="nav-item">
                        <a id="fechavista" class="nav-link"></a>
                      </li>
                      <li class="nav-item">
                        <a href="../../../ContrasenaCambioWeb.aspx" class="nav-link">
                            <i class="fas fa-key"></i>
                        </a>
                      </li> 
                      <li class="nav-item">
                        <asp:LoginStatus ID="LoginStatus1" runat="server" 
                            LogoutAction="Redirect"
                            onclick="return confirm('Esta seguro de salir del sistema?');"
                            LogoutText="<span class='nav-link'><i class='fas fa-sign-out-alt'></i></span>" 
                            LogoutPageUrl="~/" 
                            OnLoggingOut="Unnamed_LoggingOut" ToolTip="Salir" />
                        <%--<a href='#' class='nav-link'><i class='fas fa-sign-out-alt'></i>Salir</a>--%>
                      </li> 
                    </ul>
              </nav>
            </section>
                <%--<div id="divpendiente" class="row row-cols-1 row-cols-md-6 g-4">--%>
                <div id="divpendiente" class="card-deck">
                </div>
        </div>
    </form>

    <!-- ./wrapper -->

<!-- jQuery -->
<script src="../../../plugins/jquery/jquery.min.js"></script>
<script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="../../../plugins/jquery-blockuid/jquery.blockUI.min.js"></script>

<!-- Bootstrap 4 -->
<script src="../../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="../../../plugins/jquery-validation/additional-methods.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../../plugins/jszip/jszip.min.js"></script>
<script src="../../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- bs-custom-file-input -->
<script src="../../../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- InputMask -->
<script src="../../../plugins/moment/moment.min.js"></script>
<script src="../../../plugins/inputmask/jquery.inputmask.min.js"></script>
<!-- date-range-picker -->
<script src="../../../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../../../plugins/moment/locale/es.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="../../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="../../../plugins/jquery-bootstrap-confirm-modal/js/jquery.confirmModal.min.js"></script>
<!-- SweetAlert2 -->
<script src="../../../plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Toastr -->
<script src="../../../plugins/toastr/toastr.min.js"></script>

<script src="../../../Scripts/jquery.keyboard.js"></script>
<script src="../../../Scripts/jquery.keyboard.extension-all.js"></script>

<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
<script src="../../../plugins/jquery/puntoventa/Visor04/jquery.listadoweb-1.3.7.js"></script>
<script src="../../../Scripts/jquery.table2excel.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>

<style>

    .card-body {
        padding: 0.30rem !important;
    }

    .card-header {
        padding: 0.15rem 0.15rem !important;
    }

    .btn {
        text-align:left !important;
        padding:.15rem .15rem !important;
        
    }

    .card-columns {
      @include media-breakpoint-only(xl) {
        column-count: 5;
      }
      @include media-breakpoint-only(lg) {
        column-count: 4;
      }
      @include media-breakpoint-only(md) {
        column-count: 3;
      }
      @include media-breakpoint-only(sm) {
        column-count: 2;
      }
    }

    @media (min-width: 576px) {
    .card-columns {
        column-count: 3;
    }
}

    @media (min-width: 768px) {
        .card-columns {
            column-count: 4;
        }
    }

    @media (min-width: 992px) {
        .card-columns {
            column-count: 5;
        }
    }

    @media (min-width: 1200px) {
        .card-columns {
            column-count: 6;
        }
    }
</style>
</body>


</html>

