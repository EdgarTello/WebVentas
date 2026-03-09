using DevExpress.XtraRichEdit.Model;
using iTextSharp.text.pdf.parser;
using iTextSharp.text.pdf.qrcode;
using Microsoft.Owin.Security.Provider;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Net.Mime;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.VTex.Recojo
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

                if (context.Request.Params["ope"] == "0")
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    string indicador = string.Empty;
                    StringBuilder serror = new StringBuilder();
                    
                    Metodos.ValidateAntiXsrfToken("IpickupList");

                    TwoTecnology.Entity.VTex.ItemSendMail pedido = JsonConvert.DeserializeObject<TwoTecnology.Entity.VTex.ItemSendMail>(json);
                    var empresa = new TwoTecnology.BusinessShared.Consulta().ConsultaEmpresaByRuc(empresaruc);
                    string urlorderlogo = ConfigurationManager.AppSettings["urlorderlogo"] ?? "";
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls13;

                    try
                    {
                        string htmlContent = File.ReadAllText(System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "VTexOrder.html"));
                        TwoTecnology.Entity.VTex.OrdenPago d = new TwoTecnology.Entity.VTex.OrdenPago();

                        using (TwoTecnology.Repositorio.VTex.ItemOrder obj = new TwoTecnology.Repositorio.VTex.ItemOrder())
                        {
                            var id = obj.LoadByGuid(pedido.guid);
                            d = obj.LoadByIdWithDetail(id);
                            htmlContent=  htmlContent.Replace("{$pnombre}", string.Format("Hola {0}", d.clientname));
                            htmlContent = htmlContent.Replace("{$porden}", string.Format("# {0}", d.orderid));
                            htmlContent = htmlContent.Replace("{$pnumid}", string.Format("{0}", d.orderid));
                            htmlContent = htmlContent.Replace("{$pentregar}", string.Format("{0}", d.shippingreceivername));

                            htmlContent = htmlContent.Replace("{$pdireccion1}", string.Format("Ilaria {0}", d.shippingneighborhood));
                            htmlContent = htmlContent.Replace("{$pdireccion2}", string.Format("{0} {1}", d.shippingstreet, d.shippingnumber));
                            htmlContent = htmlContent.Replace("{$pdireccion3}", string.Format("{0}-{1}-{2}", d.shippingcity, d.shippingstate, d.shippingcountry));
                            htmlContent = htmlContent.Replace("{$pdireccion4}", string.Format("{0}", d.shippingpostalcode));
                            htmlContent = htmlContent.Replace("{$pdireccion5}", string.Format("{0} {1}", d.shippinggeox, d.shippinggeoy));

                            htmlContent = htmlContent.Replace("{$padditionalinfo}", string.Format("{0}", d.additionalinfo));

                            htmlContent = htmlContent.Replace("{$productsamount}", string.Format("{0} {1}", d.currencysymbol, Convert.ToDecimal(d.productsamount).ToString("#,##0.00")));
                            htmlContent = htmlContent.Replace("{$discountsamount}", string.Format("{0} {1}", d.currencysymbol, Convert.ToDecimal(d.discountsamount).ToString("#,##0.00")));
                            htmlContent = htmlContent.Replace("{$totalamount}", string.Format("{0} {1}", d.currencysymbol, Convert.ToDecimal(d.totalamount).ToString("#,##0.00")));
                            
                        }

                        using (MailMessage message = new MailMessage())
                        {
                            string messageid = String.Format("<{0}@{1}>", Guid.NewGuid().ToString(), empresa.CorreoCuenta.Split('@')[1]);
                            message.Headers.Add("Message-Id", messageid);
                            message.BodyEncoding = System.Text.Encoding.UTF8;
                            message.SubjectEncoding = System.Text.Encoding.UTF8;                            
                            message.Subject = pedido.emailsubject;
                            message.From = new MailAddress(empresa.CorreoCuenta, empresa.CorreoCuenta);

                            List<LinkedResource> listresourcex = new List<LinkedResource>();

                            
                            StringBuilder detail = new StringBuilder();
                            int row = 1;
                            int rowtotal = d.detail.Count;

                            foreach (var products in d.detail)
                            {

                                string productsimagen = string.Format("$productsimagen{0}", row.ToString());
                                var descripcion = string.Format("{0} unid. {1} {2}", products.quantity, d.currencysymbol, Convert.ToDecimal(products.costprice).ToString("#,##0.00"));
                                //string line = "<tr><td colspan='2'><hr style='border: 0.2px solid #979595;'></td></tr>";


                                detail.AppendLine("<tr>" +
                                        "   <td style='padding:4px;text-align:center;border-top:0.2px solid #979595;border-right:0.2px solid #979595;'> " +
                                        "       <img src='cid:{$productsimagen}' height='80' width='80'>" +
                                        "   </td>" +
                                        "   <td style='text-align:left;border-top:0.2px solid #979595;'>" +
                                        "       <p style='padding-left:10px;margin: 0 auto !important;font-family:Arial,Tahoma,Helvetica; font-size: 0.8rem !important;'>{$productsname}</p>" +
                                        "       <p style='padding-left:10px;margin: 0 auto !important;font-family:Arial,Tahoma,Helvetica; font-size: 0.8rem !important;'>{$productsamount}</p>" +  
                                        "   </td>"+ 
                                        "</tr>")
                                        //((row<rowtotal)?line:""))
                                        .Replace("{$productsname}", products.name)
                                        .Replace("{$productsamount}", descripcion)
                                        .Replace("{$productsimagen}", productsimagen);


                                
                                LinkedResource resourcex = new LinkedResource(GetImagen(products.url), "image/jpeg") { ContentId = productsimagen };
                                listresourcex.Add(resourcex);
                                row++;
                            }

                            htmlContent = htmlContent.Replace("{tbody}", string.Format("{0}", detail.ToString()));

                            AlternateView item = AlternateView.CreateAlternateViewFromString(htmlContent, null, "text/html");
                            LinkedResource resource = new LinkedResource(GetImagen(urlorderlogo), "image/jpeg"){ContentId = "imglogo"};
                            item.LinkedResources.Add(resource);

                            foreach(var itemresourcex in listresourcex)
                            item.LinkedResources.Add(itemresourcex);



                            message.AlternateViews.Add(item);
                            message.To.Add(pedido.emailto);

                            //if (!string.IsNullOrEmpty(pedido.emailcc)) message.CC.Add(pedido.emailcc);

                            if (!string.IsNullOrEmpty(pedido.emailbcc)){

                                string[] emailbcc = pedido.emailbcc.Split(';');

                                foreach (string s in emailbcc)
                                {
                                    message.Bcc.Add(s);
                                }
                                
                            }
                                                                
                            //ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                            SmtpClient client = new SmtpClient(empresa.CorreoServidor, Convert.ToInt32(empresa.CorreoPuerto));
                            client.EnableSsl = empresa.CorreoSSL;
                            client.Timeout = 60000;
                            client.DeliveryMethod = SmtpDeliveryMethod.Network;
                            client.UseDefaultCredentials = false;
                            //client.TargetName = "STARTTLS/smtp.gmail.com";
                            client.TargetName = "STARTTLS/smtp.office365.com";

                            client.Credentials = new NetworkCredential(empresa.CorreoUsuario, empresa.CorreoClave);
                            client.Send(message);
                            new TwoTecnology.Repositorio.VTex.ItemOrder().UpdateSendMail(empresaruc, pedido.id, "S");
                            respuesta = pedido.id;
                        }
                    }
                    catch (Exception ex)
                    {
                        new TwoTecnology.Repositorio.VTex.ItemOrder().UpdateSendMail(empresaruc, pedido.id, "N");
                        Console.WriteLine(ex.Message);
                    }
                }

                if (context.Request.Params["ope"] == "1")
                {
                    string id = context.Request.Params["id"];

                    Metodos.ValidateAntiXsrfToken("IpickupList");

                    using (TwoTecnology.Repositorio.VTex.ItemOrder obj = new TwoTecnology.Repositorio.VTex.ItemOrder())
                    {
                        var orden =obj.LoadById(empresaruc, id);

                        if (orden.pickupinstatus == "1")
                        {

                            obj.UpdateOrderStatus(empresaruc, id, "2");//En Tienda
                            obj.AddOrderStatus(id, "2", usuario_nombre);//En Tienda

                            respuesta = id;
                        }
                        else
                            respuesta = string.Format("La orden {0} no se puede procesar!", orden.id);
                    }
                }

                if (context.Request.Params["ope"] == "2")
                {
                    string id = context.Request.Params["id"];

                    Metodos.ValidateAntiXsrfToken("IpickupList");

                    using (TwoTecnology.Repositorio.VTex.ItemOrder obj = new TwoTecnology.Repositorio.VTex.ItemOrder())
                    {
                        var orden = obj.LoadById(empresaruc, id);

                        if (orden.pickupinstatus == "2")
                        {

                            obj.UpdateOrderStatus(empresaruc, id, "3");//En Tienda
                            obj.AddOrderStatus(id, "3", usuario_nombre);//En Tienda

                            respuesta = id;
                        }
                        else
                            respuesta = string.Format("La orden {0} no se puede procesar!", orden.id);
                    }
                }


            }
            catch(Exception ex)
            {
                //Console.WriteLine(ex.Message);
                respuesta = ex.Message;
            }

            context.Response.Write(respuesta);


        }

        public Stream GetImagen(string url) {
            using (WebClient client = new WebClient())
            {
                byte[] imageData = client.DownloadData(url);
                Stream stream = new MemoryStream(imageData);
                return stream;

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