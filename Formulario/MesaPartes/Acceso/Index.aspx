<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.MesaPartes.Acceso.Index" %>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
       <meta name="viewport" content="width=device-width, initial-scale=1" />
      <title>Sistema de Gestión</title>
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
      <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css">
      <link rel="stylesheet" href="../../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
      <link rel="stylesheet" href="../../../dist/css/adminlte.min.css?v=3.2.0">
      <%--<script nonce="52f88652-38e5-4d2e-be4e-6d5bea784e72">(function (w, d) { !function (j, k, l, m) { j[l] = j[l] || {}; j[l].executed = []; j.zaraz = { deferred: [], listeners: [] }; j.zaraz.q = []; j.zaraz._f = function (n) { return async function () { var o = Array.prototype.slice.call(arguments); j.zaraz.q.push({ m: n, a: o }) } }; for (const p of ["track", "set", "debug"]) j.zaraz[p] = j.zaraz._f(p); j.zaraz.init = () => { var q = k.getElementsByTagName(m)[0], r = k.createElement(m), s = k.getElementsByTagName("title")[0]; s && (j[l].t = k.getElementsByTagName("title")[0].text); j[l].x = Math.random(); j[l].w = j.screen.width; j[l].h = j.screen.height; j[l].j = j.innerHeight; j[l].e = j.innerWidth; j[l].l = j.location.href; j[l].r = k.referrer; j[l].k = j.screen.colorDepth; j[l].n = k.characterSet; j[l].o = (new Date).getTimezoneOffset(); if (j.dataLayer) for (const w of Object.entries(Object.entries(dataLayer).reduce(((x, y) => ({ ...x[1], ...y[1] })), {}))) zaraz.set(w[0], w[1], { scope: "page" }); j[l].q = []; for (; j.zaraz.q.length;) { const z = j.zaraz.q.shift(); j[l].q.push(z) } r.defer = !0; for (const A of [localStorage, sessionStorage]) Object.keys(A || {}).filter((C => C.startsWith("_zaraz_"))).forEach((B => { try { j[l]["z_" + B.slice(7)] = JSON.parse(A.getItem(B)) } catch { j[l]["z_" + B.slice(7)] = A.getItem(B) } })); r.referrerPolicy = "origin"; r.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(j[l]))); q.parentNode.insertBefore(r, q) };["complete", "interactive"].includes(k.readyState) ? zaraz.init() : j.addEventListener("DOMContentLoaded", zaraz.init) }(w, d, "zarazData", "script"); })(window, document);</script>--%>
      
   </head>
   <body class="hold-transition login-page">
      <form id="formdocument" asp-antiforgery="false" runat="server">
	    <asp:ScriptManager runat="server"></asp:ScriptManager>

        <asp:HiddenField runat="server" ID="hruc" />
		<asp:HiddenField runat="server" ID="hlocal" />
		<asp:HiddenField runat="server" ID="hacceso" />
        <asp:HiddenField runat="server" ID="haccesoservidor" />
		<asp:HiddenField runat="server" ID="hlicenciaservidor" />
		<asp:HiddenField runat="server" ID="hlocalservidor" />
        <asp:HiddenField runat="server" ID="hjefemozosession" />
        <asp:HiddenField runat="server" ID="hmovil" Value="0" />
	    

          <div class="container py-4 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
              <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                  <div class="row g-0">
                    <div class="col-md-6 col-lg-5 d-none d-md-block">
                      <img src="../../../img/empresa/<%=this.ViewState["empresacodigo"].ToString()%>-fondo.png"
                        alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                    </div>
                    <div class="col-md-6 col-lg-7 d-flex align-items-center">
                      <div class="card-body p-4 p-lg-5 text-black">

                          <a href="#" class="d-flex justify-content-center mb-4">
                            <img src="../../../img/empresa/<%=this.ViewState["empresacodigo"].ToString()%>.png" alt="" width="160" />
                          </a>

                          <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Bienvenido</h5>
                          
                          <div data-mdb-input-init class="form-outline mb-4">
                            <input type="text" id="husuario" class="form-control form-control-lg" runat="server" maxlength="40" />
                            <label class="form-label" for="husuario">Usuario</label>
                          </div>

                          <div data-mdb-input-init class="form-outline mb-4">
                            <input type="password" id="hpassword" class="form-control form-control-lg"  runat="server" maxlength="20"/>
                            <label class="form-label" for="hpassword">Password</label>
                          </div>

                          <div class="pt-1 mb-4">
                            <%--<button data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg btn-block" type="button">Ingresar</button>--%>
                            <asp:Button ID="btnLogin" ClientIDMode="Static" runat="server" CssClass="btn btn-dark btn-block" OnClick="btnLogin_Click" Text="Ingresar"  />
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

                          <p class="mb-5 pb-lg-2" style="color: #393f81;"><a href="Recovery.aspx" style="color: #393f81;">Olvidaste tu contraseña?</a></p>

                          <a href="#!" class="small text-muted">Terms of use.</a>
                          <a href="#!" class="small text-muted">Privacy policy</a>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        
     </form>
     <script src="../../../plugins/jquery/jquery.min.js"></script>
     <script src="../../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
     <script src="../../../dist/js/adminlte.min.js?v=3.2.0"></script>
   </body>
</html>