using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.Script.Serialization;
using System.IO;
using System.Text;
using System.Configuration;
using System.Web.Security;
using System.Web.Services;
using Newtonsoft.Json;
using TwoTecnology.Entity;
using RestSharp;


namespace TwoTecnology.WebVentas.Formulario.Presupuesto.Dashboard
{
    public partial class Operacion : System.Web.UI.Page
    {
        string urlDefault = "../../../Default.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Clear();
                    Header.Controls.Add(new LiteralControl(@"
                    <script type=""text/javascript"">
                    top.location = ""../../../Default.aspx"";
                    parent.location = ""../../../Default.aspx"";
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
                Response.End();
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
            string respuesta = "";

            
            if (Request.QueryString["ope"] == "100")
            {   
                string opcion = Request.QueryString["opcion"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string horainicio = Request.QueryString["horainicio"];
                string fechafin = Request.QueryString["fechaFin"].ConverTo_YYYYMMDD();
                string horafin = Request.QueryString["horafin"];
                string di = Request.QueryString["di"];
                
                using (TwoTecnology.Repositorio.MPReporte obj = new TwoTecnology.Repositorio.MPReporte())
                {
                    respuesta = obj.LoadTotales(ruc, 
                        ((usuario_acceso=="Derivador")?"": usuario_nombre),
                        usuario_codigo,
                        opcion, fechaini, horainicio, fechafin, horafin).Serialize();

                    Response.Write(respuesta);
                    Response.End();

                }
            }

        }
    }
}