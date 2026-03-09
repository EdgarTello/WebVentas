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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.AlmacenSerie
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
            string AlmacenSeriecodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            if (Request.QueryString["ope"] == "0")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    respuesta = obj.LoadAlmacenByCodigo(id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {

                string idalmacen = Request.QueryString["idalmacen"];

                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    respuesta = obj.LoadByAlmacen(idalmacen).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_1")
            {

                string idalmacen = Request.QueryString["idalmacen"];

                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    respuesta = obj.LoadByAlmacenActivo(idalmacen).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                string id = Request.QueryString["id"];              
               
                string idalmacen = Request.QueryString["idalmacen"];
                string tipo = Request.QueryString["tipo"];
                string indicador = Request.QueryString["indicador"];

                string serie = Request.QueryString["serie"];
                string correlativo = Request.QueryString["correlativo"];
                string orden = Request.QueryString["orden"];



                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    if (id == "0")
                    {
                        if (obj.ExisteByDatosAlmacen(ruc, idalmacen, serie))
                            respuesta = "La serie existe en el almacen seleccionado!";
                        else
                            obj.AlmacenAgregar(idalmacen, tipo, indicador,serie,correlativo, orden);
                    }
                    else
                        obj.AlmacenEditar(id, tipo, indicador, serie, correlativo, orden);
                }
                
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];
                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                    obj.AlmacenEliminar(id);
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}