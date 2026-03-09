using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.Logistica.ProductoImportar
{
    /// <summary>
    /// Summary description for Operacion1
    /// </summary>
    public class Operacion1 : IHttpHandler
    {
        string respuesta = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            FormsAuthenticationTicket ticket = null;
            try
            {
                FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                ticket = formsIdentity.Ticket;

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


                if (context.Request.Params["ope"] == "4")
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    string ajuste = context.Request.Params["ajuste"];

                    List<Entity.Producto> listaproducto = JsonConvert.DeserializeObject<List<Entity.Producto>>(json);

                    if (listaproducto.Count > 0)
                    {
                        foreach (var item in listaproducto)
                        {

                            try
                            {

                                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                                {
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
                            }
                            catch (Exception ex) {
                                Console.WriteLine(ex.Message);
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                respuesta = "-1";
            }

            context.Response.Write(respuesta);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}