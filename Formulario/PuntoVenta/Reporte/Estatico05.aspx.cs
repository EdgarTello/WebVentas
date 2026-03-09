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
    public partial class Estatico05 : System.Web.UI.Page
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
                string caja = Request.QueryString["caja"];
                string cajades = Request.QueryString["cajades"];

                string categoriacliente = Request.QueryString["categoriacliente"];
                string categoriaclientedes = Request.QueryString["categoriaclientedes"];

                string cliente = Request.QueryString["cliente"];
                string clientedes = Request.QueryString["clientedes"];

                string mesa = Request.QueryString["mesa"];
                string mesades = Request.QueryString["mesades"];
                string cierre = Request.QueryString["cierre"];
                string fechaini = Request.QueryString["fechaini"];
                string fechafin = Request.QueryString["fechafin"];
                string di = Request.QueryString["di"];



                loadreporte(ruc, 
                    local, localdes, 
                    caja, cajades,
                    categoriacliente,
                    categoriaclientedes,
                    cliente,
                    clientedes,
                    mesa, 
                    mesades,
                    cierre, fechaini, fechafin, di);
            }

        }

        private void loadreporte(string ruc, 
            string local,
            string localdes,
            string caja,
            string cajades,
            string categoriacliente,
            string categoriaclientedes,
            string cliente,
            string clientedes,
            string mesa,
            string mesades,
            string cierre, 
            string fechaini, 
            string fechafin, 
            string di)
        {
            ReportViewer01.ProcessingMode = ProcessingMode.Local;
            ReportViewer01.LocalReport.ReportPath = Server.MapPath("~/Rpt/Estatico05.rdlc");
            ReportViewer01.LocalReport.DataSources.Clear();

            ReportDataSource datasource = new ReportDataSource("DataSet1",
                new TwoTecnology.Repositorio.Reporte().ReporteValesConsumoFilter(
                ruc,
                local,
                caja,
                categoriacliente,
                cliente,
                mesa,
                cierre,
                fechaini,
                fechafin,
                di));

            ReportViewer01.LocalReport.DataSources.Add(datasource);

            // Create the sales order number report parameter  
            ReportParameter rpPeriodo = new ReportParameter();
            rpPeriodo.Name = "Periodo";
            rpPeriodo.Values.Add(string.Format("{0} al {1}", fechaini , fechafin));

            ReportParameter rpLocal = new ReportParameter();
            rpLocal.Name = "Local";
            rpLocal.Values.Add(localdes);

            ReportParameter rpCaja = new ReportParameter();
            rpCaja.Name = "Caja";
            rpCaja.Values.Add(cajades);

            ReportParameter rpCategoriaCliente = new ReportParameter();
            rpCategoriaCliente.Name = "CategoriaCliente";
            rpCategoriaCliente.Values.Add(categoriaclientedes);

            ReportParameter rpCliente = new ReportParameter();
            rpCliente.Name = "Cliente";
            rpCliente.Values.Add(clientedes);

            ReportParameter rpMesa = new ReportParameter();
            rpMesa.Name = "Mesa";
            rpMesa.Values.Add(mesades);


            ReportParameter rpCierre = new ReportParameter();
            rpCierre.Name = "Cierre";
            rpCierre.Values.Add(cierre);

            ReportParameter rpTicket = new ReportParameter();
            rpTicket.Name = "Ticket";
            rpTicket.Values.Add(((di == "0") ? "NO" : "SI"));

            //ReportViewer01.LocalReport.SetParameters(new ReportParameter[] {
            //    rpPeriodo, rpLocal, rpCaja, rpCajero, rpMesero, rpMesa, rpCierre, rpTicket});

            ReportViewer01.LocalReport.SetParameters(new ReportParameter[] { 
                rpPeriodo,  rpLocal, rpCaja, rpCategoriaCliente, rpCliente, rpMesa, rpCierre, rpTicket});
        }

        
    }
}