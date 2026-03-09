using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Documento
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

                    string acceso = ticket.UserData.Split('|')[3];


                    string ruc = ticket.UserData.Split('|')[1];
                    string tipo = ticket.UserData.Split('|')[12];
                    string mm58 = ticket.UserData.Split('|')[14];
                    string mm80 = ticket.UserData.Split('|')[15];
                    string a4 = ticket.UserData.Split('|')[16];
                    string localcodigo = ticket.UserData.Split('|')[10];


                    var local = new TwoTecnology.Repositorio.Local().LoadByCodigo(ruc, localcodigo);

                    hidlocal.Value = localcodigo;
                    hdocumentoimpresoras.Value = local.documentoimpresoras;
                    hdocumentoimpresoraip.Value = local.documentoimpresoraip;
                    htieneimpresora.Value = "1";

                    ViewState["ticket"] = "0";

                    if (acceso == "Cajero" || acceso == "Administrador" || acceso == "SuperAdmin")
                    {
                        int total = Convert.ToInt32(mm58) + Convert.ToInt32(mm80) + Convert.ToInt32(a4);

                        hmm58.Value = mm58;
                        hmm80.Value = mm80;
                        ha4.Value = a4;

                        if (total > 0)
                        {
                            hticket.Value = "1";                            
                            ViewState["ticket"] = "1";
                        }

                    }
                }
            }
        }
    }
}