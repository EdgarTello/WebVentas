using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Web.Security;
using Microsoft.Reporting.WebForms;
using System.Data;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte
{
    public partial class Estatico02 : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                    // This is an unauthorized, authenticated request...
                    Response.Redirect("Default.aspx");

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

                string empresaid = ticket.UserData.Split('|')[0];
                string ruc = ticket.UserData.Split('|')[1];
                string usuario_acceso = ticket.UserData.Split('|')[3];
                string usuario_codigo = ticket.UserData.Split('|')[4];
                string usuario_nombre = ticket.UserData.Split('|')[5];
                string usuario_serie = ticket.UserData.Split('|')[7];
                string puntosid = ticket.UserData.Split('|')[8];
                string ipcliente = ticket.UserData.Split('|')[9];
                string localcodigo = ticket.UserData.Split('|')[10];
                string movil = ticket.UserData.Split('|')[11];

                string local = Request.QueryString["local"];
                string localdes = Request.QueryString["localdes"];
                string tipo = Request.QueryString["tipo"];
                string anio = Request.QueryString["anio"];
                string mes = Request.QueryString["mes"];
                string di = Request.QueryString["di"];

                loadreporte(ruc,
                    local, 
                    localdes,
                    anio, 
                    mes,
                    tipo,
                    di);
            }

        }

        private void loadreporte(string ruc,
            string local,
            string localdes,
            string anio,
            string mes,
            string tipo,
            string di)
        {
            ReportViewer01.ProcessingMode = ProcessingMode.Local;
            ReportViewer01.LocalReport.ReportPath = Server.MapPath("~/Rpt/Estatico02.rdlc");
            ReportViewer01.LocalReport.DataSources.Clear();

            ReportDataSource datasource = new ReportDataSource("DataSet1",
                new TwoTecnology.Repositorio.Reporte().ReporteVentasDocumentoCategoria(
                ruc,
                local,
                anio,
                mes,
                tipo,
                di));

            ReportViewer01.LocalReport.DataSources.Add(datasource);

            // Create the sales order number report parameter  
            ReportParameter rpPeriodo = new ReportParameter();
            rpPeriodo.Name = "Periodo";
            rpPeriodo.Values.Add(string.Format("{0}-{1}", anio, mes));

           
            ReportViewer01.LocalReport.SetParameters(new ReportParameter[] {rpPeriodo});
        }


    }
}