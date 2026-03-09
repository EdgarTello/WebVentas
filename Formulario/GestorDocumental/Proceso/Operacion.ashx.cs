using DevExpress.PivotGrid.Criteria.Validation;
using DevExpress.XtraRichEdit.Commands;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using TwoTecnology.WebVentas.Formulario.GestorDocumental;

namespace TwoTecnology.WebVentas.Formulario.GestorDocumental.Proceso
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

            //try
            //{
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
            string ruta_principal = ticket.UserData.Split('|')[35];
            string ruta_documento = ticket.UserData.Split('|')[36];
            string idarchivador = ticket.UserData.Split('|')[37];

            if (context.Request.Params["ope"] == "1" ) {
                //&& (usuario_acceso == "Administrador" || usuario_acceso == "Admin")

                string localdes = new Repositorio.Local().LoadByCodigo(empresaruc, localcodigo).nombre;
                string id = context.Request.Params["id"];
                string fecha = context.Request.Params["fecha"].ConverTo_YYYYMMDD();

                Metodos.ValidateAntiXsrfToken("ProcesoNew");

                if (id.IsNumeric() && !fecha.IsInyection())
                {

                    var drequisito = new TwoTecnology.Repositorio.GestorRequisito();
                    List<TwoTecnology.Entity.GestorRequisito> listareq = drequisito.Load(empresaruc);
                    List<string> lista_archivo = new List<string>();
                    List<string> lista_temporal = new List<string>();
                    int count = 0;
                    //List<TwoTecnology.Entity.GestorGenerar> lista_factura = new List<TwoTecnology.Entity.GestorGenerar>();

                    ////////////////////////////////////////////////////////////////////////////////////////////////
                    // obtiene los documentos que son factura
                    foreach (var itemreq in listareq)
                    {
                        var listfiles = Directory.EnumerateFiles(ruta_documento, "*.pdf", SearchOption.TopDirectoryOnly)
                        .Where(x => x.Contains(id) && x.ToUpper().Contains(string.Format("_{0}_", itemreq.parametro)) &&
                               System.IO.Path.GetFileNameWithoutExtension(x).CountChar('_') == 3)
                        .Select(filePath => filePath.ToUpper())
                        .ToList();

                        foreach (var filename in listfiles)
                        {
                            string nametmp = System.IO.Path.GetFileNameWithoutExtension(filename).ToUpper().Replace(".PDF", "");

                            if (itemreq.parametro == "F")
                            {
                                lista_archivo.Add(filename);
                            }
                            else
                            {

                                if (itemreq.parametro == "L")
                                {
                                    count = Convert.ToInt32(nametmp.Split('_')[3]);
                                    lista_temporal.AddIfNotExists(filename);
                                }
                            }
                        }
                    }

                    for (int i = 1; i <= count; i++) {

                        foreach (var itemreq in listareq)
                        {
                            if (itemreq.parametro == "R" || itemreq.parametro == "P" || itemreq.parametro == "T" || itemreq.parametro == "D")
                            {
                                var listfiles = Directory.EnumerateFiles(ruta_documento, "*.pdf", SearchOption.TopDirectoryOnly)
                                .Where(x => x.Contains(id) && x.ToUpper().Contains(string.Format("_{0}_", itemreq.parametro)) &&
                                       System.IO.Path.GetFileNameWithoutExtension(x).CountChar('_') == 3)
                                .Select(filePath => filePath.ToUpper())
                                .ToList();


                                foreach (var filename in listfiles)
                                {
                                    string nametmp = System.IO.Path.GetFileNameWithoutExtension(filename).ToUpper().Replace(".PDF", "");

                                    var numero = Convert.ToInt32(nametmp.Split('_')[3]);

                                    if (numero == i)
                                        lista_temporal.AddIfNotExists(filename);

                                }
                            }
                        }
                    }

                    //obtiene los documentos por cada facturaforeach (var itemreq in listareq)
                    //foreach (var name in lista_factura)
                    //{
                    //    foreach (var itemreq in listareq)
                    //    {
                    //        var listfiles = Directory.EnumerateFiles(ruta_documento, "*.pdf", SearchOption.TopDirectoryOnly)
                    //        .Where(x => x.Contains(id) && x.Contains(string.Format("_{0}_", itemreq.parametro)))
                    //        .ToList();

                    //        foreach (var filename in listfiles)
                    //        {
                    //            string nametmp = System.IO.Path.GetFileNameWithoutExtension(filename);

                    //            if (name.CountChar('_') == 3)
                    //            {
                    //                if (nametmp == name)
                    //                {
                    //                    lista_archivo.Add(Path.GetFileNameWithoutExtension(filename));
                    //                }
                    //                else {
                    //                    if (itemreq.parametro != "F")
                    //                    {
                    //                        lista_archivo.Add(name);
                    //                    }
                    //                }
                    //            }
                    //        }
                    //    }
                    //}
                    ////////////////////////////////////////////////////////////////////////////////////////////////




                    foreach (var item in lista_archivo)
                    {
                        //File.Delete(archivo_al);
                        string nametmp = System.IO.Path.GetFileNameWithoutExtension(item).ToUpper().Replace(".PDF","");
                        string facturatmp = nametmp.Split('_')[3].ToUpper();
                        string archivo_al = string.Format(@"{0}\{1}.pdf", ruta_principal, facturatmp);
                        var listaal = lista_temporal.Prepend(item).ToList();
                        //var tipo = itemreq.parametro.Split('_')[2];

                        //if (item.parametro == "F")

                        Shared.FilePdfOutAddPage(archivo_al, listaal);


                        AgregarArchivo(localcodigo, idarchivador, archivo_al, facturatmp, localdes, id, facturatmp, fecha,  
                            "", "", "", "", "", "",usuario_nombre, empresaruc);
                        
                    }

                    lista_archivo.RemoveFile();
                    lista_temporal.RemoveFile();


                    respuesta = id;

                }

            }
            //}
            //catch(Exception ex)
            //{
            //    respuesta = "-1";
            //}

            context.Response.Write(respuesta);
        }

        private void AgregarArchivo(string idlocal, string idarchivador, string outputFile, string filenombre, string indice1, string indice2, 
            string indice3, string indice4, string indice5, string indice6, string indice7, string indice8, string indice9, 
            string indice10, string usuario, string ruc) {

            string codigo = string.Empty;

            using (TwoTecnology.Repositorio.GestorDocumento obj = new TwoTecnology.Repositorio.GestorDocumento())
            {
                codigo = obj.Agregar(idlocal, idarchivador, 
                    indice1, indice2, indice3, indice4, indice5, 
                    indice6, indice7,indice8, indice9, indice10, 
                    usuario , ruc);

                string extension = Path.GetExtension(outputFile);
                string filename = Path.GetFileName(outputFile);
                string paginas = "0";
                byte[] Databytes = Shared.FileToByteArray(outputFile);

                if (Databytes != null)
                {
                    //File.WriteAllBytes(outputFile, Databytes);

                    if (extension == ".pdf")
                    {
                        paginas = Shared.GetPage(outputFile);
                    }

                    float mb = (Databytes.Length / 1024f) / 1024f;

                    obj.ActualizaTransaccion(codigo,
                        paginas,
                        filename,
                        outputFile,
                        mb.ToString("0.000000")
                        );

                    obj.ActualizaLog(codigo, "Crear");
                }
            }
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