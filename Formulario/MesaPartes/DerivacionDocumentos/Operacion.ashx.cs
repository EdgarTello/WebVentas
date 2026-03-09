using iTextSharp.text.pdf;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.DerivacionDocumentos
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

                /*
                if (context.Request.Params["ope"] == "1" && usuario_acceso=="Derivador")
                {
                    if (context.Request.Files.Count > 0)
                    {
                        //Fetch the Uploaded File.
                        HttpPostedFile postedFile = context.Request.Files[0];
                        string extension = Path.GetExtension(postedFile.FileName);
                        string paginas = "0";
                        string pathdmesapartes_s = System.Web.Hosting.HostingEnvironment.MapPath(pathdmesapartes);
                        string pathdmesapartes_r = string.Format(@"{0}\{1}", pathdmesapartes_s, empresaruc);



                        try
                        {
                            if (!System.IO.Directory.Exists( string.Format(@"{0}\{1}", pathdmesapartes_s, empresaruc)))
                            {
                                System.IO.Directory.CreateDirectory(string.Format(@"{0}\{1}", pathdmesapartes_s, empresaruc));
                            }
                        }
                        catch { }


                        using (Stream s = postedFile.InputStream)
                        {
                            using (BinaryReader br = new BinaryReader(s))
                            {
                                byte[] Databytes = br.ReadBytes((Int32)s.Length);
                                var guid = Guid.NewGuid().ToString();

                                using (Repositorio.MPArchivo obj = new TwoTecnology.Repositorio.MPArchivo())
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
                                        PdfReader pdfReader = new PdfReader(pathfile);
                                        paginas = pdfReader.NumberOfPages.ToString();
                                    }

                                    string pathdmesapartes_u = string.Format(@"{0}/{1}/{2}{3}",pathdmesapartes, empresaruc, guid, extension);
                                    string urlhost_a = string.Format(@"{0}{1}/{2}/{3}{4}", urlhost, pathdmesapartes.Replace("~",""), empresaruc, guid, extension);

                                    string id = obj.Agregar(
                                        empresaruc,
                                        guid,
                                        postedFile.FileName,
                                        pathdmesapartes_u,
                                        urlhost_a,
                                        pathfile,
                                        extension,
                                        paginas,
                                        ConvertBytesToMegabytes(postedFile.ContentLength).ToString()
                                        );

                                    

                                    //obj.ActualizaLog(id, "Crear");

                                    respuesta = id;

                                }
                            }
                        }
                    }
                }
                */

                if(context.Request.Params["ope"] == "100" && usuario_acceso == "Derivador")
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.MPDocumento mpdocumento = JsonConvert.DeserializeObject<Entity.MPDocumento>(json);


                    using (TwoTecnology.Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        respuesta = obj.LoadDerivador(
                            empresaruc,
                            mpdocumento.fechainicio.ConverTo_YYYYMMDD(),
                            mpdocumento.fechafin.ConverTo_YYYYMMDD(),
                            mpdocumento.operacion,
                            mpdocumento.etapa,
                            mpdocumento.idarea,
                            mpdocumento.busqueda).Serialize();

                    }
                }

                
                if (context.Request.Params["ope"] == "2" && usuario_acceso == "Derivador")
                {
                    //string id = context.Request.Params["id"];
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.MPDocumento mpdocumento = JsonConvert.DeserializeObject<Entity.MPDocumento>(json);

                    using (Repositorio.MPDocumento doc = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        if (mpdocumento.id == "0")
                        {
                            
                        }
                        else {
                            doc.Editar(mpdocumento.id,
                                mpdocumento.asunto,
                                mpdocumento.clientetipodoc, mpdocumento.clientedocumento, mpdocumento.clientenombre,
                                mpdocumento.idtipo, mpdocumento.idarea, mpdocumento.idcanal,
                                mpdocumento.plazofecha.ConverTo_YYYYMMDD(),
                                mpdocumento.confidencial,
                                mpdocumento.respuesta,
                                usuario_nombre,
                                GetIPAddress(),
                                empresaruc);

                            respuesta = "OK";
                        }
                    }
                }

                

                if (context.Request.Params["ope"] == "3" && usuario_acceso == "Derivador")
                {
                    //string id = context.Request.Params["id"];
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.MPDocumento mpdocumento = JsonConvert.DeserializeObject<Entity.MPDocumento>(json);


                    using (Repositorio.MPDocumento doc = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        doc.Editar(mpdocumento.id,
                            mpdocumento.usuario,
                            "10",
                            usuario_nombre,
                            GetIPAddress(),
                            empresaruc);

                        respuesta = "OK";
                        
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