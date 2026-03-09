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

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoNC03
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
            string empresaruc = ticket.UserData.Split('|')[1];
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string usuario_serie = ticket.UserData.Split('|')[7];
            string puntosid = ticket.UserData.Split('|')[8];
            string ipcliente = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];
                string indicador = Request.QueryString["indicador"];
                string tipo = Request.QueryString["tipo"];
                string idcaja = Request.QueryString["idcaja"];
                string caja = Request.QueryString["caja"];
                string serie = Request.QueryString["serie"];
                string motivoid = Request.QueryString["motivoid"];
                string motivotext = HttpUtility.UrlDecode(Request.QueryString["motivotext"]);

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    doc.ActualizarCabecera(id);
                    doc.ActualizarCabeceraNC(id);
                    doc.ActualizarTipo(id, tipo, indicador, idcaja, caja, serie, "", "0", "0", motivoid, motivotext);

                }

                respuesta = id;
            }

            if (Request.QueryString["ope"] == "4")
            {
                string id = Request.QueryString["id"];
                string idmotivo = Request.QueryString["idmotivo"];
                string producto = Request.QueryString["producto"];
                string total = Request.QueryString["total"];

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    doc.EliminarDetalle_v3(id);
                    doc.ActualizarMotivoReferencia(id, idmotivo);
                    doc.AgregarDetalle_v2(id, producto, total);
                    
                }

                respuesta = id;
            }

            if (Request.QueryString["ope"] == "10")
            {   
                using (TwoTecnology.Repositorio.TipoNotaCredito doc = new TwoTecnology.Repositorio.TipoNotaCredito())
                {
                    respuesta= doc.Load(empresaruc).Serialize();
                }
            }


            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}