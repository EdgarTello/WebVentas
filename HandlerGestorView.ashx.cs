using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using iTextSharp.text.pdf;

namespace TwoTecnology.WebVentas
{
    public class HandlerGestorView : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //Check if Request is to Upload the File.

            string retorno = "";
;
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

                string ruc = ticket.UserData.Split('|')[1];
                string pathdocumento = ticket.UserData.Split('|')[22];
                string ver = ticket.UserData.Split('|')[24];
                string descargar = ticket.UserData.Split('|')[25];
                string editar = ticket.UserData.Split('|')[26];
                string eliminar = ticket.UserData.Split('|')[27];

               

                if (ver == "0")
                {
                    context.Response.Clear();
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("No cuenta con permiso de visualización de documentos!");
                }
                else
                {
                    string id = HttpContext.Current.Request.Form["id"];

                    using (Repositorio.GestorDocumento doc = new TwoTecnology.Repositorio.GestorDocumento())
                    {
                        var documento = doc.LoadById(id);

                        if (string.IsNullOrEmpty(documento.ruta) || !File.Exists(documento.ruta))
                        {
                            context.Response.Clear();
                            context.Response.ContentType = "text/plain";
                            context.Response.Write(string.Format("El archivo no fue encontrado:{0}", documento.archivo));
                            
                        }
                        else
                        {
                            doc.ActualizaLog(id, "Ver");

                            context.Response.Clear();
                            context.Response.ContentType = "application/pdf";
                            context.Response.AppendHeader("Content-Disposition", string.Format("inline; filename={0}", documento.archivo));
                            context.Response.BinaryWrite(File.ReadAllBytes(documento.ruta));
                            context.Response.Flush();
                        }
                    }
                }


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }
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