<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultWeb.aspx.cs" Inherits="TwoTecnology.WebVentas.DefaultWeb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>ERP - TwoTecnology</title>
	
	<script src="Scripts/jquery-3.1.1.js"></script>
	<script src="Scripts/jquery.validate.min.js"></script>
<%--	<script src="Scripts/jquery.default-1.0.0.js"></script>--%>
	<link href="Content/bootstrap.4.1.3.min.css" rel="stylesheet" />
	<link href="Content/fontawesome.5.3.1.min.css" rel="stylesheet" />
    <link href="defaultstylesv2.css" rel="stylesheet" />
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100" >
			<div class="card">
				<div class="card-header text-center">
					<img src="Img/logo-min_100.png" class="img-responsive" />
					<h3>Iniciar sessión</h3>	
					<h5><asp:Label ID="lblempresa" runat="server"></asp:Label></h5>
				</div>
				<div class="card-body" style="padding: 0.5rem !important;">
					<form id="formdocument" asp-antiforgery="false" runat="server">
						<h5>Perfil</h5>	
						<div class="input-group form-group">
							<asp:DropDownList ID="cboacceso" CssClass="form-control" runat="server" OnSelectedIndexChanged="cboacceso_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
						</div>

						<h5>Usuario</h5>
						<div class="input-group form-group">
							<asp:DropDownList ID="cbousuarios" CssClass="form-control" runat="server"></asp:DropDownList>
						</div>

						<h5>Contraseña</h5>
						<div class="input-group form-group">
							<input type="password" id="Password" name="Password" class="form-control" placeholder="Clave" runat="server" maxlength="20"/>
						</div>


						<div class="form-group" style="text-align:center">
							<asp:Button ID="btnLogin" runat="server" CssClass="btn float login_btn" OnClick="btnLogin_Click" Text="Acceso"  />
						</div>
						
						<asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
							<p class="text-danger">
								<asp:Literal runat="server" ID="FailureText" />
							</p>
							<asp:HiddenField runat="server" ID="hruc" />
						</asp:PlaceHolder> 
					</form>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center">
						<a href="#">¿Olvidaste la contraseña?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
