using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.ProductoImportar
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
                    string empresaruc = ticket.UserData.Split('|')[1];
                    string empresanombre = ticket.UserData.Split('|')[2];
                    string usuario_acceso = ticket.UserData.Split('|')[3];
                    string usuario = ticket.UserData.Split('|')[5];
                    string usuarioanum_documento = ticket.UserData.Split('|')[6];
                    string empresa_imagen = ticket.UserData.Split('|')[7];
                    string empresa_pago = ticket.UserData.Split('|')[8];
                    string localnombre = ticket.UserData.Split('|')[9];
                    string localcodigo = ticket.UserData.Split('|')[10];

                    hidlocal.Value = localcodigo;

                    ViewState["acceso"] = usuario_acceso;
                    ViewState["usuario"] = usuario;
                    ViewState["empresaruc"] = empresaruc;
                    ViewState["empresanombre"] = empresanombre;
                    ViewState["usuarioanum_documento"] = usuarioanum_documento;
                    ViewState["empresa_imagen"] = empresa_imagen;



                    List<Entity.Almacen> listatmp = new List<Entity.Almacen>();
                    almacen.Items.Clear();

                    if (usuario_acceso == "SuperAdmin")
                    {
                        using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                        {
                            listatmp = obj.LoadFilterByLocal(empresaruc, "");

                            foreach (var item in listatmp)
                            {
                                almacen.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                            }
                        }
                    }
                    else
                    {
                        using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                        {
                            listatmp= obj.LoadFilterByLocal(empresaruc, localcodigo);

                            foreach (var item in listatmp)
                            {
                                almacen.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                            }
                        }
                    }
                }
            }
        }
    }
}