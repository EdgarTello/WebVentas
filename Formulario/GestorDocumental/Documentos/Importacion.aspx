<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Importacion.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.GestorDocumental.Documentos.Importacion" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Documentos</title>
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
    <form id="formulario" name="formulario" runat="server" >
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="card shadow-none border mb-3" data-component-card="data-component-card">
            <div class="card-header p-2 border-bottom bg-body">
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item border-top">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                Filtro de Areas y Archivador                                
                            </button>
                            <input type="hidden" name="hid" id="hid" value="0" runat="server"/>
                            <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                            <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("ImportNew") %>" />
                        </h2>
                        <div class="accordion-collapse collapse show" id="collapseOne" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body pt-0">
                                <div class="row g-3 justify-content-between align-items-center">
                                    <div class="col-md-3">
                                        <label for="cboarea">Area</label>
                                        <select class="form-select mb-3" aria-label="category" id="cboarea" name="cboarea"></select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="cboarchivador">Archivador</label>
			                            <select class="form-select mb-3" aria-label="category" id="cboarchivador" name="cboarchivador"></select>
                                    </div>
                                    <div class="col-md-3">
                                        <div id="divarchivo" style="visibility:hidden" class="form-group">
                                            <input type="file" name="fileimagen" id="fileimagen" class="custom-file-inputc" runat="server" accept=".pdf" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="d-flex flex-row justify-content-end p-1">
										    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                                
                                                <div class="btn-group mr-2" role="group" aria-label="Second group">
												    <button type="button" class="btn btn-success" id="btngrabar" title="Grabar">
													    <i class="fas fa-save"></i> Grabar
												    </button>
											    </div>
                                                <div class="btn-group mr-2" role="group" aria-label="First group">
                                                    <button type="button" class="btn btn-primary" id="btnnuevo" title="Nuevo">
				                                        <i class="fas fa-file"></i>
                                                    </button>
                                                </div>
										    </div>
									    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="divindices"></div>	
            </div>
        </div>
    </form>
    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <!-- jQuery -->
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
    <script src="../../../vendors/flatpickr/flatpickr.min.js"></script>
    <script src="../../../vendors/lottie/lottie.min.js"></script>
    <script src="../../../vendors/popper/popper.min.js"></script>
    <script src="../../../vendors/prism/prism.js"></script>
    <script src="../../../assets/js/phoenix.js"></script>
    <%--<script src="../../../assets/js/pages/advance-ajax-table.js"></script>--%>

    <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/gestordocumental/documentos/jquery.importacionweb-2.2.5.js"></script>

</body>
</html>