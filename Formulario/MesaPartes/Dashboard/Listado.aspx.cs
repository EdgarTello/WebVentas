using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.Dashboard
{
    public partial class Listado : System.Web.UI.Page
    {
        string urlDefault = "../../../Formulario/MesaPartes/Frame/Salir.aspx";
        string ruc = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                    Response.End();
                }
                else
                {
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
                    ruc = ticket.UserData.Split('|')[1];
                    string usuario_acceso = ticket.UserData.Split('|')[3];
                    string usuario_codigo = ticket.UserData.Split('|')[4];
                    string usuario_nombre = ticket.UserData.Split('|')[5];
                    string usuario_serie = ticket.UserData.Split('|')[7];
                    string puntosid = ticket.UserData.Split('|')[8];
                    string ipcliente = ticket.UserData.Split('|')[9];
                    string localcodigo = ticket.UserData.Split('|')[10];
                    string movil = ticket.UserData.Split('|')[11];
                    string empresatipo = ticket.UserData.Split('|')[12];
                    string jefatura = ticket.UserData.Split('|')[36];

                    hruc.Value = ruc;
                    hidlocal.Value = localcodigo;
                    hempresatipo.Value = empresatipo;
                    husuarioacceso.Value = usuario_acceso;

                    ViewState["empresa_tipo"] = empresatipo;
                    ViewState["usuario_acceso"] = usuario_acceso;

                    if (!(usuario_acceso == "Operador" ||
                    usuario_acceso == "Derivador" || usuario_acceso == "Recepcion" ||
                    usuario_acceso == "Administrador" || usuario_acceso == "SuperAdmin" ||
                    usuario_acceso == "Gerencia"))
                    {

                        Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                        Response.End();
                    }

                    string dashboardopcion = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "dashboardopcion").valor ?? "4";
                    hdashboardopcion.Value = dashboardopcion;
                    ViewState["dashboardopcion"] = dashboardopcion;
                }
            }
        }

        
    }
}