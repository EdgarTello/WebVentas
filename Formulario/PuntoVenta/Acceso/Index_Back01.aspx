<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index_Back01.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Acceso.Index_Back01" %>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Sistema de Gestión de Documentos | Log in</title>
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
      <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css">
      <link rel="stylesheet" href="../../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
      <link rel="stylesheet" href="../../../dist/css/adminlte.min.css?v=3.2.0">
      <script nonce="52f88652-38e5-4d2e-be4e-6d5bea784e72">(function (w, d) { !function (j, k, l, m) { j[l] = j[l] || {}; j[l].executed = []; j.zaraz = { deferred: [], listeners: [] }; j.zaraz.q = []; j.zaraz._f = function (n) { return async function () { var o = Array.prototype.slice.call(arguments); j.zaraz.q.push({ m: n, a: o }) } }; for (const p of ["track", "set", "debug"]) j.zaraz[p] = j.zaraz._f(p); j.zaraz.init = () => { var q = k.getElementsByTagName(m)[0], r = k.createElement(m), s = k.getElementsByTagName("title")[0]; s && (j[l].t = k.getElementsByTagName("title")[0].text); j[l].x = Math.random(); j[l].w = j.screen.width; j[l].h = j.screen.height; j[l].j = j.innerHeight; j[l].e = j.innerWidth; j[l].l = j.location.href; j[l].r = k.referrer; j[l].k = j.screen.colorDepth; j[l].n = k.characterSet; j[l].o = (new Date).getTimezoneOffset(); if (j.dataLayer) for (const w of Object.entries(Object.entries(dataLayer).reduce(((x, y) => ({ ...x[1], ...y[1] })), {}))) zaraz.set(w[0], w[1], { scope: "page" }); j[l].q = []; for (; j.zaraz.q.length;) { const z = j.zaraz.q.shift(); j[l].q.push(z) } r.defer = !0; for (const A of [localStorage, sessionStorage]) Object.keys(A || {}).filter((C => C.startsWith("_zaraz_"))).forEach((B => { try { j[l]["z_" + B.slice(7)] = JSON.parse(A.getItem(B)) } catch { j[l]["z_" + B.slice(7)] = A.getItem(B) } })); r.referrerPolicy = "origin"; r.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(j[l]))); q.parentNode.insertBefore(r, q) };["complete", "interactive"].includes(k.readyState) ? zaraz.init() : j.addEventListener("DOMContentLoaded", zaraz.init) }(w, d, "zarazData", "script"); })(window, document);</script>
       <style>
        @import url('https://fonts.googleapis.com/css?family=Bitter|Crete+Round|Pacifico');
         .auto-style1 {
             margin-left: 75px;
         }
         .auto-style2 {
             width: 100%;
         }
         .auto-style4 {
             width: 267px;
         }
         .auto-style5 {
             width: 440px;
         }
    </style>
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
            <img src="../../../Img/empresa/<%=this.ViewState["empresacodigo"].ToString()%>.png" class="img-thumbnail" style="width:300px;height:140px"/>
        </div>

  
         <div class="card">
            <div class="card-body login-card-body" style="background-color:#0b1f4d">
               
                  <div class="input-group mb-3">
                     <input type="text" id="husuario"  name="husuario" class="form-control" runat="server" placeholder="Usuario" maxlength="20" />
                     <div class="input-group-append">
                        <div class="input-group-text">
                           <span class="fas fa-user"></span>
                        </div>
                     </div>
                  </div>
                  <div class="input-group mb-3">
                     <input type="password" id="Password" name="Password" class="form-control" placeholder="Clave" runat="server" maxlength="20" autofocus="autofocus"/>
                     <div class="input-group-append">
                        <div class="input-group-text">
                           <span class="fas fa-lock"></span>
                        </div>
                     </div>
                  </div>
                 <div class="row" style="text-align:center">
                     <div class="col align-self-center">
                        <asp:Image ID="Image2" runat="server" Height="55px" ImageUrl="Captcha.aspx" Width="186px" />
                     </div>
                 </div>
                 <div class="row">
                    <br />
                  </div>
                 <div class="row" style="text-align:center">
                     <div class="col align-self-center">
                        <asp:TextBox runat="server" ID="txtVerificationCode" placeholder="Ingresar captcha"></asp:TextBox>
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
                           <input type="checkbox" id="remember">
                           <label for="remember" style="color:white">
                           Acuérdate de mí
                           </label>
                        </div>
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnLogin" ClientIDMode="Static" runat="server" CssClass="btn btn-warning btn-block" OnClick="btnLogin_Click" Text="Acceder"  />
                     </div>
                  </div>
               
           
               <p class="mb-0">
                  <a href="forgot-password.html" style="color:white">Olvidé mi contraseña</a>
               </p>
            </div>
         </div>
      </div>
    </form>
    <script src="../../../plugins/jquery/jquery.min.js"></script>
    <script src="../../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../../dist/js/adminlte.min.js?v=3.2.0"></script>
   </body>
</html>