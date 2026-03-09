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


namespace TwoTecnology.WebVentas.Formulario.AlmacenTomador.Local
{
    public partial class Operacion : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";

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

            string ciacod = ticket.UserData.Split('|')[0];
            string noemple = ticket.UserData.Split('|')[1];
            string tracod = ticket.UserData.Split('|')[2];
            string tranom = ticket.UserData.Split('|')[3];
            string almcod = ticket.UserData.Split('|')[4];
            string respuesta = "";

            if (Request.QueryString["ope"] == "100")
            {
                TwoTecnology.Repositorio.TOMADOR.Articulo obj = new TwoTecnology.Repositorio.TOMADOR.Articulo();
                respuesta = obj.LoadList(ciacod).Serialize();
            }

            if (Request.QueryString["ope"] == "200")
            {
                TwoTecnology.Repositorio.TOMADOR.Bodega obj = new TwoTecnology.Repositorio.TOMADOR.Bodega();
                respuesta = obj.Load(ciacod).Serialize();
            }

            if (Request.QueryString["ope"] == "300")
            {
                TwoTecnology.Repositorio.TOMADOR.Pedido obj = new TwoTecnology.Repositorio.TOMADOR.Pedido();
                respuesta = obj.LoadEstandar(ciacod).Serialize();
            }


            if (Request.QueryString["ope"] == "400")
            {
                string op = Request.QueryString["op"];

                TwoTecnology.Repositorio.TOMADOR.Pedido obj = new TwoTecnology.Repositorio.TOMADOR.Pedido();
                respuesta = obj.LoadDetailEstandar(ciacod, op).Serialize();
            }

            if (Request.QueryString["ope"] == "500")
            {
                TwoTecnology.Repositorio.TOMADOR.Maquina obj = new TwoTecnology.Repositorio.TOMADOR.Maquina();
                respuesta = obj.Load(ciacod).Serialize();
            }

            


            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}