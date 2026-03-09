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

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.Reporte
{
    public partial class Dinamico01 : System.Web.UI.Page
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
            string area = Request.QueryString["area"];
            string areades = Request.QueryString["areades"];
            string ope = Request.QueryString["ope"];
            string opedes = Request.QueryString["opedes"];
            string etapa = Request.QueryString["etapa"];
            string etapades = Request.QueryString["etapades"];
            string fechaini = Request.QueryString["fechaini"];
            string fechafin = Request.QueryString["fechafin"];

            string sql= string.Format("set dateformat dmy;" +
                "select ruc, localnombre as local, areanombre, canalnombre, flujonombre,  openombre, etapanombre, " + 
                "fecharegistro, flujo_total as cantidad " +
                "from v_listar_mp_total " +
                "where ruc='{0}' {1} {2} {3} {4} {5};",
                 empresaruc,
                 ((ope == "") ? " and ope in('S','E')" : string.Format(" and ope='{0}'", ope)),
                 ((local == "0" || local == "") ? string.Empty : string.Format("and idlocal={0}", local)),
                 ((etapa == "0" || etapa == "") ? string.Empty : string.Format("and etapa in({0})", etapa)),
                 ((area == "0" || area == "") ? string.Empty : string.Format("and idarea in({0})", area)),
                 (fechaini == "" || fechafin == "") ? "" : string.Format(" and fecharegistro between '{0}' and '{1}' ", fechaini, fechafin));

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