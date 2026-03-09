using DevExpress.Utils.Extensions;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.S10.OrdenPago
{
    /// <summary>
    /// Summary description for Operacion1http://localhost:15384/Formulario/S10/OrdenPago/Operacion.ashx.cs
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
                string rol_id = ticket.UserData.Split('|')[29];
                string movil = ticket.UserData.Split('|')[11];



                if (context.Request.Params["ope"] == "0")
                {
                    string opcion = "OrdenPago";
                    string pagina = "../../S10/OrdenPago/Listado.aspx";

                    using (Repositorio.RolesxPagina obj = new TwoTecnology.Repositorio.RolesxPagina())
                    {
                        var permiso_acceso = obj.LoadAcceso(empresaruc, usuario_codigo, rol_id, opcion, pagina);

                        if (permiso_acceso.acceso != "1")
                        {
                            respuesta = "No tiene permisos de acceso";
                            return;
                        }

                        if (!permiso_acceso.opciones.Contains("solicitar")) {
                            respuesta = "No tiene permisos para solicitar";
                            return;
                        }
                    }





                    string id = context.Request.Params["id"].ToString();
                    string estadocodigo = "0";
                    Metodos.ValidateAntiXsrfToken("OrdenPagoList");

                    //var empresa = new TwoTecnology.BusinessShared.Consulta().ConsultaEmpresaByRuc(empresaruc);
                    
                    //ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls13;

                    using (TwoTecnology.Repositorio.S10.OrdenPago obj = new TwoTecnology.Repositorio.S10.OrdenPago())
                    {
                        var pago = obj.LoadById(empresaruc, id);
                        estadocodigo = pago.estadocodigo;
                    }

                    if (estadocodigo == "1")
                    {
                        List<string> listacorreo = new List<string>();

                        using (TwoTecnology.Repositorio.S10.OrdenPago obj = new TwoTecnology.Repositorio.S10.OrdenPago())
                        {
                            var pago = obj.LoadById(empresaruc, id);
                            var solicitud = obj.LoadSolicitud(empresaruc, "APRHOSTBAN", "0");
                            var idflujo = "0";

                            foreach (var flujo in solicitud)
                            {
                                idflujo= flujo.idflujo;

                                var idpagoflujo = obj.AgregarFlujo_Solicitud(pago.pagoid, flujo.idflujo, flujo.idflujodetalle,
                                    pago.fechatrx, flujo.usuarioid, flujo.usuariologin,
                                    flujo.nivelaprobacion,
                                    flujo.requiereaprobacion,
                                    ((flujo.requiereaprobacion == "1") ? "0" : "1"));
                                //var flujoaprobacion_guid = obj.LoadFlujo_Solicitud(idflujodetalle).guid;

                                using (TwoTecnology.Repositorio.Correo correo = new TwoTecnology.Repositorio.Correo())
                                {
                                    string idcorreo = correo.Agregar(
                                        pago.pagoid,
                                        pago.fechatrx,
                                        idpagoflujo,
                                        flujo.plantillanombre,
                                        flujo.plantillapath,
                                        flujo.urlaprobacion,
                                        flujo.idflujo,
                                        flujo.idflujodetalle,
                                        pago.usuarioid,
                                        pago.usuarionombre,
                                        pago.usuariologin,
                                        pago.usuariorol,

                                        flujo.usuarioid,
                                        flujo.usuarionombre,
                                        flujo.usuariologin,
                                        flujo.usuariorol,
                                        flujo.usuariocorreo,
                                        ((flujo.enviarcorreo=="1")? ((flujo.requiereaprobacion == "1") ? "0" : "1"):"0"),
                                        flujo.requiereaprobacion);

                                    listacorreo.Add(idcorreo);
                                }
                            }

                            using (TwoTecnology.Repositorio.S10.OrdenPago objp = new TwoTecnology.Repositorio.S10.OrdenPago())
                            {
                                objp.UpdateFlujo(id, idflujo);
                            }
                        }

                        using (TwoTecnology.Repositorio.S10.OrdenPago objp = new TwoTecnology.Repositorio.S10.OrdenPago())
                        {
                            objp.UpdateStatus(id, "2", "0%");
                        }

                        foreach (var idcorreo in listacorreo)
                        {
                            using (TwoTecnology.Repositorio.Correo objcorreo = new TwoTecnology.Repositorio.Correo())
                            {
                                objcorreo.ActualizaTransaccion(idcorreo);
                            }
                        }
                        respuesta = id;
                    }
                    else {
                        respuesta = "Error documento solicitado";
                    }
                    

                }

                if (context.Request.Params["ope"] == "1")
                {
                    string id = context.Request.Params["id"].ToString();

                    Metodos.ValidateAntiXsrfToken("OrdenPagoList");

                    using (TwoTecnology.Repositorio.S10.OrdenPago objp = new TwoTecnology.Repositorio.S10.OrdenPago())
                    {
                        objp.UpdateStatus(id, "5", "100%");
                        respuesta = id;
                    }
                }
            }
            catch (Exception ex)
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