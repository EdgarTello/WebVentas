using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta03
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

                    string empresaruc = ticket.UserData.Split('|')[1];
                    string acceso = ticket.UserData.Split('|')[3];
                    string localcodigo = ticket.UserData.Split('|')[10];
                    string tipo = ticket.UserData.Split('|')[12];
                    string mm58 = ticket.UserData.Split('|')[14];
                    string mm80 = ticket.UserData.Split('|')[15];
                    string a4 = ticket.UserData.Split('|')[16];

                    htipo.Value = tipo;
                    hidlocal.Value = localcodigo;

                    ViewState["ticket"] = "0";

                    if (acceso == "Cajero" || acceso=="Administrador" || acceso == "SuperAdmin")
                    {
                        hmm58.Value = mm58;
                        hmm80.Value = mm80;
                        ha4.Value = a4;

                        var local = new TwoTecnology.Repositorio.Local().LoadByCodigo(empresaruc, localcodigo);

                        hdocumentoimpresoras.Value = local.documentoimpresoras;
                        hdocumentoimpresoraip.Value = local.documentoimpresoraip;
                        htieneimpresora.Value = "1";

                        string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo).Serialize();
                        hcajerogavetatecla.Value = jsonconfig.Configurate("cajerogavetatecla");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cajerogavetatecla").valor;
                    }                    
                }
            }
        }
    }
}