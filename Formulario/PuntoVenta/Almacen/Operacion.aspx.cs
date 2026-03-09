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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Almacen
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
            string Almacencodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            if (Request.QueryString["ope"] == "0")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                    respuesta = obj.LoadByCodigo( id).Serialize();
            }

            if (Request.QueryString["ope"] == "1")
            {
                using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                {
                    respuesta = obj.Load(ruc).Serialize();
                }
            }

      

            if (Request.QueryString["ope"] == "2")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string codigointerno = Request.QueryString["codigointerno"];
                string codigosunat = Request.QueryString["codigosunat"];
                string nombre = Request.QueryString["nombre"];

                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string departamento = Request.QueryString["departamento"];
                    string provincia = Request.QueryString["provincia"];
                    string distrito = Request.QueryString["distrito"];
                    string direccion = Request.QueryString["direccion"];
                    string ubigeo = Request.QueryString["ubigeo"];
                    string telefono = Request.QueryString["telefono"];
                    string latitud = Request.QueryString["latitud"];
                    string longitud = Request.QueryString["longitud"];
                    string correoenviarguia = Request.QueryString["correoenviarguia"];
                    string activo = Request.QueryString["activo"];


                    using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                    {
                        if (id == "0")
                        {
                            if (obj.ExisteByNombre(ruc, nombre))
                                respuesta = "El nombre de Almacen existe!";
                            else
                                obj.Agregar(ruc, codigointerno, codigosunat, nombre, departamento, provincia, distrito, direccion, ubigeo,
                                    telefono, latitud, longitud, correoenviarguia, activo);
                        }
                        else
                            obj.Editar(id, codigointerno, codigosunat, nombre, departamento, provincia, distrito, direccion, ubigeo,
                                telefono, latitud, longitud, correoenviarguia, activo);
                    }
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];
                using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                    obj.Eliminar(id);
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}