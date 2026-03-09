<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" validateRequest="true" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Login03.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	<title>ERP - TwoTecnology</title>	
    <meta name="apple-itunes-app" content="app-id=378649517" />
    <meta name="description" content="Nos preocupamos por ti.  En la banca por internet de Interbank encontrarás todo para tus necesidades financieras. ¡Maneja tu dinero de manera segura!" />
	<meta name="robots" content="index, follow"/>
    <meta name="viewport" content="initial-scale=1, minimum-scale=1, shrink-to-fit=no, width=device-width" />

	<meta property="og:type" content="website" />
	<meta property="og:title" content="ERP: un pago rápido - TwoTecnology" />
	<meta property="og:description" content="Nos preocupamos por darle un mejor soporte!" />
	<meta property="og:url" content="http://twotecnology.online/" />
	
	
	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
	<!-- Font Awesome -->
	<link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css" />
	<link rel="stylesheet" href="../../../plugins/jquery-ui/jquery-ui.min.css"  />

	<link rel="stylesheet" href="../../../plugins/select2/css/select2.min.css" />
	<link rel="stylesheet" href="../../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />
	<link rel="stylesheet" href="../../../plugins/toastr/toastr.min.css"  />
	<!-- Theme style -->
	<link rel="stylesheet" href="../../../dist/css/keyboard.css" />
    <link rel="stylesheet" href="../../../dist/css/keyboard-previewkeyset.css" />

	<link rel="stylesheet" href="../../../dist/css/adminlte.min.css" />

    <link rel="shortcut icon" type="image/x-icon" href="../../../favicon.ico" />

    <%if (this.ViewState["licencia"].ToString() == "basico")
    { %>
        <link rel="stylesheet" href="../../../Content/style_custom_v8.2.css" />
    <%}else{%>
        <link rel="stylesheet" href="../../../Content/style_custom_v4.2.css" />
    <%}%>

	<style>
		
		 
	</style>
</head>
<body>
	<form id="formdocument" asp-antiforgery="false" runat="server">
	<asp:ScriptManager runat="server"></asp:ScriptManager>
	
		<%if (this.ViewState["licencia"].ToString() == "basico")
        { %>
            <div class="row">
			    <div class="col-lg-12 text-center" >
				    <h6>Iniciar sessión</h6>	
				    <h4><asp:Label ID="lblempresa2" runat="server"></asp:Label></h4>
				    <h4><asp:Label ID="lbllocal2" runat="server"></asp:Label></h4>
			    </div>
		    </div>
        <%}else{%>
            <div class="row">
			    <div class="col-lg-12 text-center" >
				    <img src="../../../Img/logo-min_100.png" class="img-responsive" />
				    <h5>Iniciar sessión</h5>	
				    <h3><asp:Label ID="lblempresa"  runat="server"></asp:Label></h3>
				    <h3><asp:Label ID="lbllocal" runat="server"></asp:Label></h3>
			    </div>
		    </div>
         <%}%>
		
		<div class="row">
			<div class="col-lg-12 text-center" >
				<div id="divadmin"></div>		
			</div>	
		</div>
		<div class="row">
			<div class="col-lg-12 text-center" >
				<div id="divotros"></div>	
			</div>	
		</div>
		<div class="row">
			<div class="col-lg-12 text-center" >
				<div id="divcajero"></div>	
			</div>	
		</div>
		<div class="row">
			<div class="col-lg-12 text-center" >
				<div id="divjefaturamesero"></div>	
			</div>	
		</div>
		<div class="row">
			<div class="col-lg-12 text-center" >
				<div id="divmesero"></div>	
			</div>	
		</div>
        <div class="row">
			<div class="col-lg-12 text-center" >
				<div id="divvisor"></div>	
			</div>	
		</div>
				
		<div>
			<asp:HiddenField runat="server" ID="hruc" />
			<asp:HiddenField runat="server" ID="hlocal" />
			<asp:HiddenField runat="server" ID="husuario" />
			<asp:HiddenField runat="server" ID="hacceso" />
            <asp:HiddenField runat="server" ID="haccesoservidor" />
			<asp:HiddenField runat="server" ID="hlicenciaservidor" />
			<asp:HiddenField runat="server" ID="hlocalservidor" Value="" />
			<asp:HiddenField runat="server" ID="hloginclave" Value="0" />
            <asp:HiddenField runat="server" ID="hjefemozosession" />
            <asp:HiddenField runat="server" ID="hmovil" Value="0" />
		</div>

		<div class="modal" id="confirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel" style="color:black">Credencial</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p><span id="susuario"></span> Ingrese su credencial?</p>
						<input type="password" id="Password" name="Password" class="form-control" placeholder="Clave" runat="server" maxlength="20" autofocus="autofocus"/>
						<p class="debug-url"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal">Cancelar</button>
						<asp:Button ID="btnLogin" ClientIDMode="Static" runat="server" CssClass="btn btn-success" OnClick="btnLogin_Click" Text="Acceso"  />

						<asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
							<p class="text-danger">
								<asp:Literal runat="server" ID="FailureText" />
							</p>
						
						</asp:PlaceHolder> 
					</div>
				</div>
			</div>
		</div>

        <%if (this.ViewState["licencia"].ToString() == "basico")
        { %>
          <footer class="main-footer" style="margin-left:0px !important">
            <div class="float-right d-none d-sm-block">
              <b>Version</b> 3.1.0
            </div>
            <strong>Copyright &copy; 2020-2021 <a href="https://www.twotecnology.com" target="_blank">Two Tecnology</a>.</strong> All rights reserved.
        </footer>
        <%}%>
        
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

	<script src="../../../dist/js/jquery.keyboard.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-all.js"></script>


    <script src="../../../dist/js/jquery.mousewheel.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-typing.js"></script>
    <script src="../../../dist/js/jquery.keyboard.extension-previewkeyset.js"></script>
    <script src="../../../dist/layouts/keyboard-layouts-greywyvern.min.js"></script>

	<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
    <script src="../../../plugins/jquery/puntoventa/login03/jquery.listadoweb-1.1.6.js"></script>
	
	
	<%--<script src="../../../plugins/jquery-bootstrap-confirm-modal/js/jquery.confirmModal.min.js"></script>--%>
	<!-- AdminLTE App -->
	<script src="../../../dist/js/adminlte.min.js"></script>

    <style>
        .ui-keyboard div {
            font-size: 1.7em;
        }
    </style>
</body>
</html>
