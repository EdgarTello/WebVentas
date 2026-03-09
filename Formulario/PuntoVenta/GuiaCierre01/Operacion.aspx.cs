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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaCierre01
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


            if (Request.QueryString["ope"] == "2")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.GuiaCliente guia = JsonConvert.DeserializeObject<Entity.GuiaCliente>(json);


                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {

                    if (obj.EnTransaccion(guia.id))
                    {
                        obj.ActualizarGuia(guia.id, guia.tipo, guia.idmotivo, 
                            guia.unidad, guia.cantidad,
                            guia.bultos, 
                            guia.idtransporte, guia.idconductor, 
                            guia.fechatraslado.ConverTo_YYYYMMDD(), 
                            guia.horatraslado,

                            guia.fechaentrega.ConverTo_YYYYMMDD(),
                            guia.horaentrega,

                            guia.idalmacen,
                            guia.observacion,
                            guia.clasificacion,

                            guia.indicador,
                            guia.serie,
                            guia.correlativo);

                        obj.ActualizarStock(guia.id);

                        obj.ActualizarCierre(guia.id);

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