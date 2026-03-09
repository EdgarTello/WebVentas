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


namespace TwoTecnology.WebVentas.Formulario.Logistica.Seguridad
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
            string empresa_ruc = ticket.UserData.Split('|')[1];
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string usuario_serie = ticket.UserData.Split('|')[7];
            string puntosid = ticket.UserData.Split('|')[8];
            string ipcliente = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            //if (Request.QueryString["ope"] == "0")
            //{
            //    string id = Request.QueryString["id"];
               
            //    Metodos.ValidateAntiXsrfToken("OrdenPedidoList");

            //    if (id.IsNumeric())
            //    {



            //        using (TwoTecnology.Repositorio.GuiaRemision obj = new TwoTecnology.Repositorio.GuiaRemision())
            //        {
            //            respuesta = obj.LoadById(
            //                empresa_ruc,
            //                id).Serialize();
            //        }
            //    }
            //}

            if (Request.QueryString["ope"] == "1")
            {
                string idalmacen = Request.QueryString["idalmacen"];
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string documento = Request.QueryString["documento"];
                

                Metodos.ValidateAntiXsrfToken("SeguridadList");

                if (idalmacen.IsNumeric() && !documento.IsInyection() &&
                    !fechainicio.IsInyection() && !fechafin.IsInyection())
                {

                    

                        using (TwoTecnology.Repositorio.GuiaRemision obj = new TwoTecnology.Repositorio.GuiaRemision())
                        {
                            respuesta = obj.LoadTraslado(
                                empresa_ruc,
                                idalmacen,
                                fechainicio,
                                fechafin,
                                documento).Serialize();
                        }
                }
            }

            //if (Request.QueryString["ope"] == "3")
            //{
            //    string id = Request.QueryString["id"];

            //    Metodos.ValidateAntiXsrfToken("OrdenPedidoList");

            //    if (id.IsNumeric())
            //    {

            //        using (Repositorio.GuiaRemision obj = new TwoTecnology.Repositorio.GuiaRemision())
            //        {
            //            var orden = obj.LoadById(empresa_ruc, id);

            //            if ((orden.estado == "0" || orden.estado == "1") && orden.anulado == "0")
            //            {
            //                obj.Eliminar(empresa_ruc, id, usuario_nombre);
            //                respuesta = id;
            //            }
            //            else
            //                respuesta = string.Format("El pedido {0} no se puede procesar!", orden.correlativo);
            //        }
            //    }
            //}



            if (Request.QueryString["ope"] == "10")
            {
                string id = Request.QueryString["id"];

                Metodos.ValidateAntiXsrfToken("SeguridadList");

                if (id.IsNumeric())
                {

                    using (TwoTecnology.Repositorio.GuiaRemision obj = new TwoTecnology.Repositorio.GuiaRemision())
                    {
                        respuesta = obj.LoadDetail(empresa_ruc, id).Serialize();

                    }
                }
            }


            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}