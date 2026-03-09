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

namespace TwoTecnology.WebVentas.Formulario.Corporativo.Login
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
                
            }

            
            string macaddress = GetClientMAC(GetIPAddress());
            string ismobile = "0";

            ismobile= (Request.Browser.IsMobileDevice) ? "1" : "0"; ;

            hismobile.Value = ismobile;
            ViewState["ismobile"] = ismobile;
            
            //FailureText.Text = macaddress;
            //ErrorMessage.Visible = true;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string password = clave.Value;
            string ismobile = hismobile.Value;
            string ambiente = hambiente.Value;
            string username = Usuario.Value;
            string empresaruc = hruc.Value;

            if (password.IsInyection())
            {
                FailureText.Text = "Inyecction Code Detected!";
                ErrorMessage.Visible = true;
            }
            else
            {
                if (IsValid)
                {
                    if (username != "" && password != "")
                    {
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
                        Authenticated = obj.ValidateClientRuc(empresaruc, username, password);



                        if (Authenticated)
                        {
                            TwoTecnology.BusinessShared.Consulta objconsulta = new TwoTecnology.BusinessShared.Consulta();

                            if (!objconsulta.ConsultaEmpresaValidoByRuc(ambiente, empresaruc))
                            {
                                FailureText.Text = "Ruc no habilitado!";
                                ErrorMessage.Visible = true;
                            }
                            else
                            {
                                Entity.Empresa objempresa = objconsulta.ConsultaEmpresaSimpleByRuc(ambiente, empresaruc);

                                if (objempresa.Bloqueado == "0")
                                {
                                    Entity.Usuario usu = obj.GetUsuario(empresaruc, username);

                                    if (usu.horariotrabajo != "0")
                                    {
                                        bool blnhorario = obj.GetUsuarioHorarioAsignado(empresaruc, usu.horariotrabajo);

                                        if (!blnhorario)
                                        {
                                            FailureText.Text = "Fuera de horario!";
                                            ErrorMessage.Visible = true;
                                            return;
                                        }
                                    }

                                    string verificamaccaddress = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, usu.idlocal.Trim(), "macadresshabillitar").valor;
                                    string monedacaja = "";
                                    string monedadefault = "";

                                    if (verificamaccaddress == "1")
                                    {
                                        if (usu.macaddress!= "" && usu.macaddress != macaddress)
                                        {
                                            FailureText.Text = "El #mac no es el asignado!";
                                            ErrorMessage.Visible = true;
                                            return;
                                        }
                                    }



                                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                                        username, DateTime.Now, DateTime.Now.AddMinutes(720), true,
                                        objempresa.Id.Trim() + "|" +        //0
                                        objempresa.Ruc.Trim() + "|" +       //1
                                        objempresa.Nombre.Trim() + "|" +    //2
                                        usu.acceso.Trim() + "|" +           //3
                                        usu.codigo.Trim() + "|" +           //4
                                        usu.usuario.Trim() + "|" +          //5
                                        usu.num_documento.Trim() + "|" +    //6    
                                        Path.GetFileName(objempresa.Imagen) + "|" +  //7
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
                                        monedacaja + "|" +                  //24
                                        monedadefault + "|" +               //25
                                        objempresa.BDVentas + "|" +         //26
                                        usu.idcaja + "|" +                  //27
                                        usu.serie + "|" +                   //28
                                        usu.idrol + "|" +                   //29
                                        "|" +                               //30
                                        "|" +                               //31
                                        "|" +                               //32
                                        pathdmesapartes + "|" +             //33
                                        urlhost + "|" +                     //34
                                        usu.ruta_principal + "|" +          //35
                                        usu.ruta_documento + "|" +          //36
                                        usu.idarchivador + "|"  +           //37
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
                                    cookie_usuario.Value = ((basic_checkbox.Checked) ? username : "");
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

        private void LoadAcceso()
        {   
            hruc.Value = ConfigurationManager.AppSettings["empresaruc"] ?? "";

            if (hruc.Value != "")
            {
                hambiente.Value = ConfigurationManager.AppSettings["ambiente"] ?? "0";
                Usuario.Value = Request.Cookies["usuario_empresa"]?.Value ?? "";
                string imagen = new TwoTecnology.BusinessShared.Consulta().ConsultaEmpresaSimpleByRuc(hambiente.Value, hruc.Value).Imagen;
                ViewState["empresa_imagen"] = Path.GetFileName(imagen);
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
