using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta22
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

            string empresaid = ticket.UserData.Split('|')[0];
            string ruc = ticket.UserData.Split('|')[1];
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string usuario_serie = ticket.UserData.Split('|')[7];
            string puntosid = ticket.UserData.Split('|')[8];
            string ipcliente = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string mobile = ticket.UserData.Split('|')[11];
            string cambioprecio = "0";

            hempleado.Value = usuario_nombre;
            hmobile.Value = mobile;
            hidlocal.Value = localcodigo;

            htipocambio.Value = new TwoTecnology.Repositorio.TipoCambio().LoadMontoCompraLast(ruc);
            hstock.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stock").valor;
            hstockver.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stockver").valor;

            string perfilcambioprecio = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cambioprecio").valor;

            if (usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador" || usuario_acceso == perfilcambioprecio)
            {
                cambioprecio = "1";
            }

            hcambioprecio.Value = cambioprecio;

            lblempleado.Text = string.Format("{0}:{1}", usuario_acceso, usuario_nombre);

            if (hid.Value != "0")
            {
                new TwoTecnology.Repositorio.Pedido().RemoverTransaccion(hid.Value);

                var pedido = new TwoTecnology.Repositorio.Pedido().LoadByCodigo(hid.Value);
                hestado.Value = pedido.estado;
                hfecha.Value = pedido.pedidofecha;
                hclientetipo.Value = pedido.clientetipo;
                hguiacreacion.Value = pedido.guiacreacion;

                if (pedido.ubicacion != "")
                {
                    lblubicacion.Text = string.Format("Ubicación:{0}", pedido.ubicacion);
                }
            }
        }
    }
}