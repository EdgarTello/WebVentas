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


namespace TwoTecnology.WebVentas.Formulario.Logistica.Presentacion
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

                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.Load(ruc, "1",nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_1")
            {
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.LoadAll(ruc, "1", nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {

                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string descripcion = Request.QueryString["descripcion"];
                string codigosunat = Request.QueryString["codigosunat"];


                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    if (id == "0")
                        if (obj.ExisteByNombre(ruc, nombre))
                            respuesta = "La presentación existe!";
                        else
                            obj.Agregar(ruc, "1",nombre, descripcion, codigosunat);
                    else
                        obj.Editar(id, nombre, descripcion, codigosunat);

                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "4")
            {
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.Load(ruc, "0", nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "5")
            {
                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.Load(ruc, "0").Serialize();
                }
            }

            if (Request.QueryString["ope"] == "6")
            {
                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.Load(ruc, "1").Serialize();
                }
            }

            if (Request.QueryString["ope"] == "6_1")
            {
                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.Load(ruc, "1").Serialize();
                }
            }

            if (Request.QueryString["ope"] == "7")
            {
                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.Load(ruc, "2").Serialize();
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}