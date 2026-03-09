using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaCierre01
{
    public partial class Nuevo : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                    Response.End();
                }


                if (Request.QueryString["id"] != null)
                    hid.Value = Request.QueryString["id"];
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

            string ruc = ticket.UserData.Split('|')[1];
            string usuario = ticket.UserData.Split('|')[5];
            string mobile = ticket.UserData.Split('|')[11];
            hid.Value = Request.QueryString["id"];


            var guia = new TwoTecnology.Repositorio.Guia().LoadByCodigo(hid.Value);

            if (guia.estado == "0")
            {
                htipo.Value = guia.tipo;

            }
            else
            {
                Response.Redirect("../GuiaDeRemision01/Listado.aspx");
            }
        }
    }
}