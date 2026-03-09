<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.MesaPartes.Dashboard.Listado"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>DashBoard</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../../../Template_Finance/css/bootstrap.min.css" />
    <!-- themefy CSS -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/themefy_icon/themify-icons.css" />
    <!-- swiper slider CSS -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/swiper_slider/css/swiper.min.css" />
    <!-- select2 CSS -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/select2/css/select2.min.css" />
    <!-- select2 CSS -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/niceselect/css/nice-select.css" />
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/owl_carousel/css/owl.carousel.css" />
    <!-- gijgo css -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/gijgo/gijgo.min.css" />
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/font_awesome/css/all.min.css" />
    <link rel="stylesheet" href="../../../Template_Finance/vendors/tagsinput/tagsinput.css" />
    <!-- datatable CSS -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/datatable/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="../../../Template_Finance/vendors/datatable/css/responsive.dataTables.min.css" />
    <link rel="stylesheet" href="../../../Template_Finance/vendors/datatable/css/buttons.dataTables.min.css" />
    <!-- text editor css -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/text_editor/summernote-bs4.css" />
    <!-- morris css -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/morris/morris.css">
    <!-- metarial icon css -->
    <link rel="stylesheet" href="../../../Template_Finance/vendors/material_icon/material-icons.css" />

    <!-- style CSS -->
    <link rel="stylesheet" href="../../../Template_Finance/css/style.css" />
    <link rel="stylesheet" href="../../../Template_Finance/css/colors/default.css" id="colorSkinCSS">


    <!-- Google Font: Source Sans Pro -->
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
   <!-- Font Awesome -->
   <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css" />
   <link rel="stylesheet" href="../../../plugins/jquery-ui/jquery-ui.min.css"  />

    <!-- menu css  -->
    <link rel="stylesheet" href="../../../Template_Finance/css/metisMenu.css">

    <link rel="stylesheet" href="../../../plugins/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="../../../plugins/select2/css/select2.min.css" />
    <link rel="stylesheet" href="../../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />

    <link rel="stylesheet" href="../../../dist/css/adminlte.min.css" />

    
