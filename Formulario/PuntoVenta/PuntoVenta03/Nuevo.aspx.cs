using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta03
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

            string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo).Serialize();

            hstock.Value = jsonconfig.Configurate("stock");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stock").valor;
            hstockver.Value = jsonconfig.Configurate("stockver"); //new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stockver").valor;
            hcomandaimpresion.Value = jsonconfig.Configurate("comandaimpresion"); //new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "comandaimpresion").valor;
            htecladovisualiza.Value = jsonconfig.Configurate("tecladovisualiza"); //new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tecladovisualiza").valor;
            hcomandavolver.Value = jsonconfig.Configurate("comandavolver"); //new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "comandavolver").valor;
            hfamiliapedido.Value = jsonconfig.Configurate("familiapedido"); //new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "familiapedido").valor;

            if (hid.Value != "0")
            {
                new TwoTecnology.Repositorio.Pedido().RemoverTransaccion(hid.Value);

                var pedido = new TwoTecnology.Repositorio.Pedido().LoadHaderByCodigo(hid.Value);
                hestado.Value = pedido.estado;
                hfecha.Value = pedido.pedidofecha;
                hprecuentaimpresoras.Value = pedido.precuentaimpresoras;
                hprecuentaimpresoraip.Value = pedido.precuentaimpresoraip;
                hmotorizado.Value = pedido.motorizado;
                hcategoriascantidad.Value = pedido.categoriascantidad;

                lblpedido.Text = string.Format("PED:{0}", pedido.id);
                lblentrega.Text = string.Format("{0}:{1}", pedido.entrega, pedido.ubicacion);


                if (usuario_acceso == "Mesero")
                    lblempleado.Text = string.Format("{0}", pedido.mesero);


                if (usuario_acceso == "J.Mozo") 
                    lblempleado.Text = string.Format("<a href='#' onclick='cambiomesero();'>{0}</a>",
                        ((pedido.mesero == "") ? pedido.empleado : pedido.mesero));
            }

            if (usuario_acceso == "Cajero")
            {
                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    var listado = obj.AperturaByLocalEmpleado(empresaruc, localcodigo, usuario_nombre);

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

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            var absoluteReturnUrl = "../PuntoVenta/Menu/Salir.aspx";

            Response.Redirect(absoluteReturnUrl);
        }
    }
}