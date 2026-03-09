using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta02Importar
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
                    string usuario_nombre = ticket.UserData.Split('|')[5];
                    string usuarioanum_documento = ticket.UserData.Split('|')[6];
                    string empresa_imagen = ticket.UserData.Split('|')[7];
                    string empresa_pago = ticket.UserData.Split('|')[8];
                    string localnombre = ticket.UserData.Split('|')[9];
                    string localcodigo = ticket.UserData.Split('|')[10];

                    hidlocal.Value = localcodigo;

                    ViewState["acceso"] = usuario_acceso;
                    ViewState["usuario"] = usuario_nombre;
                    ViewState["empresaruc"] = empresaruc;
                    ViewState["empresanombre"] = empresanombre;
                    ViewState["usuarioanum_documento"] = usuarioanum_documento;
                    ViewState["empresa_imagen"] = empresa_imagen;


                    if (usuario_acceso == "Cajero")
                    {
                        using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                        {
                            var listado = obj.AperturaByLocalEmpleado(empresaruc, localcodigo, usuario_nombre);

                            foreach (var item in listado)
                            {
                                hidcaja.Value = item.idcaja;
                                hserie.Value = item.serie;
                            }
                        }
                    }
                }
            }
        }
    }
}