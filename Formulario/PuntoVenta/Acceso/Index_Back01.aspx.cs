using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Acceso
{
    public partial class Index_Back01 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                hruc.Value = ConfigurationManager.AppSettings["empresaruc"];
                ViewState["empresacodigo"] = new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).Id;
                //lblempresa.Text = string.Format("   {0}", new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).NombreCorto);



                if (Request.QueryString["movil"] != null)
                {
                    hmovil.Value = Request.QueryString["movil"];
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string ismobile = hmovil.Value;
            bool bsession = false;
            string ambiente = ConfigurationManager.AppSettings["ambiente"] ?? "0";

            if (txtVerificationCode.Text.ToLower() != Session["CaptchaVerify"].ToString())            {
                
                FailureText.Text = "Ingrese captcha correcto!";
                ErrorMessage.Visible = true;
                return;
            }

            //int screenwidth = Request.Browser.ScreenPixelsWidth; //Always returns 640 ?
            //if (Request.Browser.IsMobileDevice == true) { ismobile = true; } //Doesn't detect mobile device ?

            if (IsValid)
            {
                if (Password.Value.Length > 3 || bsession)
                {
                    string userAcceso = hacceso.Value;
                    string userName = husuario.Value;
                    string userRuc = hruc.Value;
                    string password = Password.Value;
                    bool Authenticated = false;
                    string userNameCompuesto = string.Empty;
                    string pathdocumento = string.Format(@"{0}\{1}", 
                            ConfigurationManager.AppSettings["pathdocumento"], 
                            ConfigurationManager.AppSettings["empresaruc"]);


                    Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();

                    if (!bsession)
                    Authenticated = obj.ValidateClientRuc(userRuc, userName, password);



                    if (Authenticated || bsession)
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
                            Entity.Usuario usu = obj.GetUsuario(userRuc, userName);


                            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                                userName, DateTime.Now, DateTime.Now.AddMinutes(300), true,
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
                                usu.areas + "|"  +//18
                                usu.dashboard + "|" +  //19
                                objempresa.TelefonoSoporte + "|" + //20
                                pathdocumento + "|"  //21
                                ,
                                FormsAuthentication.FormsCookiePath);

                            string encryptedCookie = FormsAuthentication.Encrypt(ticket);
                            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
                            cookie.Expires = DateTime.Now.AddMinutes(300);
                            Response.Cookies.Add(cookie);
                            //FormsAuthentication.RedirectFromLoginPage(userName, false);


                            DateTime now = DateTime.Now;
                            HttpCookie cookie_ruc = new HttpCookie("ruc_empresa");
                            cookie_ruc.Value = userRuc;
                            cookie_ruc.Expires = now.AddYears(50);
                            Response.Cookies.Add(cookie_ruc);

                            
                            HttpCookie cookie_usuario = new HttpCookie("usuario_empresa");
                            cookie_usuario.Value = userName;
                            cookie_usuario.Expires = now.AddYears(50);
                            Response.Cookies.Add(cookie_usuario);


                            string redirect = string.Empty;

                            
                                
                            redirect = string.Format("../Frame/Index.aspx{0}",
                                    (((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=2" : ""))
                                    );
                                

                            Response.Redirect(redirect);
                            

                        }
                    }
                    else
                    {
                        FailureText.Text = "Cuenta o clave inválido!";
                        ErrorMessage.Visible = true;
                    }
                }
                else {
                    FailureText.Text = "La contraseña debe ser mayor a 3 caracteres!";
                    ErrorMessage.Visible = true;
                }
            }
        }
    }
}