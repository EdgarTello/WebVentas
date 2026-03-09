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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.DeliveryDireccion
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

            if (Request.QueryString["ope"] == "0")
            {
                string codigo = Request.QueryString["id"];

                using (Repositorio.ClienteDireccion obj = new TwoTecnology.Repositorio.ClienteDireccion())
                {
                    respuesta = obj.LoadByCodigo(codigo).Serialize();
                }
            }

           

            if (Request.QueryString["ope"] == "1")
            {
                string idcliente = Request.QueryString["idcliente"];

                if (idcliente.IsNumeric())
                {

                    using (Repositorio.ClienteDireccion obj = new TwoTecnology.Repositorio.ClienteDireccion())
                    {
                        respuesta = obj.Load(ruc, idcliente).Serialize();
                    }
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string idcliente = Request.QueryString["idcliente"];

                if (!blnerror)
                {
                    string departamento = Request.QueryString["departamento"];
                    string provincia = Request.QueryString["provincia"];
                    string distrito = Request.QueryString["distrito"];
                    string direccion = HttpUtility.UrlDecode(Request.QueryString["direccion"]);
                    string referencia = HttpUtility.UrlDecode(Request.QueryString["referencia"]);
                    string ubigeo = Request.QueryString["ubigeo"];
                    string telefonofijo = Request.QueryString["telefonofijo"];
                    string telefonocelular = Request.QueryString["telefonocelular"];
                    string email = Request.QueryString["email"];
                    string contacto = Request.QueryString["contacto"];
                    string nombre = Request.QueryString["nombre"];

                    using (Repositorio.ClienteDireccion obj = new TwoTecnology.Repositorio.ClienteDireccion())
                    {
                        if (id == "0")
                        {
                            respuesta = obj.Agregar(idcliente, departamento, provincia, distrito, 
                                        direccion, referencia , ubigeo, telefonofijo,
                                        telefonocelular, email, contacto, nombre);
                        }
                        else
                            respuesta = obj.Editar(id, 
                                departamento, provincia, distrito, direccion, referencia,
                                ubigeo, telefonofijo, telefonocelular, email, contacto, nombre);

                    }
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.ClienteDireccion obj = new TwoTecnology.Repositorio.ClienteDireccion())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "4")
            {
                string empleado = Request.QueryString["empleado"];
                string idcliente = Request.QueryString["idcliente"];
                string identrega = Request.QueryString["identrega"];
                string idlocal = Request.QueryString["idlocal"];
                string idcaja = Request.QueryString["idcaja"];
                string caja = Request.QueryString["caja"];
                string impresora = HttpUtility.UrlDecode(Request.QueryString["impresora"]);
                string entrega = Request.QueryString["entrega"];
                string pagado = Request.QueryString["pagado"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {

                    respuesta = obj.AgregarPedidoDelivery(empleado, idcliente,
                        identrega,
                        idlocal, idcaja, caja, impresora, entrega, pagado,ruc);
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}