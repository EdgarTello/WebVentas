<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.GestorDocumental.Documentos.Listado" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Documentos</title>
        <!-- ===============================================-->
        <!--    Favicons-->
        <!-- ===============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="../../../assets/img/favicons/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="../../../assets/img/favicons/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="../../../assets/img/favicons/favicon-16x16.png" />
        <link rel="shortcut icon" type="image/x-icon" href="../../../assets/img/favicons/favicon.ico" />
        <link rel="manifest" href="../../../assets/img/favicons/manifest.json" />
        <meta name="msapplication-TileImage" content="../../../assets/img/favicons/mstile-150x150.png" />
        <meta name="theme-color" content="#ffffff" />
        <script src="../../../vendors/simplebar/simplebar.min.js"></script>
        <script src="../../../assets/js/config.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- ===============================================-->
        <!--    Stylesheets-->
        <!-- ===============================================-->
        <link href="../../../vendors/glightbox/glightbox.min.css" rel="stylesheet" />
        <link href="../../../vendors/flatpickr/flatpickr.min.css" rel="stylesheet" />
        <link href="../../../vendors/nouislider/nouislider.min.css" rel="stylesheet" />
        <link href="../../../vendors/choices/choices.min.css" rel="stylesheet" />
        <link href="../../../vendors/prism/prism-okaidia.css" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet" />
        <link href="../../../vendors/simplebar/simplebar.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css" />
        <link href="../../../assets/css/theme.min.css" type="text/css" rel="stylesheet" />
        <link href="../../../assets/css/user.min.css" type="text/css" rel="stylesheet" />
    </head>
    <body>   
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
                            <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("DocumentosList") %>" />
                        </h2>
                        <div class="accordion-collapse collapse show" id="collapseOne" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body pt-0">
                                <div class="row g-3 justify-content-between align-items-center">
                                    <div class="col-md-4">
                                        <label for="cboarea">Area</label>
                                        <select class="form-select mb-3" aria-label="category" id="cboarea" name="cboarea"></select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="cboarchivador">Archivador</label>
					                    <select class="form-select mb-3" aria-label="category" id="cboarchivador" name="cboarchivador"></select>
                                    </div>
                                    <div class="col-md-4"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="divindices"></div>	
            </div>
            <div class="card-body p-0">
                <div class="collapse code-collapse" id="ajax-table-code">
                    <pre class="scrollbar" style="max-height:420px"><code class="language-html"></code></pre>
                </div>
                <div class="p-4 code-to-copy">
                    <div class="table-list" id="advanceAjaxTable">
                        <div class="table-responsive scrollbar mb-3">
                            <table id="tbldetalle" class="table table-sm fs-9 mb-0 overflow-hidden">
                                <thead class="text-body bg-body-highlight">
                                    <tr>
									    <th class="text-center">N°</th>
									    <th class="text-center">
                                            <div class="btn-reveal-trigger position-static">
                                                <button class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal fs-10" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs-10"></span></button>
                                                <div class="dropdown-menu dropdown-menu-end py-2">
                                                    <a class="dropdown-item" href="#!" onclick="exportpdf();"><span class="text-danger far fa-file-pdf"></span> PDF</a>
                                                    <a class="dropdown-item" href="#!" onclick="exportexcel();"><span class="text-success far fa-file-excel"></span> EXCEL</a>
                                                </div>
                                            </div>
									    </th>
									    <th>ARCHIVO</th>									
									    <th id="indice1" class="cssindice">Indice1</th>
									    <th id="indice2" class="cssindice">Indice2</th>
									    <th id="indice3" class="cssindice">Indice3</th>
									    <th id="indice4" class="cssindice">Indice4</th>
									    <th id="indice5" class="cssindice">Indice5</th>
									    <th id="indice6" class="cssindice">Indice6</th>
									    <th id="indice7" class="cssindice">Indice7</th>
									    <th id="indice8" class="cssindice">Indice8</th>
									    <th id="indice9" class="cssindice">Indice9</th>
									    <th id="indice10" class="cssindice">Indice10</th>
								    </tr>
                                </thead>
                                <tbody class="list"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="modal fade" id="dialogPdf" tabindex="-1" role="dialog" aria-labelledby="dialogPdfLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header justify-content-between">
                    <h5 class="modal-title" id="dialogPdfLabel">Vista PDF</h5>
                    <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close">
                        <span class="fas fa-times fs-10 me-1" data-fa-transform="up-1"></span>Close
                    </button>
                </div>
                <div class="modal-body" id="modalpdf">
                    <%--<object id="pdfViewer" width="100%" height="500px" type="application/pdf"></object>--%>
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
        <script src="../../../vendors/nouislider/nouislider.min.js"></script>
        <script src="../../../vendors/choices/choices.min.js"></script>
        <script src="../../../vendors/prism/prism.js"></script>
        <script src="../../../assets/js/phoenix.js"></script>
        <%--<script src="../../../assets/js/pages/advance-ajax-table.js"></script>--%>

        <script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
        <script src="../../../plugins/jquery/gestordocumental/documentos/jquery.listadoweb-2.2.6.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.10.3/xlsx.full.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/file-saver@2.0.2/dist/FileSaver.min.js"></script>
      </body>
</html>