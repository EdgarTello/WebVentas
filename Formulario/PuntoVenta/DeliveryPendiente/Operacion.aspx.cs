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
using RestSharp;


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.DeliveryPendiente
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
                string fecha = Request.QueryString["fecha"].ToString();
                string fechainicio = string.Empty;
                string fechafin = string.Empty;
                string documento = Request.QueryString["documento"];
                string di = Request.QueryString["di"];
                string tipodocumento = Request.QueryString["tipodocumento"];
                string estado = Request.QueryString["estado"];

                if (fecha != "")
                    fechainicio = fecha.Split('-')[0].ToString().Trim().ConverTo_YYYYMMDD();

                if (fecha != "")
                    fechafin = fecha.Split('-')[1].ToString().Trim().ConverTo_YYYYMMDD();

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
                            respuesta = obj.LoadByCajaSinCierreFilter_Delivery(
                                idlocal,
                                ((usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador") ? "" : idcaja),
                                fecha,
                                fechainicio,
                                fecha,
                                "",
                                documento,
                                di,
                                tipodocumento,
                                estado, //pagado
                                ruc).Serialize();
                        }
                    }
                }

            }

            if (Request.QueryString["ope"] == "4")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarPagado(id);
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}