using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.GestorDocumental.Login
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadAcceso();
                string macaddress = GetClientMAC(GetIPAddress());
                string ismobile = "0";

                ismobile = (Request.Browser.IsMobileDevice) ? "1" : "0"; ;

                hismobile.Value = ismobile;
                ViewState["ismobile"] = ismobile;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string login = usuario.Value;
            string password = clave.Value;
            string ismobile = hismobile.Value;
            string _cookieUsuario = string.Empty;
            HttpCookie cookieUsuario = Request.Cookies["CookieUsuario"];
            string httpcookie = ConfigurationManager.AppSettings["httpcookie"] ?? "0";
            string ambiente = ConfigurationManager.AppSettings["ambiente"] ?? "1";

            if (cookieUsuario != null){
                _cookieUsuario = cookieUsuario.Value;
            }


            if (password.IsInyection())
            {
                FailureText.Text = "Inyecction Code Detected!";
                ErrorMessage.Visible = true;
            }
            else
            {
                if (IsValid)
                {
                    if (usuario.Value != "" && password != "")
                    {
                        string userRuc = hruc.Value;
                        string userName = usuario.Value;

                        bool Authenticated = false;
                        string userNameCompuesto = string.Empty;
                        string urlhost = ConfigurationManager.AppSettings["urlhost"];
                        string macaddress = GetClientMAC(GetIPAddress());



                        string pathdocumento = string.Format(@"{0}\{1}",
                                ConfigurationManager.AppSettings["pathdocumento"],
                                ConfigurationManager.AppSettings["empresaruc"]);


                        string pathtemporal = string.Format(@"{0}\{1}",
                                ConfigurationManager.AppSettings["pathtemporal"],
                                ConfigurationManager.AppSettings["empresaruc"]);

                        string pathdmesapartes = string.Format(@"{0}",
                            ConfigurationManager.AppSettings["pathmesapartes"]);



                        Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();
                        Authenticated = obj.ValidateClientRuc(userRuc, userName, password);



                        if (Authenticated)
                        {
                            Entity.Usuario usu = obj.GetUsuario(userRuc, userName);
                            TwoTecnology.BusinessShared.Consulta objconsulta = new TwoTecnology.BusinessShared.Consulta();


                            if (!objconsulta.ConsultaEmpresaValidoByRuc(ambiente, userRuc))
                            {
                                FailureText.Text = "Ruc no habilitado!";
                                ErrorMessage.Visible = true;
                                return;
                            }
                            

                            Entity.Empresa objempresa = objconsulta.ConsultaEmpresaSimpleByRuc(ambiente, userRuc);

                            if (objempresa.Bloqueado == "0")
                            {
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


                                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                                    userName, DateTime.Now, DateTime.Now.AddMinutes(720), true,
                                    objempresa.Id.Trim() + "|" +        //0
                                    objempresa.Ruc.Trim() + "|" +       //1
                                    objempresa.Nombre.Trim() + "|" +    //2
                                    usu.acceso.Trim() + "|" +           //3
                                    usu.codigo.Trim() + "|" +           //4
                                    usu.usuario.Trim() + "|" +          //5
                                    usu.num_documento.Trim() + "|" +    //6    
                                    objempresa.Imagen + "|" +  //7
                                    objempresa.HorasBloqueo + "|" +     //8
                                    usu.local.Trim() + "|" +            //9
                                    usu.idlocal.Trim() + "|" +          //10
                                    ismobile + "|" +    //11
                                    objempresa.Tipo + "|" +             //12
                                    objempresa.Comercial + "|" +        //13
                                    usu.mm58 + "|" +                    //14
                                    usu.mm80 + "|" +                    //15
                                    usu.a4 + "|" +                      //16
                                    usu.ubigeo + "|" +                  //17
                                    usu.areas + "|" +                   //18
                                    usu.dashboard + "|" +               //19
                                    objempresa.TelefonoSoporte + "|" +  //20
                                    objempresa.Pago + "|" +             //21
                                    pathdocumento + "|" +               //22
                                    pathtemporal + "|" +                //23
                                    "" + "|" +                  //24
                                    "" + "|" +               //25
                                    objempresa.BDVentas + "|" +         //26
                                    usu.idcaja + "|" +                  //27
                                    usu.serie + "|" +                   //28
                                    usu.idrol + "|" +                   //29
                                    usu.idperfil + "|" +                //30
                                    "|" +                               //31
                                    "|" +                               //32
                                    pathdmesapartes + "|" +             //33
                                    urlhost + "|" +                     //34
                                    usu.ruta_principal + "|" +          //35
                                    usu.ruta_documento + "|" +          //36
                                    usu.idarchivador + "|" +           //37
                                    "|" +                               //38
                                    "|" + //39
                                    "|" + //40
                                    "|" +  //41
                                    usu.noframe + "|",  //42
                                    FormsAuthentication.FormsCookiePath);

                                string encryptedCookie = FormsAuthentication.Encrypt(ticket);
                                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
                                //cookie.Expires = DateTime.Now.AddMinutes(60);
                                Response.Cookies.Add(cookie);
                                //FormsAuthentication.RedirectFromLoginPage(userName, false);


                                
                                HttpCookie cookie_usuario = new HttpCookie("usuario_empresa");
                                cookie_usuario.Value = ((basic_checkbox.Checked) ? userName : "");
                                //cookie_usuario.Expires = now.AddYears(50);
                                Response.Cookies.Add(cookie_usuario);
                                Response.Redirect(usu.paginaredireccion);
                            }
                            else
                            {
                                FailureText.Text = "La licencia ha caducado!";
                                ErrorMessage.Visible = true;
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
            string empresa_ruc = ConfigurationManager.AppSettings["empresaruc"];

            if (empresa_ruc != "")
            {   
                string ambiente = ConfigurationManager.AppSettings["ambiente"] ?? "0";
                string imagen = new TwoTecnology.BusinessShared.Consulta().ConsultaEmpresaSimpleByRuc(ambiente, empresa_ruc).Imagen;

                string base64String = Metodos.ConvertImageFileToBase64DataUri(imagen) ?? "";
                lblimagen.Text = $"<img class='auth-title-box-img d-dark-none' src='{base64String}' />";
                usuario.Value = Request.Cookies["usuario_empresa"]?.Value ?? "";
                hruc.Value = empresa_ruc;
            }
        }


        public string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            return context.Request.ServerVariables["REMOTE_ADDR"];
        }

        [DllImport("Iphlpapi.dll")]
        private static extern int SendARP(Int32 dest, Int32 host, ref Int64 mac, ref Int32 length);
        [DllImport("Ws2_32.dll")]
        private static extern Int32 inet_addr(string ip);

        private static string GetClientMAC(string strClientIP)
        {
            string mac_dest = "";
            try
            {
                Int32 ldest = inet_addr(strClientIP);
                Int32 lhost = inet_addr("");
                Int64 macinfo = new Int64();
                Int32 len = 6;
                int res = SendARP(ldest, 0, ref macinfo, ref len);
                string mac_src = macinfo.ToString("X");

                while (mac_src.Length < 12)
                {
                    mac_src = mac_src.Insert(0, "0");
                }

                for (int i = 0; i < 11; i++)
                {
                    if (0 == (i % 2))
                    {
                        if (i == 10)
                        {
                            mac_dest = mac_dest.Insert(0, mac_src.Substring(i, 2));
                        }
                        else
                        {
                            mac_dest = "-" + mac_dest.Insert(0, mac_src.Substring(i, 2));
                        }
                    }
                }
            }
            catch (Exception err)
            {
                throw new Exception("L?i " + err.Message);
            }
            return mac_dest;
        }

        
    }
}
