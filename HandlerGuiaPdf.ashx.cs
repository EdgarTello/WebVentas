using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace TwoTecnology.WebVentas
{
    public class HandlerGuiaPdf : IHttpHandler
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

                if (context.Request.Files.Count > 0)
                {
                    string[] codigos = { "10", "20", "30", "40", "50", "60", "70", "80", "90", "100",
                                            "110", "120", "130", "140", "150", "160", "170", "180", "190", "200",
                                            "210", "220", "230", "240", "250", "260", "270", "280", "290", "300",
                                            "310", "320", "330", "340", "350", "360", "370", "380", "390", "400",
                                            "410", "420", "430", "440", "450", "460", "470", "480", "490", "500",
                                            "510", "520", "530", "540", "550", "560", "570", "580", "590", "600"};

                    StringBuilder sb = new StringBuilder();
                    HttpPostedFile postedFile = context.Request.Files[0];
                    string extension = System.IO.Path.GetExtension(postedFile.FileName);
                    string id = HttpContext.Current.Request.Form["id"];
                    string idmotivo = HttpContext.Current.Request.Form["idmotivo"];
                    List<string> list = new List<string>();
                    bool blnreparacion = false;
                    bool blntabla = false;                    
                    bool blncut = false;
                    bool blnsinkey = false;

                    using (PdfReader reader = new PdfReader(postedFile.InputStream))
                    {
                        ITextExtractionStrategy strategy = new SimpleTextExtractionStrategy();

                        for (int page = 1; page <= reader.NumberOfPages; page++)
                        {
                            string text = PdfTextExtractor.GetTextFromPage(reader, page, strategy);
                            if (!string.IsNullOrWhiteSpace(text))
                            {
                                if (page == reader.NumberOfPages)
                                {
                                    sb.Append(Encoding.UTF8.GetString(ASCIIEncoding.Convert(Encoding.Default, Encoding.UTF8, Encoding.Default.GetBytes(text))));
                                }
                            }
                        }           
                    }

                    
                    string[] lines = sb.ToString().Split(Environment.NewLine.ToCharArray());
                    

                    using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                    {
                        obj.EliminarDetalleAll(id);
                    }

                    for (int j=0;j<lines.Length;j++)
                    {
                        string line = lines[j];

                        if (line.IndexOf("Servicio de reparación") > 0) {
                            blnreparacion = true;
                        }

                        if(line.IndexOf("POS.") >= 0) {
                            blntabla = true;
                        }


                        string[] items = line.Split((char[])null, StringSplitOptions.RemoveEmptyEntries);

                        if (Array.IndexOf(codigos, items[0]) >= 0 || blncut || items[items.Length - 1] == "g")
                        {
                            if (blnreparacion)
                            {
                                procesar_reparacion(id, items);
                            }
                            else
                            {
                                if (Array.IndexOf(codigos, items[0]) == -1 && items[items.Length - 1] == "g" && items[0].Length>4)
                                {
                                    procesar_sinsecuencia(id, items);
                                }
                                else
                                {

                                    if (items.Length >= 8 && items[items.Length - 1] == "g")
                                    {
                                        procesar_normal(id, items);
                                    }
                                    else
                                    {
                                        if (!blncut)
                                        {
                                            blncut = true;
                                            list = new List<string>();
                                        }

                                        foreach (var item in items)
                                        {
                                            list.Add(item);

                                            if (item == "g")
                                            {
                                                procesar_normal(id, list.ToArray());
                                                blncut = false;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            if (blntabla && items[0]!="POS." && items[0].All(char.IsDigit)) {
                                blnsinkey = true;
                                procesar_productocodigo(id, items);
                            }
                        }
                        
                    }

                    //hilti
                    if (ruc == "20604767289")
                    {
                        using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                        {   
                            obj.ActualizarCabeceraHilti(id, idmotivo, ruc);

                            if(blnsinkey)
                                obj.ActualizaDetalleProducto(id, ruc);
                        }
                    }

                    retorno = "1";
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

        void procesar_productocodigo(string id, string[] items)
        {

            using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
            {
                string codigo = items[0];
                string cantidad = items[items.Length - 1].Replace(",", "");


                
                obj.AgregarDetalle_NoInventariado(id,
                    codigo,// guia.codigo, 
                    "",//guia.producto, 
                    "",//guia.descripcion, 
                    "NIU",
                    cantidad //guia.cantidad);
                    );

            }
        }

        void procesar_sinsecuencia(string id, string[] items)
        {

            using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
            {
                string codigo = items[0];
                StringBuilder nombre = new StringBuilder();
                string unidad = items[items.Length - 4];
                string cantidad = items[items.Length - 3].Replace(",", "");


                for (int index = 1; index <= items.Length - 5; index++)
                {
                    nombre.AppendLine(items[index]);
                }

                string[] _nombre = nombre.ToString().Split(new string[] { Environment.NewLine }, StringSplitOptions.None);

                obj.AgregarDetalle_NoInventariado(id,
                    codigo,// guia.codigo, 
                    string.Join(" ", _nombre).Trim(),//guia.producto, 
                    "",//guia.descripcion, 
                    ((unidad == "each") ? "EA" : "NIU"),//guia.unidad, 
                    cantidad //guia.cantidad);
                    );

            }
        }

        void procesar_reparacion(string id, string[] items)
        {

            using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
            {
                string codigo = items[1];
                StringBuilder nombre = new StringBuilder();
                string unidad = items[items.Length - 2];
                string cantidad = items[items.Length - 1].Replace(",", "");


                for (int index = 2; index <= items.Length - 3; index++)
                {
                    nombre.AppendLine(items[index]);
                }

                string[] _nombre = nombre.ToString().Split(new string[] { Environment.NewLine }, StringSplitOptions.None);

                obj.AgregarDetalle_NoInventariado(id,
                    codigo,// guia.codigo, 
                    string.Join(" ", _nombre).Trim(),//guia.producto, 
                    "",//guia.descripcion, 
                    ((unidad == "each") ? "EA" : "NIU"),//guia.unidad, 
                    cantidad //guia.cantidad);
                    );

            }
        }

        void procesar_normal(string id, string[] items) {

            using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
            {
                string codigo = items[1];
                StringBuilder nombre = new StringBuilder();
                string unidad = items[items.Length - 4];
                string cantidad = items[items.Length - 3].Replace(",", "");


                for (int index = 2; index <= items.Length - 5; index++)
                {
                    nombre.AppendLine(items[index]);
                }

                string[] _nombre = nombre.ToString().Split(new string[] { Environment.NewLine }, StringSplitOptions.None);

                obj.AgregarDetalle_NoInventariado(id,
                    codigo,// guia.codigo, 
                    string.Join(" ", _nombre).Trim(),//guia.producto, 
                    "",//guia.descripcion, 
                    ((unidad == "each") ? "EA" : "NIU"),//guia.unidad, 
                    cantidad //guia.cantidad);
                    );

            }
        }

        bool IsNumeric(object Expression)
        {
            double retNum;

            bool isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
            return isNum;
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