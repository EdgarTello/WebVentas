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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Personalizar
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

                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {
                string idtipo = Request.QueryString["idtipo"];
                string idgrupo = Request.QueryString["idgrupo"];

                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    respuesta = obj.Load(ruc, idtipo, idgrupo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {

                string id = Request.QueryString["id"];
                string idtipo = Request.QueryString["idtipo"];
                string tipo = Request.QueryString["tipo"];
                string idproducto = Request.QueryString["idproducto"];
                string cantidad = Request.QueryString["cantidad"];
                string idgrupo = Request.QueryString["idgrupo"];
                string grupo = Request.QueryString["grupo"];
                string seleccion = Request.QueryString["seleccion"];
                string nombre = Request.QueryString["nombre"];
                string orden = Request.QueryString["orden"];


                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    if (id == "0")
                        obj.Agregar(idtipo, idgrupo, grupo, seleccion, nombre, orden, idproducto, tipo, cantidad, ruc);
                    else
                        obj.Editar(id, nombre, orden, idproducto, tipo, cantidad);

                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "5")
            {

                string id = Request.QueryString["id"];
               
                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    obj.Activar(id);

                }
            }

            if (Request.QueryString["ope"] == "6")
            {

                string id = Request.QueryString["id"];

                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    obj.Desactivar(id);

                }
            }


            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}