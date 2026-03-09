using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta
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


                if (context.Request.Params["ope"] == "822")
                {
                    string codigo = "0";
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    string tipo = context.Request.Params["tipo"];
                    string idcaja = context.Request.Params["idcaja"];
                    string caja = context.Request.Params["caja"];
                    string serie = context.Request.Params["serie"];
                    string impresora = context.Request.Params["impresora"];
                    string mediopago = context.Request.Params["mediopago"];
                    string contingencia = context.Request.Params["contingencia"];
                    string pagorapidodetalle = context.Request.Params["pagorapidodetalle"]; 
                    string indicador = string.Empty;

                    Entity.Pedido pedido = JsonConvert.DeserializeObject<Entity.Pedido>(json);


                    using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                    {
                        

                        if (pedido.id == "0")
                        {
                            codigo = obj.Agregarv2(ruc, pedido.idlocal, pedido.idcaja, pedido.caja, pedido.serie, pedido.empleado,
                                pedido.idalmacen, pedido.idubicacion, pedido.tipocambio, pedido.tipo, pedido.subtotal,
                                pedido.descuento, pedido.total, pedido.imprimir, pedido.indicador, pedido.moneda, pedido.idimpuesto);

                            if (tipo == "91" && pagorapidodetalle == "1")
                            {
                                obj.ActualizarPedido(
                                codigo,
                                pedido.idcliente,
                                pedido.tipocliente,
                                pedido.numerodocumento,
                                pedido.nombre,
                                pedido.direccion,
                                pedido.departamento,
                                pedido.provincia,
                                pedido.distrito,
                                pedido.telefonocelular,
                                pedido.email,
                                pedido.glosa
                                );
                            }

                            if (contingencia == "1")
                            {
                                indicador = "0";
                            }
                            else
                            {
                                if (tipo == "91" && pagorapidodetalle == "1")
                                {
                                    if (pedido.tipocliente == "6") 
                                        indicador = "F";
                                    else
                                        indicador = "B";
                                }
                                else
                                {
                                    switch (tipo)
                                    {
                                        case "01":
                                            indicador = "F";
                                            break;
                                        case "03":
                                            indicador = "B";
                                            break;
                                        case "91":
                                            indicador = "B";
                                            break;
                                        case "99":
                                            indicador = "I";
                                            break;
                                    }
                                }
                            }

                            obj.ActualizarTipo(codigo, tipo, indicador, idcaja, caja, serie, impresora, "0", "0", "", "");

                            if (caja.Trim() == "" && serie.Trim() == "")
                            {
                                obj.ActualizarSerie(codigo);
                            }


                            foreach (var item in pedido.pedidodetalle)
                            {
                                var idpedidodetalle = obj.AgregarDetalle_v20(codigo, item.idproducto, item.idalmacen, item.cantidad, item.precio,
                                    item.subtotal, item.descuento, item.igv, item.isc, item.icb, item.gratuito, item.total,
                                    item.referencia, item.comisionpor1);

                                if (!string.IsNullOrWhiteSpace(item.idempleados))
                                {
                                    foreach (var empleado in item.idempleados.Split(',')) { 
                                        obj.AgregarDetalle_Empleado(idpedidodetalle, empleado);
                                    } 
                                }
                            }

                            if (tipo == "91") {
                                obj.Eliminar_Pago(codigo);
                                obj.AgregarPago(codigo, mediopago, pedido.moneda, pedido.total, "0.00", "", "");

                                obj.Eliminar_Forma(codigo);
                                obj.AgregarForma(codigo, "Contado", pedido.moneda, pedido.total, "");
                            }

                            obj.ActualizarCabecera(codigo);
                            obj.ActualizarImpuesto(codigo); 
                            obj.ActualizarComision(codigo);
                            
                            respuesta = codigo;
                        }
                        else
                        {
                            codigo = obj.Actualizar(pedido.id, pedido.tipo, pedido.indicador, pedido.subtotal, pedido.descuento,
                                pedido.igv, pedido.isc, pedido.icb, pedido.total, pedido.moneda);

                            if (caja.Trim() == "" && serie.Trim() == "")
                            {
                                obj.ActualizarSerie(codigo);
                            }

                            foreach (var item in pedido.pedidodetalle)
                            {
                                obj.ActualizarDetallev2(pedido.id, item.idproducto, item.cantidad, item.precio, item.subtotal,
                                    item.descuento, item.igv, item.isc, item.icb, item.gratuito, item.total, item.referencia,
                                    item.comisionpor1);

                                if (!string.IsNullOrWhiteSpace(item.idempleados))
                                {
                                    string idpedidodetalle = obj.ObtenerIdPedidoDetalle(pedido.id, item.idproducto);

                                    obj.EliminarDetalle_Empleado(idpedidodetalle);

                                    foreach (var empleado in item.idempleados.Split(','))
                                    {
                                        obj.AgregarDetalle_Empleado(idpedidodetalle, empleado);
                                    }
                                }
                            }



                            if ( (tipo == "91" || tipo == "03") && pagorapidodetalle == "1") {
                                obj.Eliminar_Pago(codigo);
                                obj.AgregarPago(codigo, mediopago, pedido.moneda, pedido.total, "0.00", "", "");

                                obj.Eliminar_Forma(codigo);
                                obj.AgregarForma(codigo, "Contado", pedido.moneda, pedido.total, "");
                            }

                            obj.ActualizarCabecera(pedido.id);
                            obj.ActualizarImpuesto(pedido.id); 
                            obj.ActualizarComision(pedido.id);

                            respuesta = pedido.id;
                        }
                    }
                }

                if (context.Request.Params["ope"] == "822_1")
                {
                    string id = context.Request.Params["id"];
                  
                    using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                    {
                        if (ruc == "20604767289" && id!=null)
                        {
                            doc.Actualizar_Reprocesar_Hilti(id);
                        }

                    }

                    respuesta = id;
                }

                if (context.Request.Params["ope"] == "822_2")
                {
                    string id = context.Request.Params["id"];
                    string id2 = context.Request.Params["id"];
                    string tipo = context.Request.Params["tipo"];
                    string idcaja = context.Request.Params["idcaja"];
                    string caja = context.Request.Params["caja"];
                    string serie = context.Request.Params["serie"];
                    string impresora = context.Request.Params["impresora"];
                    string mediopago = context.Request.Params["mediopago"];
                    string moneda = context.Request.Params["moneda"];
                    string total = context.Request.Params["total"];
                    string contingencia = context.Request.Params["contingencia"];
                    string imprimir = "0";
                    string imprimirtmp = "0";

                    if (context.Request.Params["imprimir"] != null)
                    {
                        imprimir = context.Request.Params["imprimir"];
                    }

                    if (context.Request.Params["imprimirtmp"] != null)
                    {
                        imprimirtmp = context.Request.Params["imprimirtmp"];
                    }

                    string indicador = string.Empty;
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    List<Entity.PedidoSimple> listapedidoplato = JsonConvert.DeserializeObject<List<Entity.PedidoSimple>>(json);

                    if (contingencia == "1")
                    {
                        indicador = "0";
                    }
                    else
                    {
                        switch (tipo)
                        {
                            case "01":
                                indicador = "F";
                                break;
                            case "03":
                                indicador = "B";
                                break;
                            case "91":
                                indicador = "B";
                                break;
                            case "99":
                                indicador = "I";
                                break;
                        }
                    }

                    if (listapedidoplato.Count > 0)
                    {
                        using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                        {
                            id2 = doc.Agregar_VentaPorPlato(id);
                            
                            foreach (var item in listapedidoplato)
                            {
                                doc.AgregarDetalle_PagoPorPlato(id2, item.id);
                                doc.EliminarDetalle_NoComandar(item.id, "PAGOPORPLATO", "AUTOMATICO");
                            }

                            doc.ActualizarCabecera(id2);
                            doc.ActualizarCabecera(id);
                            doc.ActualizarTipo(id2, tipo, indicador, idcaja, caja, serie, impresora, "0", "0", "", "");

                            if (tipo == "91")
                            {
                                var total2 = doc.LoadHaderByCodigo(id2).total;

                                doc.Eliminar_Pago(id2);
                                doc.AgregarPago(id2, mediopago, moneda, total2, "0.00", "", "");

                                doc.Eliminar_Forma(id2);
                                doc.AgregarForma(id2, "Contado", moneda, total2, "");
                            }
                        }

                    }
                    else
                    {
                        using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                        {
                            doc.ActualizarCabecera(id2);
                            doc.ActualizarTipo(id2, tipo, indicador, idcaja, caja, serie, impresora, imprimir, imprimirtmp, "", "");


                            if (tipo == "91")
                            {
                                doc.Eliminar_Pago(id2);
                                doc.AgregarPago(id2, mediopago, moneda, total, "0.00", "", "");

                                doc.Eliminar_Forma(id2);
                                doc.AgregarForma(id2, "Contado", moneda, total, "");
                            }
                        }


                    }


                    respuesta = id2;
                }
            }
            catch(Exception ex)
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