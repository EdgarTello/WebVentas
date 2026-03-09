using iTextSharp.text.pdf;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.VencidosDocumentos
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

                

                if(context.Request.Params["ope"] == "100" && 
                    (usuario_acceso == "Operador" || 
                    usuario_acceso == "Derivador" ||
                    usuario_acceso == "Administrador" ||
                    usuario_acceso == "Gerencia"))
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.MPDocumento mpdocumento = JsonConvert.DeserializeObject<Entity.MPDocumento>(json);


                    using (TwoTecnology.Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                    {

                            if (    usuario_acceso == "Derivador" || usuario_acceso == "Administrador" || usuario_acceso == "Gerencia")
                            {
                                    usuario_codigo = "0";
                            }

                            respuesta = obj.LoadVencidos(
                            empresaruc,
                            usuario_codigo,
                            mpdocumento.fechainicio.ConverTo_YYYYMMDD(),
                            mpdocumento.fechafin.ConverTo_YYYYMMDD(),
                            mpdocumento.operacion,
                            mpdocumento.etapa,
                            mpdocumento.idarea,
                            mpdocumento.busqueda).Serialize();

                    }
                }

                

                


            }
            catch(Exception ex)
            {
                respuesta = "-1";
            }

            context.Response.Write(respuesta);
        }
        decimal ConvertBytesToMegabytes(long bytes)
        {
            return Math.Round(Convert.ToDecimal((bytes / 1024f) / 1024f), 6);
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