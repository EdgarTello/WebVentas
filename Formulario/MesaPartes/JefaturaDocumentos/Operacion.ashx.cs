using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.JefaturaDocumentos
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
                string pathdmesapartes = ticket.UserData.Split('|')[33];
                string urlhost = ticket.UserData.Split('|')[34];

                if(context.Request.Params["ope"] == "100" && (usuario_acceso == "Gerencia" || usuario_acceso == "Operador"))
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.MPDocumento mpdocumento = JsonConvert.DeserializeObject<Entity.MPDocumento>(json);

                  

                    using (TwoTecnology.Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        respuesta = obj.LoadJefatura(
                            empresaruc,
                            usuario_acceso,
                            usuario_codigo,
                            mpdocumento.fechainicio.ConverTo_YYYYMMDD(),
                            mpdocumento.fechafin.ConverTo_YYYYMMDD(),
                            mpdocumento.etapa,
                            mpdocumento.idarea,
                            mpdocumento.busqueda).Serialize();

                    }
                }

                if (context.Request.Params["ope"] == "3" && (usuario_acceso == "Gerencia" || usuario_acceso == "Operador"))
                {
                    //string id = context.Request.Params["id"];
                    bool blnproceso = true;
                    string id = "0";
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.MPDocumento mpdocumento = JsonConvert.DeserializeObject<Entity.MPDocumento>(json);

                    //VERIFICA SI EL DOCUMENTO FUE ACEPTADO O RECHAZADO PREVIAMENTE

                    using (Repositorio.MPDocumento doc = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        var documento = doc.LoadByCodigo(empresaruc, mpdocumento.id, "", "0");

                        if (documento != null)
                        {
                            if (documento.etapa == "120")
                            {
                                respuesta = "Documento fue aceptado previamente";
                                blnproceso = false;
                            }

                            if (documento.etapa == "110" && documento.rechazado == "1")
                            {
                                respuesta = "Documento fue rechazado previamente";
                                blnproceso = false;
                            }
                        }

                        if (blnproceso)
                        {

                            id = doc.JefaturaEtapa(empresaruc,
                                usuario_codigo,
                                mpdocumento.id,
                                mpdocumento.etapa,
                                mpdocumento.rechazado,
                                mpdocumento.rechazadotexto,
                                usuario_nombre,
                                GetIPAddress());

                            respuesta = doc.LoadByCodigo(empresaruc, id, "", "").codigointerno;

                            using (TwoTecnology.Repositorio.MPArchivo mparchivo = new TwoTecnology.Repositorio.MPArchivo())
                            {
                                TwoTecnology.Entity.MPArchivo iarchivo = mparchivo.LoadByCodigo(empresaruc, documento.idarchivo);

                                if (File.Exists(iarchivo.ruta.Replace("Temporal", "Aprobado")))
                                {
                                    File.Delete(iarchivo.ruta.Replace("Temporal", "Aprobado"));
                                }

                                //File.Copy(iarchivo.ruta, iarchivo.ruta.Replace("Temporal", "Aprobado"));

                                try
                                {
                                    Shared.GetTexto(iarchivo.ruta, id);
                                    Shared.PdfStamp(iarchivo.ruta, iarchivo.ruta.Replace("Temporal", "Aprobado"), respuesta);
                                }
                                catch (Exception ex)
                                {
                                    File.Copy(iarchivo.ruta, iarchivo.ruta.Replace("Temporal", "Aprobado"));
                                }

                                mparchivo.EditarPath(documento.idarchivo,
                                    iarchivo.ruta.Replace("Temporal", "Aprobado"),
                                    iarchivo.absolute.Replace("Temporal", "Aprobado"),
                                    iarchivo.url.Replace("Temporal", "Aprobado"));

                            }


                        }

                    }
                }

            }
            catch(Exception ex)
            {
                respuesta = "-1";
            }

            context.Response.Write(respuesta);
        }
        
        protected string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            return context.Request.ServerVariables["REMOTE_ADDR"];
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