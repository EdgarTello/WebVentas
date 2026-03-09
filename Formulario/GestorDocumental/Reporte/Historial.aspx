<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Historial.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.GestorDocumental.Reporte.Historial" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Listado</title>
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
        <div class="card shadow-none border mb-3" data-component-card="data-component-card">
             <div class="card-header p-2 border-bottom bg-body">
                 <div class="row g-3 justify-content-between align-items-end mb-1">
                    <div class="col-auto">
                         <h4 class="text-body mb-0">Historial de Eventos</h4>
					    <input type="hidden" name="hid" id="hid" value="0" runat="server"/>
					    <input type="hidden" name="hnombre" id="hnombre" runat="server"/>
					    <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
					    <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("HistorialList") %>" />
				    </div>
				     <div class="col-12 col-sm-auto">
					    <button class="btn btn-phoenix-secondary text-nowrap" type="button" data-bs-toggle="modal" data-bs-target="#searchFilterModal"><span class="fa-solid fa-filter me-md-2"></span><span class="d-none d-md-inline-block">Filtros</span></button>
					    <button id="btnrefrescar" class="btn btn-phoenix-secondary" type="button"><i class="fa-solid fa-refresh me-2"></i></button>
				    </div>
			    </div>
		    </div>
            <div class="card-body p-0">                
                <div class="collapse code-collapse" id="ajax-table-code">
                    <pre class="scrollbar" style="max-height:420px"><code class="language-html"></code></pre>
                </div>
                <div class="p-4 code-to-copy">
                    <div class="table-list" id="advanceAjaxTable">
                        <div class="table-responsive scrollbar mb-3">
                            <table id="tbldetalle" class="table table-sm fs-9 mb-0 overflow-hidden table-hover">
                                <thead class="text-body bg-body-highlight">
                                    <tr>
                                        <th class="white-space-nowrap fs-9 align-middle ps-0" style="max-width:20px; width:18px;">N</th>
                                        <th class="sort text-center align-middle pe-0 ps-4"      scope="col">Archivador</th>
                                        <th class="sort text-center align-middle pe-0 ps-4"      scope="col">Fecha</th>
                                        <th class="sort text-center align-middle pe-0 ps-4"      scope="col">Accion</th>
                                        <th class="sort text-center align-middle pe-0 ps-4"      scope="col">Archivo</th>
                                        <th class="sort text-center align-middle pe-0 ps-4"      scope="col">Pag.</th>
                                    </tr>
                                </thead>
                                <tbody class="list" id="tblbodydetalle"></tbody>
                            </table>
                        </div>
                        <div class="d-flex justify-content-center mt-3"><button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                            <ul class="mb-0 pagination"></ul><button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"> </span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" tabindex="-1" id="searchFilterModal" aria-labelledby="searchFilterModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable modal-fullscreen-md-down">
            <div class="modal-content">
              <div class="modal-header p-4 pb-3 align-items-start border-0">
                <div>
                  <h4 class="mb-2 text-body-highlight" id="searchFilterModalLabel">Filtro</h4>
                </div>
                <button class="btn btn-close fs-10" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body scrollbar px-4 py-1">
                <div class="row g-5">
                  <div class="col-md-12">
                    <div class="row g-0">
                        <div class="col-12">
                            <div class="mb-1">
                                <div class="row g-2">
                                    <div class="form-floating">
                                        <input class="form-control search-input search" type="text" id="documento" />
                                        <label class="form-label" for="documento">Busqueda</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mb-1">
                                <div class="row g-2">
                                    <div class="col-sm-6">
                                        <div class="form-floating flex-1">
                                        <input class="form-control datetimepicker" id="fechainicio" type="text" placeholder="dd/mm/yyyy" data-options='{"disableMobile":true,"defaultDate":"today","dateFormat":"j M, Y"}'/>
                                        <label class="form-label" for="fechainicio">Inicio</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-floating flex-1">
                                        <input class="form-control datetimepicker" id="fechafin" type="text" placeholder="dd/mm/yyyy" data-options='{"disableMobile":true,"defaultDate":"today","dateFormat":"j M, Y"}'/>
                                        <label class="form-label" for="fechafin">Fin</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                          <div class="col-12">
                              <div class="mb-1">
                                  <div class="row g-2">
                                      <div class="form-floating">
                                          <select class="form-select" id="cboevento">
                                                <option value="">[Seleccionar]</option>
								                <option value="Crear">Crear</option>
								                <option value="Consulta">Consulta</option>
								                <option value="Ver">Ver</option>
                                          </select>
                                          <label for="cboevento">Evento</label>
                                      </div>
                                  </div>
                              </div>
                        </div>
                        <div class="col-12">
                            <div class="mb-1">
                                <div class="row g-2">
                                    <div class="form-floating">
                                        <select class="form-select" id="cboarchivador"></select>
                                        <label for="cboarchivador">Archivador</label>
                                    </div>
                                </div>
                            </div>
                      </div>
                      <div class="col-12">
                          <div class="mb-1">
                              <div class="row g-2">
                                  <div class="form-floating">
                                      <select class="form-select" id="cbousuario"></select>
                                      <label for="cbousuario">Usuario</label>
                                  </div>
                              </div>
                          </div>
                    </div>
         
                    </div>
                 </div>                  
                </div>
              </div>
              <div class="modal-footer border-0 p-4 pt-0">
                <div class="w-100 d-flex flex-wrap gap-3 border-top border-translucent pt-4">
                  <button class="m-0 btn btn-lg btn-phoenix-primary text-nowrap" id="btnclear"> <span class="fa-solid fa-rotate me-sm-2"></span><span class="d-none d-sm-inline-block">Limpiar</span></button>
                  <button class="m-0 btn btn-lg btn-primary text-nowrap flex-1" id="btnsearch"> <span class="fa-solid fa-magnifying-glass me-2"></span>Actualizar Resultado</button>
                </div>
              </div>
            </div>
          </div>
        </div>
	    <!-- ./wrapper -->

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
	    <script src="../../../plugins/jquery/gestordocumental/Reporte/jquery.historialweb-2.2.0.js"></script>

    </body>
</html>