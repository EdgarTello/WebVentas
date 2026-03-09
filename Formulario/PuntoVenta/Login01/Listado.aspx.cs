using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Login01
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
                ViewState["licencia"] = Request.QueryString["licencia"] ?? "" ;
                hruc.Value = Request.QueryString["ruc"] ?? (Request.Cookies["ruc_empresa"].Value ?? "");
                hlocal.Value = Request.QueryString["local"] ?? (Request.Cookies["local_empresa"].Value ?? "");
                hautogestion.Value = Request.QueryString["autogestion"] ?? "";
                LoadAcceso();

                if (Request.Cookies["acceso_empresa"] != null)
                {
                    cboacceso.SelectedValue = Request.Cookies["acceso_empresa"].Value;                 
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool ismobile = false;
            string password = Password.Value;
            string userName = txtusuario.Value;
            int screenwidth = Request.Browser.ScreenPixelsWidth; //Always returns 640 ?
            string ambiente = ConfigurationManager.AppSettings["ambiente"] ?? "0";


            if (Request.Browser.IsMobileDevice == true) { ismobile = true; } //Doesn't detect mobile device ?

            if (userName.IsInyection() || password.IsInyection() )
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
                        string userRuc = hruc.Value;
                        string userAcceso = cboacceso.SelectedValue;
                        bool Authenticated = false;
                        string userNameCompuesto = string.Empty;
                        int iminutos = (hautogestion.Value == "1") ? 600 : 60;



                        string pathdocumento = string.Format(@"{0}\{1}",
                                ConfigurationManager.AppSettings["pathdocumento"],
                                ConfigurationManager.AppSettings["empresaruc"] ?? hruc.Value);


                        string pathtemporal = string.Format(@"{0}\{1}",
                                ConfigurationManager.AppSettings["pathtemporal"],
                                ConfigurationManager.AppSettings["empresaruc"] ?? hruc.Value);


                        Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();
                        Authenticated = obj.ValidateClientRuc(userRuc, userName, password);



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

                                    Entity.Usuario usu = obj.GetUsuario(userRuc, userName);

                                    string monedacaja = new TwoTecnology.Repositorio.Configuracion().LoadObject(userRuc, usu.idlocal.Trim(), "monedacaja").valor;
                                    string monedadefault = new TwoTecnology.Repositorio.TipoMoneda().LoadDefault(userRuc).id;



                                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                                        userName, DateTime.Now, DateTime.Now.AddMinutes(iminutos), true,
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
                                        "|",  //40,
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

                                    HttpCookie cookie_acceso = new HttpCookie("acceso_empresa");
                                    cookie_acceso.Value = userAcceso;
                                    //cookie_acceso.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_acceso);

                                    HttpCookie cookie_usuario = new HttpCookie("usuario_empresa");
                                    cookie_usuario.Value = userName;
                                    //cookie_usuario.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_usuario);


                                    string redirect = string.Empty;

                                    //if (objempresa.Tipo == "23")
                                    //{
                                        redirect = string.Format("../Menu/Index.aspx{0}",
                                            (
                                                (usu.acceso == "Operador" || usu.acceso == "Auditor") ? "?pagina=101" :
                                                ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=102" : "")
                                            ));

                                    //}
                                    //else
                                    //{
                                    //    if (objempresa.Tipo != "3")
                                    //    {
                                    //        redirect = string.Format("../Menu/Index.aspx{0}",
                                    //        (
                                    //            (usu.acceso == "Mesero" || usu.acceso == "Cajero" || usu.acceso == "Vendedor") ? "?pagina=1" :
                                    //            ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin" || usu.acceso == "AdminAlmacen") ? "?pagina=2" : "")
                                    //        ));
                                    //    }
                                    //    else
                                    //    {
                                    //        redirect = string.Format("../Menu/Index.aspx{0}",
                                    //        (
                                    //            (usu.acceso == "Mesero" || usu.acceso == "Cajero") ? "?pagina=3" :
                                    //            ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=2" : "")
                                    //        )
                                    //        );
                                    //    }
                                    //}

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
                    else
                    {
                        FailureText.Text = "Cuenta inválida!";
                    }
                }
            }
        }

       

        private void LoadAcceso()
        {
            if (hruc.Value != "")
            {
                //lblempresa.Text = string.Format(" a {0}", new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).NombreCorto);
                //lblempresa2.Text = string.Format(" a {0}", new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).NombreCorto);


                cboacceso.Items.Clear();

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    List<Entity.Empleado> lista = obj.LoadListaAcceso(hruc.Value);

                    foreach (var item in lista)
                        cboacceso.Items.Add(item.acceso);

                    if (cboacceso.Items.Count > 0)
                    {
                        cboacceso.SelectedIndex = 0;
                        txtusuario.Value = "";
                    }
                }

                using (Repositorio.Empresa obj = new TwoTecnology.Repositorio.Empresa())
                {
                    ViewState["empresa_codigo"] = obj.LoadByRucObject(hruc.Value).Id;
                }
            }
        }


    }
}
