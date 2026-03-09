using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.Retail.OrdenPedido
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
                string empresaruc = ticket.UserData.Split('|')[1];
                string usuario_acceso = ticket.UserData.Split('|')[3];
                string usuario_codigo = ticket.UserData.Split('|')[4];
                string usuario_nombre = ticket.UserData.Split('|')[5];
                string usuario_serie = ticket.UserData.Split('|')[7];
                string puntosid = ticket.UserData.Split('|')[8];
                string ipcliente = ticket.UserData.Split('|')[9];
                string localcodigo = ticket.UserData.Split('|')[10];
                string movil = ticket.UserData.Split('|')[11];


                if (context.Request.Params["ope"] == "0")
                {
                    string codigo = "0";
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    string indicador = string.Empty;
                    StringBuilder serror = new StringBuilder();
                    bool blnerror = false;

                    Metodos.ValidateAntiXsrfToken("OrdenPedidoNew");


                    Entity.OrdenPedido pedido = JsonConvert.DeserializeObject<Entity.OrdenPedido>(json);

                    using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                    {
                        foreach (var item in pedido.ordenpedidodetalle)
                        { 
                            var iproducto = obj.LoadByAlmacen_v1(empresaruc, item.idproducto, localcodigo, item.idalmacen,
                                item.idpresentacion);

                            item.nombre = iproducto.nombre;

                            decimal mtotal = 0.00M;

                            if (iproducto.gratuito == "0") {
                                mtotal = Convert.ToDecimal(iproducto.precio) * Convert.ToDecimal(item.cantidad);
                            }

                            item.precio_original = iproducto.precio;

                            //if (Convert.ToDecimal(iproducto.precio) != Convert.ToDecimal(item.precio)) {
                            //    serror.AppendLine( string.Format( "(*){0} el precio no corresponde!", item.nombre));
                            //    blnerror = true;
                            //}

                            //if (mtotal != Convert.ToDecimal(item.total))
                            //{
                            //    serror.AppendLine(string.Format("(*){0} el total no corresponde!", item.nombre));
                            //    blnerror = true;
                            //}
                        }
                    }

                    if (!blnerror)
                    {

                        using (Repositorio.OrdenPedido obj = new TwoTecnology.Repositorio.OrdenPedido())
                        {
                            if (pedido.id == "0")
                            {
                                codigo = obj.Agregar(empresaruc, pedido.idlocal, usuario_nombre, pedido.idcliente,
                                    pedido.idclienteentrega,
                                    pedido.idtipopago, pedido.tipopago, pedido.imprimir);


                                obj.ActualizarCorrealtivo(codigo);

                                //decimal mtotal = 0.00M;

                                foreach (var item in pedido.ordenpedidodetalle)
                                {
                                    obj.AgregarDetalle(codigo, item.idproducto, item.idalmacen, item.idpresentacion, 
                                        item.cantidad, item.precio, item.precio_original, item.total, item.nombre);
                                    //mtotal += Convert.ToDecimal(item.total);
                                }

                                obj.ActualizarCabecera(codigo);

                                obj.Agregar_Historico(empresaruc, codigo, "1", usuario_nombre);

                                obj.ActualizarTransaccion(codigo);

                                respuesta = codigo;
                            }
                            else
                            {
                                codigo = obj.Actualizar(pedido.id,  usuario_nombre, pedido.idcliente,
                                    pedido.idclienteentrega, pedido.idtipopago, pedido.tipopago, pedido.imprimir);

                                obj.Eliminar_Detalle(pedido.id);

                                foreach (var item in pedido.ordenpedidodetalle)
                                {
                                    obj.AgregarDetalle(codigo, item.idproducto, item.idalmacen, item.idpresentacion,
                                        item.cantidad, item.precio, item.precio_original, item.total, item.nombre);
                                }


                                obj.ActualizarCabecera(codigo);
                                respuesta = pedido.id;
                            }
                        }
                    }
                    else {
                        respuesta = serror.ToString();
                    }
                }


                if (context.Request.Params["ope"] == "1")
                {
                    string id = context.Request.Params["id"];

                    Metodos.ValidateAntiXsrfToken("OrdenPedidoList");

                    using (Repositorio.OrdenPedido obj = new TwoTecnology.Repositorio.OrdenPedido())
                    {
                        var orden =obj.LoadById(empresaruc, id);

                        if (orden.estado == "1" && orden.anulado == "0")
                        {

                            string idpedido = obj.Agregar_Pedido(empresaruc, id);

                            obj.Agregar_Pedido_Detalle(empresaruc, id, idpedido);

                            obj.Actualizar_Estado(empresaruc, id, "2");//Solicitado

                            obj.Agregar_Historico(empresaruc, id, "2", usuario_nombre);

                            respuesta = idpedido;
                        }
                        else
                            respuesta = string.Format("El pedido {0} no se puede procesar!", orden.correlativo);
                    }
                }

                if (context.Request.Params["ope"] == "2")
                {
                    string id = context.Request.Params["id"];

                    Metodos.ValidateAntiXsrfToken("OrdenPedidoList");

                    using (Repositorio.OrdenPedido obj = new TwoTecnology.Repositorio.OrdenPedido())
                    {
                        var orden = obj.LoadById(empresaruc, id);

                        if (orden.estado == "3" && orden.anulado == "0")
                        {

                            obj.Actualizar_Estado(empresaruc, id, "4");//Desapachado

                            obj.Agregar_Historico(empresaruc, id, "4", usuario_nombre);

                            respuesta = id;
                        }
                        else
                            respuesta = string.Format("El pedido {0} no se puede procesar!", orden.correlativo);
                    }
                }

                if (context.Request.Params["ope"] == "3")
                {
                    string id = context.Request.Params["id"];

                    Metodos.ValidateAntiXsrfToken("OrdenPedidoList");

                    using (Repositorio.OrdenPedido obj = new TwoTecnology.Repositorio.OrdenPedido())
                    {
                        var orden = obj.LoadById(empresaruc, id);

                        if (orden.estado == "4" && orden.anulado == "0")
                        {

                            obj.Actualizar_Estado(empresaruc, id, "5");//Seguridad

                            obj.Agregar_Historico(empresaruc, id, "5", usuario_nombre);

                            respuesta = id;
                        }
                        else
                            respuesta = string.Format("El pedido {0} no se puede procesar!", orden.correlativo);
                    }
                }

                if (context.Request.Params["ope"] == "10")
                {
                    Metodos.ValidateAntiXsrfToken("OrdenPedidoList");

                    string detalle = HttpUtility.UrlDecode(context.Request.Params["detalle"]);
                    Entity.Entidad lista = JsonConvert.DeserializeObject<Entity.Entidad>(detalle);


                    if (lista.clave1.IsInyection() || lista.clave2.IsInyection())
                    {
                        respuesta = "Inyection Code Detected";
                    }
                    else
                    {

                        if ((lista.clave1 == lista.clave2) && (lista.clave1.Length > 5 && lista.clave2.Length > 5))
                        {
                            TwoTecnology.Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();
                            bool blnresult = obj.CambiarClave(empresaruc, usuario_codigo, lista.clave2);

                            if (!blnresult)
                            {
                                respuesta = "Hubo un error al actualizar las credenciales!";
                            }
                        }
                        else
                        {
                            respuesta = "Las credenciales son diferentes!";
                        }
                    }
                }



            }
            catch(Exception ex)
            {
                //Console.WriteLine(ex.Message);
                respuesta = ex.Message;
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