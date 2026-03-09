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
    public partial class Index : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                hruc.Value = ConfigurationManager.AppSettings["empresaruc"];
                ViewState["empresacodigo"] = new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).Id;
                //lblempresa.Text = string.Format("   {0}", new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).NombreCorto);
                if (Request.Cookies["remeber"] != null)
                {
                    husuario.Value = Request.Cookies["remeber"].Value;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string ismobile = hmovil.Value;
            string ambiente = ConfigurationManager.AppSettings["ambiente"] ?? "0";

            if (IsValid)
            {
                if (hpassword.Value.Length > 3)
                {
                    string userAcceso = hacceso.Value;
                    string userName = husuario.Value;
                    string userRuc = hruc.Value;
                    string password = hpassword.Value;
                    bool Authenticated = false;
                    string userNameCompuesto = string.Empty;
                    string urlhost = ConfigurationManager.AppSettings["urlhost"];
                    string pathdocumento = string.Format(@"{0}\{1}", 
                            ConfigurationManager.AppSettings["pathdocumento"], 
                            ConfigurationManager.AppSettings["empresaruc"]);


                    string pathtemporal= string.Format(@"{0}\{1}",
                            ConfigurationManager.AppSettings["pathtemporal"],
                            ConfigurationManager.AppSettings["empresaruc"]);

                    string pathdmesapartes = string.Format(@"{0}", 
                        ConfigurationManager.AppSettings["pathmesapartes"]);


                    Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();
                    Authenticated = obj.ValidateClientRuc(userRuc, userName, password);



                    if (Authenticated)
                    {
                        TwoTecnology.BusinessShared.Consulta objconsulta = new TwoTecnology.BusinessShared.Consulta();

                        if (!objconsulta.ConsultaEmpresaValidoByRuc(ambiente, userRuc))
                        {
                            FailureText.Text = "Empresa no habilitado!";
                            ErrorMessage.Visible = true;
                        }
                        else
                        {
                            Entity.Empresa objempresa = objconsulta.ConsultaEmpresaSimpleByRuc(ambiente, userRuc);
                            Entity.Usuario usu = obj.GetUsuario(userRuc, userName);

                            if (usu.bloqueado == "1")
                            {
                                FailureText.Text = "Usuario Bloqueado!";
                                ErrorMessage.Visible = true;
                            }
                            else
                            {
                                string monedacaja = new TwoTecnology.Repositorio.Configuracion().LoadObject(userRuc, usu.idlocal.Trim(), "monedacaja").valor;
                                string monedadefault = new TwoTecnology.Repositorio.TipoMoneda().LoadDefault(userRuc).id;

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
                                    usu.areas + "|" +//18
                                    usu.dashboard + "|" +  //19
                                    objempresa.TelefonoSoporte + "|" + //20
                                    objempresa.Pago + "|" + //21
                                    pathdocumento + "|" + //22
                                    pathtemporal + "|" + //23

                                    monedacaja + "|" + //24
                                    monedadefault + "|" + //25
                                    objempresa.BDVentas + "|" + //26 
                                    usu.idcaja + "|" + //27
                                    usu.serie + "|"  + //28

                                    usu.ver + "|" + //29
                                    usu.descargar + "|" + //30
                                    usu.editar + "|" + //31
                                    usu.eliminar + "|" + //32

                                    pathdmesapartes + "|"  + //33
                                    urlhost + "|" + //34
                                    usu.idarea + "|" + //35
                                    usu.jefatura + "|"   //36
                                    ,
                                    FormsAuthentication.FormsCookiePath);

                                string encryptedCookie = FormsAuthentication.Encrypt(ticket);
                                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
                                cookie.Expires = DateTime.Now.AddMinutes(300);
                                Response.Cookies.Add(cookie);
                                

                                //if (remember.Checked)
                                //{
                                //    DateTime now = DateTime.Now;
                                //    HttpCookie cookie_usuario = new HttpCookie("remeber");
                                //    cookie_usuario.Value = husuario.Value;
                                //    cookie_usuario.Expires = now.AddYears(50);
                                //    Response.Cookies.Add(cookie_usuario);
                                //}



                                string redirect = string.Empty;


                                if (objempresa.Tipo == "103")
                                {
                                    redirect = string.Format("../Frame/Index.aspx{0}",
                                            ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=1" :
                                                ((usu.acceso == "Recepcion") ? "?pagina=2" :
                                                    ((usu.acceso == "Derivador") ? "?pagina=3" :
                                                        ((usu.acceso == "Operador") ? "?pagina=4" :
                                                        "")))));
                                }
                                else
                                {
                                    redirect = string.Format("../Frame/Index.aspx{0}",
                                            ((usu.acceso == "Administrador" || usu.acceso == "SuperAdmin") ? "?pagina=2" : "?pagina=1"));
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
                else {
                    FailureText.Text = "La contraseña debe ser mayor a 3 caracteres!";
                    ErrorMessage.Visible = true;
                }
            }
        }
    }
}