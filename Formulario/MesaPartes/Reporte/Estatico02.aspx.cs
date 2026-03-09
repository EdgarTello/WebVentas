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

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.Reporte
{
    public partial class Estatico02 : System.Web.UI.Page
    {
        protected void ReportViewer_OnLoad(object sender, EventArgs e)
        {
            string exportOptionPdf = "PDF";
            RenderingExtension extension01 = ReportViewer01.LocalReport.ListRenderingExtensions().ToList().Find(x => x.LocalizedName.Equals(exportOptionPdf, StringComparison.CurrentCultureIgnoreCase));
            if (extension01 != null)
            {
                System.Reflection.FieldInfo fieldInfo = extension01.GetType().GetField("m_isVisible", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
                fieldInfo.SetValue(extension01, false);
            }

            string exportOptionWord = "Word";
            RenderingExtension extension02 = ReportViewer01.LocalReport.ListRenderingExtensions().ToList().Find(x => x.LocalizedName.Equals(exportOptionWord, StringComparison.CurrentCultureIgnoreCase));
            if (extension02 != null)
            {
                System.Reflection.FieldInfo fieldInfo = extension02.GetType().GetField("m_isVisible", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
                fieldInfo.SetValue(extension02, false);
            }
        }
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
                string empresaruc = ticket.UserData.Split('|')[1];
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
                string area = Request.QueryString["area"];
                string areades = Request.QueryString["areades"];
                string ope = Request.QueryString["ope"];
                string opedes = Request.QueryString["opedes"];
                string etapa = Request.QueryString["etapa"];
                string etapades = Request.QueryString["etapades"];
                string busqueda = Request.QueryString["busqueda"];
                string fechaini = Request.QueryString["fechaini"];
                string fechafin = Request.QueryString["fechafin"];

                loadreporte(empresaruc, local, localdes, area, areades, ope, opedes, etapa, etapades,
                    busqueda, fechaini, fechafin);
            }

        }

        private void loadreporte(string ruc,
            string local,
            string localdes,
            string area,
            string areades,
            string ope,
            string opedes,
            string etapa,
            string etapades,
            string busqueda,
            string fechaini,
            string fechafin)
        {
            ReportViewer01.ProcessingMode = ProcessingMode.Local;
            ReportViewer01.LocalReport.ReportPath = Server.MapPath("~/Formulario/MesaPartes/Rpt/Estatico02.rdlc");
            ReportViewer01.LocalReport.DataSources.Clear();


            ReportDataSource datasource = new ReportDataSource("DataSet1",
                new TwoTecnology.Repositorio.MPDocumento().LoadReporteHistorial(
                ruc,
                local,
                area,
                ope,
                etapa,
                busqueda,
                fechaini,
                fechafin));

            ReportViewer01.LocalReport.DataSources.Add(datasource);

            // Create the sales order number report parameter  
            ReportParameter rpPeriodo = new ReportParameter();
            rpPeriodo.Name = "Periodo";
            rpPeriodo.Values.Add(string.Format("{0} al {1}", fechaini, fechafin));

            ReportParameter rpLocal = new ReportParameter();
            rpLocal.Name = "Local";
            rpLocal.Values.Add(localdes);

            ReportParameter rpArea = new ReportParameter();
            rpArea.Name = "Area";
            rpArea.Values.Add(areades);

            ReportParameter rpOpe = new ReportParameter();
            rpOpe.Name = "Ope";
            rpOpe.Values.Add(opedes);

            ReportParameter rpEtapa = new ReportParameter();
            rpEtapa.Name = "Etapa";
            rpEtapa.Values.Add(etapades);

            ReportViewer01.LocalReport.SetParameters(new ReportParameter[] {
                rpPeriodo,  rpLocal, rpArea, rpOpe, rpEtapa});
        }


    }
}