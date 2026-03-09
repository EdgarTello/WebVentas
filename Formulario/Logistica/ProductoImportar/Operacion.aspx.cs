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


namespace TwoTecnology.WebVentas.Formulario.Logistica.ProductoImportar
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
            string ipProductoImportar = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            

            if (Request.QueryString["ope"] == "4")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                string ajuste = Request.QueryString["ajuste"];

                //List<Entity.Producto> listaproducto = JsonConvert.DeserializeObject<List<Entity.Producto>>(json);
                Entity.Producto item = JsonConvert.DeserializeObject<Entity.Producto>(json);

                //if (listaproducto.Count > 0)
                //{
                //    foreach (var item in listaproducto)
                //    {
                        using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                        {
                            //if (item.codigointerno == "149504" || item.codigointerno == "149610")
                            //{
                            //    Console.WriteLine("error");
                            //}

                            obj.AgregarMasivo(ruc, 
                                item.idlocal,
                                item.idalmacen,
                                item.codigointerno,
                                item.nombre,
                                item.descripcion,
                                item.tipo,
                                item.familia,
                                item.categoria,

                                item.marca,
                                item.talla,
                                item.color,

                                item.presentacion,
                                item.codigobarra,
                                item.costo,
                                item.stockminimo,
                                item.stockactual,
                                item.stockmaximo,
                                item.preciomesa,
                                item.preciollevar,
                                item.preciodelivery,
                                item.area1,
                                item.area2,
                                item.sunat,
                                item.imagen,
                                ajuste,
                                usuario_nombre);
                        }
                //    }
                //}
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}