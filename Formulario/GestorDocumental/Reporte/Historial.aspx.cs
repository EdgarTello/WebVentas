using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.GestorDocumental.Reporte
{
    public partial class Historial : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
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

                    string acceso = ticket.UserData.Split('|')[3];


                    string ruc = ticket.UserData.Split('|')[1];
                    string tipo = ticket.UserData.Split('|')[12];
                    string mm58 = ticket.UserData.Split('|')[14];
                    string mm80 = ticket.UserData.Split('|')[15];
                    string a4 = ticket.UserData.Split('|')[16];
                    string localcodigo = ticket.UserData.Split('|')[10];

                    
                    //var local = new TwoTecnology.Repositorio.Local().LoadByCodigo(ruc, localcodigo);

                    hidlocal.Value = localcodigo;
                    

                }
            }
        }
    }
}