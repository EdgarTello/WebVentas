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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.LlevarPendiente
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
                //string fechafin = Request.QueryString["fechafin"].ToString();
                //string fechainicio = string.Empty;
                //string fecha = string.Empty;
                string documento = Request.QueryString["documento"];
                string di = Request.QueryString["di"];
                string tipodocumento = Request.QueryString["tipodocumento"];
                string estado = Request.QueryString["estado"];

                /*
                if (fecha != "")
                    fechainicio = fecha.Split('-')[0].ToString().Trim().ConverTo_YYYYMMDD();

                if (fecha != "")
                    fecha = fecha.Split('-')[1].ToString().Trim().ConverTo_YYYYMMDD();

                */
                if (usuario_acceso == "Administrador" || usuario_acceso == "SuperAdmin" ||
                    usuario_acceso == "Cajero")
                {

                  
                    using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                    {
                        respuesta = obj.LoadByCajaSinCierreFilter_ParaLlevar_v2(
                            idlocal,
                            ((usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador") ? "" : idcaja),
                            //fechafin,
                            //fechainicio,
                            //fecha,
                            "",
                            documento,
                            di,
                            tipodocumento,
                            estado, //pagado
                            ruc).Serialize();
                    }
                    
                }

            }


            if (Request.QueryString["ope"] == "2")
            {
                string ninos = Request.QueryString["ninos"];
                string adultos = Request.QueryString["adultos"];
                string ancianos = Request.QueryString["ancianos"];
                string hombres = Request.QueryString["hombres"];
                string mujeres = Request.QueryString["mujeres"];
                string personas = Request.QueryString["personas"];
                string idubicacion = Request.QueryString["idubicacion"];
                string empleado = Request.QueryString["empleado"];
                string idlocal = Request.QueryString["idlocal"];
                string entrega = Request.QueryString["entrega"];
                string pagado = Request.QueryString["pagado"];
                string idcaja = Request.QueryString["idcaja"];
                string caja = Request.QueryString["caja"];
                string serie = Request.QueryString["serie"];
                string impresora = Request.QueryString["impresora"];
                string alias = string.Empty;

                if (!(Request.QueryString["alias"] == null))
                    alias = HttpUtility.UrlDecode(Request.QueryString["alias"].ToString());

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {

                    respuesta = obj.AgregarPersonas(idubicacion, ninos, adultos,
                        ancianos, hombres, mujeres, personas, empleado, idlocal,
                        entrega, pagado, alias, idcaja, caja, serie, impresora,
                        ((usuario_acceso == "Mesero") ? empleado : ""),"","","00","00",
                        "",ruc);
                }
            }

            if (Request.QueryString["ope"] == "10")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta = obj.LoadDetailAll(id, "").Serialize();

                }
            }

            if (Request.QueryString["ope"] == "91")
            {
                using (Repositorio.Configuracion obj = new TwoTecnology.Repositorio.Configuracion())
                {
                    respuesta = obj.LoadTexto(ruc, localcodigo, "aperturacaja");
                }
            }

            if (Request.QueryString["ope"] == "92")
            {
                using (TwoTecnology.Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    respuesta = obj.AperturaExisteByLocalEmpleado(ruc, localcodigo, usuario_nombre);
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}