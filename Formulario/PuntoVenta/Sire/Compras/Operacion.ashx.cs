using iTextSharp.text.pdf;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Sire.Compras
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
                string usuario_idarea = ticket.UserData.Split('|')[35];

                if (context.Request.Params["ope"] == "1"){

                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.MPPeriodo mpperiodo = JsonConvert.DeserializeObject<Entity.MPPeriodo>(json);
                    

                    using (TwoTecnology.Api.Autenticacion aut = new Api.Autenticacion()) {

                        Entity.Empresa empresa = new TwoTecnology.BusinessShared.Consulta().ConsultaEmpresaByRuc(empresaruc);
                        DateTime fecha = new DateTime( Convert.ToInt32( mpperiodo.anio) , Convert.ToInt32(mpperiodo.mes), 1);
                        string fechainicio = fecha.ToString("yyyy-MM-dd");
                        string fechafin = fecha.AddMonths(1).AddDays(-1).ToString("yyyy-MM-dd");

                        string url_consulta = "https://api-seguridad.sunat.gob.pe/v1/clientessol/{0}/oauth2/token/";
                        string url_app = "https://api-sire.sunat.gob.pe/v1/contribuyente/migeigv/libros/rce/propuesta/web/propuesta/{0}{1}/exportacioncomprobantepropuesta?codTipoArchivo=1&codOrigenEnvio=1&fecEmisionIni={2}&fecEmision={3}&codTipoCDP=01";

                        var resultado= aut.Consulta_Api_Json(
                            string.Format(url_app, mpperiodo.anio, mpperiodo.mes, fechainicio, fecha), 
                            empresa.Usua_Fact, empresa.Clave_Fact,
                            string.Format(url_consulta, empresa.Usuario_Api),
                            empresa.Usuario_Api, empresa.Clave_Api);

                    }
                    
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