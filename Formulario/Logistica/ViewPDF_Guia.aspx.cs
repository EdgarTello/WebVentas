using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.Logistica
{
    public partial class ViewPDF_Guia : System.Web.UI.Page
    {
        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);

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
            string respuesta = string.Empty;
            //Response.Expires = -1;

            if (!IsPostBack)
            {
                if (Context.User.Identity.IsAuthenticated)
                { 

                    string tipo = Request.QueryString["tipo"] ?? "";
                    string indicador = Request.QueryString["indicador"] ?? "";
                    string serie = Request.QueryString["serie"] ?? "";
                    string correlativo = Request.QueryString["correlativo"] ?? "";
                    string webservice = ConfigurationSettings.AppSettings["webservice"];


                    //if (webservice == "0")
                    //{
                    string id = Request.QueryString["id"].ToString();
                    var guia = new TwoTecnology.Repositorio.Guia().LoadByCodigo(id);

                    if (guia.externo == "1")
                    {
                        using (servicioDocumento.DocumentoClient doc = new servicioDocumento.DocumentoClient())
                        {
                            string pdfstring = doc.ObtenerPdf(ruc, tipo, string.Format("{0}{1}", indicador, serie), correlativo);

                            if (!string.IsNullOrEmpty(pdfstring))
                            {
                                respuesta = "data:application/pdf;base64," + pdfstring;
                            }
                        }
                    }
                    else
                    {
                        using (Repositorio.PdfGenerate objeto = new TwoTecnology.Repositorio.PdfGenerate())
                        {
                            var pdf = objeto.GenerarPDF_Guia(id);

                            if (pdf != null && pdf.Length > 0)
                            {
                                string base64String = Convert.ToBase64String(pdf);
                                respuesta = "data:application/pdf;base64," + base64String;
                            }
                        }
                    }

                    Response.Write(respuesta);
                    Response.ContentEncoding = Encoding.UTF8;
                    Response.End();
                }
            }

        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {


        }
    }
}