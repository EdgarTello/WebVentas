using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta04
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
            string empresaruc = ticket.UserData.Split('|')[1];
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string usuario_serie = ticket.UserData.Split('|')[7];
            string puntosid = ticket.UserData.Split('|')[8];
            string ipcliente = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string mobile = ticket.UserData.Split('|')[11];
            

            hempleado.Value = usuario_nombre;
            hmobile.Value = mobile;
            hacceso.Value = usuario_acceso;
            hidlocal.Value = localcodigo;

            if (usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador")
            {
                var pedido = new TwoTecnology.Repositorio.Pedido().LoadHaderByCodigo(hid.Value);
                hidlocal.Value = pedido.idlocal;
                localcodigo = pedido.idlocal;
            }

            string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo).Serialize();

            hstock.Value = jsonconfig.Configurate("stock");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stock").valor;
            hstockver.Value = jsonconfig.Configurate("stockver");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stockver").valor;
            hanulacioncomanda.Value = jsonconfig.Configurate("anulacioncomanda");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "anulacioncomanda").valor;
            hcomandaimpresion.Value = jsonconfig.Configurate("comandaimpresion");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "comandaimpresion").valor;
            hprecuentaimpresion.Value = jsonconfig.Configurate("precuentaimpresion");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "precuentaimpresion").valor;
            htecladovisualiza.Value = jsonconfig.Configurate("tecladovisualiza");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tecladovisualiza").valor;
            hdcpermitido.Value = jsonconfig.Configurate("dcpermitido");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "dcpermitido").valor;

            
            //hfamiliapedido.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "familiapedido").valor;

            hllevarcomanda.Value = jsonconfig.Configurate("llevarcomanda");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "llevarcomanda").valor;
            hllevarcategoria.Value = jsonconfig.Configurate("llevarcategoria");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "llevarcategoria").valor;
            hcolumnaizquierdapedido.Value = jsonconfig.Configurate("columnaizquierdapedido");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "columnaizquierdapedido").valor;
            hcolumnaderechapedido.Value = jsonconfig.Configurate("columnaderechapedido");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "columnaderechapedido").valor;
            hcajarapida.Value = jsonconfig.Configurate("cajarapida");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cajarapida").valor;

            hmuestratipo.Value = jsonconfig.Configurate("muestratipo");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            hmuestrafamilia.Value = jsonconfig.Configurate("muestrafamilia");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestrafamilia").valor;
            hmuestracategoria.Value = jsonconfig.Configurate("muestracategoria");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestracategoria").valor;
            hmuestraproducto.Value = jsonconfig.Configurate("muestraproducto");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestraproducto").valor;
            hproductobusqueda.Value = jsonconfig.Configurate("productobusqueda");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "productobusqueda").valor;
            hproductoimagen.Value = jsonconfig.Configurate("productoimagen");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "productoimagen").valor;

            hscanerbusca.Value = jsonconfig.Configurate("scanerbusca");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "scanerbusca").valor;
            hscanneragrega.Value = jsonconfig.Configurate("scanneragrega");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "scanneragrega").valor;

            hdescuentoitem_permitir.Value = jsonconfig.Configurate("descuentoitem_permitir");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "descuentoitem_permitir").valor;
            hpedidocortesia.Value = jsonconfig.Configurate("pedidocortesia") ?? "0";// new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "pedidocortesia").valor;
            hcambioprecio.Value = jsonconfig.Configurate("cambioprecio") ?? "0";//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cambioprecio").valor;
            hcambiopreciototal.Value = jsonconfig.Configurate("cambiopreciototal");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cambiopreciototal").valor;

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
                hestado.Value = pedido.estado;
                hfecha.Value = pedido.pedidofecha;
                hcategoriascantidad.Value = pedido.categoriascantidad;
                
                hprecuentaimpresoras.Value = pedido.precuentaimpresoras;
                hprecuentaimpresoraip.Value = pedido.precuentaimpresoraip;
                hid2.Value = pedido.idpedido2;

                if (pedido.entrega=="DELIVERY")
                    lblmotorizado.Text = string.Format("<a href='#' onclick='cambiomotorizado();'>{0}</a>",
                        ((pedido.motorizado == "") ? "Ninguno" : pedido.motorizado));

                //if (pedido.entrega == "MESA")
                //    lblubicacion.Text = string.Format("{0}", pedido.ubicacion);

                lblpedido.Text = string.Format("PED:{0}", pedido.interno);
                lblentrega.Text = string.Format("{0}:{1}", pedido.entrega, pedido.ubicacion);

                if (pedido.entrega == "MESA")
                    lblempleado.Text = string.Format("<a href='#' onclick='cambiomesero();'>{0}</a>", 
                        ((pedido.mesero=="")?pedido.empleado:pedido.mesero));
            }

            if (usuario_acceso == "Cajero" || usuario_acceso == "Administrador")
            {
                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    var listado = obj.AperturaByLocalEmpleado(empresaruc, localcodigo, 
                        ((usuario_acceso == "Administrador") ?"": usuario_nombre)
                        );

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