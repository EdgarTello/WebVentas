using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.RecepcionDocumentos
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

                if (context.Request.Params["ope"] == "1" && (usuario_acceso == "Recepcion" || usuario_acceso == "Derivador" || usuario_acceso == "Operador"))
                {
                    if (context.Request.Files.Count > 0)
                    {
                        //Fetch the Uploaded File.
                        HttpPostedFile postedFile = context.Request.Files[0];
                        string extension = System.IO.Path.GetExtension(postedFile.FileName);
                        string paginas = "0";
                        string pathdmesapartes_s = System.Web.Hosting.HostingEnvironment.MapPath(pathdmesapartes);
                        string pathdmesapartes_r = string.Format(@"{0}\{1}\Temporal", pathdmesapartes_s, empresaruc);


                        try
                        {
                            if (!System.IO.Directory.Exists( string.Format(@"{0}\{1}\Temporal", pathdmesapartes_s, empresaruc)))
                            {
                                System.IO.Directory.CreateDirectory(string.Format(@"{0}\{1}\Temporal", pathdmesapartes_s, empresaruc));
                            }
                        }
                        catch { }


                        using (Stream s = postedFile.InputStream)
                        {
                            using (BinaryReader br = new BinaryReader(s))
                            {
                                byte[] Databytes = br.ReadBytes((Int32)s.Length);
                                var guid = Guid.NewGuid().ToString();

                                using (TwoTecnology.Repositorio.MPArchivo obj = new TwoTecnology.Repositorio.MPArchivo())
                                {
                                    string pathfile = string.Format(@"{0}\{1}{2}",
                                       pathdmesapartes_r,
                                       guid,
                                       extension);

                                    File.WriteAllBytes(
                                        pathfile,
                                        Databytes);

                                    if (extension == ".pdf")
                                    {
                                        paginas = Shared.GetPage(pathfile);
                                    }

                                    string pathdmesapartes_u = string.Format(@"{0}/{1}/Temporal/{2}{3}",pathdmesapartes, empresaruc, guid, extension);
                                    string urlhost_a = string.Format(@"{0}{1}/{2}/Temporal/{3}{4}", urlhost, pathdmesapartes.Replace("~",""), empresaruc, guid, extension);

                                    string id = obj.Agregar(
                                        empresaruc,
                                        guid,
                                        postedFile.FileName,
                                        pathdmesapartes_u,
                                        urlhost_a,
                                        pathfile,
                                        extension,
                                        paginas,
                                        Shared.ConvertBytesToMegabytes(postedFile.ContentLength).ToString()
                                        );

                                    

                                    //obj.ActualizaLog(id, "Crear");

                                    respuesta = id;

                                }
                            }
                        }
                    }
                }

                if (context.Request.Params["ope"] == "100" && (usuario_acceso == "Recepcion" || usuario_acceso == "Derivador" || usuario_acceso == "Operador")) 
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.MPDocumento mpdocumento = JsonConvert.DeserializeObject<Entity.MPDocumento>(json);

                    using (TwoTecnology.Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        respuesta = obj.LoadRecepcion(
                            empresaruc,
                            mpdocumento.fechainicio.ConverTo_YYYYMMDD(),
                            mpdocumento.fechafin.ConverTo_YYYYMMDD(),
                            mpdocumento.operacion,
                            mpdocumento.etapa,
                            mpdocumento.idarea,
                            mpdocumento.busqueda,
                            usuario_nombre).Serialize();
                        
                    }
                }

                if (context.Request.Params["ope"] == "101" && (usuario_acceso == "Recepcion" || usuario_acceso == "Derivador" || usuario_acceso == "Operador" || usuario_acceso == "Gerencia"))
                {
                    string iddocumento=context.Request.Params["iddocumento"];

                    using (TwoTecnology.Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        respuesta = obj.LoadHistorial(
                            empresaruc,
                            iddocumento).Serialize();

                    }
                }

                if (context.Request.Params["ope"] == "102" && (usuario_acceso == "Recepcion" || usuario_acceso == "Derivador" || usuario_acceso == "Operador"))
                {
                    string codigointerno = context.Request.Params["codigointerno"];

                    using (TwoTecnology.Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        respuesta = obj.LoadHistorialv2(
                            empresaruc,
                            codigointerno).Serialize();

                    }
                }

                if (context.Request.Params["ope"] == "2" && (usuario_acceso == "Recepcion" || usuario_acceso == "Derivador" || usuario_acceso == "Operador"))
                {
                    string id = "0";
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.MPDocumento mpdocumento = JsonConvert.DeserializeObject<Entity.MPDocumento>(json);

                    string etapa = "0";

                    switch (usuario_acceso) {
                        case "Recepcion":
                            etapa = "1";
                            break;

                        case "Derivador":
                            etapa = "1";
                            break;

                        case "Operador":
                            etapa = "20";
                            mpdocumento.ope = "S";
                            mpdocumento.operador = usuario_codigo;
                            mpdocumento.idarea = usuario_idarea;
                            break;
                    }

                    using (TwoTecnology.Repositorio.MPDocumento doc = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        if (mpdocumento.id == "0")
                        {
                            id = doc.Agregar(empresaruc,
                            mpdocumento.idarchivo,
                            localcodigo,
                            usuario_nombre,
                            mpdocumento.asunto,
                            mpdocumento.clientetipodoc, 
                            mpdocumento.clientedocumento, 
                            mpdocumento.clientenombre,
                            mpdocumento.idtipo, mpdocumento.idarea, mpdocumento.idcanal,
                            mpdocumento.plazofecha.ConverTo_YYYYMMDD(),
                            mpdocumento.confidencial,
                            mpdocumento.respuesta,
                            mpdocumento.ope,
                            mpdocumento.operador ?? "0",
                            etapa,
                            mpdocumento.codigointerno_r ?? "",
                            GetIPAddress()
                            ); ;

                            respuesta = doc.LoadByCodigo(empresaruc, id, "", "").codigointerno;

                            using (TwoTecnology.Repositorio.MPArchivo mparchivo = new TwoTecnology.Repositorio.MPArchivo())
                            {
                                TwoTecnology.Entity.MPArchivo iarchivo = mparchivo.LoadByCodigo(empresaruc, mpdocumento.idarchivo);

                                if (File.Exists(iarchivo.ruta.Replace("Temporal", "Aprobado"))) {
                                    File.Delete(iarchivo.ruta.Replace("Temporal", "Aprobado"));
                                }

                                //File.Copy(iarchivo.ruta, iarchivo.ruta.Replace("Temporal", "Aprobado"));

                                try
                                {
                                    Shared.GetTexto(iarchivo.ruta, id);
                                    Shared.PdfStamp(iarchivo.ruta, iarchivo.ruta.Replace("Temporal", "Aprobado"), respuesta);                                    
                                }
                                catch (Exception ex) {
                                    File.Copy(iarchivo.ruta, iarchivo.ruta.Replace("Temporal", "Aprobado"));
                                }

                                mparchivo.EditarPath(mpdocumento.idarchivo,
                                    iarchivo.ruta.Replace("Temporal", "Aprobado"),
                                    iarchivo.absolute.Replace("Temporal", "Aprobado"),
                                    iarchivo.url.Replace("Temporal", "Aprobado"));

                            }
                        }
                        else {
                            id = mpdocumento.id;

                            doc.Editar(mpdocumento.id,
                                mpdocumento.asunto,
                                mpdocumento.clientetipodoc,
                                mpdocumento.clientedocumento, 
                                mpdocumento.clientenombre,
                                mpdocumento.idtipo, mpdocumento.idarea, mpdocumento.idcanal,
                                mpdocumento.plazofecha.ConverTo_YYYYMMDD(),
                                mpdocumento.confidencial,
                                mpdocumento.respuesta,
                                usuario_codigo,
                                GetIPAddress(),
                                empresaruc
                                );

                            respuesta = doc.LoadByCodigo(empresaruc, id, "", "").codigointerno;

                        }

                        

                    }

                    using (Repositorio.MPEtiqueta doc = new TwoTecnology.Repositorio.MPEtiqueta())
                    {
                        doc.Eliminar(empresaruc, id);

                        foreach (var ietiqueta in mpdocumento.etiquetas) {
                            doc.Agregar(empresaruc, id, ietiqueta.nombre);
                        }
                    }

                    
                }

                if (context.Request.Params["ope"] == "2000" && (usuario_acceso == "Recepcion" || usuario_acceso == "Derivador"))
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
            catch (Exception ex)
            {
                //throw new Exception(ex.Message);
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