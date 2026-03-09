using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.AlmacenTomador.Acceso
{
    public partial class Index : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["dni"] != null)
                {
                    string sGUID = Solicitud(Request.QueryString["dni"]);
                    Response.Redirect(string.Format("Index2FA.aspx?id={0}", sGUID));
                }

                if (Request.Cookies["remeber"] != null)
                {
                    txtemployee.Value = Request.Cookies["remeber"].Value;
                }

                
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool Authenticated = false;
            string userName = txtemployee.Value;

            if (userName.IndexOf("'") >= 0 || userName.IndexOf(" OR ") >= 0 ||
                userName.IndexOf("--") >= 0)
            {
                //FailureText.Text = "Inyecction Code Detected!";
                //ErrorMessage.Visible = true;
            }
            else
            {

                if (IsValid)
                {
                    

                    if (userName.Length != 8)
                    {
                        return;
                    }

                    Repositorio.TOMADOR.Usuario obj = new TwoTecnology.Repositorio.TOMADOR.Usuario();
                    Authenticated = obj.ValidateTrabajador(userName);

                    if (Authenticated)
                    {
                        string sGUID = Solicitud(userName);

                        if (basic_checkbox.Checked)
                        {
                            DateTime now = DateTime.Now;
                            HttpCookie cookie_usuario = new HttpCookie("remeber");
                            cookie_usuario.Value = userName;
                            cookie_usuario.Expires = now.AddYears(50);
                            Response.Cookies.Add(cookie_usuario);
                        }

                        DateTime now01 = DateTime.Now;
                        HttpCookie cookie_usuario01 = new HttpCookie("empleado");
                        cookie_usuario01.Value = userName;
                        cookie_usuario01.Expires = now01.AddYears(50);
                        Response.Cookies.Add(cookie_usuario01);

                        Response.Redirect(string.Format("Index2FA.aspx?id={0}", sGUID));
                    }
                }
            }
        }

        private string Solicitud(string dni) {

            Random rnd = new Random();
            System.Guid miGUID = System.Guid.NewGuid();
            string sGUID = miGUID.ToString();
            string empresacorreo = ConfigurationManager.AppSettings.Get("empresacorreo");
            int clave1 = rnd.Next(0, 10);  // creates a number between 1 and 12
            int clave2 = rnd.Next(0, 10);   // creates a number between 1 and 6
            int clave3 = rnd.Next(0, 10);
            int clave4 = rnd.Next(0, 10);

            Repositorio.TOMADOR.Usuario obj = new TwoTecnology.Repositorio.TOMADOR.Usuario();

            obj.AgregarToken(dni, string.Format("{0}{1}{2}{3}", clave1, clave2, clave3, clave4),
                "A", sGUID);

            obj.AgregarCorreo(empresacorreo, dni, string.Format("{0}{1}{2}{3}", clave1, clave2, clave3, clave4));

            return sGUID;

        }
    }
}