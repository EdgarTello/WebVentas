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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaCliente01
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

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadByCodigo(ruc, id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.Load(ruc, nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string tipo_documento = Request.QueryString["tipo_documento"];
                string num_documento = Request.QueryString["num_documento"];
                string nombre = HttpUtility.UrlDecode(Request.QueryString["nombre"]);


                if (tipo_documento == "1")
                {
                    if (num_documento.Length != 8)
                    {
                        respuesta = "El tipo de documento DNI debe contener 8 caracteres!";
                        blnerror = true;
                    }
                }

                if (tipo_documento == "6")
                {
                    if (num_documento.Length != 11)
                    {
                        respuesta = "El tipo de documento RUC debe contener 11 caracteres!";
                        blnerror = true;
                    }
                }


                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string sexo = Request.QueryString["sexo"];
                    string fecha_nacimiento = Request.QueryString["fecha_nacimiento"];

                    string departamento = Request.QueryString["departamento"];
                    string provincia = Request.QueryString["provincia"];
                    string distrito = Request.QueryString["distrito"];
                    string direccion = HttpUtility.UrlDecode(Request.QueryString["direccion"]);
                    string referencia = HttpUtility.UrlDecode(Request.QueryString["referencia"]);
                    string ubigeo = Request.QueryString["ubigeo"];
                    string telefonofijo = Request.QueryString["telefonofijo"];
                    string telefonocelular = Request.QueryString["telefonocelular"];
                    string email = Request.QueryString["email"];
                    string latitud = Request.QueryString["latitud"];
                    string longitud = Request.QueryString["longitud"];
                    string contacto = Request.QueryString["contacto"];

                    using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                    {
                        if (id == "0")
                        {
                            if (tipo_documento == "0" && num_documento == "00000000")
                            {
                                respuesta = obj.Agregar(ruc, nombre, sexo, fecha_nacimiento, tipo_documento, num_documento,
                                           departamento, provincia, distrito, direccion, referencia, ubigeo, telefonofijo,
                                           telefonocelular, email, latitud, longitud, contacto, "","", "0", "");
                            }
                            else { 
                            
                                if (obj.ExisteByDocumento(ruc, num_documento))
                                    respuesta = "Numero de documento existe!";
                                else
                                    respuesta = obj.Agregar(ruc, nombre, sexo, fecha_nacimiento, tipo_documento, num_documento,
                                            departamento, provincia, distrito, direccion, referencia, ubigeo, telefonofijo,
                                            telefonocelular, email, latitud, longitud, contacto, "","", "0", "");
                            }
                        }
                        else
                            if (obj.ExisteByDocumentoEditar(ruc, id, num_documento))
                            respuesta = "Numero de documento existe!";
                        else
                            respuesta=obj.Editar(id, nombre, sexo, fecha_nacimiento, tipo_documento, num_documento,
                                departamento, provincia, distrito, direccion, referencia, ubigeo, telefonofijo,
                                telefonocelular, email, latitud, longitud, contacto, "","", "0", "");

                    }
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "4")
            {
                string empleado = Request.QueryString["empleado"];
                string idcliente = Request.QueryString["idcliente"];
                string identrega = Request.QueryString["identrega"];
                string idlocal = Request.QueryString["idlocal"];
                string clasificacion = Request.QueryString["clasificacion"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {

                    respuesta = obj.AgregarPedidoGuia(empleado, idcliente, identrega, idlocal, clasificacion, ruc);
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}