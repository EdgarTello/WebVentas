using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoAN03
{
    public partial class Nuevo : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");

                if (Request.QueryString["id"] != null)
                    hid.Value = Request.QueryString["id"];

                if (Request.QueryString["entrega"] != null)
                    hentrega.Value = Request.QueryString["entrega"];

                if (Request.QueryString["pagina"] != null)
                    hpagina.Value = Request.QueryString["pagina"];
               
                if (Request.QueryString["pagado"] != null)
                    hpagado.Value = Request.QueryString["pagado"];

                if (Request.QueryString["idubicacion"] != null)
                    hidubicacion.Value = Request.QueryString["idubicacion"];
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
            hacceso.Value = usuario_acceso;

            hidlocal.Value = localcodigo;
            hstock.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stock").valor;
            hstockver.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stockver").valor;
            hanulacioncomanda.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "anulacioncomanda").valor;
            hcomandaimpresion.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "comandaimpresion").valor;
            hprecuentaimpresion.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "precuentaimpresion").valor;
            hcolumnaizquierdapedido.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "columnaizquierdapedido").valor;
            hcolumnaderechapedido.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "columnaderechapedido").valor;


            string perfilcambioprecio = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cambioprecio").valor;

            if (usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador" || usuario_acceso == perfilcambioprecio)
            {
                cambioprecio = "1";
            }

            hcambioprecio.Value = cambioprecio;

            hcolumnaizquierdapedido.Value = (hcolumnaizquierdapedido.Value == "") ? "0" : hcolumnaizquierdapedido.Value;
            hcolumnaderechapedido.Value = (hcolumnaderechapedido.Value == "") ? "0" : hcolumnaderechapedido.Value;

            if ((Convert.ToInt32(hcolumnaizquierdapedido.Value) + Convert.ToInt32(hcolumnaderechapedido.Value)) != 12)
            {
                hcolumnaizquierdapedido.Value = "6";
                hcolumnaderechapedido.Value = "6";
            }

            ViewState["columnaizquierdapedido"] = hcolumnaizquierdapedido.Value;
            ViewState["columnaderechapedido"] = hcolumnaderechapedido.Value;

            if (hid.Value != "0")
            {
                new TwoTecnology.Repositorio.Pedido().RemoverTransaccion(hid.Value);

                var pedido = new TwoTecnology.Repositorio.Pedido().LoadHaderByCodigo(hid.Value);
                htipofererencia.Value = pedido.tiporeferencia;
                hindicador.Value= pedido.indicador;
                hestado.Value = pedido.estado;
                hfecha.Value = pedido.pedidofecha;
                htipo.Value = pedido.tipo;


                lblcliente.Text = string.Format("Cliente:{0}", pedido.cliente.Left(20));
                //lblentrega.Text = string.Format("{0}:{1}", pedido.entrega, pedido.ubicacion);
                lblempleado.Text = string.Format("{0}", pedido.mesero);
            }

            if (usuario_acceso == "Cajero")
            {
                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    var listado = obj.AperturaByLocalEmpleado(ruc, localcodigo, usuario_nombre);

                    foreach (var item in listado)
                    {
                        hidcaja.Value = item.idcaja;
                        hcaja.Value = item.caja;
                        hserie.Value = item.serie;
                        himpresora.Value = item.impresora;

                    }
                }
            }
        }
    }
}