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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaCierre23
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

            if (Request.QueryString["ope"] == "1")
            {
                string id = Request.QueryString["id"];
                

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    respuesta = obj.LoadByCodigo(id).Serialize();
                }

            }


            if (Request.QueryString["ope"] == "2")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.GuiaCliente guia = JsonConvert.DeserializeObject<Entity.GuiaCliente>(json);

                Metodos.ValidateAntiXsrfToken("GC23New");


                //if (guia.id.IsNumeric() && !guia.observacion.IsInyection())
                if (guia.id.IsNumeric())
                {

                    using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                    {

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

                            guia.idtransporte, guia.idconductor,
                            guia.fechatraslado.ConverTo_YYYYMMDD(),
                            guia.horatraslado,

                            guia.fechaentrega.ConverTo_YYYYMMDD(),
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

                        foreach (var documento in guia.documentos)
                        {
                            obj.AgregarDocumento(guia.id, documento.codigo, documento.nombre, documento.documento, documento.emisortipo, documento.emisornumero);
                        }



                        foreach (var vehiculo in guia.vehiculos)
                        {
                            obj.AgregarVehiculo(guia.id, vehiculo.idvehiculo, vehiculo.nivel);
                        }


                        foreach (var conductor in guia.conductores)
                        {
                            obj.AgregarConductor(guia.id, conductor.idconductor, conductor.nivel);
                        }

                        foreach (var contenedor in guia.contenedores)
                        {
                            obj.AgregarContenedor(guia.id, contenedor.nombre, contenedor.precinto, contenedor.enviar);
                        }

                        foreach (var puerto in guia.puertos)
                        {
                            obj.AgregarPuerto(guia.id, puerto.codigo, puerto.nombre);
                        }


                        foreach (var guiadetalle in guia.guiadetalle)
                        {
                            obj.ActualizarDetalleExp(guiadetalle.id,
                                guiadetalle.e7020,
                                guiadetalle.e7021,
                                guiadetalle.e7022,
                                guiadetalle.e7023);
                        }

                        obj.ActualizarStock(guia.id);

                        obj.ActualizarCierre(guia.id);

                        respuesta = "Documento Generado!";
                        //}
                        //else
                        //{
                        //    respuesta = "Documento en transacción!";
                        //}

                    }
                }
            }

           

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}