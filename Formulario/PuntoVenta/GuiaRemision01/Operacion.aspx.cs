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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaRemision01
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
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string estado = Request.QueryString["estado"];
                string anulado = Request.QueryString["anulado"];
                string documento = Request.QueryString["documento"];
                string externo = Request.QueryString["externo"];
                string detalle = Request.QueryString["detalle"];


                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    respuesta = obj.LoadByLocalFilter(idlocal, fechainicio, fechafin,
                        estado,
                        usuario_codigo,
                        usuario_acceso,
                        ((usuario_acceso == "SuperAdmin" || usuario_acceso == "Admin") ? "" : usuario_nombre), 
                        anulado,
                        documento,
                        "1",
                        externo,
                        detalle,
                        ruc).Serialize();
                }

            }

            if (Request.QueryString["ope"] == "2") { 
                string id = Request.QueryString["id"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                    respuesta = obj.LoadByCodigoWithDetail(id).Serialize();
            }

            if (Request.QueryString["ope"] == "3")
            {
                string codigo = "0";
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);

                Entity.Guia guia = JsonConvert.DeserializeObject<Entity.Guia>(json);


                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    if (guia.id == "0")
                    {
                        codigo = obj.Agregar(ruc, guia.idlocal, guia.serie, guia.empleado, guia.idalmacen,
                            guia.tipo, guia.total, guia.imprimir);

                        foreach (var item in guia.guiadetalle)
                        {
                            obj.AgregarDetalle(codigo, item.idproducto, item.cantidad, item.precio, item.total);
                        }

                        respuesta = codigo;
                    }
                    else
                    {

                        codigo = obj.Actualizar(guia.id, guia.tipo, guia.total);

                        foreach (var item in guia.guiadetalle)
                        {
                            obj.ActualizarDetalle(guia.id, item.idproducto, item.cantidad, item.precio, item.total);
                        }

                        respuesta = codigo;
                    }
                }
            }

            if (Request.QueryString["ope"] == "4")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "5")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.ActualizarImpresion(id);
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}