</head>
<body class="crm_body_bg">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <input type="hidden" id="hidlocal" name="hidlocal" value="0" runat="server" />
        <input type="hidden" id="hruc" name="hruc" value="" runat="server" />
        <input type="hidden" id="hdashboardopcion" name="hdashboardopcion" value="0" runat="server" />
        <input type="hidden" id="hempresatipo" name="hempresatipo" value="" runat="server" />
        <input type="hidden" id="husuarioacceso" name="husuarioacceso" value="" runat="server" />
        <!-- main content part here -->
 

        <!--/ menu  -->
        <div class="main_content_iner">
            <div class="container-fluid plr_30 body_white_bg pt_30">

                <div class="row">
                    <div class="col-lg-4" style="text-align:left">
                    </div>
                    <div class="col-lg-3" style="text-align:right">
                        <h4><span id="sfecha" class="text-secondary"></span></h4>
                    </div>
                    <div class="col-lg-3" style="text-align:center">
                        
                    </div>
                    <div class="col-lg-2" style="text-align:right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="../../../img/procesar32.png" style="width:20px;height:20px" title="Opciones" />
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#" onclick="loaddatos('1','1');">Hoy</a>
                                <a class="dropdown-item" href="#" onclick="loaddatos('2','1');">Ayer</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" onclick="loaddatos('3','1');">Semana actual</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" onclick="loaddatos('4','1');">Mes actual</a>
                                <a class="dropdown-item" href="#" onclick="loaddatos('5','1');">Mes anterior</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" onclick="loaddatos('6','1');">Año actual</a>
                                <a class="dropdown-item" href="#" onclick="loaddatos('7','1');">Año anterior</a>                        
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" onclick="personalizado('8','1');">Personalizado</a>

                                <%if (this.ViewState["dashboardopcion"].ToString() == "1")
                                { %> 
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" onclick="logout();">Salir</a>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <br />
                </div>

                <div class="row justify-content-center">
                    <h4># RECEPCIONADO <span id="sF1TOTAL_C">0</span></h4>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="single_element">
                            <div class="quick_activity">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="quick_activity_wrap" style="grid-template-columns: repeat(3, 1fr) !important;">

                                            <div class="single_quick_activity">
                                                <h4>PENDIENTE</h4>
                                                <h3><span class="counter" id="sF1RECEPCIONADO_C">0</span> </h3>
                                            </div>

                                            <div class="single_quick_activity">
                                                <h4>DERIVADO</h4>
                                                <h3><span class="counter" id="sF1DERIVADO_C">0</span> </h3>
                                            </div>

                                            <div class="single_quick_activity">
                                                <h4>FINALIZADO</h4>
                                                <h3><span class="counter" id="sF1FINALIZADO_C">0</span> </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <h4># SALIDA <span id="sF2TOTAL_C">0</span></h4>
                </div>

                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="single_element">
                            <div class="quick_activity">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="quick_activity_wrap" style="grid-template-columns: repeat(3, 1fr) !important;">

                                            <div class="single_quick_activity">
                                                <h4>PENDIENTE</h4>
                                                <h3><span class="counter" id="sF2SOLICITUD_C">0</span> </h3>
                                            </div>

                                            <div class="single_quick_activity">
                                                <h4>APROBADO</h4>
                                                <h3><span class="counter" id="sF2ACEPTADO_C">0</span> </h3>
                                            </div>

                                            <div class="single_quick_activity">
                                                <h4>FINALIZADO</h4>
                                                <h3><span class="counter" id="sF2FINALIZADO_C">0</span> </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="dialogdetalle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" style="color:black">Personalizado</h3>
						<button type="button" id="btnclose" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-lg-2 d-flex justify-content-center">
                                <label class="form-label">Del</label>
                            </div>
                            <div class="col-lg-2">
								<input type="text" class="form-control" data-target="#fechainicio" id="dfechainicio" name="dfechainicio" readonly="readonly" />
							</div>
                            <div class="col-lg-2">
                                <input type="time" id="horainicio" name="horainicio" min="00:00" max="23:59" value="00:00" class="form-control" required="required" />
                            </div>
                            <div class="col-lg-2 d-flex justify-content-center">
                                <label class="form-label">Al</label>
                            </div>
							<div class="col-lg-2">
						        <input type="text" class="form-control datetimepicker-input" data-target="#fechafin" id="dfechafin" name="dfechafin" readonly="readonly"/>
							</div>
                            <div class="col-lg-2">
                                <input type="time" id="horafin" name="horafin" min="00:00" max="23:59" value="00:00" class="form-control" required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                    </div>
                   <div class="modal-footer">
                       <input type="button" class="btn btn-secondary" onclick="cancelar();" value="Cancelar" title="Cancelar"    />
                       <input type="button" class="btn btn-success" onclick="buscar();" value="Buscar" title="Buscar"   />
                   </div>
                </div>
            </div>
        </div>

    </form>
    <!-- main content part end -->

    <!-- footer  -->
    <!-- jquery slim -->
    <script src="../../../Template_Finance/js/jquery-3.4.1.min.js"></script>
    <!-- popper js -->
    <script src="../../../Template_Finance/js/popper.min.js"></script>
    <!-- bootstarp js -->
    <script src="../../../Template_Finance/js/bootstrap.min.js"></script>
    <!-- sidebar menu  -->
    <script src="../../../Template_Finance/js/metisMenu.js"></script>
    <!-- waypoints js -->
    <script src="../../../Template_Finance/vendors/count_up/jquery.waypoints.min.js"></script>
    <!-- waypoints js -->
    <script src="../../../Template_Finance/vendors/chartlist/Chart.min.js"></script>
    <!-- counterup js -->
    <script src="../../../Template_Finance/vendors/count_up/jquery.counterup.min.js"></script>
    <!-- swiper slider js -->
    <script src="../../../Template_Finance/vendors/swiper_slider/js/swiper.min.js"></script>
    <!-- nice select -->
    <script src="../../../Template_Finance/vendors/niceselect/js/jquery.nice-select.min.js"></script>
    <!-- owl carousel -->
    <script src="../../../Template_Finance/vendors/owl_carousel/js/owl.carousel.min.js"></script>
    <!-- gijgo css -->
    <script src="../../../Template_Finance/vendors/gijgo/gijgo.min.js"></script>
    <!-- responsive table -->
    <script src="../../../Template_Finance/vendors/datatable/js/jquery.dataTables.min.js"></script>
    <script src="../../../Template_Finance/vendors/datatable/js/dataTables.responsive.min.js"></script>
    <script src="../../../Template_Finance/vendors/datatable/js/dataTables.buttons.min.js"></script>
    <script src="../../../Template_Finance/vendors/datatable/js/buttons.flash.min.js"></script>
    <script src="../../../Template_Finance/vendors/datatable/js/jszip.min.js"></script>
    <script src="../../../Template_Finance/vendors/datatable/js/pdfmake.min.js"></script>
    <script src="../../../Template_Finance/vendors/datatable/js/vfs_fonts.js"></script>
    <script src="../../../Template_Finance/vendors/datatable/js/buttons.html5.min.js"></script>
    <script src="../../../Template_Finance/vendors/datatable/js/buttons.print.min.js"></script>

    <script src="../../../Template_Finance/js/chart.min.js"></script>
    <!-- progressbar js -->
    <script src="../../../Template_Finance/vendors/progressbar/jquery.barfiller.js"></script>
    <!-- tag input -->
    <script src="../../../Template_Finance/vendors/tagsinput/tagsinput.js"></script>
    <!-- text editor js -->
    <script src="../../../Template_Finance/vendors/text_editor/summernote-bs4.js"></script>

    <script src="../../../Template_Finance/vendors/apex_chart/apexcharts.js"></script>

    <!-- custom js -->
    <script src="../../../Template_Finance/js/custom.js"></script>

    <!-- Bootstrap 4 -->
	<script src="../../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../../../plugins/jquery-validation/jquery.validate.min.js"></script>
	<script src="../../../plugins/jquery-validation/additional-methods.min.js"></script>

    <!-- bs-custom-file-input -->
	<script src="../../../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

    <!-- InputMask -->
    <script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../../../plugins/jquery-blockuid/jquery.blockUI.min.js"></script>
    <script src="../../../plugins/moment/moment.min.js"></script>
    <script src="../../../plugins/inputmask/jquery.inputmask.min.js"></script>

    <!-- date-range-picker -->
    <script src="../../../plugins/daterangepicker/daterangepicker.js"></script>
    <script src="../../../plugins/moment/locale/es.js"></script>


    <!-- <?php }?> -->
    <script src="../../../plugins/jquery/mesapartes/dashboard/jquery.listadoweb-1.4.1.js"></script>
</body>
</html>