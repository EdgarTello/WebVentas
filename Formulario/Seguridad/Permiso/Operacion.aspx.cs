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


namespace TwoTecnology.WebVentas.Formulario.Seguridad.Permiso
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
            string ipColaborador = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            if (Request.QueryString["ope"] == "0")
            {
                string id = Request.QueryString["id"];

                Metodos.ValidateAntiXsrfToken("PermisoNew");

                using (TwoTecnology.Repositorio.Roles obj = new TwoTecnology.Repositorio.Roles())
                {
                    respuesta = obj.LoadById(empresaruc, id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {
                                
                Metodos.ValidateAntiXsrfToken("PermisoList");

                string idrol = Request.QueryString["idrol"];

                if (idrol.IsNumeric())
                {

                    using (TwoTecnology.Repositorio.RolesxPagina obj = new TwoTecnology.Repositorio.RolesxPagina())
                    {
                        respuesta = obj.Load(empresaruc, idrol).Serialize();
                    }
                }
            }

            
            if (Request.QueryString["ope"] == "2")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string paginadefecto = Request.QueryString["paginadefecto"];
                string paginaredireccion = Request.QueryString["paginaredireccion"];
                string orden = Request.QueryString["orden"];
                string activo = Request.QueryString["activo"];

                Metodos.ValidateAntiXsrfToken("PermisoNew");

                if (id.IsNumeric() && 
                    !nombre.IsInyection() &&
                    !paginadefecto.IsInyection() && 
                    !paginaredireccion.IsInyection() &&
                    orden.IsNumeric() && 
                    activo.IsNumeric())
                {

                    if (nombre.Length < 5)
                    {
                        respuesta = "El nombre debe contener mas de 4 caracteres!";
                        blnerror = true;
                    }


                    if (!blnerror)
                    {


                        using (TwoTecnology.Repositorio.Roles obj = new TwoTecnology.Repositorio.Roles())
                        {

                            if (id == "0")
                            {
                                if (obj.ExisteRolByNombre(empresaruc, nombre))
                                {
                                    respuesta = "El rol se encuentra registrado!";
                                }
                                else
                                {

                                    obj.Agregar(empresaruc, nombre, paginadefecto, paginaredireccion, activo);
                                }
                            }
                            else
                            {
                                obj.Editar(id, nombre, nombre, paginadefecto, paginaredireccion, activo);

                            }
                        }
                    }
                }
                else {
                    respuesta = "Error interno!";

                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                if (id.IsNumeric())
                {

                    Metodos.ValidateAntiXsrfToken("PermisoList");

                    using (TwoTecnology.Repositorio.Roles obj = new TwoTecnology.Repositorio.Roles())
                    {
                        obj.Eliminar(empresaruc, id);
                    }
                }
            }

            

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}