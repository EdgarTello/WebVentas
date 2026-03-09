using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.GestorDocumental.Proceso
{
    public partial class Listado : System.Web.UI.Page
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

                    string empresa_id = ticket.UserData.Split('|')[0];
                    string empresa_ruc = ticket.UserData.Split('|')[1];
                    string usuario_acceso = ticket.UserData.Split('|')[3];
                    string usuario_codigo = ticket.UserData.Split('|')[4];
                    string rol_id = ticket.UserData.Split('|')[29];

                    
                    string opcion = "Proceso";
                    string pagina = "../../GestorDocumental/Proceso/Listado.aspx";


                    using (Repositorio.RolesxPagina obj = new TwoTecnology.Repositorio.RolesxPagina())
                    {
                        var permiso_acceso = obj.LoadAcceso(empresa_ruc, usuario_codigo, rol_id, opcion, pagina);

                        if (permiso_acceso.acceso!="1")
                        {
                            Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                        }
                    }

                    
                }
            }
        }
    }
}