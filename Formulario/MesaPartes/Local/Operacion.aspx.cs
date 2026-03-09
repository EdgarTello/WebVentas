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


namespace TwoTecnology.WebVentas.Formulario.MesaPartes.Local
{
    public partial class Operacion : System.Web.UI.Page
    {
        string urlDefault = "../../../Formulario/MesaPartes/Frame/Salir.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Clear();
                    Header.Controls.Add(new LiteralControl(@"
                    <script type=""text/javascript"">
                    top.location = ""../../../Default.aspx"";
                    parent.location = ""../../../Default.aspx"";
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

                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                    respuesta = obj.LoadByCodigo(ruc, id).Serialize();
            }

            if (Request.QueryString["ope"] == "1")
            {
                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                {
                    respuesta = obj.Load(ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_1")
            {
                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                {
                    respuesta = obj.LoadActivo(ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];

                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string a4 = Request.QueryString["a4"];
                    string mm58 = Request.QueryString["mm58"];
                    string mm80 = Request.QueryString["mm80"];

                    string departamento = Request.QueryString["departamento"];
                    string provincia = Request.QueryString["provincia"];
                    string distrito = Request.QueryString["distrito"];
                    string direccion = Request.QueryString["direccion"];
                    string ubigeo = Request.QueryString["ubigeo"];
                    string telefono = Request.QueryString["telefono"];
                    string latitud = Request.QueryString["latitud"];
                    string longitud = Request.QueryString["longitud"];

                    string precuentatexto = Request.QueryString["precuentatexto"];
                    string pedidotexto = Request.QueryString["pedidotexto"];
                    string claveimpresion = Request.QueryString["claveimpresion"];

                    string idalmacen = Request.QueryString["idalmacen"];
                    string activo = Request.QueryString["activo"];

                    string ventamensual = Request.QueryString["ventamensual"];
                    string ventaanual = Request.QueryString["ventaanual"];

                    string abreviatura = Request.QueryString["abreviatura"] ?? "";
                    string vtexid = Request.QueryString["vtexid"] ?? "";

                    using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                    {
                        if (id == "0")
                        {
                            if (obj.ExisteByNombre(ruc, nombre))
                                respuesta = "El nombre de Local existe!";
                            else
                                obj.Agregar(ruc, nombre, departamento, provincia, distrito, direccion, ubigeo,
                                    telefono, latitud, longitud, idalmacen, a4, mm58, mm80, 
                                    precuentatexto, pedidotexto, claveimpresion,
                                    activo, ventamensual, ventaanual, abreviatura, vtexid);
                        }
                        else
                            obj.Editar(id, nombre, departamento, provincia, distrito, direccion, ubigeo,
                                telefono, latitud, longitud, idalmacen, a4, mm58, mm80,
                                precuentatexto, pedidotexto, claveimpresion,
                                activo, ventamensual, ventaanual, abreviatura, vtexid);
                    }
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];
                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                    obj.Eliminar(id);
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}