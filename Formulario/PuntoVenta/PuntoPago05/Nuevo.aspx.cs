using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoPago05
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
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string mobile = ticket.UserData.Split('|')[11];
            hmobile.Value = mobile;
            hid.Value = Request.QueryString["id"];
            hentrega.Value = Request.QueryString["entrega"];

            var pedido = new TwoTecnology.Repositorio.Pedido().LoadByCodigo(hid.Value);


            if (pedido.autorizacion == "1")
            {
                if (!string.IsNullOrEmpty(pedido.idcliente))
                {
                    //hidcliente.Value = pedido.idcliente;

                    numerodocumento.Value = string.Format("{0}-{1}", pedido.clientetipodes, pedido.clientenumero);
                    nombre.Value = pedido.cliente;
                    direccion.Value = pedido.direccion;
                    ubigeo.Value = string.Format("{0}-{1}-{2}", pedido.distrito, pedido.provincia, pedido.departamento);
                    telefonocelular.Value = pedido.telefonocelular;
                    telefonofijo.Value = pedido.telefonofijo;
                }



                var tipocambiotmp = new TwoTecnology.Repositorio.TipoCambio().LoadMontoCompraLast(ruc);

                htipo.Value = pedido.tipo;
                htotal.Value = pedido.total;
                htipocambio.Value = ((pedido.tipocambio == "") ? tipocambiotmp : pedido.tipocambio);
                //tipocambio.Value = ((pedido.tipocambio == "") ? tipocambiotmp : pedido.tipocambio);
                totalpago.Value = String.Format("{0:#,##0.00}", Convert.ToDecimal(pedido.total));
                htipocambio.Value = ((pedido.tipocambio == "") ? tipocambiotmp : pedido.tipocambio);
                hmoneda.Value = pedido.moneda;

                hconfigtipocambio.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, pedido.idlocal, "tipocambio").valor ?? "0";
                htecladovisualiza.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, pedido.idlocal, "tecladovisualiza").valor;

                lbltipocambio.Text = string.Format("TC:{0}", ((pedido.tipocambio == "") ? tipocambiotmp : pedido.tipocambio));
                lblempleado.Text = string.Format("{0}:{1}", usuario_acceso, usuario_nombre);
                lblubicacion.Text = string.Format("MESA:{0}", pedido.ubicacion);
                lblpedido.Text = string.Format("PEDIDO:{0}", pedido.id);

                hmotorizado.Value = pedido.motorizado;
                lblmotorizado.Text = string.Format("MOTORIZADO:<a href='#' onclick='cambiomotorizado();'>{0}</a>",
                    ((pedido.motorizado == "") ? "Ninguno" : pedido.motorizado));
            }
        }
    }
}