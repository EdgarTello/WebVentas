using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Utils;
using DevExpress.XtraPivotGrid.Printing;
using DevExpress.XtraPivotGrid.Data;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.Web.ASPxPivotGrid.Export;
using DevExpress.Web.ASPxPivotGrid.Html;
using DevExpress.Export;
using DevExpress.XtraPrinting;
using System.Globalization;
using DevExpress.Web;
using DevExpress.XtraPivotGrid;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte
{
    public partial class Dinamico02 : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";
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


                
            }


            if (!IsPostBack && !IsCallback)
            {
                //ASPxPivotGrid1.CollapseAll();
            }

            SetCompactLayout();
        }

        void SetCompactLayout()
        {
            ASPxPivotGrid1.OptionsPager.Visible = false;
            ASPxPivotGrid1.OptionsView.ShowColumnHeaders = true;
            ASPxPivotGrid1.OptionsView.ShowRowHeaders = true;
            ASPxPivotGrid1.OptionsView.ShowDataHeaders = true;
            ASPxPivotGrid1.OptionsView.ShowFilterHeaders = true;

            ASPxPivotGrid1.OptionsView.VerticalScrollingMode = PivotScrollingMode.Virtual;
            ASPxPivotGrid1.OptionsView.HorizontalScrollingMode = PivotScrollingMode.Virtual;
            ASPxPivotGrid1.OptionsView.VerticalScrollBarMode = ScrollBarMode.Auto;
            ASPxPivotGrid1.OptionsView.HorizontalScrollBarMode = ScrollBarMode.Auto;
            ASPxPivotGrid1.OptionsView.RowTotalsLocation = PivotRowTotalsLocation.Tree;
            ASPxPivotGrid1.OptionsView.ShowRowTotals = true;
            ASPxPivotGrid1.OptionsView.ShowRowGrandTotals = true;
            ASPxPivotGrid1.Styles.FieldValueStyle.Wrap = DefaultBoolean.True;


            ASPxPivotCustomizationControl1.Width = Unit.Pixel(350);
            ASPxPivotCustomizationControl1.ASPxPivotGridID = "ASPxPivotGrid1";
            ASPxPivotCustomizationControl1.Visible = false;



            FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
            FormsAuthenticationTicket ticket = formsIdentity.Ticket;

            string empresaruc = ticket.UserData.Split('|')[1];
            string localcodigo = ticket.UserData.Split('|')[10];

            string local = Request.QueryString["local"];
            string localdes = Request.QueryString["localdes"];
            string caja = Request.QueryString["caja"];
            string cajero = Request.QueryString["cajero"];
            string mesero = Request.QueryString["mesero"];
            string idubicacion = Request.QueryString["mesa"];
            string cierre = Request.QueryString["cierre"];
            string fechaini = Request.QueryString["fechaini"];
            string fechafin = Request.QueryString["fechafin"];
            string di = Request.QueryString["di"];

            string sql= string.Format("set dateformat dmy;" +
                "select ruc, local, hora, caja, tipocambio, tipodocumento, documento, fecha,moneda, " +
                "clientetipo, clientenombre, clientedistrito, cajero, mesero, cantidad, descuento, importe, igv, rc , total " +
                "from v_venta_cliente_total " +
                "where ruc='{0}' {1} {2} {3} {4} {5} {6} {7} {8};",
                empresaruc,
                (local == "" || local == "[Todos]") ? "" : string.Format(" and idlocal={0} ", local),
                (caja == "" || caja == "[Todos]") ? "" : string.Format(" and idcaja={0} ", caja),
                (cajero == "" || cajero == "[Todos]") ? "" : string.Format(" and empleado='{0}' ", cajero),
                (mesero == "" || mesero == "[Todos]") ? "" : string.Format(" and mesero='{0}' ", mesero),
                (idubicacion == "" || idubicacion == "[Todos]") ? "" : string.Format(" and idubicacion={0} ", idubicacion),
                (cierre == "" || cierre == "[Todos]") ? "" : ((cierre == "SI") ? " and coalesce(cierrecaja,0)<>0 " : " and coalesce(cierrecaja,'0')='0' "),
                (fechaini == "" || fechafin == "") ? "" : string.Format(" and fecha between '{0}' and '{1}' ", fechaini, fechafin),
                ((di == "1") ? " and tipo in('01','03','07','99') " : " and tipo in('01','03','07') ")
                );

            SqlDataSourceDB.SelectCommand = sql;
                
        }

        protected void buttonSaveAs_Click(object sender, EventArgs e)
        {
            foreach (DevExpress.Web.ASPxPivotGrid.PivotGridField field in ASPxPivotGrid1.Fields)
            {
                if (field.ValueFormat != null && !string.IsNullOrEmpty(field.ValueFormat.FormatString))
                    field.UseNativeFormat = checkCustomFormattedValuesAsText.Checked ? DefaultBoolean.False : DefaultBoolean.True;
            }

            ASPxPivotGridExporter1.OptionsPrint.PrintColumnAreaOnEveryPage = checkPrintColumnAreaOnEveryPage.Checked;
            ASPxPivotGridExporter1.OptionsPrint.PrintRowAreaOnEveryPage = checkPrintRowAreaOnEveryPage.Checked;
            ASPxPivotGridExporter1.OptionsPrint.MergeColumnFieldValues = checkMergeColumnFieldValues.Checked;
            ASPxPivotGridExporter1.OptionsPrint.MergeRowFieldValues = checkMergeRowFieldValues.Checked;

            ASPxPivotGridExporter1.OptionsPrint.PrintFilterHeaders = checkPrintFilterFieldHeaders.Checked ? DefaultBoolean.True : DefaultBoolean.False;
            ASPxPivotGridExporter1.OptionsPrint.PrintColumnHeaders = checkPrintColumnFieldHeaders.Checked ? DefaultBoolean.True : DefaultBoolean.False;
            ASPxPivotGridExporter1.OptionsPrint.PrintRowHeaders = checkPrintRowFieldHeaders.Checked ? DefaultBoolean.True : DefaultBoolean.False;
            ASPxPivotGridExporter1.OptionsPrint.PrintDataHeaders = checkPrintDataFieldHeaders.Checked ? DefaultBoolean.True : DefaultBoolean.False;

            const string fileName = "PivotGrid";
            XlsxExportOptionsEx options;
            switch (listExportFormat.SelectedIndex)
            {
                case 0:
                    ASPxPivotGridExporter1.ExportPdfToResponse(fileName);
                    break;
                case 1:
                    options = new XlsxExportOptionsEx() { ExportType = ExportType.WYSIWYG };
                    ASPxPivotGridExporter1.ExportXlsxToResponse(fileName, options);
                    break;
                case 2:
                    ASPxPivotGridExporter1.ExportMhtToResponse(fileName, "utf-8", "ASPxPivotGrid Printing Sample", true);
                    break;
                case 3:
                    ASPxPivotGridExporter1.ExportRtfToResponse(fileName);
                    break;
                case 4:
                    ASPxPivotGridExporter1.ExportTextToResponse(fileName);
                    break;
                case 5:
                    ASPxPivotGridExporter1.ExportHtmlToResponse(fileName, "utf-8", "ASPxPivotGrid Printing Sample", true);
                    break;
                case 6:
                    options = new XlsxExportOptionsEx()
                    {
                        ExportType = ExportType.DataAware,
                        AllowGrouping = allowGroupingCheckBox.Checked ? DefaultBoolean.True : DefaultBoolean.False,
                        TextExportMode = exportCellValuesAsText.Checked ? TextExportMode.Text : TextExportMode.Value,
                        AllowFixedColumns = allowFixedColumns.Checked ? DefaultBoolean.True : DefaultBoolean.False,
                        AllowFixedColumnHeaderPanel = allowFixedColumns.Checked ? DefaultBoolean.True : DefaultBoolean.False,
                        RawDataMode = exportRawData.Checked
                    };
                    ASPxPivotGridExporter1.ExportXlsxToResponse(fileName, options);
                    break;
            }
        }

        
    }
}