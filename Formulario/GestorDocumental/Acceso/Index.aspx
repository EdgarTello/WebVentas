<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.GestorDocumental.Acceso.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	<title>Sistema de Gestión de Documentos | Log in</title>
    <meta name="apple-itunes-app" content="app-id=378649517" />
    <meta name="description" content="Nos preocupamos por ti.  En la banca por internet de Interbank encontrarás todo para tus necesidades financieras. ¡Maneja tu dinero de manera segura!" />
	<meta name="robots" content="index, follow"/>
    <meta name="viewport" content="initial-scale=1, minimum-scale=1, shrink-to-fit=no, width=device-width" />

	<meta property="og:type" content="website" />
	<meta property="og:title" content="ERP: un pago rápido - TwoTecnology" />
	<meta property="og:description" content="Nos preocupamos por darle un mejor soporte!" />
	<meta property="og:url" content="http://twotecnology.online/" />
      
    <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css" />
    <link rel="stylesheet" href="../../../plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <link rel="stylesheet" href="../../../dist/css/adminlte.min.css?v=3.2.0" />

    <link rel="shortcut icon" type="image/x-icon" href="../../../favicon.ico" />
</head>
<body class="hold-transition login-page">
    <form id="formdocument" asp-antiforgery="false" runat="server">
	    <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div>
	    <asp:HiddenField runat="server" ID="hruc" />
	    <asp:HiddenField runat="server" ID="hlocal" />
	    <asp:HiddenField runat="server" ID="hacceso" />
        <asp:HiddenField runat="server" ID="haccesoservidor" />
	    <asp:HiddenField runat="server" ID="hlicenciaservidor" />
	    <asp:HiddenField runat="server" ID="hlocalservidor" />
        <asp:HiddenField runat="server" ID="hjefemozosession" />
        <asp:HiddenField runat="server" ID="hmovil" Value="0" />
	    </div>
        <div class="login-box">

        <div class="login-logo">
            <img src="../../../img/empresa/<%=this.ViewState["empresacodigo"].ToString()%>.png" class="img-thumbnail" 
                style="width:300px;height:140px"/>
        </div>

  
            <div class="card">
            <div class="card-body login-card-body">
               
                    <div class="input-group mb-3">
                        <input type="text" id="husuario"  name="husuario" class="form-control" runat="server" placeholder="Usuario" maxlength="40"  autofocus="autofocus"/>
                        <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" id="Password" name="Password" autocomplete="off" class="form-control" placeholder="Clave" runat="server" maxlength="20" />
                        <div class="input-group-append">
                        <div class="input-group-text">
                            <i id="togglePassword1" onclick="togglePass();" class="icon fa fa-eye"></i>
                            <i id="togglePassword2" onclick="togglePass();" class="icon fa fa-eye-slash" style="display:none"></i>
                        </div>
                        </div>
                    </div>
               
                    <div class="row">
                        <div class="col align-self-center">
                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
						    <p class="text-danger">
							    <asp:Literal runat="server" ID="FailureText" />
						    </p>
					    </asp:PlaceHolder> 
                        </div>
                    </div>
                    <div class="row">
                    <br />
                    </div>
                
                    <div class="row">
                        <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="remember" runat="server" />
                            <label for="remember">
                            Acuérdate de mí
                            </label>
                        </div>
                        </div>
                        <div class="col-4">
                        <asp:Button ID="btnLogin" ClientIDMode="Static" runat="server" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" Text="Acceder"  />
                        </div>
                    </div>
               
           
                <p class="mb-1">
                    <a href="Recovery.aspx">Olvidé mi contraseña</a>
                </p>
            </div>
            </div>
        </div>
    </form>

    <script src="../../../plugins/jquery/jquery.min.js"></script>
    <script src="../../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../../dist/js/adminlte.min.js?v=3.2.0"></script>
    <script type="text/javascript">
        function togglePass() {

            var x = $('#Password');         // Input
            var s = $('#togglePassword1');  // Show pass
            var h = $('#togglePassword2');  // Hide pass

            if (x.attr('type') == "password") {
                x.attr('type', 'text');
                s.css("display", "none");
                h.css("display", "inline");
            } else {
                x.attr('type', 'password');
                s.css("display", "inline");
                h.css("display", "none");
            }
        }
    </script>
   </body>
</html>