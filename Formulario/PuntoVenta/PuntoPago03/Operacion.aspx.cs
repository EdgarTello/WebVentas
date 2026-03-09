using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.Script.Serialization;
using System.IO;
using System.Text;
using System.Configuration;
using System.Web.Security;
using System.Web.Services;
using Newtonsoft.Json;
using TwoTecnology.Entity;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoPago03
{
    public partial class Operacion : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Clear();
                    Header.Controls.Add(new LiteralControl(@"
                    <script type=""text/javascript"">
                    top.location = ""Default.aspx"";
                    parent.location = ""Default.aspx"";
                    </script>
                    "));
                    Response.End();
                    // This is an unauthorized, authenticated request...
                    //Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                }
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
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            

            if (Request.QueryString["ope"] == "1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcaja = Request.QueryString["idcaja"];
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string estado = Request.QueryString["estado"];
                string anulado = Request.QueryString["anulado"];
                string documento = Request.QueryString["documento"];
                string di = Request.QueryString["di"];
                string tipodocumento = Request.QueryString["tipodocumento"];

                if (usuario_acceso == "Administrador" || usuario_acceso == "SuperAdmin" ||
                    usuario_acceso == "Cajero")
                {

                    if (movil == "1")
                    {
                        using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                        {
                            respuesta = obj.LoadByCajaMobilSinCierreFilter("", "", ruc);
                        }
                    }
                    else
                    {
                        using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                        {
                            respuesta = obj.LoadByCajaSinCierreFilter(
                                idlocal,
                                ((usuario_acceso == "SuperAdmin" || usuario_acceso == "Admin") ? "" : idcaja),
                                fechainicio,
                                fechafin,
                                estado,
                                "",
                                anulado,
                                documento,
                                di,
                                tipodocumento,
                                ruc);
                        }
                    }
                }

            }


            if (Request.QueryString["ope"] == "2")
            {
                string id = Request.QueryString["id"];
                string impresora = Request.QueryString["impresora"] ?? "";

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarImpresion(id, impresora);
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.PedidoCliente pedido = JsonConvert.DeserializeObject<Entity.PedidoCliente>(json);


                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    if (obj.EnTransaccion(pedido.id))
                    {
                        obj.ActualizarPedido(
                            pedido.id,
                            pedido.tipo,
                            pedido.idcliente,
                            pedido.tipocliente,
                            pedido.numerodocumento,
                            pedido.nombre,
                            pedido.direccion,
                            pedido.referencia,
                            pedido.departamento,
                            pedido.provincia,
                            pedido.distrito,
                            pedido.telefonofijo,
                            pedido.telefonocelular,
                            pedido.email,
                            pedido.totalefectivo,
                            pedido.vuelto,
                            pedido.imprimir,

                            pedido.glosa,
                            ((pedido.formapagotexto == "") ? "Contado" : pedido.formapagotexto),
                            pedido.impresora,
                            pedido.vendedor,
                            pedido.pagoconsumo,
                            pedido.tipocambio,
                            pedido.ordencompra,
                            pedido.numeroguia,
                            ""
                            );

                        foreach (var item in pedido.pedidopago)
                        {
                            obj.AgregarPago(pedido.id, item.tipopago, item.moneda, item.monto, item.propina,
                                item.operacion, item.fecha);
                        }

                        foreach (var item in pedido.formapago)
                        {
                            obj.AgregarForma(pedido.id, item.nombre, item.moneda, item.monto, item.fecha);
                        }

                        obj.ActualizarCierre(pedido.id);

                        obj.ActualizarStock(pedido.id);

                        respuesta = "Documento Generado!";
                    }
                    else
                    {
                        respuesta = "Documento en transacción!";
                    }

                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}