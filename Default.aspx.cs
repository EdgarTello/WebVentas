using Microsoft.Owin.Security.Provider;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Documents;


namespace TwoTecnology.WebVentas
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            //LoginSAML("20604767289", "jasmine.zee@hilti.com", "zeewei@hilti.com", "usuario");

            string ruc = Request.QueryString["ruc"];
            string idlocal = Request.QueryString["local"] ?? "";
            string idlicencia = Request.QueryString["licencia"] ?? "";
            string acceso = Request.QueryString["acceso"] ?? "";
            string empresatipo = ConfigurationManager.AppSettings["empresatipo"] ?? "";
            string _empresaruc = ConfigurationManager.AppSettings["empresaruc"] ?? "";
            string _empresalocal = ConfigurationManager.AppSettings["empresalocal"] ?? "";
            string _samlssohabilitar = ConfigurationManager.AppSettings["samlssohabilitar"] ?? "";
            string _ssoaction = Request.Params["ssoaction"] ?? "";
            string _autogestion = Request.Params["autogestion"] ?? "";


            hruc.Value = _empresaruc;
            hidlocal.Value = _empresalocal;


            if (_samlssohabilitar == "1")
            {
                Repositorio.Empresa obj = new TwoTecnology.Repositorio.Empresa();
                Entity.Empresa empresa = obj.LoadByRucObject(_empresaruc);
                HttpContext.Current.Session["DBVentas"] = empresa.BDVentas;


                hsamlssohabillitar.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(_empresaruc, _empresalocal, "samlssohabillitar").valor;
                hsamlssologin.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(_empresaruc, _empresalocal, "samlssologin").valor;
                hsamlssocertificado.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(_empresaruc, _empresalocal, "samlssocertificado").valor;
                hsamlssourlcliente.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(_empresaruc, _empresalocal, "samlssourlcliente").valor;


                if (hsamlssohabillitar.Value == "1")
                {
                    if (_ssoaction == "")
                    {
                        string samlssourlmain = ConfigurationManager.AppSettings["samlssourlmain"];
                        string samlssourlassertion = ConfigurationManager.AppSettings["samlssourlassertion"];

                        var samlEndpoint = hsamlssourlcliente.Value;

                        var request = new Saml.AuthRequest(
                            samlssourlmain, //TODO: put your app's "entity ID" here
                            samlssourlassertion //TODO: put Assertion Consumer URL (where the provider should redirect users after authenticating)
                        );

                        //now send the user to the SAML provider
                        Response.Redirect(request.GetRedirectUrl(samlEndpoint));
                    }
                }
            }
            else
            {
                #region

                if (empresatipo != string.Empty) {
                    switch (empresatipo)
                    {
                        case "105":
                            Response.Redirect("Formulario/AlmacenTomador/Acceso/Index.aspx");
                            break;

                        default:
                            Response.Redirect(string.Format("Formulario/PuntoVenta/Login04/Listado.aspx"));
                            break;
                    }
                }
                else
                {

                    if (!(string.IsNullOrEmpty(ruc) && string.IsNullOrEmpty(_empresaruc)))
                    {
                        Repositorio.Empresa obj = new TwoTecnology.Repositorio.Empresa();

                        if (ruc == null)
                        {
                            ruc = _empresaruc;
                        }

                        if (ruc == "")
                        {
                            return;
                        }



                        Entity.Empresa empresa = obj.LoadByRucObject(ruc);

                        ////if (Request.Browser.IsMobileDevice == true)
                        ////    Response.Redirect( string.Format( "DefaultMovil.aspx?ruc={0}",ruc));
                        ////else
                        ///


                        DateTime now = DateTime.Now;
                        HttpCookie cookie_ruc = new HttpCookie("ruc_empresa");
                        HttpCookie cookie_local = new HttpCookie("local_empresa");
                        HttpCookie cookie_licencia = new HttpCookie("licencia_empresa");
                        HttpCookie cookie_acceso = new HttpCookie("acceso_empresa");

                        //cookie_ruc.Expires = now.AddYears(-1);
                        Response.Cookies.Add(cookie_ruc);

                        //cookie_local.Expires = now.AddYears(-1);
                        Response.Cookies.Add(cookie_local);

                        //cookie_licencia.Expires = now.AddYears(-1);
                        Response.Cookies.Add(cookie_licencia);

                        //cookie_acceso.Expires = now.AddYears(-1);
                        Response.Cookies.Add(cookie_acceso);

                        /////////////////////////////////////////////////////////-

                        cookie_ruc.Value = ruc;
                        //cookie_ruc.Expires = now.AddYears(50);
                        Response.Cookies.Add(cookie_ruc);


                        cookie_local.Value = idlocal;
                        //cookie_local.Expires = now.AddYears(50);
                        Response.Cookies.Add(cookie_local);

                        cookie_licencia.Value = idlicencia;
                        //cookie_licencia.Expires = now.AddYears(50);
                        Response.Cookies.Add(cookie_licencia);

                        cookie_acceso.Value = acceso;
                        //cookie_acceso.Expires = now.AddYears(50);
                        Response.Cookies.Add(cookie_acceso);

                        HttpContext.Current.Session["DBVentas"] = empresa.BDVentas;

                        if (empresa.RolCodigo == "999")
                        {
                            Response.Redirect(string.Format("Formulario/PuntoVenta/Login04/Listado.aspx?ruc={0}&local={1}&licencia={2}&acceso={3}", ruc, idlocal, idlicencia, acceso));

                        }
                        else
                        {

                            switch (empresa.Tipo)
                            {
                                case "1":
                                    Response.Redirect(string.Format("Formulario/PuntoVenta/Login01/Listado.aspx?ruc={0}&local={1}&licencia={2}&acceso={3}", ruc, idlocal, idlicencia, acceso));
                                    break;

                                case "2":
                                    Response.Redirect(string.Format("Formulario/PuntoVenta/Login02/Listado.aspx?ruc={0}&local={1}&licencia={2}&acceso={3}", ruc, idlocal, idlicencia, acceso));
                                    //Response.Redirect(string.Format("Formulario/General/Login/Index.aspx?ruc={0}", ruc));
                                    break;

                                case "3":
                                    Response.Redirect(string.Format("Formulario/PuntoVenta/Login03/Listado.aspx?ruc={0}&local={1}&licencia={2}&acceso={3}", ruc, idlocal, idlicencia, acceso));
                                    break;

                                case "31":
                                    Response.Redirect(string.Format("Formulario/PuntoVenta/Login03/Listado.aspx?ruc={0}&local={1}&licencia={2}&acceso={3}", ruc, idlocal, idlicencia, acceso));
                                    break;

                                case "32":
                                    Response.Redirect(string.Format("Formulario/PuntoVenta/Login03/Listado.aspx?ruc={0}&local={1}&licencia={2}&acceso={3}", ruc, idlocal, idlicencia, acceso));
                                    break;

                                case "21":
                                    Response.Redirect(string.Format("Formulario/General/Login/Listado.aspx?ruc={0}&local={1}&licencia={2}&acceso={3}", ruc, idlocal, idlicencia, acceso));
                                    break;

                                case "22":
                                    Response.Redirect(string.Format("Formulario/General/Login/Listado.aspx?ruc={0}&local={1}&licencia={2}&acceso={3}", ruc, idlocal, idlicencia, acceso));
                                    break;

                                case "23":
                                    Response.Redirect(string.Format("Formulario/PuntoVenta/Login01/Listado.aspx?ruc={0}&local={1}&licencia={2}&acceso={3}", ruc, idlocal, idlicencia, acceso));
                                    break;

                                case "101"://APP DE DOCUMENTOS
                                    //Response.Redirect("Formulario/GestorDocumental/Acceso/Index.aspx");
                                    if(_empresaruc!="")
                                        Response.Redirect("Formulario/GestorDocumental/Login/Index.aspx");
                                    else
                                        Response.Redirect(string.Format("Formulario/GestorDocumental/Login/Index.aspx?ruc={0}", ruc));
                                    break;

                                case "110"://APP DE DOCUMENTOS
                                    Response.Redirect($"Formulario/General/Login/Index.aspx?ruc={ruc}&local={idlocal}&licencia={idlicencia}&acceso={acceso}");
                                    break;

                                case "102"://APP DE RENDICION DE GASTOS
                                    Response.Redirect("Formulario/Rendicion/Acceso/Index.aspx");
                                    break;

                                case "103"://APP DE FLUJO CVC
                                    Response.Redirect("Formulario/MesaPartes/Acceso/Index.aspx");
                                    break;

                                case "104"://APP DE RECIBO DE LUZ AGUA
                                    Response.Redirect("Formulario/Recibos/Acceso/Index.aspx");
                                    break;

                                case "105"://TOMADOR DE PEDIDO
                                    Response.Redirect("Formulario/AlmacenTomador/Acceso/Index.aspx");
                                    break;

                                case "120"://Proyectos
                                    Response.Redirect(string.Format("Formulario/General/Login/Index.aspx?ruc={0}", ruc));
                                    break;

                                case "501":
                                    //Response.Redirect(string.Format("Formulario/PuntoVenta/Login02/Listado.aspx?ruc={0}&local={1}&licencia={2}&acceso={3}", ruc, idlocal, idlicencia, acceso));

                                    if(_empresaruc!="")
                                        Response.Redirect("Formulario/Corporativo/Login/Index.aspx");
                                    else
                                        Response.Redirect(string.Format("Formulario/Corporativo/Login/Index.aspx?ruc={0}", ruc));
                                    break;
                            }
                        }
                    }
                    else
                    {


                        Response.Redirect(string.Format("Formulario/PuntoVenta/Login04/Listado.aspx"));
                    }

                }
            
                #endregion
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            

            string _samlssohabilitar = ConfigurationManager.AppSettings["samlssohabilitar"] == null ? "" : ConfigurationManager.AppSettings["samlssohabilitar"];
            string _ssoaction = Request.Params["ssoaction"] ?? "";
            string username = string.Empty;
            

            if(hsamlssohabillitar.Value=="1" && _samlssohabilitar=="1")
            {
                

                if (_ssoaction == "acs")
                {   
                    // 1. TODO: specify the certificate that your SAML provider gave you
                    string samlCertificate = hsamlssocertificado.Value;

                    // 2. Let's read the data - SAML providers usually POST it into the "SAMLResponse" var
                    var samlResponse = new Saml.Response(samlCertificate, Request.Form["SAMLResponse"]);

                    // 3. DONE!
                    try
                    {
                        if (samlResponse.IsValid()) //all good?
                        {
                            username = samlResponse.GetNameID();
                            string email = samlResponse.GetEmail().ToLower();
                            string firstname = samlResponse.GetFirstName().ToLower();
                            string lastname = samlResponse.GetLastName().ToLower();

                            StringBuilder sb = new StringBuilder();
                            //sb.AppendLine(string.Format("username:{0}", username));
                            //sb.AppendLine(string.Format("email:{0}", email));
                            //sb.AppendLine(string.Format("firstname:{0}", firstname));
                            //sb.AppendLine(string.Format("lastname:{0}", lastname));
                            sb.AppendLine(string.Format("ruc:{0};email:{1};username:{2};hsamlssologin:{3};", 
                                hruc.Value, email, username, hsamlssologin.Value));

                            TextBox1.Text = sb.ToString();

                            LoginSAML(hruc.Value, email, username, hsamlssologin.Value);
                        }
                    }
                    catch (Exception ex) {
                        FailureText.Text = ex.Message;
                        ErrorMessage.Visible = true;
                    }
                }

                if (_ssoaction == "logout")
                {
                    FormsAuthenticationTicket ticket = null;
                    FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                    ticket = formsIdentity.Ticket;

                    string usuario_codigo = ticket.UserData.Split('|')[4];

                    string samlssourlmain = ConfigurationManager.AppSettings["samlssourlmain"];
                    string samlEndpoint = hsamlssourlcliente.Value;

                    var request = new Saml.SignoutRequest(samlssourlmain, usuario_codigo);
                    Response.Redirect(request.GetRedirectUrl(samlEndpoint));

                }
            }
        }

        private void LoginSAML(string ruc, string email, string username, string tipoautenticacion)
        {

            bool ismobile = false;
            int screenwidth = Request.Browser.ScreenPixelsWidth; //Always returns 640 ?
            bool Authenticated = false;
            string ambiente = ConfigurationManager.AppSettings["ambiente"] ?? "1";

            TextBox1.Text = TextBox1.Text + Environment.NewLine + "Login Paso 1";

            Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();

            if(tipoautenticacion=="correo")
                Authenticated = obj.ValidateClientRucByCorreo(ruc, email);

            if (tipoautenticacion == "usuario")
                Authenticated = obj.ValidateClientRucByUsuario(ruc, username);

            TextBox1.Text = TextBox1.Text + Environment.NewLine + "Login Paso 2";

            string pathdocumento = string.Format(@"{0}\{1}",
                           ConfigurationManager.AppSettings["pathdocumento"] ?? "" ,
                           ConfigurationManager.AppSettings["empresaruc"] ?? "");


            string pathtemporal = string.Format(@"{0}\{1}",
                    ConfigurationManager.AppSettings["pathtemporal"] ?? "",
                    ConfigurationManager.AppSettings["empresaruc"] ?? "");

            string pathdmesapartes = string.Format(@"{0}",
                            ConfigurationManager.AppSettings["pathmesapartes"] ?? "");


            TextBox1.Text = TextBox1.Text + Environment.NewLine + "Login Paso 3";

            if (Authenticated)
            {
                TwoTecnology.BusinessShared.Consulta objconsulta = new TwoTecnology.BusinessShared.Consulta();

                if (!objconsulta.ConsultaEmpresaValidoByRuc(ambiente,ruc))
                {
                    FailureText.Text = "Ruc no habilitado!";
                    ErrorMessage.Visible = true;
                }
                else
                {
                    Entity.Empresa objempresa = objconsulta.ConsultaEmpresaSimpleByRuc(ambiente, ruc);

                    if (objempresa.Bloqueado == "0")
                    {

                        Entity.Usuario usu = null;

                        if (tipoautenticacion == "correo")
                            usu = obj.GetUsuarioByCorreo(ruc, email);

                        if (tipoautenticacion == "usuario")
                            usu = obj.GetUsuarioByUsuario(ruc, username);




                        string monedacaja = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, usu.idlocal.Trim(), "monedacaja").valor;
                        string monedadefault = new TwoTecnology.Repositorio.TipoMoneda().LoadDefault(ruc).id;
                        string urlhost = ConfigurationManager.AppSettings["urlhost"];


                        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                            username, DateTime.Now, DateTime.Now.AddMinutes(60), true,
                            objempresa.Id.Trim() + "|" +
                            objempresa.Ruc.Trim() + "|" +
                            objempresa.Nombre.Trim() + "|" +
                            usu.acceso.Trim() + "|" +
                            usu.codigo.Trim() + "|" +
                            usu.usuario.Trim() + "|" +
                            usu.num_documento.Trim() + "|" +
                            Path.GetFileName(objempresa.Imagen) + "|" +
                            objempresa.HorasBloqueo + "|" +
                            usu.local.Trim() + "|" +
                            usu.idlocal.Trim() + "|" +
                            ((ismobile) ? "1" : "0") + "|" +
                            objempresa.Tipo + "|" +
                            objempresa.Comercial + "|" +
                            usu.mm58 + "|" +
                            usu.mm80 + "|" +
                            usu.a4 + "|" + //16
                            usu.ubigeo + "|" + //17
                            usu.areas + "|" +//18
                            usu.dashboard + "|" + //19
                            objempresa.TelefonoSoporte + "|" + //20
                            objempresa.Pago + "|" +              //21
                            pathdocumento + "|" + //22
                            pathtemporal + "|" +//23
                            monedacaja + "|" + //24
                            monedadefault + "|" + //25
                            objempresa.BDVentas + "|" + //26
                            usu.idcaja + "|" + //27
                            usu.serie + "|" + //28
                            usu.idrol + "|" + //29
                            "|" + //30
                            "|" + //31
                            "|" + //32
                            pathdmesapartes + "|" + //33
                            urlhost + "|" + //34
                            usu.ruta_principal + "|" + //35
                            usu.ruta_documento + "|" + //36
                            usu.idarchivador + "|" +  //37
                            "|" + //37
                            "|" + //38
                            "|" + //39
                            "|",  //40
                            FormsAuthentication.FormsCookiePath);

                        string encryptedCookie = FormsAuthentication.Encrypt(ticket);
                        HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
                        //cookie.Expires = DateTime.Now.AddMinutes(60);
                        Response.Cookies.Add(cookie);
                        //FormsAuthentication.RedirectFromLoginPage(userName, false);


                        DateTime now = DateTime.Now;
                        HttpCookie cookie_ruc = new HttpCookie("ruc_empresa");
                        cookie_ruc.Value = ruc;
                        //cookie_ruc.Expires = now.AddYears(50);
                        Response.Cookies.Add(cookie_ruc);

                        HttpCookie cookie_local = new HttpCookie("local_empresa");
                        cookie_local.Value = usu.idlocal;
                        //cookie_local.Expires = now.AddYears(50);
                        Response.Cookies.Add(cookie_local);

                        HttpCookie cookie_acceso = new HttpCookie("acceso_empresa");
                        cookie_acceso.Value = usu.acceso;
                        //cookie_acceso.Expires = now.AddYears(50);
                        Response.Cookies.Add(cookie_acceso);

                        HttpCookie cookie_usuario = new HttpCookie("usuario_empresa");
                        cookie_usuario.Value = usu.usuario;
                        //cookie_usuario.Expires = now.AddYears(50);
                        Response.Cookies.Add(cookie_usuario);




                        string redirect = string.Empty;

                        if (objempresa.Tipo == "23")
                        {
                            redirect = string.Format("Formulario/PuntoVenta/Menu/Index.aspx{0}",
                                (
                                    (usu.acceso == "Operador" || usu.acceso == "Auditor") ? "?pagina=101" :
                                    ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=102" : "")
                                ));

                        }

                        if (objempresa.Tipo == "501")
                        {
                            redirect="Formulario/Corporativo/Frame/Index.aspx";
                        }

                        Response.Redirect(redirect);

                    }
                    else
                    {
                        FailureText.Text = "La licencia ha caducado!";
                        ErrorMessage.Visible = true;
                    }
                }
            }
            else
            {
                FailureText.Text = "Cuenta o clave inválido!";
                ErrorMessage.Visible = true;
            }
               
        }
            
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string _empresaruc = ConfigurationManager.AppSettings["empresaruc"] == null ? "" : ConfigurationManager.AppSettings["empresaruc"];
            string _empresalocal = ConfigurationManager.AppSettings["empresalocal"] == null ? "" : ConfigurationManager.AppSettings["empresalocal"];
            string _ssoaction = Request.Params["ssoaction"] ?? "";

            hsamlssohabillitar.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(_empresaruc, _empresalocal, "samlssohabillitar").valor;
            hsamlssologin.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(_empresaruc, _empresalocal, "samlssologin").valor;
            hsamlssocertificado.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(_empresaruc, _empresalocal, "samlssocertificado").valor;
            hsamlssourlcliente.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(_empresaruc, _empresalocal, "samlssourlcliente").valor;

            if (hsamlssohabillitar.Value == "1")
            {
                string samlssourlmain = ConfigurationManager.AppSettings["samlssourlmain"];
                string samlssourlassertion = ConfigurationManager.AppSettings["samlssourlassertion"];

                var samlEndpoint = hsamlssourlcliente.Value;

                var request = new Saml.AuthRequest(
                    samlssourlmain, //TODO: put your app's "entity ID" here
                    samlssourlassertion //TODO: put Assertion Consumer URL (where the provider should redirect users after authenticating)
                );

                //now send the user to the SAML provider
                Response.Redirect(request.GetRedirectUrl(samlEndpoint));
            }
        }
    }
}