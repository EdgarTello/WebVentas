using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using iTextSharp.text.pdf;

namespace TwoTecnology.WebVentas.Formulario.GestorDocumental
{
    public class HandlerGestor : IHttpHandler
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

                string pathdocumento = ticket.UserData.Split('|')[22];

                Metodos.ValidateAntiXsrfToken("ImportNew");


                if (context.Request.Files.Count > 0)
                {
                    //Fetch the Uploaded File.
                    HttpPostedFile postedFile = context.Request.Files[0];
                    string extension = Path.GetExtension(postedFile.FileName);
                    string id = HttpContext.Current.Request.Form["id"];
                    string paginas = "0";

                    string pathfile = string.Format(@"{0}\{1}{2}",
                                    pathdocumento,
                                    id,
                                    extension);

                    try
                    {
                        if (!System.IO.Directory.Exists(pathdocumento))
                        {
                            System.IO.Directory.CreateDirectory(pathdocumento);
                        }
                    }
                    catch { }


                    using (Stream s = postedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(s))
                        {
                            byte[] Databytes = br.ReadBytes((Int32)s.Length);

                            using (Repositorio.GestorDocumento obj = new TwoTecnology.Repositorio.GestorDocumento())
                            {
                                File.WriteAllBytes(
                                    pathfile,
                                    Databytes);

                                if (extension == ".pdf")
                                {
                                    PdfReader pdfReader = new PdfReader(pathfile);
                                    paginas = pdfReader.NumberOfPages.ToString();
                                }

                                obj.ActualizaTransaccion(id,
                                    paginas,
                                    postedFile.FileName,
                                    pathfile,
                                    ConvertBytesToMegabytes(postedFile.ContentLength).ToString()
                                    );

                                obj.ActualizaLog(id, "Crear");

                                retorno = "1";

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }
            finally {

                context.Response.StatusCode = (int)HttpStatusCode.OK;
                context.Response.ContentType = "text/json";
                context.Response.Write(retorno);
                context.Response.End();
            }
        }

        decimal ConvertBytesToMegabytes(long bytes)
        {
            return Math.Round(Convert.ToDecimal( (bytes / 1024f) / 1024f),6);
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