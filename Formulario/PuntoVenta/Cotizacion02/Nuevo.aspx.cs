using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Cotizacion02
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
            string monedacaja = ticket.UserData.Split('|')[24];
            string monedadefault = ticket.UserData.Split('|')[25];
            string cambioprecio = "0";            

            hempleado.Value = usuario_nombre;
            hmobile.Value = mobile;
            hidlocal.Value = localcodigo;

            hmonedacaja.Value = monedacaja;
            hmonedadefault.Value = monedadefault;

            htipocambio.Value = new TwoTecnology.Repositorio.TipoCambio().LoadMontoCompraLast(ruc);
            hstock.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stock").valor;
            hstockver.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stockver").valor;
            htecladovisualiza.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tecladovisualiza").valor;
            hdcpermitido.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "dcpermitido").valor;
            
            hmuestratipo.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            hmuestrafamilia.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestrafamilia").valor;
            hmuestracategoria.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestracategoria").valor;
            hmuestraproducto.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestraproducto").valor;
            hproductobusqueda.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "productobusqueda").valor;
            hproductoimagen.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "productoimagen").valor;

            hscanerbusca.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "scanerbusca").valor;
            hscanneragrega.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "scanneragrega").valor;

            hpedidotipo.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "pedidotipo").valor;
            hpedidofamilia.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "pedidofamilia").valor;
            hpedidocategoria.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "pedidocategoria").valor;

            hcolumnaizquierdapedido.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "columnaizquierdapedido").valor;
            hcolumnaderechapedido.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "columnaderechapedido").valor;
            hcajarapida.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cajarapida").valor;

            lblempleado.Text = string.Format("{0}:{1}", usuario_acceso, usuario_nombre);
            string perfilcambioprecio = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cambioprecio").valor;

            hcolumnaizquierdapedido.Value = (hcolumnaizquierdapedido.Value == "") ? "0" : hcolumnaizquierdapedido.Value;
            hcolumnaderechapedido.Value = (hcolumnaderechapedido.Value == "") ? "0" : hcolumnaderechapedido.Value;

            if ((Convert.ToInt32(hcolumnaizquierdapedido.Value) + Convert.ToInt32(hcolumnaderechapedido.Value))!=12) {
                hcolumnaizquierdapedido.Value = "6";
                hcolumnaderechapedido.Value = "6";
            }

            ViewState["columnaizquierdapedido"] = hcolumnaizquierdapedido.Value;
            ViewState["columnaderechapedido"] = hcolumnaderechapedido.Value;


            if (usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador" || usuario_acceso == perfilcambioprecio) {
                cambioprecio = "1";
            }

            hcambioprecio.Value = cambioprecio;

            if (hid.Value != "0")
            {
                new TwoTecnology.Repositorio.Pedido().RemoverTransaccion(hid.Value);

                var pedido = new TwoTecnology.Repositorio.Pedido().LoadByCodigo(hid.Value);
                hestado.Value = pedido.estado;
                hfecha.Value = pedido.pedidofecha;
                hclientetipo.Value = pedido.clientetipo;
                hguiacreacion.Value = pedido.guiacreacion;
                hcategoriascantidad.Value = pedido.categoriascantidad;

                //if (pedido.ubicacion != "")
                //{
                //    lblubicacion.Text = string.Format("Ubicación:{0}", pedido.ubicacion);
                //}
            }
        }
    }
}