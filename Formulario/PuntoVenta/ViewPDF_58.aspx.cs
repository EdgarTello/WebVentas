using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta
{
    public partial class ViewPDF_58 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthenticationTicket ticket = null;

            try
            {
                FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                ticket = formsIdentity.Ticket;
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }

            string ruc = ticket.UserData.Split('|')[1];
            
            //Response.Expires = -1;
            Response.ContentType = "application/pdf";

            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                    // This is an unauthorized, authenticated request...
                    Response.Redirect("Default.aspx");
            }

            string tipo = Request.QueryString["tipo"].ToString();
            string indicador = Request.QueryString["indicador"].ToString();
            string serie = Request.QueryString["serie"].ToString();
            string correlativo = Request.QueryString["correlativo"].ToString();
            string webservice = ConfigurationSettings.AppSettings["webservice"];

            if (webservice == "0")
            {
                string id = Request.QueryString["id"].ToString();
                var pedido = new TwoTecnology.Repositorio.Pedido().LoadByCodigo(id);

                using (Repositorio.PdfGenerate objeto = new TwoTecnology.Repositorio.PdfGenerate())
                {
                    var pdf = objeto.GenerarPDF_Documento(id, "58");

                    if (pdf != null && pdf.Length > 0)
                    {
                        Response.Clear();
                        Response.ContentType = "application/pdf";
                        Response.AppendHeader("Content-Disposition", string.Format("inline; filename={0}.pdf", pedido.xml));
                        Response.BinaryWrite(pdf);

                    }
                    else
                    {
                        Response.Clear();
                        Response.ContentType = "text/plain";
                        Response.Write("El archivo no fue encontrado!");
                    }
                }

            }
            else
            {

                using (servicioImpresionPedido.DocumentoPedidoClient doc = new servicioImpresionPedido.DocumentoPedidoClient())
                {
                    string documento = string.Empty;

                    if (tipo != "" && indicador != "" && serie != "" && correlativo != "")
                    {
                        documento = doc.ObtenerPdf58(ruc, tipo, string.Format("{0}{1}", indicador, serie), correlativo);
                    }

                    string xml = string.Format("{0}-{1}-{2}{3}-{4}.pdf", ruc, tipo, indicador, serie, correlativo);

                    if (string.IsNullOrEmpty(documento))
                    {
                        if (Request.QueryString["id"] != null)
                        {

                            string id = Request.QueryString["id"].ToString();
                            var pedido = new TwoTecnology.Repositorio.Pedido().LoadByCodigo(id);

                            using (Repositorio.PdfGenerate objeto = new TwoTecnology.Repositorio.PdfGenerate())
                            {
                                var pdf = objeto.GenerarPDF_Documento(id, "58");

                                if (pdf != null && pdf.Length > 0)
                                {
                                    Response.Clear();
                                    Response.ContentType = "application/pdf";
                                    Response.AppendHeader("Content-Disposition", string.Format("inline; filename={0}.pdf", pedido.xml));
                                    Response.BinaryWrite(pdf);

                                }
                                else
                                {
                                    Response.Clear();
                                    Response.ContentType = "text/plain";
                                    Response.Write("El archivo no fue encontrado!");
                                }
                            }
                        }
                        else
                        {
                            Response.Clear();
                            Response.ContentType = "text/plain";
                            Response.Write("El archivo no fue encontrado!");
                        }
                    }
                    else
                    {
                        Response.Clear();
                        Response.ContentType = "application/pdf";
                        Response.AppendHeader("Content-Disposition", string.Format("inline; filename={0}.pdf", xml));
                        byte[] file = Convert.FromBase64String(documento);
                        Response.BinaryWrite(file);
                    }
                }

            }
        }
    }
}