using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Login04
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if ( Request.Cookies["ruc_empresa"] != null)
                {
                    if (Request.Cookies["ruc_empresa"].Value != "")
                    {
                        hruc.Value = Request.Cookies["ruc_empresa"].Value;
                        ruc.Value = Request.Cookies["ruc_empresa"].Value;


                        if (Request.Cookies["local_empresa"] != null)
                        {
                            if (Request.Cookies["local_empresa"].Value != "")
                            {
                                hlocal.Value = Request.Cookies["local_empresa"].Value;

                                if (Request.Cookies["usuario_empresa"] != null)
                                {
                                    if (Request.Cookies["usuario_empresa"].Value != "")
                                        husuario.Value = Request.Cookies["usuario_empresa"].Value;
                                }
                            }
                        }
                    }
                }

                
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = husuario.Value ?? "";
            string password = Password.Value;
            bool ismobile = false;
            string ambiente = ConfigurationManager.AppSettings["ambiente"] ?? "0";
            int screenwidth = Request.Browser.ScreenPixelsWidth; //Always returns 640 ?
            //if (Request.Browser.IsMobileDevice == true) { ismobile = true; } //Doesn't detect mobile device ?

            if (userName.IsInyection() || password.IsInyection())
            {
                FailureText.Text = "Inyecction Code Detected!";
                ErrorMessage.Visible = true;
            }
            else
            {

                if (IsValid)
                {
                    if (userName != "" && password != "")
                    {
                        string userRuc = ruc.Value;
                        string LocalName = hlocal.Value;                        
                        bool Authenticated = false;
                        string userNameCompuesto = string.Empty;

                        string pathdocumento = string.Format(@"{0}\{1}",
                                ConfigurationManager.AppSettings["pathdocumento"],
                                ConfigurationManager.AppSettings["empresaruc"]);


                        string pathtemporal = string.Format(@"{0}\{1}",
                                ConfigurationManager.AppSettings["pathtemporal"],
                                ConfigurationManager.AppSettings["empresaruc"]);

                        Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();

                        if (userName == "superadmin")
                            Authenticated = obj.ValidateClientRuc(userRuc, userName, password);
                        else
                            Authenticated = obj.ValidateClientLocalRuc(userRuc, LocalName, userName, password);


                        if (Authenticated)
                        {
                            TwoTecnology.BusinessShared.Consulta objconsulta = new TwoTecnology.BusinessShared.Consulta();

                            if (!objconsulta.ConsultaEmpresaValidoByRuc(ambiente, userRuc))
                            {
                                FailureText.Text = "Ruc no habilitado!";
                                ErrorMessage.Visible = true;
                            }
                            else
                            {
                                Entity.Empresa objempresa = objconsulta.ConsultaEmpresaSimpleByRuc(ambiente, userRuc);

                                if (objempresa.Bloqueado == "0")
                                {
                                    HttpContext.Current.Session["DBVentas"] = objempresa.BDVentas;

                                    Entity.Usuario usu = null;

                                    if (userName == "superadmin")
                                        usu = obj.GetUsuario(userRuc, userName);
                                    else
                                        usu = obj.GetUsuarioByLocal(userRuc, LocalName, userName);

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
                                        objempresa.Pago + "|" +           //21
                                        pathdocumento + "|" + //22
                                        pathtemporal + "|" +//23
                                        monedacaja + "|" + //24
                                        monedadefault + "|" + //25
                                        objempresa.BDVentas + "|" +//26
                                        usu.idcaja + "|" + //27
                                        usu.serie + "|" + //28
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
                                    cookie_local.Value = usu.idlocal;
                                    //cookie_local.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_local);



                                    HttpCookie cookie_usuario = new HttpCookie("usuario_empresa");
                                    cookie_usuario.Value = userName;
                                    //cookie_usuario.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_usuario);




                                    string redirect = string.Empty;


                                    if (!(objempresa.Tipo == "3" || objempresa.Tipo == "300" || objempresa.Tipo == "301" || objempresa.Tipo == "302"))
                                    {
                                        redirect = string.Format("../Menu/Index.aspx{0}",
                                        (
                                            (usu.acceso == "Mesero" || usu.acceso == "Cajero" || usu.acceso == "Vendedor") ? "?pagina=1" :
                                            ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin" || usu.acceso == "AdminAlmacen") ? "?pagina=2" :
                                            ((usu.acceso == "AdminAlmacen" || usu.acceso == "Almacenero") ? "?pagina=10" : "")
                                            )
                                        ));
                                    }
                                    else
                                    {
                                        redirect = string.Format("../Menu/Index.aspx{0}",
                                        (
                                            (usu.acceso == "Mesero" || usu.acceso == "Cajero") ? "?pagina=3" :
                                            ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=2" : "")
                                        )
                                        );
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
                }
            }
        }
    }
}
