<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nuevo.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.GestorDocumental.Proceso.Nuevo" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Proceso</title>
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
    <script src="../../../vendors/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="../../../vendors/simplebar/simplebar.min.js"></script>
    <script src="../../../assets/js/config.js"></script>

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="../../../vendors/glightbox/glightbox.min.css" rel="stylesheet">
    <link href="../../../vendors/flatpickr/flatpickr.min.css" rel="stylesheet">
    <link href="../../../vendors/prism/prism-okaidia.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link href="../../../vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link href="../../../assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    <link href="../../../assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
  </head>
  <body>
    <div class="card shadow-none border mb-3" data-component-card="data-component-card">
        <div class="card-header p-2 border-bottom bg-body">
            <div class="row g-3 justify-content-between align-items-center">
                <div class="col-md-4">
                    <select class="form-select mb-3" aria-label="category" id="cbotipo"></select>

                    <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("ProcesoNew") %>" />
                    <input type="hidden" id="hid" name="hid" runat="server" />
                    <input type="hidden" id="hpersonas" name="hpersonas" runat="server" />
                    <input type="hidden" id="husuario_acceso" name="husuario_acceso" runat="server" />
                </div>
                <div class="col-md-8">
                    <div class="row justify-content-end align-items-center" role="tablist">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-6">
                                    <input class="form-control datetimepicker flatpickr-input" id="dfecha" type="text" placeholder="dd/mm/yyyy" data-options='{"disableMobile":true,"dateFormat":"d/m/Y"}' readonly="readonly">
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-primary" id="btnaceptar"><span class="fas fa-plus me-2"></span>GENERAR KIT</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 text-end">
                            <button class="btn btn-phoenix-secondary" id="btncancelar"><span class="fa-solid fa-arrow-left me-sm-2"></span><span class="d-none d-sm-inline-block">VOLVER</span></button>                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body p-0">
            <div class="collapse code-collapse" id="ajax-table-code">
                <pre class="scrollbar" style="max-height:420px"><code class="language-html"></code></pre>
            </div>
            <div class="p-4 code-to-copy">
                <div class="row">
                    <div class="col-md-4">
                        <div class="table-list" id="advanceAjaxTable">
                            <table id="tbldetalle" class="table table-sm fs-9 mb-0 overflow-hidden">
                                <thead class="text-body bg-body-highlight">
                                    <tr>
									    <th class="pe-1 align-middle white-space-nowrap text-center">N°</th>
									    <th class="pe-1 align-middle white-space-nowrap text-center">COLUMNA</th>
                                        <th class="pe-1 align-middle white-space-nowrap text-center">ARCHIVO</th>
									    <th></th>
								    </tr>
                                </thead>
                                <tbody class="list"></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <embed id="objpdf" type="application/pdf" width="100%" height="500px" style="border:solid; border-color:gray" />
                    </div>
                </div>
            </div>
        </div>
    </div>
        
    <div class="modal fade" id="dialoggrabar" tabindex="-1" role="dialog" aria-labelledby="dialoggrabarLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header justify-content-between">
                    <h5 class="modal-title" id="dialogLoginLabel">Administrador</h5>
                    <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                        <span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close
                    </button>
                </div>
				<div class="modal-body" id="mbody_grabar">
                    Estas seguro de generar el KIT?
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-success" id="btn_pup_grabar" name="btn_pup_grabar" onclick="this.disabled='true';actualizar_grabar();" value="CONFIRMAR" title="Grabar" />                       
                </div>
            </div>
        </div>
    </div>

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
    <script src="../../../vendors/flatpickr/flatpickr.min.js"></script>
    <script src="../../../vendors/lottie/lottie.min.js"></script>
      <script src="../../../vendors/prism/prism.js"></script>
    <script src="../../../assets/js/phoenix.js"></script>

    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/gestordocumental/proceso/jquery.nuevoweb-2.2.3.js"></script>
  </body>

</html>