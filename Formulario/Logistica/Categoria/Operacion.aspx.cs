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

namespace TwoTecnology.WebVentas.Formulario.Logistica.Categoria
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

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.LoadAll(ruc, "1",nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idfamilia = Request.QueryString["idfamilia"];
                string tipo = Request.QueryString["tipo"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.LoadByLocal(ruc, idlocal, idfamilia, tipo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_2")
            {
                
                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.LoadActivo(ruc, "1").Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_3")
            {
                string idfamilia = Request.QueryString["idfamilia"];
                string idtipo = Request.QueryString["idtipo"];
                string idalmacen = Request.QueryString["idalmacen"] ?? "0"; 

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.LoadByFamiliaActivo(ruc, idfamilia, idtipo, idalmacen).Serialize();
                }
            }

            


            if (Request.QueryString["ope"] == "2")
            {

                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string descripcion = Request.QueryString["descripcion"];
                string codigosunat = Request.QueryString["codigosunat"];
                string fondocolor = Request.QueryString["fondocolor"];
                string fuentecolor = Request.QueryString["fuentecolor"];
                string orden = Request.QueryString["orden"];


                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    if (id == "0")
                        if (obj.ExisteByNombre(ruc, nombre))
                            respuesta = "La categoría existe!";
                        else
                            obj.Agregar("1" , nombre, descripcion, codigosunat, 
                                ((fondocolor.Length>2)? string.Format("#{0}", fondocolor):"") ,
                                ((fuentecolor.Length > 2) ? string.Format("#{0}", fuentecolor) : ""),
                                orden,
                                ruc);
                    else
                        obj.Editar(id, nombre, descripcion, codigosunat,
                                ((fondocolor.Length > 2) ? string.Format("#{0}", fondocolor) : ""),
                                ((fuentecolor.Length > 2) ? string.Format("#{0}", fuentecolor) : ""),
                                orden
                            );

                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "5")
            {

                string id = Request.QueryString["id"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    obj.Activar(id);

                }
            }

            if (Request.QueryString["ope"] == "6")
            {

                string id = Request.QueryString["id"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
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