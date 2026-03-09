using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.S10.OrdenPago
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
                    string usuario = ticket.UserData.Split('|')[5];
                    string tipo = ticket.UserData.Split('|')[12];                    
                    string localcodigo = ticket.UserData.Split('|')[10];
                    string rol_id = ticket.UserData.Split('|')[29];
                    string noframe = ticket.UserData.Split('|')[42];


                    string opcion = "OrdenPago";
                    string pagina = "../../S10/OrdenPago/Listado.aspx";

                    using (Repositorio.RolesxPagina obj = new TwoTecnology.Repositorio.RolesxPagina())
                    {
                        var permiso_acceso = obj.LoadAcceso(empresa_ruc, usuario_codigo, rol_id, opcion, pagina);

                        if (permiso_acceso.acceso != "1")
                        {
                            Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                        }
                        else {
                            hnuevo.Value = permiso_acceso.nuevo;
                            heliminar.Value = permiso_acceso.eliminar;
                            hfiltrousuario.Value = permiso_acceso.filtrousuario;
                            hopciones.Value = permiso_acceso.opciones;

                            ViewState["noframe"] = noframe;
                            hidlocal.Value = localcodigo;
                            hempleado.Value = usuario;
                        }
                    }
                }
            }
        }
    }
}