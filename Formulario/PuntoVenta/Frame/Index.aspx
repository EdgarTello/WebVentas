<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Frame.Index" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- ===============================================-->
      <!--    Document Title-->
      <!-- ===============================================-->
      <title>Punto de Venta</title>
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
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
      <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
      <link href="../../../vendors/simplebar/simplebar.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
      <link href="../../../assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
      <link href="../../../assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
   </head>
   <body>
      <%--   <form id="formdocument" asp-antiforgery="false" runat="server">
         <asp:ScriptManager runat="server"></asp:ScriptManager>--%>
      <!-- ===============================================-->
      <!--    Main Content-->
      <!-- ===============================================-->
      <main class="main" id="top">
         <input type="hidden" id="hempresatipo" name="hempresatipo" runat="server" />
         <input type="hidden" id="husuarioacceso" name="husuarioacceso" runat="server" />
         <input type="hidden" id="hcajeroreporte" name="hcajeroreporte" runat="server" />
         <input type="hidden" id="hcajeroproducto" name="hcajeroproducto" runat="server" />
         <input type="hidden" id="hcajeroparallevar" name="hcajeroparallevar" runat="server" />
         <input type="hidden" id="hcajerodelivery" name="hcajerodelivery" runat="server" />
         <input type="hidden" id="hcajerodashboard" name="hcajerodashboard" runat="server" />
         <input type="hidden" id="hdashboarpantalla" name="hdashboarpantalla" runat="server" />
         <input type="hidden" id="htelefonosoporte" name="htelefonosoporte" runat="server" />
         <nav class="navbar navbar-vertical navbar-expand-lg">
            <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
               <!-- scrollbar removed-->
               <div class="navbar-vertical-content">
                  <ul class="navbar-nav flex-column" id="navbarVerticalNav">
                     <li class="nav-item">
                        <!-- parent pages-->
                        <div class="nav-item-wrapper">
                           <a class="nav-link dropdown-indicator label-1" href="#nv-home" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-home">
                              <div class="d-flex align-items-center">
                                 <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                 <span class="nav-link-icon"><span data-feather="pie-chart"></span></span><span class="nav-link-text">Home</span>
                              </div>
                           </a>
                           <div class="parent-wrapper label-1">
                              <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-home">
                                 <li class="collapsed-nav-item-title d-none">Home
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link item-menu" href="../DashBoard/Listado.aspx">E commerce</a>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </li>
                     <li class="nav-item">
                        <!-- label-->
                        <p class="navbar-vertical-label">Modules</p>
                        <hr class="navbar-vertical-line" />
                        <!-- parent pages-->
                        <div class="nav-item-wrapper">
                           <a class="nav-link dropdown-indicator label-1" href="#nv-tables" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-tables">
                              <div class="d-flex align-items-center">
                                 <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                 <span class="nav-link-icon"><span data-feather="columns"></span></span><span class="nav-link-text">Ventas</span>
                              </div>
                           </a>
                           <div class="parent-wrapper label-1">
                              <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-tables">
                                 <li class="collapsed-nav-item-title d-none">Ventas
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link item-menu" href="../OperacionCaja/Listado.aspx">
                                       <div class="d-flex align-items-center"><span class="nav-link-text">Apertura Caja</span></div>
                                    </a>
                                    <!-- more inner pages-->
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link item-menu" href="../Validacion/Nuevo.aspx">
                                       <div class="d-flex align-items-center"><span class="nav-link-text">Punto de Venta</span>
                                       </div>
                                    </a>
                                    <!-- more inner pages-->
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link item-menu" href="../Delivery/Listado.aspx">
                                       <div class="d-flex align-items-center"><span class="nav-link-text">Delivery</span>
                                       </div>
                                    </a>
                                    <!-- more inner pages-->
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link item-menu" href="../Cotizacion02/Listado.aspx">
                                       <div class="d-flex align-items-center"><span class="nav-link-text">Cotizacion</span>
                                       </div>
                                    </a>
                                    <!-- more inner pages-->
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link item-menu" href="../Documento/Listado.aspx">
                                       <div class="d-flex align-items-center"><span class="nav-link-text">Documentos</span>
                                       </div>
                                    </a>
                                    <!-- more inner pages-->
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link dropdown-indicator" href="#nv-gestion" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-gestion">
                                       <div class="d-flex align-items-center">
                                          <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                          <span class="nav-link-text">Gestion</span>
                                       </div>
                                    </a>
                                    <!-- more inner pages-->
                                    <div class="parent-wrapper">
                                       <ul class="nav collapse parent" data-bs-parent="#forms" id="nv-gestion">
                                          <li class="nav-item">
                                             <a class="nav-link item-menu" href="../PromocionPrecio/Listado.aspx">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Promocion x Precio</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link item-menu" href="../ValesConsumo/Listado.aspx">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Vales Consumo</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                       </ul>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                        </div>
                        <!-- parent pages-->
                        <div class="nav-item-wrapper">
                           <a class="nav-link dropdown-indicator label-1" href="#nv-forms" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-forms">
                              <div class="d-flex align-items-center">
                                 <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                 <span class="nav-link-icon"><span data-feather="file-text"></span></span><span class="nav-link-text">Forms</span>
                              </div>
                           </a>
                           <div class="parent-wrapper label-1">
                              <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="nv-forms">
                                 <li class="collapsed-nav-item-title d-none">Forms
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link dropdown-indicator" href="#nv-basic" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-basic">
                                       <div class="d-flex align-items-center">
                                          <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                          <span class="nav-link-text">Basic</span>
                                       </div>
                                    </a>
                                    <!-- more inner pages-->
                                    <div class="parent-wrapper">
                                       <ul class="nav collapse parent" data-bs-parent="#forms" id="nv-basic">
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/basic/form-control.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Form control</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/basic/input-group.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Input group</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/basic/select.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Select</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/basic/checks.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Checks</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/basic/range.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Range</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/basic/floating-labels.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Floating labels</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/basic/layout.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Layout</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                       </ul>
                                    </div>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link dropdown-indicator" href="#nv-advance" data-bs-toggle="collapse" aria-expanded="false" aria-controls="nv-advance">
                                       <div class="d-flex align-items-center">
                                          <div class="dropdown-indicator-icon-wrapper"><span class="fas fa-caret-right dropdown-indicator-icon"></span></div>
                                          <span class="nav-link-text">Advance</span>
                                       </div>
                                    </a>
                                    <!-- more inner pages-->
                                    <div class="parent-wrapper">
                                       <ul class="nav collapse parent" data-bs-parent="#forms" id="nv-advance">
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/advance/advance-select.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Advance select</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/advance/date-picker.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Date picker</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/advance/editor.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Editor</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/advance/file-uploader.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">File uploader</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/advance/range.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Range</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/advance/rating.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Rating</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                          <li class="nav-item">
                                             <a class="nav-link" href="../../modules/forms/advance/emoji-button.html">
                                                <div class="d-flex align-items-center"><span class="nav-link-text">Emoji button</span>
                                                </div>
                                             </a>
                                             <!-- more inner pages-->
                                          </li>
                                       </ul>
                                    </div>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link" href="../../modules/forms/validation.html">
                                       <div class="d-flex align-items-center"><span class="nav-link-text">Validation</span>
                                       </div>
                                    </a>
                                    <!-- more inner pages-->
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link" href="../../modules/forms/wizard.html">
                                       <div class="d-flex align-items-center"><span class="nav-link-text">Wizard</span>
                                       </div>
                                    </a>
                                    <!-- more inner pages-->
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
                  <div class="d-flex align-items-center">
                     <div class="d-flex align-items-center"><img src="../../../img/empresa/<% =ViewState["empresa_imagen"] %>" width="27" />
                        <%--<h5 class="logo-text ms-2 d-none d-sm-block">phoenix</h5>--%>
                     </div>
                  </div>
               </div>
               <ul class="navbar-nav">
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
                     <a id="fechavista" class="nav-link"></a>
                  </li>
               </ul>
               <form id="formdocument" asp-antiforgery="false" runat="server">
                  <asp:DropDownList ID="cbolocal" CssClass="form-select mb-3" runat="server"></asp:DropDownList>
               </form>
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
                                 </h6>
                              </div>
                           </div>
                           <div class="overflow-auto scrollbar" style="height: 10rem;">
                              <ul class="nav d-flex flex-column mb-2 pb-1">
                                 <li class="nav-item"><a class="nav-link px-3 d-block" href="#!"><span class="me-2 text-body align-bottom" data-feather="key"></span>Contrasena</a></li>
                                 <li class="nav-item"><a class="nav-link px-3 d-block" href="#!"> <span class="me-2 text-body align-bottom" data-feather="settings"></span>Configuracion </a></li>
                                 <li class="nav-item"><a class="nav-link px-3 d-block" href="#!"> <span class="me-2 text-body align-bottom" data-feather="help-circle"></span>Centro de Ayuda</a></li>
                              </ul>
                           </div>
                           <div class="card-footer p-0 border-top border-translucent">
                              <div class="px-3"> <a class="btn btn-phoenix-secondary d-flex flex-center w-100" href="#!" onclick="$('#dialogLogin').modal('show'); return false;"> <span class="me-2" data-feather="log-out"> </span>Salir</a></div>
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
                  <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close</button>
               </div>
               <div class="modal-body">
                  Esta seguro de salir del aplicativo? 
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger" id="btncontinuar" onclick="logout()">Salir</button>
               </div>
            </div>
         </div>
      </div>
      <!-- ===============================================-->
      <!--    JavaScripts-->
      <!-- ===============================================-->
      <!-- jQuery -->
      <script src="../../../plugins/jquery/jquery.min.js"></script>
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
      <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
      <script>

          $(".nav-tabs a").click(function () {
              $(this).tab('show');
          });

          $('.nav-tabs a').on('shown.bs.tab', function (event) {
              var x = $(event.target).text();         // active tab
              var y = $(event.relatedTarget).text();  // previous tab
              $(".act span").text(x);
              $(".prev span").text(y);
          });

          setInterval(
              function () {
                  $("#fechavista").text(getDateTime());
              }, 1000);

          $('.item-menu').click(function (e) {
              e.preventDefault();

              var text = $(this).text().trim();
              var href = $(this).attr("href").trim();
              var name = $(this).text().trim().replaceAll(' ', '-').toLowerCase();

              $(".tab-item").removeClass('active');
              $(".tab-pane").removeClass('show').removeClass('active');

              
              if ($("#" + name + "-tab").length==0) {

                  $(".tab-list").append('<li class="nav-item">' +
                      '<div class="tab-item nav-link active" id="' + name + '-tab" data-bs-toggle="tab" href="#tab-' + name + '" role="button" aria-controls="tab-' + name + '" aria-selected="true">' +
                      text + '</div></li>')

                  $(".tab-content").append('<div class="tab-pane fade show active embed-responsive" id="tab-' + name + '" role="tabpanel" aria-labelledby="' + name + '-tab">' +
                      '<iframe id="#f' + name + '" src="' + href + '" class="embed-responsive-item"></iframe></div > ')
              }

              $('#' + name + '-tab').trigger('click');
          });

          function logout() {
              window.location.href = '../Menu/Salir.aspx';
          }

      </script>
      <style>
         .embed-responsive {
             position: relative !important;
             padding-bottom: 56.25% !important;
             padding-top: 20px !important; 
             overflow: hidden !important;
         }
         .embed-responsive iframe,
         .embed-responsive object,
         .embed-responsive embed {
             position: absolute !important;
             top: 0 !important;
             left: 0 !important;
             width: 100% !important;
             height: 100% !important;
         }

         .content {
             padding-left: 0.15rem !important;
             padding-right: 0.15rem !important;
         }
      </style>
   </body>
</html>