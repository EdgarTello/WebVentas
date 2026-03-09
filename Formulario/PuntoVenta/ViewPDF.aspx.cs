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
    public partial class ViewPDF : System.Web.UI.Page
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


            using (servicioDocumento.DocumentoClient doc = new servicioDocumento.DocumentoClient())
            {
                string pdffile = string.Format("{0}-{1}-{2}{3}-{4}.pdf", ruc, tipo, indicador, serie, correlativo);
                string pdfstring = doc.ObtenerPdf(ruc, tipo, string.Format("{0}{1}", indicador, serie), correlativo);

                if (string.IsNullOrEmpty(pdfstring))
                {
                    Response.Clear();
                    Response.ContentType = "text/plain";
                    Response.Write(string.Format("El archivo no fue encontrado:{0}", pdffile));
                }
                else
                {
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AppendHeader("Content-Disposition", string.Format("inline; filename={0}.pdf", pdffile));
                    byte[] file = Convert.FromBase64String(pdfstring);
                    Response.BinaryWrite(file);
                }
            }

            Response.End();


        }
    }
}