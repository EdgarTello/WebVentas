using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.AlmacenTomador.Pedido
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

                string ciacod = ticket.UserData.Split('|')[0];
                string noemple = ticket.UserData.Split('|')[1];
                string tracod = ticket.UserData.Split('|')[2];
                string tranom = ticket.UserData.Split('|')[3];
                string almcod = ticket.UserData.Split('|')[4];

                if (context.Request.Params["ope"] == "0")
                {
                    TwoTecnology.Repositorio.TOMADOR.Pedido obj = new TwoTecnology.Repositorio.TOMADOR.Pedido();
                    respuesta = obj.LoadWithDetail(ciacod, noemple).Serialize();
                }

                if (context.Request.Params["ope"] == "1")
                {
                    string op = context.Request.Params["op"];

                    TwoTecnology.Repositorio.TOMADOR.Pedido obj = new TwoTecnology.Repositorio.TOMADOR.Pedido();
                    respuesta = obj.LoadByOpWithDetail(ciacod, op).Serialize();
                }

                if (context.Request.Params["ope"] == "2")
                {
                    string detalle = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    TwoTecnology.Repositorio.TOMADOR.Pedido obj = new TwoTecnology.Repositorio.TOMADOR.Pedido();
                    TwoTecnology.Entity.TOMADOR.ARCOOP pedido = JsonConvert.DeserializeObject<TwoTecnology.Entity.TOMADOR.ARCOOP>(detalle);
                    string codigo = "";

                    if (pedido.codigo == "")
                    {   
                        codigo = string.Format("PED-{0}", obj.LoadId(ciacod));
                        obj.AgregarPedido(ciacod, codigo, "P", noemple, pedido.tipo, pedido.bodega, pedido.maquina);
                    }
                    else {
                        codigo = pedido.codigo;
                    }

                    obj.EliminarAllDetail(ciacod, codigo);

                    foreach (var item in pedido.detalle) {
                        obj.AgregarDetalle(ciacod, codigo, 
                            ((pedido.tipo=="2")?"":item.articulo_codigo), 
                            item.cantidad,
                            ((pedido.tipo == "2") ? item.articulo_nombre : ""));
                    }

                    respuesta = "OK";
                }

                if (context.Request.Params["ope"] == "3")
                {
                    string detalle = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    TwoTecnology.Entity.TOMADOR.ARCOOP pedido = JsonConvert.DeserializeObject<TwoTecnology.Entity.TOMADOR.ARCOOP>(detalle);
                
                    TwoTecnology.Repositorio.TOMADOR.Pedido obj = new TwoTecnology.Repositorio.TOMADOR.Pedido();
                    respuesta= obj.Eliminar(ciacod, pedido.op);

                }





            }
            catch (Exception ex)
            {
                TwoTecnology.BusinessLog.Log.SaveLogSimple(ex.Message);
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