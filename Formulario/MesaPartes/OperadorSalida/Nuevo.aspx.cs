using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.OperadorSalida
{
    public partial class Nuevo : System.Web.UI.Page
    {
        string urlDefault = "../../../Formulario/MesaPartes/Frame/Salir.aspx";
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
            string idarea = ticket.UserData.Split('|')[35];

            string idjefatura = ticket.UserData.Split('|')[37];
            string jefaturanombre = ticket.UserData.Split('|')[38];
            string personalacargo = ticket.UserData.Split('|')[39];
            string flujo2_aprobacion_directa = ticket.UserData.Split('|')[40];

            ViewState["localcodigo"] = localcodigo;
            hidarea.Value = idarea;

            hoperador.Value = idjefatura;
            soperador.InnerHtml = jefaturanombre;
            hflujo2_aprobacion_directa.Value = flujo2_aprobacion_directa;

            if (!(usuario_acceso == "Operador" || 
                    usuario_acceso == "Derivador" || usuario_acceso == "Recepcion" || 
                    usuario_acceso == "Administrador" || usuario_acceso == "SuperAdmin" || 
                    usuario_acceso == "Gerencia"))
            {

                Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                Response.End();
            }
        }
    }
}