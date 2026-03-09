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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Impuesto
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

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {
                string nombre = Request.QueryString["nombre"] ?? "";

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    respuesta = obj.Load(ruc, nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_1")
            {
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    respuesta = obj.Load(ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {

                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string formula = Request.QueryString["formula"];
                string porcentaje = Request.QueryString["porcentaje"];
                string rccodigo = Request.QueryString["rccodigo"];
                string rcmonto = Request.QueryString["rcmonto"];
                string monto = Request.QueryString["monto"];
                string operacioncodigo = Request.QueryString["operacioncodigo"];
                string tributocodigo = Request.QueryString["tributocodigo"];
                string tributonombre = Request.QueryString["tributonombre"];
                string tributocode = Request.QueryString["tributocode"];
                string rango = Request.QueryString["rango"];
                string pordefecto = Request.QueryString["pordefecto"];
                string gratuito = Request.QueryString["gratuito"];


                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {

                    if (id == "0")
                    {
                        if (obj.ExisteByNombre(ruc, nombre))
                            respuesta = "El impuesto existe!";
                        else
                             if (obj.ExisteByDefecto(ruc) && pordefecto == "1")
                            {
                                respuesta = "El impuesto por defecto existe!";
                            }
                            else
                            obj.Agregar(nombre, formula, porcentaje, monto, operacioncodigo, tributocodigo,
                                    tributonombre, tributocode, rango, pordefecto, gratuito, rcmonto, rccodigo, ruc);
                    }
                    else
                        obj.Editar(id, nombre, formula, porcentaje, monto, operacioncodigo, tributocodigo,
                                tributonombre, tributocode, rango, pordefecto, gratuito, rcmonto, rccodigo);
                    
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
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