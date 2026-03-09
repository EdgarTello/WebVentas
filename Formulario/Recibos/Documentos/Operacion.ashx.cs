using iTextSharp.text.pdf;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.Recibos.Documentos
{
    /// <summary>
    /// Summary description for Operacion1
    /// </summary>
    public class Operacion1 : IHttpHandler
    {
        string respuesta = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            //Check if Request is to Upload the File.

            string retorno = "";
            
            try
            {
                FormsAuthenticationTicket ticket = null;
                try
                {
                    FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                    ticket = formsIdentity.Ticket;
                }
                catch
                {
                }

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
                string pathmesapartes = ticket.UserData.Split('|')[33];
                string pathrecibos = ticket.UserData.Split('|')[40];
                string urlhost = ticket.UserData.Split('|')[34];
                string usuario_idarea = ticket.UserData.Split('|')[35];

                if (context.Request.Params["ope"] == "1" && (usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador"))
                {
                    if (context.Request.Files.Count > 0)
                    {
                        //Fetch the Uploaded File.
                        HttpPostedFile postedFile = context.Request.Files[0];
                        string extension = System.IO.Path.GetExtension(postedFile.FileName);
                        string paginas = "1";
                        string pathrecibos_s = System.Web.Hosting.HostingEnvironment.MapPath(pathrecibos);
                        string pathrecibos_r = string.Format(@"{0}\{1}\Temporal", pathrecibos_s, empresaruc);


                        try
                        {
                            if (!System.IO.Directory.Exists(string.Format(@"{0}\{1}\Temporal", pathrecibos_s, empresaruc)))
                            {
                                System.IO.Directory.CreateDirectory(string.Format(@"{0}\{1}\Temporal", pathrecibos_s, empresaruc));
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
                                       pathrecibos_r,
                                       guid,
                                       extension);

                                    File.WriteAllBytes(
                                        pathfile,
                                        Databytes);

                                    string pathrecibos_u = string.Format(@"{0}/{1}/Temporal/{2}{3}", pathrecibos, empresaruc, guid, extension);
                                    string urlhost_a = string.Format(@"{0}{1}/{2}/Temporal/{3}{4}", urlhost, pathrecibos.Replace("~", ""), empresaruc, guid, extension);

                                    string id = obj.Agregar(
                                        empresaruc,
                                        guid,
                                        postedFile.FileName,
                                        pathrecibos_u,
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
            }
            catch (Exception ex)
            {
                //throw new Exception(ex.Message);
                respuesta = "-1";
            }

            context.Response.Write(respuesta);
        }

        decimal ConvertBytesToMegabytes(long bytes)
        {
            return Math.Round(Convert.ToDecimal((bytes / 1024f) / 1024f), 6);
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