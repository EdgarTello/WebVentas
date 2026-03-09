using Ionic.Zip;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte
{
    public partial class CajaCierre : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Write("La sessión ha finalizado, salga del aplicativo y vuelva a autenticarse");
                    Response.End();
                }
                else {
                    LoadDatos();
                }
            }
            

        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
       

        public void LoadDatos() {
            string id = Request.QueryString["id"].ToString();
            string idcaja = Request.QueryString["idcaja"].ToString();
            string fechacierre = Request.QueryString["fechacierre"].ToString();
            string di = Request.QueryString["di"].ToString();


            if (fechacierre == "")
            {
                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    //Random rd = new Random();
                    //id = rd.Next(99999).ToString();
                    obj.Cierre_Tmp(id, idcaja);
                }
            }


            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Rpt/CajaCierre.rdlc");
            ReportDataSource datasource1 = null;
            ReportDataSource datasource2 = null;
            ReportDataSource datasource20 = null;
            ReportDataSource datasource3 = null;
            ReportDataSource datasource4 = null;
            ReportDataSource datasource5 = null;
            ReportDataSource datasource100 = null;

            if (fechacierre != "")
            {
                datasource1 = new ReportDataSource("DataSet1", new TwoTecnology.Repositorio.CajaOperacion().CierreCabecera(id, di));
                datasource2 = new ReportDataSource("DataSet2", new TwoTecnology.Repositorio.CajaOperacion().CierreDetalle(id, di));
                datasource20 = new ReportDataSource("DataSet20", new TwoTecnology.Repositorio.CajaOperacion().CierreCredito(id, di));
                datasource3 = new ReportDataSource("DataSet3", new TwoTecnology.Repositorio.CajaOperacion().CierreEgreso(id, di));
                datasource4 = new ReportDataSource("DataSet4", new TwoTecnology.Repositorio.CajaOperacion().CierreProducto(id, di));
                datasource5 = new ReportDataSource("DataSet5", new TwoTecnology.Repositorio.CajaOperacion().CierreDocumento(id, di));
                datasource100 = new ReportDataSource("DataSet100", new TwoTecnology.Repositorio.CajaOperacion().CierreComisiones(id, di));
            }
            else
            {
                datasource1 = new ReportDataSource("DataSet1", new TwoTecnology.Repositorio.CajaOperacion().CierreCabecera_Tmp(id, di));
                datasource2 = new ReportDataSource("DataSet2", new TwoTecnology.Repositorio.CajaOperacion().CierreDetalle_Tmp(id, di));
                datasource20 = new ReportDataSource("DataSet20", new TwoTecnology.Repositorio.CajaOperacion().CierreCredito_Tmp(id, di));
                datasource3 = new ReportDataSource("DataSet3", new TwoTecnology.Repositorio.CajaOperacion().CierreEgreso_Tmp(id, di));
                datasource4 = new ReportDataSource("DataSet4", new TwoTecnology.Repositorio.CajaOperacion().CierreProducto_Tmp(id, di));
                datasource5 = new ReportDataSource("DataSet5", new TwoTecnology.Repositorio.CajaOperacion().CierreDocumento_Tmp(id, di));
                datasource100 = new ReportDataSource("DataSet100", new TwoTecnology.Repositorio.CajaOperacion().CierreComisiones_Tmp(id, di));
            }

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(datasource1);
            ReportViewer1.LocalReport.DataSources.Add(datasource2);
            ReportViewer1.LocalReport.DataSources.Add(datasource20);
            ReportViewer1.LocalReport.DataSources.Add(datasource3);
            ReportViewer1.LocalReport.DataSources.Add(datasource4);
            ReportViewer1.LocalReport.DataSources.Add(datasource5);
            ReportViewer1.LocalReport.DataSources.Add(datasource100);
        }
    }
}