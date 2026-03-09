using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta02
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
            string empresaruc = ticket.UserData.Split('|')[1];
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
            

            hempleado.Value = usuario_nombre;
            hmobile.Value = mobile;
            hidlocal.Value = localcodigo;

            hmonedacaja.Value = monedacaja;
            hmonedadefault.Value = monedadefault;

            string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo).Serialize();

            htipocambio.Value = new TwoTecnology.Repositorio.TipoCambio().LoadMontoCompraLast(empresaruc);
            hanfitrionacaja.Value = jsonconfig.Configurate("anfitrionacaja"); 
            hstock.Value = jsonconfig.Configurate("stock");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stock").valor;
            hstockver.Value = jsonconfig.Configurate("stockver");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stockver").valor;
            htecladovisualiza.Value = jsonconfig.Configurate("tecladovisualiza");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tecladovisualiza").valor;
            hdcpermitido.Value = jsonconfig.Configurate("dcpermitido");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "dcpermitido").valor;

            hsoloimagen.Value = jsonconfig.Configurate("soloimagen");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "dcpermitido").valor;

            hmuestraalmacenexterno.Value = jsonconfig.Configurate("muestraalmacenexterno");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            hmuestracodigoproducto.Value = jsonconfig.Configurate("muestracodigoproducto");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            hmuestratipo.Value = jsonconfig.Configurate("muestratipo");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            hmuestrafamilia.Value = jsonconfig.Configurate("muestrafamilia");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestrafamilia").valor;
            hmuestracategoria.Value = jsonconfig.Configurate("muestracategoria");// new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestracategoria").valor;
            hmuestraproducto.Value = jsonconfig.Configurate("muestraproducto");// new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestraproducto").valor;
            hproductobusqueda.Value = jsonconfig.Configurate("productobusqueda");// new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "productobusqueda").valor;
            hproductoimagen.Value = jsonconfig.Configurate("productoimagen");// new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "productoimagen").valor;

            hscanerbusca.Value = jsonconfig.Configurate("scanerbusca");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "scanerbusca").valor;
            hscanneragrega.Value = jsonconfig.Configurate("scanneragrega");// new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "scanneragrega").valor;

            hpedidotipo.Value = jsonconfig.Configurate("pedidotipo");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "pedidotipo").valor;
            hpedidofamilia.Value = jsonconfig.Configurate("pedidofamilia");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "pedidofamilia").valor;
            hpedidocategoria.Value = jsonconfig.Configurate("pedidocategoria");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "pedidocategoria").valor;

            hcolumnaizquierdapedido.Value = jsonconfig.Configurate("columnaizquierdapedido");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "columnaizquierdapedido").valor;
            hcolumnaderechapedido.Value = jsonconfig.Configurate("columnaderechapedido");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "columnaderechapedido").valor;
            hcajarapida.Value = jsonconfig.Configurate("cajarapida");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cajarapida").valor;

            hcambiopreciototal.Value = jsonconfig.Configurate("cambiopreciototal");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cambiopreciototal").valor;
            hpagorapidodetalle.Value = jsonconfig.Configurate("pagorapidodetalle");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "pagorapidodetalle").valor;

            hfilasindividual.Value = jsonconfig.Configurate("filasindividual");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "filasindividual").valor;
            hdescuentoglobal_permitir.Value = jsonconfig.Configurate("descuentoglobal_permitir");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "descuentoglobal_permitir").valor;

            
            hdescuentoitem_pormonto.Value = jsonconfig.Configurate("descuentoitem_pormonto");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "descuentoitem_pormonto").valor;
            hdescuentoitem_porporcentaje.Value = jsonconfig.Configurate("descuentoitem_porporcentaje");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "descuentoitem_porporcentaje").valor;
            hdescuentoitem_porporcentaje_lista.Value = jsonconfig.Configurate("descuentoitem_porporcentaje_lista");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "descuentoitem_porporcentaje_lista").valor;
            hpagorapidoglosa.Value = jsonconfig.Configurate("pagorapidoobservacion");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "pagorapidoobservacion").valor;

            hdescuentoitem_permitir.Value = jsonconfig.Configurate("descuentoitem_permitir");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "descuentoitem_permitir").valor;
            hcambioprecio.Value = jsonconfig.Configurate("cambioprecio") ?? "0";//new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "cambioprecio").valor;

            hcomisionrolpedido.Value = jsonconfig.Configurate("comisionrolpedido") ?? "0";
            hcomisioncantidadpedido.Value = jsonconfig.Configurate("comisioncantidadpedido") ?? "0";

            lblempleado.Text = string.Format("{0}:{1}", usuario_acceso, usuario_nombre);
            hcolumnaizquierdapedido.Value = (hcolumnaizquierdapedido.Value == "") ? "0" : hcolumnaizquierdapedido.Value;
            hcolumnaderechapedido.Value = (hcolumnaderechapedido.Value == "") ? "0" : hcolumnaderechapedido.Value;

            if ((Convert.ToInt32(hcolumnaizquierdapedido.Value) + Convert.ToInt32(hcolumnaderechapedido.Value))!=12) {
                hcolumnaizquierdapedido.Value = "6";
                hcolumnaderechapedido.Value = "6";
            }

            ViewState["columnaizquierdapedido"] = hcolumnaizquierdapedido.Value;
            ViewState["columnaderechapedido"] = hcolumnaderechapedido.Value;



            if (hid.Value != "0")
            {
                new TwoTecnology.Repositorio.Pedido().RemoverTransaccion(hid.Value);

                var pedido = new TwoTecnology.Repositorio.Pedido().LoadHaderSimpleByCodigo(hid.Value);
                hestado.Value = pedido.estado;
                hfecha.Value = pedido.pedidofecha;
                hclientetipo.Value = pedido.clientetipo;
                hidcliente.Value = pedido.idcliente;
                numerodocumento.Value = pedido.clientenumero;
                hguiacreacion.Value = pedido.guiacreacion;
                hcategoriascantidad.Value = pedido.categoriascantidad;
                htipopago.Value = pedido.tipopago;

                //if (pedido.ubicacion != "")
                //{
                //    lblubicacion.Text = string.Format("Ubicación:{0}", pedido.ubicacion);
                //}
            }
        }
    }
}