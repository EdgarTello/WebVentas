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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.ValesConsumo
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
                string id = Request.QueryString["id"];

                using (Repositorio.ValesConsumo obj = new TwoTecnology.Repositorio.ValesConsumo())
                {
                    respuesta = obj.LoadByCodigo(ruc, id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {
                string idclientecategoria = Request.QueryString["idclientecategoria"];
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();


                using (Repositorio.ValesConsumo obj = new TwoTecnology.Repositorio.ValesConsumo())
                {
                    respuesta = obj.Load(ruc, idclientecategoria, fechainicio, fechafin).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_1")
            {
                string idcliente = Request.QueryString["idcliente"];


                using (Repositorio.ValesConsumo obj = new TwoTecnology.Repositorio.ValesConsumo())
                {
                    respuesta = obj.LoadByCliente(idcliente).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string nombre = HttpUtility.UrlDecode(Request.QueryString["nombre"]);
                


                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string idclientecategoria = Request.QueryString["idclientecategoria"];
                    string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                    string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                    string monto = Request.QueryString["monto"];
                    string cantidad = Request.QueryString["cantidad"];

                    using (Repositorio.ValesConsumo obj = new TwoTecnology.Repositorio.ValesConsumo())
                    {
                        if (id == "0")
                        {
                            obj.Agregar(ruc, nombre, idclientecategoria, fechainicio, fechafin, monto, cantidad);
                        }
                        else
                            obj.Editar(id, nombre, idclientecategoria, fechainicio, fechafin, monto, cantidad);

                    }
                }
            }

            

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.ValesConsumo obj = new TwoTecnology.Repositorio.ValesConsumo())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "10")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.ValesConsumo obj = new TwoTecnology.Repositorio.ValesConsumo())
                {
                    obj.Imprimir(id);
                }
            }


            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}