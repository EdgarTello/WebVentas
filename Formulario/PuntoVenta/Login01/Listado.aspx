<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Login01.Listado" %>

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
	<link rel="stylesheet" href="../../../Content/keyboard.css"/>
	<link rel="stylesheet" href="../../../dist/css/adminlte.min.css" />

	
	<link rel="shortcut icon" type="image/x-icon" href="../../../favicon.ico" />

    <%if (this.ViewState["licencia"].ToString() == "basico")
    { %>
        <link rel="stylesheet" href="../../../Content/style_default_v8.2.css" />
    <%}else{%>
        <link rel="stylesheet" href="../../../Content/style_default_v4.2.css" />
    <%}%>
</head>
<body>
	<form id="formdocument" asp-antiforgery="false" runat="server">
		<asp:ScriptManager runat="server"></asp:ScriptManager>

		<div class="container">
			<div class="d-flex justify-content-center h-100" >
				<div class="card">

                    <%if (this.ViewState["licencia"].ToString() == "basico")
                    { %>
                        <div class="card-header text-center">
						<h4><asp:Label ID="lblempresa2" runat="server"></asp:Label></h4>				
					</div>
                    <%}else{%>
                        <div class="card-header text-center">
						<img src="../../../Img/Empresa/<%=this.ViewState["empresa_codigo"].ToString()%>.jpeg" class="img-responsive" />	
					</div>
                     <%}%>

					

					<div class="card-body">
						
						<h5>Perfil</h5>	
						<div class="input-group form-group">
							<asp:DropDownList ID="cboacceso" CssClass="form-control" runat="server"></asp:DropDownList>
						</div>

						<h5>Usuario</h5>
						<div class="input-group form-group">
							<input type="text" id="txtusuario" name="txtusuario" class="form-control" placeholder="Usuario" runat="server" maxlength="20"/>
						</div>

						<h5>Contraseña</h5>
						<div class="input-group form-group">
							<input type="password" id="Password" name="Password" class="form-control" placeholder="Clave" runat="server" maxlength="20"/>
						</div>

						<div class="form-group" style="text-align:center">
							<asp:Button ID="btnLogin" ClientIDMode="Static" runat="server" CssClass="btn float login_btn" OnClick="btnLogin_Click" Text="Acceso"  />
						</div>
						
						<asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
							<p class="text-danger">
								<asp:Literal runat="server" ID="FailureText" />
							</p>
							<asp:HiddenField runat="server" ID="hruc" />
							<asp:HiddenField runat="server" ID="hlocal" />
							<asp:HiddenField runat="server" ID="hautogestion" />
						</asp:PlaceHolder> 
					</div>
					<div class="card-footer">
						<div class="d-flex justify-content-center">
							<a href="#">¿Olvidaste la contraseña?</a>
						</div>
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
    <!-- jQuery -->
	<script src="../../../plugins/jquery/jquery.min.js"></script>
	<script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="../../../plugins/jquery-blockuid/jquery.blockUI.min.js"></script>

	<!-- Bootstrap 4 -->
	<script src="../../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../../../plugins/jquery-validation/jquery.validate.min.js"></script>
	<script src="../../../plugins/jquery-validation/additional-methods.min.js"></script>
	
	<!-- bs-custom-file-input -->
	<script src="../../../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- InputMask -->
	<script src="../../../plugins/moment/moment.min.js"></script>
	<script src="../../../plugins/inputmask/jquery.inputmask.min.js"></script>
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
    <script src="../../../plugins/jquery/puntoventa/login01/jquery.listadoweb-1.0.6.js"></script>

</body>
</html>
