using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.Logistica.GuiaRemision04
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
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.GuiaCliente guia = JsonConvert.DeserializeObject<Entity.GuiaCliente>(json);

                    Metodos.ValidateAntiXsrfToken("GC23New");


                    if (guia.id.IsNumeric() && !guia.observacion.IsInyection())
                    {
                        using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                        {
                            guia.id = obj.AgregarPedidoGuiav2(guia.empleado, guia.idalmacen, "09", guia.idlocal, 
                                "0", "0", empresaruc);
                        }

                        using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                        {
                            DateTime fechaActual = DateTime.Now;
                            string fechaFormateada = fechaActual.ToString("yyyyMMdd");
                            //if (obj.EnTransaccion(guia.id))
                            //{

                            

                            obj.ActualizarGuia_v2(guia.id, guia.tipo,
                                guia.idmotivo,
                                guia.motivo,

                                guia.idtraslado,

                                guia.idcomprador,
                                guia.idcliente,
                                guia.identrega,


                                guia.idtransportista,
                                guia.identregat,
                                guia.registromtct,

                                guia.departamentot,
                                guia.provinciat,
                                guia.distritot,
                                guia.ubigeot,
                                guia.direcciont,

                                guia.idproveedor,
                                guia.idrecojop,

                                guia.unidad,

                                guia.peso,
                                guia.bultos,

                                guia.idtransporte, 
                                guia.idconductor,
                                (( string.IsNullOrEmpty(guia.fechatraslado))? fechaFormateada: guia.fechatraslado.ConverTo_YYYYMMDD()),
                                guia.horatraslado,

                                ((string.IsNullOrEmpty(guia.fechaentrega)) ? fechaFormateada : guia.fechaentrega.ConverTo_YYYYMMDD()),
                                guia.horaentrega,

                                guia.idalmacenorigen,

                                guia.indicador,
                                guia.serie,

                                guia.idalmacendestino,

                                guia.observacion,

                                guia.salidaalmacen,
                                guia.ordentrabajo,

                                guia.ordencompra,
                                guia.ordeninterno,
                                guia.outbonddelivery,


                                guia.auditoria,
                                guia.usuariovalida,
                                guia.generar,

                                guia.departamentoenvio,
                                guia.provinciaenvio,
                                guia.distritoenvio,
                                guia.ubigeoenvio,
                                guia.direccionenvio,

                                guia.departamentoentrega,
                                guia.provinciaentrega,
                                guia.distritoentrega,
                                guia.ubigeoentrega,
                                guia.direccionentrega

                                );

                            foreach (var parametro in guia.parametros)
                            {
                                obj.AgregarParametro(guia.id, parametro.nombre);
                            }

                            
                            foreach (var vehiculo in guia.vehiculos)
                            {
                                obj.AgregarVehiculo(guia.id, vehiculo.idvehiculo, vehiculo.nivel);
                            }


                            foreach (var conductor in guia.conductores)
                            {
                                obj.AgregarConductor(guia.id, conductor.idconductor, conductor.nivel);
                            }


                            foreach (var guiadetalle in guia.guiadetalle)
                            {
                                obj.AgregarDetalle_v2(guia.id, guiadetalle.idalmacen, guiadetalle.idproducto, guiadetalle.unidad, guiadetalle.cantidad);
                            }

                            obj.Agregar_Historico(empresaruc, guia.id, "1", usuario_nombre);

                            obj.ActualizarStock(guia.id);

                            obj.ActualizarCierre(guia.id);

                            respuesta = guia.id;
                        }
                    }
                }

            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                respuesta = "Error General";
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