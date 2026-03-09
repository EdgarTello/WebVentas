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

namespace TwoTecnology.WebVentas.Formulario.GestorDocumental.Documentos
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

                if (context.Request.Params["ope"] == "2")
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    TwoTecnology.Entity.GestorDocumental.Indice datos = JsonConvert.DeserializeObject<TwoTecnology.Entity.GestorDocumental.Indice>(json);

                    Metodos.ValidateAntiXsrfToken("ImportNew");

                    var gestorindice = new TwoTecnology.Repositorio.GestorIndice().LoadByArchivador(datos.idarchivador);

                    string indice1 = datos.indice1;
                    string indice2 = datos.indice2;
                    string indice3 = datos.indice3;
                    string indice4 = datos.indice4;
                    string indice5 = datos.indice5;
                    string indice6 = datos.indice6;
                    string indice7 = datos.indice7;
                    string indice8 = datos.indice8;
                    string indice9 = datos.indice9;
                    string indice10 = datos.indice10;

                    foreach (var item in gestorindice) {

                        if (item.tipo == "fecha") {
                            if (item.nombre == "indice1") indice1=indice1.ConverTo_YYYYMMDD();
                            if (item.nombre == "indice2") indice2 = indice2.ConverTo_YYYYMMDD();
                            if (item.nombre == "indice3") indice3 = indice3.ConverTo_YYYYMMDD();
                            if (item.nombre == "indice4") indice4 = indice4.ConverTo_YYYYMMDD();
                            if (item.nombre == "indice5") indice5 = indice5.ConverTo_YYYYMMDD();
                            if (item.nombre == "indice6") indice6 = indice6.ConverTo_YYYYMMDD();
                            if (item.nombre == "indice7") indice7 = indice7.ConverTo_YYYYMMDD();
                            if (item.nombre == "indice8") indice8 = indice8.ConverTo_YYYYMMDD();
                            if (item.nombre == "indice9") indice9 = indice9.ConverTo_YYYYMMDD();
                            if (item.nombre == "indice10") indice10 = indice10.ConverTo_YYYYMMDD();
                        }
                    }


                    if (datos.idlocal.IsNumeric() && datos.idarchivador.IsNumeric())
                    {
                        using (TwoTecnology.Repositorio.GestorDocumento obj = new TwoTecnology.Repositorio.GestorDocumento())
                        {
                            respuesta = obj.Agregar(datos.idlocal, datos.idarchivador,
                                indice1,
                                indice2,
                                indice3,
                                indice4,
                                indice5,
                                indice6,
                                indice7,
                                indice8,
                                indice9,
                                indice10,
                                usuario_nombre,
                                empresaruc);

                        }
                    }
                }

                if (context.Request.Params["ope"] == "2000")
                {
                    string tipo = context.Request.Params["tipo"];
                    string numero = context.Request.Params["documento"];

                    if (tipo == "1")
                    {
                        
                        string url = string.Format("https://api.apis.net.pe/v2/reniec/dni?numero={0}", numero);
                        System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                        var client = new RestClient(url);
                        //client.Authenticator = new OAuth2AuthorizationRequestHeaderAuthenticator("apis-token-3395.fk-GkEjdkkrwWZIO1C9fCYQuqHlRTedK", "Bearer");
                        client.Timeout = 10 * 1000;
                        var request = new RestRequest(Method.GET);
                        request.Parameters.Clear();
                        request.AddHeader("Accept", "application/json");
                        request.AddHeader("Authorization", "Bearer " + "apis-token-11153.70vQTXvHUaB0dEuQCphWLd3UeS6KPDRV");

                        IRestResponse response = client.Execute(request);
                        respuesta = response.Content;
                    }


                    if (tipo == "6")
                    {
                        string url = string.Format("https://api.apis.net.pe/v2/sunat/ruc?numero={0}", numero);
                        System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                        var client = new RestClient(url);
                        //client.Authenticator = new OAuth2AuthorizationRequestHeaderAuthenticator("apis-token-3395.fk-GkEjdkkrwWZIO1C9fCYQuqHlRTedK", "Bearer");
                        client.Timeout = 10 * 1000;
                        var request = new RestRequest(Method.GET);
                        request.Parameters.Clear();
                        request.AddHeader("Accept", "application/json");
                        request.AddHeader("Authorization", "Bearer " + "apis-token-11153.70vQTXvHUaB0dEuQCphWLd3UeS6KPDRV");

                        IRestResponse response = client.Execute(request);
                        respuesta = response.Content;
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