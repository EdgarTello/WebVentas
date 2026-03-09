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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.LocalUbicacion
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
            string LocalUbicacioncodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            if (Request.QueryString["ope"] == "0")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion())
                    respuesta = obj.LoadByCodigo(id).Serialize();
            }

            if (Request.QueryString["ope"] == "1")
            {
                using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion())
                {
                    string idlocal = Request.QueryString["idlocal"];
                    respuesta = obj.LoadByLocal(idlocal, ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                string idlocal = Request.QueryString["idlocal"];
                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string idubicacion = Request.QueryString["idubicacion"];
                string usaalias = Request.QueryString["usaalias"]; 
                string minimo = Request.QueryString["minimo"];
                string maximo = Request.QueryString["maximo"];
                string orden = Request.QueryString["orden"];


                using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion())
                {
                    if (id == "0")
                    {
                        if (obj.ExisteByNombre(idlocal, nombre))
                            respuesta = "La ubicación existe en el local seleccionado!";
                        else
                            obj.Agregar(idlocal, nombre, idubicacion, usaalias, minimo, maximo, orden );
                    }
                    else
                        obj.Editar(id, nombre, idubicacion, usaalias, minimo, maximo, orden);
                }
                
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion()){
                    obj.Eliminar(id);
                }
            }

            

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}