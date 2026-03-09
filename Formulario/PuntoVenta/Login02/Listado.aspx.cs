using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Login02
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
                if (!string.IsNullOrEmpty(Request.QueryString["licencia"]))
                {
                    //hmodo.Value = Request.QueryString["licencia"];
                    ViewState["licencia"] = Request.QueryString["licencia"];
                }
                else
                {
                    ViewState["licencia"] = "";
                }

                if (!string.IsNullOrEmpty(Request.QueryString["ruc"]))
                {
                    hruc.Value = Request.QueryString["ruc"];
                    LoadAcceso();
                }
                else
                {
                    if (Request.Cookies["ruc_empresa"] != null)
                    {
                        hruc.Value = Request.Cookies["ruc_empresa"].Value;
                        LoadAcceso();
                    }
                }

                if (Request.QueryString["local"] != null)
                {
                    hlocal.Value = Request.QueryString["local"];

                    if (hlocal.Value != "")
                    {
                        //lbllocal.Text = string.Format("{0}", new TwoTecnology.Repositorio.Local().LoadObjectByCodigo(hruc.Value, hlocal.Value).nombre);
                        lbllocal2.Text = string.Format("{0}", new TwoTecnology.Repositorio.Local().LoadObjectByCodigo(hruc.Value, hlocal.Value).nombre);
                    }
                }
                else
                {
                    if (Request.Cookies["local_empresa"] != null)
                    {
                        hlocal.Value = Request.Cookies["local_empresa"].Value;
                        //lbllocal.Text = string.Format("{0}", new TwoTecnology.Repositorio.Local().LoadObjectByCodigo(hruc.Value, hlocal.Value).nombre);
                        lbllocal2.Text = string.Format("{0}", new TwoTecnology.Repositorio.Local().LoadObjectByCodigo(hruc.Value, hlocal.Value).nombre);
                    }
                }

                if (Request.Cookies["acceso_empresa"] != null)
                {
                    cboacceso.SelectedValue = Request.Cookies["acceso_empresa"].Value;
                    LoadUsuario();
                }

                if (Request.Cookies["usuario_empresa"] != null)
                {
                    cbousuarios.SelectedValue = Request.Cookies["usuario_empresa"].Value;
                }


            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool ismobile = false;
            int screenwidth = Request.Browser.ScreenPixelsWidth; //Always returns 640 ?
            //if (Request.Browser.IsMobileDevice == true) { ismobile = true; } //Doesn't detect mobile device ?
            string userName = cbousuarios.SelectedValue;
            string password = Password.Value;
            string ambiente = ConfigurationManager.AppSettings["ambiente"] ?? "0";

            if (userName.IsInyection() || password.IsInyection())
            {
                FailureText.Text = "Inyecction Code Detected!";
                ErrorMessage.Visible = true;
            }
            else
            {

                if (IsValid)
                {
                    if (cboacceso.SelectedValue != null && cbousuarios.SelectedValue != null)
                    {
                        string userRuc = hruc.Value;
                        string userAcceso = cboacceso.SelectedValue;
                        
                        bool Authenticated = false;
                        string userNameCompuesto = string.Empty;

                        string pathdocumento = string.Format(@"{0}\{1}",
                                ConfigurationManager.AppSettings["pathdocumento"],
                                ConfigurationManager.AppSettings["empresaruc"]);


                        string pathtemporal = string.Format(@"{0}\{1}",
                                ConfigurationManager.AppSettings["pathtemporal"],
                                ConfigurationManager.AppSettings["empresaruc"]);

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

                                    //Entity.Usuario usu = obj.GetUsuario(userRuc, userName);


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
                                        pathtemporal + "|" + //23
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
                                        "|"  //40
                                        ,
                                        FormsAuthentication.FormsCookiePath);

                                    string encryptedCookie = FormsAuthentication.Encrypt(ticket);
                                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
                                    cookie.Expires = DateTime.Now.AddMinutes(60);
                                    Response.Cookies.Add(cookie);
                                    //FormsAuthentication.RedirectFromLoginPage(userName, false);


                                    DateTime now = DateTime.Now;
                                    HttpCookie cookie_ruc = new HttpCookie("ruc_empresa");
                                    cookie_ruc.Value = userRuc;
                                    cookie_ruc.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_ruc);

                                    HttpCookie cookie_local = new HttpCookie("local_empresa");
                                    cookie_local.Value = usu.idlocal;
                                    cookie_local.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_local);

                                    HttpCookie cookie_acceso = new HttpCookie("acceso_empresa");
                                    cookie_acceso.Value = userAcceso;
                                    cookie_acceso.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_acceso);

                                    HttpCookie cookie_usuario = new HttpCookie("usuario_empresa");
                                    cookie_usuario.Value = userName;
                                    cookie_usuario.Expires = now.AddYears(50);
                                    Response.Cookies.Add(cookie_usuario);




                                    string redirect = string.Empty;


                                    if (objempresa.Tipo != "3")
                                    {
                                        if (objempresa.Tipo == "2" && usu.acceso == "Vendedor") {
                                            redirect = string.Format("../PuntoVenta02/Listado.aspx");
                                        }
                                        else
                                        {

                                            redirect = string.Format("../Menu/Index.aspx{0}",
                                            (
                                                (usu.acceso == "Mesero" || usu.acceso == "Cajero" || usu.acceso == "Vendedor") ? "?pagina=1" :
                                                ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin" || usu.acceso == "AdminAlmacen") ? "?pagina=2" :
                                                ((usu.acceso == "AdminAlmacen" || usu.acceso == "Almacenero") ? "?pagina=10" : "")
                                                )
                                            ));
                                        }
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

        protected void btnLoadAcceso_Click(object sender, EventArgs e)
        {
            LoadAcceso();
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
                        LoadUsuario();
                    }
                }
            }
        }

        protected void btnLoadUsuarios_Click(object sender, EventArgs e)
        {
            LoadUsuario();
        }

        private void LoadUsuario()
        {
            if (cboacceso.SelectedValue != null)
            {
                if (hruc.Value != "")
                {
                    string userAcceso = cboacceso.SelectedValue;
                    using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                    {
                        List<Entity.Empleado> lista = obj.LoadByAcceso(hruc.Value, hlocal.Value, userAcceso);
                        cbousuarios.Items.Clear();

                        foreach (var item in lista)
                        {
                            cbousuarios.Items.Add(item.usuario);
                        }
                    }
                }
            }
        }

        protected void cboacceso_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadUsuario();
        }
    }
}
