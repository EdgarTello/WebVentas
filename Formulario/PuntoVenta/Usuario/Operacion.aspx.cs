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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Usuario
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
            string ipColaborador = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            if (Request.QueryString["ope"] == "0")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadByCodigo_v2(ruc, id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {

                string acceso = Request.QueryString["acceso"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.Load(ruc, nombre, localcodigo, usuario_acceso, acceso).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_1")
            {

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.Lista(ruc, localcodigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string apellidos = Request.QueryString["apellidos"];
                string usuario = Request.QueryString["usuario"];
                string password = Request.QueryString["password"];

                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }

                if (usuario.Length < 4)
                {
                    respuesta = "El usuario debe contener mas de 4 caracteres!";
                    blnerror = true;
                }

                if (password.Length < 4)
                {
                    respuesta = "La contraseña debe contener mas de 4 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string email = Request.QueryString["email"];
                    string acceso = Request.QueryString["acceso"];
                    string idlocal = Request.QueryString["idlocal"];
                    string idperfil = Request.QueryString["idperfil"];

                    string bloqueado = Request.QueryString["bloqueado"];

                    using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                    {
                       
                        if (id == "0")
                        {
                            if (obj.ExisteLoginByLocal(ruc, idlocal, usuario))
                            {

                                respuesta = "El colaborador se encuentra registrado en el local!";
                            }
                            else
                            {

                                obj.Agregar(ruc, nombre, apellidos, email,
                                acceso, usuario, password, idlocal, idperfil, bloqueado);
                            }
                            
                        }
                        else
                        {
                            obj.Editar(id, nombre, apellidos, email,
                                acceso, usuario, password, idlocal,
                                idperfil, bloqueado);

                        }
                        
                    }
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    obj.Eliminar(id);
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}