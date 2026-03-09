using Ionic.Zip;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.GestorDocumental.Documentos
{
    public partial class Exportacion : System.Web.UI.Page
    {
        string urlDefault = "../../GestorDocumental/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                else
                {
                    FormsAuthenticationTicket ticket = null;

                    try
                    {
                        FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                        ticket = formsIdentity.Ticket;
                    }
                    catch
                    {
                        Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                        Response.End();
                    }

                    if (Request.QueryString["ope"] == "3")
                    {
                        string json = Request.QueryString["json"];

                        //Metodos.ValidateAntiXsrfToken("DocumentosList");

                        List<string> listado = JsonConvert.DeserializeObject<List<string>>(json);

                        using (Repositorio.GestorDocumento obj = new TwoTecnology.Repositorio.GestorDocumento())
                        {

                            var listadopdf = obj.LoadPdf(listado);

                            if (listadopdf.Count > 0)
                            {

                                using (ZipFile zip = new ZipFile())
                                {
                                    DateTime now = DateTime.Now;
                                    string codigo = now.ToString("yyyyMMddHHmmss");

                                    zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                                    //zip.AddDirectoryByName(codigo);

                                    foreach (var item in listadopdf)
                                    {
                                        string exportacion = item.exportacion
                                            .Replace("{indice1}", item.indice1)
                                            .Replace("{indice2}", item.indice2)
                                            .Replace("{indice3}", item.indice3)
                                            .Replace("{indice4}", item.indice4)
                                            .Replace("{indice5}", item.indice5)
                                            .Replace("{indice6}", item.indice6)
                                            .Replace("{indice7}", item.indice7)
                                            .Replace("{indice8}", item.indice8)
                                            .Replace("{indice9}", item.indice9)
                                            .Replace("{indice10}", item.indice10);

                                        FileInfo file1 = new FileInfo(item.ruta);

                                        if (file1.Exists)
                                            zip.AddFile(item.ruta, exportacion);
                                    }

                                    Response.Clear();
                                    Response.BufferOutput = false;
                                    string zipName = String.Format("{0}.zip", codigo);
                                    Response.ContentType = "application/zip";
                                    Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                                    zip.Save(Response.OutputStream);
                                }
                            }
                        }
                    }

                    Response.End();
                }
            }
        }
    }
}