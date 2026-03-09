using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Text;
using System.Web.Security;
using Newtonsoft.Json;
using RestSharp;
using System.Configuration;

namespace TwoTecnology.WebVentas.Formulario.Retail
{
    public partial class Operacion : System.Web.UI.Page
    {

        string urlDefault = "../General/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            string respuesta = "";
            string ruc_empresa = "";

            if (Request.Cookies["ruc_empresa"] != null) {
                ruc_empresa= Request.Cookies["ruc_empresa"].Value;
                urlDefault = string.Format("Default.aspx?ruc={0}", ruc_empresa);
            }

            

            if (Request.QueryString["ope"] == "102_2")
            {

                string rucempresa = Request.QueryString["ruc"].ToString();

                using (Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario())
                {
                    respuesta = obj.Load(rucempresa);
                }

                Response.Write(respuesta);
                Response.ContentEncoding = Encoding.UTF8;
                Response.End();
            }



            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Clear();
                    Header.Controls.Add(new LiteralControl(@"
                    <script type=""text/javascript"">
                    top.location = ""Default.aspx"";
                    parent.location = ""Default.aspx"";
                    </script>
                    "));
                    Response.End();
                    // This is an unauthorized, authenticated request...
                    //Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                }
            }



            FormsAuthenticationTicket ticket = null;
            try
            {
                FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                ticket = formsIdentity.Ticket;
            }
            catch
            {
                Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
            }

            string empresaid = ticket.UserData.Split('|')[0];
            string ruc = ticket.UserData.Split('|')[1];
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string usuario_serie = ticket.UserData.Split('|')[7];
            string puntosid = ticket.UserData.Split('|')[8];
            string ipcliente = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            



            

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }

        public static MemoryStream GenerateStreamFromString(string value)
        {
            return new MemoryStream(Encoding.UTF8.GetBytes(value ?? ""));
        }

    }
}