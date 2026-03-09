using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.Importacion.Guia
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


                if (context.Request.Params["ope"] == "1")
                {
                    Metodos.ValidateAntiXsrfToken("GuiaImportacionNew");

                    string imagen = context.Request.Params["imagen"];
                    string mensaje = "Extraer los siguientes datos de la imagen. Devuelvelo como JSON con las "+ 
                    "propiedades descritas camelCase y sin espacio. " + 
                    "Campos requeridos: " +
                    "- NO, - Date (formato dd/MM/yyyy)  estos campos se encuentran en el encabezado," + 
                    "- Detalle (se enecuenta en la tabla): { Marks (1 columna) ,  Description (3 columna), Quantity (4 columna), CTN (5 columna)}";
                    respuesta = GetFromChatGPT(mensaje, imagen);
                    
                }

                if (context.Request.Params["ope"] == "0")
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.GuiaImportacion guia = JsonConvert.DeserializeObject<Entity.GuiaImportacion>(json);

                    Metodos.ValidateAntiXsrfToken("GuiaImportacionNew");


                    if (guia.id.IsNumeric() && !guia.observacion.IsInyection())
                    {
                        using (Repositorio.GuiaImportacion obj = new TwoTecnology.Repositorio.GuiaImportacion())
                        {
                            guia.id = obj.AgregarCabecera(empresaruc, localcodigo, guia.idalmacen,  guia.fecha.ConverTo_YYYYMMDD(), 
                                guia.no, guia.observacion, usuario_nombre);
                            

                            foreach (var item in guia.detalle)
                            {
                                obj.AgregarDetalle(guia.id, item.idproducto, item.codigointerno, item.idalmacen, item.nombre, 
                                    item.idfamilia, item.idcategoria, item.cantidad, item.ctn, item.precio);
                            }

                            obj.ActualizarEstado(guia.id, "1");

                            obj.ActualizarStock(guia.id);

                            //obj.ActualizarPresentacion(guia.id);

                            obj.ActualizarCierre(guia.id);

                            respuesta = guia.id;
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                respuesta = "Error General";
            }

            context.Response.Write(respuesta);


        }
        private string GetFromChatGPT(string mensaje, string imagen)
        {
            string resultado = "";

            try
            {
                // Your OpenAI API key
                string apiKey = "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";
                string apiUrl = "https://api.openai.com/v1/chat/completions";


                //string requestJson = string.Format(@"{1}{0}model{0}:{0}gpt-4o{0},{0}messages{0}:[{{0}role{0}:{0}user{0},{0}content{0}:[{{0}type{0}:{0}text{0},{0}text{0}:{0}{3}{0}},{{0}type{0}:{0}image_url{0},{0}image_url{0}:{{0}url{0}:{0}{4}{0}}}]}]}",
                //(char)34,
                //"{",
                //"}",
                //mensaje,
                //imagen);

                //var requestJson = new
                //{
                //    model = "gpt-4o",
                //    messages =[]{ 

                //    }
                //};

                TwoTecnology.Entity.ChatGPT.Root objeto = new TwoTecnology.Entity.ChatGPT.Root();
                Entity.ChatGPT.Message message = new Entity.ChatGPT.Message();
                Entity.ChatGPT.Content content1 = new Entity.ChatGPT.Content();
                Entity.ChatGPT.Content content2 = new Entity.ChatGPT.Content();

                objeto.model = "gpt-4o";
                message.role = "user";

                content1.type = "text";
                content1.text = mensaje;

                content2.type = "image_url";
                content2.image_url = new Entity.ChatGPT.ImageUrl { url = imagen };
                message.content = new List<Entity.ChatGPT.Content>();

                message.content.Add(content1);
                message.content.Add(content2);

                objeto.messages = new List<Entity.ChatGPT.Message>();
                objeto.messages.Add(message);

                //var requestJson = System.Text.Json.JsonSerializer.Serialize(objeto);

                var requestJson =  JsonConvert.SerializeObject(
                objeto,
                Newtonsoft.Json.Formatting.None,
                new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Ignore
                });


                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11;

                var client = new RestClient(apiUrl);
                var request = new RestRequest(Method.POST);
                request.AddParameter("application/json", requestJson, ParameterType.RequestBody);
                request.AddHeader("Authorization", $"Bearer {apiKey}");
                var response = client.Execute(request);

                dynamic responseJson = JsonConvert.DeserializeObject(response.Content);
                //string completion = responseJson.choices[0].text;

                resultado = responseJson.choices[0].message.content.Value.Replace("```json", "").Replace("```", "");

            }
            catch (HttpRequestException hre)
            {
                Console.WriteLine("HTTP Request Exception: " + hre.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine("General Exception: " + ex);
            }

            return resultado;
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