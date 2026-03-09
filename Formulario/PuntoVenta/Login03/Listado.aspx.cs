using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Login03
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {

            if (Session["jefemozosession"] != null)
            {
                if (Session["jefemozosession"] == "1")
                {
                    hjefemozosession.Value = "1";
                }
            }

            if (!string.IsNullOrEmpty(Request.QueryString["acceso"]))
                haccesoservidor.Value = Request.QueryString["acceso"];


            if (!string.IsNullOrEmpty(Request.QueryString["local"]))
                hlocalservidor.Value = Request.QueryString["local"];

            if (!string.IsNullOrEmpty(Request.QueryString["licencia"]))
            {
                hlicenciaservidor.Value = Request.QueryString["licencia"];
                ViewState["licencia"] = Request.QueryString["licencia"];
            }
            else
            {
                ViewState["licencia"] = "";
            }

            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["ruc"]))
                {
                    hruc.Value = Request.QueryString["ruc"];
                    lblempresa.Text = string.Format("   {0}", new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).Nombre);
                    lblempresa2.Text = string.Format("   {0}", new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).Nombre);
                }
                else
                {
                    if (Request.Cookies["ruc_empresa"] != null)
                    {
                        hruc.Value = Request.Cookies["ruc_empresa"].Value;
                        lblempresa.Text = string.Format(" {0}", new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).Nombre);
                        lblempresa2.Text = string.Format(" {0}", new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).Nombre);
                    }
                }

                if (Request.QueryString["local"] != null)
                {
                    hlocal.Value = Request.QueryString["local"];

                    if (hlocal.Value != "")
                    {
                        lbllocal.Text = string.Format("{0}", new TwoTecnology.Repositorio.Local().LoadObjectByCodigo(hruc.Value, hlocal.Value).nombre);
                        lbllocal2.Text = string.Format("{0}", new TwoTecnology.Repositorio.Local().LoadObjectByCodigo(hruc.Value, hlocal.Value).nombre);
                    }
                }
                else
                {
                    if (Request.Cookies["local_empresa"] != null)
                    {
                        hlocal.Value = Request.Cookies["local_empresa"].Value;
                        lbllocal.Text = string.Format("{0}", new TwoTecnology.Repositorio.Local().LoadObjectByCodigo(hruc.Value, hlocal.Value).nombre);
                        lbllocal2.Text = string.Format("{0}", new TwoTecnology.Repositorio.Local().LoadObjectByCodigo(hruc.Value, hlocal.Value).nombre);
                    }
                }

                if (Request.QueryString["movil"] != null)
                {
                    hmovil.Value = Request.QueryString["movil"];
                }

                if (!string.IsNullOrEmpty(hlocalservidor.Value))
                {
                    hloginclave.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(hruc.Value, hlocal.Value, "loginclave").valor;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string ismobile = hmovil.Value;
            bool bsession = false;
            string userName = husuario.Value;
            string password = Password.Value;
            string ambiente = ConfigurationManager.AppSettings["ambiente"] ?? "0";
            //int screenwidth = Request.Browser.ScreenPixelsWidth; //Always returns 640 ?
            //if (Request.Browser.IsMobileDevice == true) { ismobile = true; } //Doesn't detect mobile device ?

            if (Session["jefemozosession"] != null)
            {
                if (Session["jefemozosession"] == "1")
                {
                    bsession = true;
                }
            }

            if (userName.IsInyection() || password.IsInyection())
            {
                FailureText.Text = "Inyecction Code Detected!";
                ErrorMessage.Visible = true;
            }
            else
            {

                if (IsValid)
                {
                    if (Password.Value.Length > 3 || bsession)
                    {
                        string userAcceso = hacceso.Value;                        
                        string userRuc = hruc.Value;
                        string local = hlocal.Value;
                        bool Authenticated = false;
                        string userNameCompuesto = string.Empty;

                        string pathdocumento = string.Format(@"{0}\{1}",
                                ConfigurationManager.AppSettings["pathdocumento"],
                                ConfigurationManager.AppSettings["empresaruc"]);


                        string pathtemporal = string.Format(@"{0}\{1}",
                                ConfigurationManager.AppSettings["pathtemporal"],
                                ConfigurationManager.AppSettings["empresaruc"]);


                        TwoTecnology.BusinessShared.Consulta objconsulta = new TwoTecnology.BusinessShared.Consulta();
                        Entity.Empresa objempresa = objconsulta.ConsultaEmpresaSimpleByRuc(ambiente, userRuc);
                        HttpContext.Current.Session["DBVentas"] = objempresa.BDVentas;

                        Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();

                        if (hloginclave.Value == "1" && userName == "")
                        {
                            userName = obj.ValidatClientRucWithPassword(userRuc, local, password);

                            if (!string.IsNullOrEmpty(userName))
                            {
                                Authenticated = true;
                            }
                        }
                        else
                        {
                            if (!bsession)
                            {

                                Authenticated = obj.ValidateClientRuc(userRuc, userName, password);
                            }
                        }


                        if (Authenticated || bsession)
                        {
                            if (!objconsulta.ConsultaEmpresaValidoByRuc(ambiente, userRuc))
                            {
                                FailureText.Text = "Ruc no habilitado!";
                                ErrorMessage.Visible = true;
                            }
                            else
                            {
                                if (objempresa.Bloqueado == "0")
                                {

                                    Entity.Usuario usu = obj.GetUsuario(userRuc, userName);

                                    if (usu.horariotrabajo != "0")
                                    {
                                        bool blnhorario = obj.GetUsuarioHorarioAsignado(userRuc, usu.horariotrabajo);

                                        if (!blnhorario)
                                        {
                                            FailureText.Text = "Fuera de horario!";
                                            ErrorMessage.Visible = true;
                                            return;
                                        }
                                    }


                                    string monedacaja = new TwoTecnology.Repositorio.Configuracion().LoadObject(userRuc, usu.idlocal.Trim(), "monedacaja").valor;
                                    string monedadefault = new TwoTecnology.Repositorio.TipoMoneda().LoadDefault(userRuc).id;


                                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                                        userName, DateTime.Now, DateTime.Now.AddMinutes(60), true,
                                        objempresa.Id.Trim() + "|" + //0
                                        objempresa.Ruc.Trim() + "|" + //1
                                        objempresa.Nombre.Trim() + "|" + //2
                                        usu.acceso.Trim() + "|" + //3
                                        usu.codigo.Trim() + "|" + //4
                                        usu.usuario.Trim() + "|" + //5
                                        usu.num_documento.Trim() + "|" + //6
                                        Path.GetFileName(objempresa.Imagen) + "|" + //7
                                        objempresa.HorasBloqueo + "|" + //8
                                        usu.local.Trim() + "|" + //9
                                        usu.idlocal.Trim() + "|" +//10
                                        ismobile + "|" +//11
                                        objempresa.Tipo + "|" +//12
                                        objempresa.Comercial + "|" +//13
                                        usu.mm58 + "|" + //14
                                        usu.mm80 + "|" + //15
                                        usu.a4 + "|" + //16
                                        usu.ubigeo + "|" + //17
                                        usu.areas + "|" +//18
                                        usu.dashboard + "|" +  //19
                                        objempresa.TelefonoSoporte + "|" + //20
                                        objempresa.Pago + "|" +//21
                                        pathdocumento + "|" + //22
                                        pathtemporal + "|" +//23
                                        monedacaja + "|" + //24
                                        monedadefault + "|" + //25
                                        objempresa.BDVentas + "|" + //26 
                                        usu.idcaja + "|" + //27
                                        usu.serie + "|" +//28
                                        "|" + //29
                                        "|" + //30
                                        "|" + //31
                                        "|" + //32
                                        "|" + //33
                                        "|" + //34
                                        "|" + //35
                                        "|" + //36
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
                                    cookie_ruc.Value = userRuc;
                                    //cookie_ruc.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_ruc);

                                    HttpCookie cookie_local = new HttpCookie("local_empresa");
                                    cookie_local.Value = hlocalservidor.Value;
                                    //cookie_local.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_local);

                                    HttpCookie cookie_licencia = new HttpCookie("licencia_empresa");
                                    cookie_licencia.Value = hlicenciaservidor.Value;
                                    //cookie_licencia.Expires = now.AddHours(50);
                                    Response.Cookies.Add(cookie_licencia);

                                    HttpCookie cookie_acceso = new HttpCookie("acceso_empresa");
                                    cookie_acceso.Value = haccesoservidor.Value;
                                    //cookie_acceso.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_acceso);

                                    HttpCookie cookie_usuario = new HttpCookie("usuario_empresa");
                                    cookie_usuario.Value = userName;
                                    //cookie_usuario.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_usuario);




                                    string redirect = string.Empty;

                                    if (ismobile == "1")
                                    {
                                        redirect = string.Format("../../MenuMovil.aspx{0}",
                                            ((usu.acceso == "Mesero" || usu.acceso == "Cajero") ? "?pagina=1" : ""));
                                        Response.Redirect(redirect);
                                    }
                                    else
                                    {
                                        if (objempresa.Tipo != "3")
                                        {
                                            redirect = string.Format("../Menu/Index.aspx{0}",
                                                    (
                                                        (usu.acceso == "J.Mozo" || usu.acceso == "Mesero" || usu.acceso == "Cajero" || usu.acceso == "Vendedor") ? "?pagina=1" :
                                                        ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=2" :
                                                        ((usu.acceso == "AdminAlmacen" || usu.acceso == "Almacenero") ? "?pagina=10" : "")
                                                        )
                                                    )
                                                 );
                                        }
                                        else
                                        {
                                            redirect = string.Format("../Menu/Index.aspx{0}",
                                                    (
                                                        (usu.acceso == "J.Mozo" || usu.acceso == "Mesero" || usu.acceso == "Cajero") ? "?pagina=3" :
                                                        ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=2" : "")
                                                    )
                                                 );
                                        }

                                        Response.Redirect(redirect);
                                    }

                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text",
                                    "alert('La licencia de ha caducado, ponerse en contacto con el area de ventas!');", true);
                                }
                            }
                        }
                        else
                        {
                            FailureText.Text = "Cuenta o clave inválido!";
                            ErrorMessage.Visible = true;
                        }
                    }
                    else
                    {
                        FailureText.Text = "La contraseña debe ser mayor a 3 caracteres!";
                        ErrorMessage.Visible = true;
                    }
                }
            }
        }
    }
}