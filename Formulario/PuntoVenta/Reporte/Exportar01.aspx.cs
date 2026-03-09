using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Web.Security;
using System.Data;
using System.Text;
using System.IO;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte
{
    public partial class Exportar01 : System.Web.UI.Page
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

                string exportar = Request.QueryString["exportar"];
                string local = Request.QueryString["local"];
                string localdes = Request.QueryString["localdes"];
                string caja = Request.QueryString["caja"];
                string cajades = Request.QueryString["cajades"];
                string cajero = Request.QueryString["cajero"];
                string mesero = Request.QueryString["mesero"];
                string mesa = Request.QueryString["mesa"];
                string mesades = Request.QueryString["mesades"];
                string cierre = Request.QueryString["cierre"];
                string fechaini = Request.QueryString["fechaini"];
                string fechafin = Request.QueryString["fechafin"];
                string montoanulado = Request.QueryString["montoanulado"];
                string di = Request.QueryString["di"];



                loadreporte(ruc, 
                    exportar,
                    local, localdes, 
                    caja, cajades, 
                    cajero, mesero, 
                    mesa, 
                    mesades,
                    cierre, fechaini, fechafin,
                    montoanulado, di);
            }

        }

        private void loadreporte(string ruc, 
            string exportar,
            string local,
            string localdes,
            string caja,
            string cajades,
            string cajero, 
            string mesero,
            string mesa,
            string mesades,
            string cierre, 
            string fechaini, 
            string fechafin, 
            string montoanulado,
            string di)
        {
             DataTable dt=  new TwoTecnology.Repositorio.Reporte().ExportarVentasFilter(
                ruc,
                exportar,
                local,
                caja,
                cajero,
                mesero,
                mesa,
                cierre,
                fechaini,
                fechafin,
                montoanulado,
                di,
                "");


             string formattedDate = DateTime.Now.ToString("yyyyMMddHHmmss");
            
             StringBuilder sb = new StringBuilder();

             string[] columnName = dt.Columns.Cast<DataColumn>().Select(cn => cn.ColumnName).ToArray();
             sb.AppendLine(string.Join("|", columnName));

             
             foreach (DataRow row in dt.Rows)
             {
                 IEnumerable<string> fields = row.ItemArray.Select(field => field.ToString());
                 sb.AppendLine(string.Join("|", fields));
             }

             byte[] buffer = System.Text.Encoding.UTF8.GetBytes(sb.ToString());

            
             Response.Clear();
             Response.Buffer = true;
             Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.csv", formattedDate));
             Response.Charset = "";
             Response.ContentType = "application/text";
             //Response.Output.Write(buffer);
             Response.BinaryWrite(buffer);
             Response.Flush();
             Response.End();
            
        }

        
    }
}