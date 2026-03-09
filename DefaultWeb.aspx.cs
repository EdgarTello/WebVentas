using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas
{
    public partial class DefaultWeb : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["ruc"])){
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
            string ambiente = ConfigurationManager.AppSettings["ambiente"] ?? "1";
            int screenwidth = Request.Browser.ScreenPixelsWidth; //Always returns 640 ?
            //if (Request.Browser.IsMobileDevice == true) { ismobile = true; } //Doesn't detect mobile device ?



            if (IsValid)
            {
                if (cboacceso.SelectedValue != null && cbousuarios.SelectedValue != null)
                {
                    string userRuc = hruc.Value;
                    string userAcceso = cboacceso.SelectedValue;
                    string userName = cbousuarios.SelectedValue;
                    string password = Password.Value;
                    bool Authenticated = false;
                    string userNameCompuesto = string.Empty;


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
                            TwoTecnology.Entity.Empresa objempresa = objconsulta.ConsultaEmpresaSimpleByRuc(ambiente, userRuc);
                            TwoTecnology.Entity.Usuario usu = obj.GetUsuario(userRuc, userName);


                            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                                userName, DateTime.Now, DateTime.Now.AddMinutes(30), true,
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
                                objempresa.Comercial,
                                FormsAuthentication.FormsCookiePath);

                            string encryptedCookie = FormsAuthentication.Encrypt(ticket);
                            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
                            cookie.Expires = DateTime.Now.AddMinutes(30);
                            Response.Cookies.Add(cookie);
                            //FormsAuthentication.RedirectFromLoginPage(userName, false);


                            DateTime now = DateTime.Now;
                            HttpCookie cookie_ruc = new HttpCookie("ruc_empresa");
                            cookie_ruc.Value = userRuc;
                            cookie_ruc.Expires = now.AddYears(50);
                            Response.Cookies.Add(cookie_ruc);

                            HttpCookie cookie_acceso = new HttpCookie("acceso_empresa");
                            cookie_acceso.Value = userAcceso;
                            cookie_acceso.Expires = now.AddYears(50);
                            Response.Cookies.Add(cookie_acceso);

                            HttpCookie cookie_usuario = new HttpCookie("usuario_empresa");
                            cookie_usuario.Value = userName;
                            cookie_usuario.Expires = now.AddYears(50);
                            Response.Cookies.Add(cookie_usuario);

                               
                            

                            string redirect = string.Empty;

                            if (ismobile)
                            {
                                redirect = string.Format("MenuMovil.aspx{0}",
                                    ((usu.acceso == "Mesero" || usu.acceso == "Cajero") ? "?pagina=1" : ""));
                                Response.Redirect(redirect);
                            }
                            else
                            {
                                if (objempresa.Tipo != "3")
                                {
                                    redirect = string.Format("Formulario/Menu/Index.aspx{0}",
                                            (
                                                (usu.acceso == "Mesero" || usu.acceso == "Cajero" || usu.acceso == "Vendedor") ? "?pagina=1" :
                                                ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=2" : "")
                                            )
                                         );
                                }
                                else
                                {
                                    redirect = string.Format("Formulario/Menu/Index.aspx{0}",
                                            (
                                                (usu.acceso == "Mesero" || usu.acceso == "Cajero") ? "?pagina=3" :
                                                ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=2" : "")
                                            )
                                         );
                                }

                                Response.Redirect(redirect);
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

        protected void btnLoadAcceso_Click(object sender, EventArgs e)
        {
            LoadAcceso();
        }

        private void LoadAcceso() {
            if (hruc.Value != "")
            {


                lblempresa.Text = string.Format(" a {0}", new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).NombreCorto);


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

        private void LoadUsuario() {
            if (cboacceso.SelectedValue != null)
            {
                if (hruc.Value != "")
                {
                    string userAcceso = cboacceso.SelectedValue;
                    using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                    {
                        List<Entity.Empleado> lista = obj.LoadByAcceso(hruc.Value, userAcceso);
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