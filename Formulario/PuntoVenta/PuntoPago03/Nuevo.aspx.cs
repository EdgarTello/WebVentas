using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoPago03
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

            string ruc = ticket.UserData.Split('|')[1];
            string mobile = ticket.UserData.Split('|')[11];
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string localcodigo = ticket.UserData.Split('|')[10];
            string empresa_tipo = ticket.UserData.Split('|')[12];

            

            hmobile.Value = mobile;
            hid.Value = Request.QueryString["id"];
            hentrega.Value = Request.QueryString["entrega"];
            

            var pedido = new TwoTecnology.Repositorio.Pedido().LoadHaderByCodigo(hid.Value);

            if (pedido.estado == "0")
            {
                if (pedido.autorizacion == "1")
                {
                    if (!string.IsNullOrEmpty(pedido.idcliente))
                    {
                        //hidcliente.Value = pedido.idcliente;
                        
                        numerodocumento.Value = pedido.clientenumero;
                        htipodocumento.Value = pedido.clientetipo;
                        //nombre.Value = pedido.cliente;

                        hidcliente.Value = pedido.idcliente;
                        hclientenombre.Value = pedido.cliente;
                        hclienteemail.Value = pedido.email;
                        hidentrega.Value = pedido.identrega;
                        hdireccion.Value = pedido.direccion;
                        hreferencia.Value = pedido.referencia;
                        hdistrito.Value = pedido.distrito;
                        hprovincia.Value = pedido.provincia;
                        hdepartamento.Value = pedido.departamento;
                        htelefonocelular.Value = pedido.telefonocelular;
                        htelefonofijo.Value = pedido.telefonofijo;
                    }

                    hid2.Value = pedido.idpedido2;
                    hdocumentoimpresoras.Value = pedido.documentoimpresoras;
                    hdocumentoimpresoraip.Value = pedido.documentoimpresoraip;
                    htieneimpresora.Value = "1";
                    
                    

                    if (pedido.cajaimpresoraip == "")
                    {
                        if (Convert.ToInt32(pedido.documentoimpresoras) > 1)
                        {
                            htieneimpresora.Value = "0";
                        }
                    }
                    else
                        hdocumentoimpresoraip.Value = pedido.cajaimpresoraip;




                    var tipocambiotmp = new TwoTecnology.Repositorio.TipoCambio().LoadMontoCompraLast(ruc);

                    htipo.Value = pedido.tipo;
                    hidlocal.Value = pedido.idlocal;
                    htotal.Value = pedido.total;
                    hmoneda.Value = pedido.moneda;
                    htipocambio.Value = ((pedido.tipocambio == "") ? tipocambiotmp : "1");
                    //tipocambio.Value = ((pedido.tipocambio == "") ? tipocambiotmp : pedido.tipocambio);





                    hdocumentoimpresionfisico.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, pedido.idlocal, "documentoimpresionfisico").valor;
                    hdocumentoimpresionweb.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, pedido.idlocal, "documentoimpresionweb").valor;
                    hcolumnasimpresionticket.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, pedido.idlocal, "columnasimpresionticket").valor;
                    henviardetraccion.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, pedido.idlocal, "enviardetraccion").valor;
                    hpagoconsumo.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, pedido.idlocal, "pagoconsumo").valor;
                    hpagodolares.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, pedido.idlocal, "pagodolares").valor;
                    htecladovisualiza.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tecladovisualiza").valor;
                    hcajeroformapago.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cajeroformapago").valor;

                    hmaximoefectivosoles.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "maximoefectivosoles").valor;
                    hmaximoefectivodolares.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "maximoefectivodolares").valor;

                    totalpago.Value = pedido.total;
                    efectivolocalmonto.Value = "0.00";
                    hfecha.Value = pedido.pedidofecha;

                    lbltipocambio.Text = string.Format("TC:{0}", ((pedido.tipocambio == "") ? tipocambiotmp : pedido.tipocambio));
                    lblempleado.Text = string.Format("{0}:{1}", usuario_acceso, usuario_nombre);
                    lblentrega.Text = string.Format("{0}:{1}", pedido.entrega, pedido.ubicacion);
                    lblpedido.Text = string.Format("P:{0}", pedido.interno);

                    hconfigtipocambio.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, pedido.idlocal, "tipocambio").valor ?? "0";

                
                }
            }
        }
    }
}