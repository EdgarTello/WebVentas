<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Mesa03.Listado" %>

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
  <link rel="stylesheet" href="../../../Content/style_custom_v2.2.css" />
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
                    </ul>

                    <!-- Right navbar links -->
                    <ul class="navbar-nav ml-auto">
                      <!-- Navbar Search -->
                       <%if (this.ViewState["empresa_tipo"].ToString() == "3" && this.ViewState["mozoparallevar"].ToString() == "1")
                        { %> 
                        <li class="nav-item">
                            <a id="A29" href="../LlevarPendiente/Nuevo.aspx?pagina=32" class="nav-link" title="Para Lllevar">
                                <i class="nav-icon fas fa-box" title="Para Lllevar"></i>
                            </a>
                        </li>
                      <%}%>
                      
                     
                      <li class="nav-item">
                        <a href="../Contrasena/Listado.aspx?pagina=03" class="nav-link">
                            <i class="fas fa-key"></i>
                        </a>
                      </li> 
                      <li class="nav-item">
                        <%if ( (this.ViewState["acceso"].ToString() == "Mesero" || this.ViewState["acceso"].ToString() == "J.Mozo")
                               && this.ViewState["jefemozosession"].ToString()=="1"
                              )
                        {%> 
                          <a href="../Menu/Salir.aspx" class="nav-link">
                              <i class='fas fa-sign-out-alt'></i>
                          </a>
                         <%} else {%>
                            
                          <asp:LoginStatus ID="LoginStatus1" runat="server" 
                            LogoutAction="Redirect"
                            onclick="$('#dialogLogin').modal('show'); return false;"
                            LogoutText="<span class='nav-link'><i class='fas fa-sign-out-alt'></i></span>" 
                            LogoutPageUrl="~/"  />
                         <%}%>
                      </li> 
                    </ul>
              </nav>
            </section>
            <section class="content">
              
                <div id="accordionExample" class="accordion accordion-flush" style="text-align:center">
                            
                </div>

                <div class="row">
                    <input type="hidden" name="hid" id="hid" value="0" runat="server"/>
                    <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                    <input type="hidden" name="hidcaja" id="hidcaja" runat="server"/>
                    <input type="hidden" name="hcaja" id="hcaja" runat="server"/>
                    <input type="hidden" name="husuario_acceso" id="husuario_acceso" runat="server"/>
                    <input type="hidden" name="husuario_nombre" id="husuario_nombre" runat="server"/>
                    <input type="hidden" name="hserie" id="hserie" runat="server"/>
                    <input type="hidden" name="hempleado" id="hempleado" runat="server"/>
                    <input type="hidden" name="hidalmacen" id="hidalmacen" runat="server"/>
                    <input type="hidden" name="hstock" id="hstock" runat="server"/>
                    <input type="hidden" name="hidubicacion" id="hidubicacion" runat="server"/>
                    <input type="hidden" name="hubicaciones" id="hubicaciones" runat="server"/>
                    <input type="hidden" name="hpagina" id="hpagina" runat="server"/>
                    <input type="hidden" name="htipo" id="htipo" runat="server"/>
                    <input type="hidden" name="hvalido" id="hvalido" runat="server"/>
                    <input type="hidden" name="hjefemozosession" id="hjefemozosession" runat="server"/>
                    <input type="hidden" name="hmobile" id="hmobile" runat="server" />

                    <input type="hidden" name="xidubicacion" id="xidubicacion" runat="server" />
                    <input type="hidden" name="xidpedido" id="xidpedido" runat="server" />
                    <input type="hidden" name="xacceso" id="xacceso" runat="server" />
                    <input type="hidden" name="xempleado" id="xempleado" runat="server" />
                    <input type="hidden" name="xusaalias" id="xusaalias" runat="server" />
                </div>
            </section>
        </div>

        <div class="modal fade" id="dialogLogin" tabindex="-1" role="dialog" aria-labelledby="dialogLoginLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="dialogLoginLabel">Administrador</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    Esta seguro de salir del aplicativo? 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-danger" id="btncontinuar" onclick="logout()">Salir</button>
                </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="dialogSession" tabindex="-1" role="dialog" aria-labelledby="dialogSessionLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="dialogSessionLabel">Administrador</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    Esta seguro de brindar acceso directo a los Mozos? 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="cancelar()">Cancelar</button>
                    <button type="button" class="btn btn-success" onclick="acceso()">Confirmar</button>
                </div>
                </div>
            </div>
        </div>    
        
        <div class="modal" id="dialog_nombre" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
	                <div class="modal-content">
		                <div class="modal-header">
			                <h3 class="modal-title" style="color:black">Punto de Venta</h3>
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                </div>
		                <div class="modal-body">
			                <div class="row p-3">
				                <div class="col">
					                <input id="nombre" name="nombre" maxlength="20" class="form-control input-normal"  placeholder="Nombre" onkeypress="return isAlphanumericKey(event);"/>
				                </div>					        
			                </div>
                         <div class="row p-3">
                             <span class="text-danger" id="mensaje"></span>
                         </div>
		                </div>
	                    <div class="modal-footer">
		                   <input type="button" id="btnactualizar_nombre" class="btn btn-success" onclick="this.disabled='true';actualizar_nombre();" value="Generar" title="Agregar Nombre"/>
	                   </div>
	                </div>
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
<script src="../../../plugins/jquery/puntoventa/mesa03/jquery.listadoweb-3.0.2.js"></script>
<script src="../../../Scripts/jquery.table2excel.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>

</body>
</html>

