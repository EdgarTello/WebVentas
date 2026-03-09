using Ionic.Zip;
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
    public partial class DownloadComprobante : System.Web.UI.Page
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

            string codigo = Request.QueryString["codigo"].ToString();
            string xml = Request.QueryString["xml"].ToString();

            string[] _xml = xml.Split('-');
            

            string _ruc = _xml[0];
            string _tipo = _xml[1];
            string _serie = _xml[2];
            string _correlativo = _xml[3];

            bool blnpertenece = false;

            if(_tipo=="09")
                blnpertenece = new Repositorio.Guia().GuiaPerteneceRuc(codigo, ruc);
            else
                blnpertenece = new Repositorio.Pedido().PedidoPerteneceRuc(codigo, ruc);

            
            if (blnpertenece) {

                using (servicioDocumento.DocumentoClient doc = new servicioDocumento.DocumentoClient())
                {
                    var zipcadena = doc.ObtenerZip(_ruc, _tipo, _serie, _correlativo);
                    string docname = String.Format("{0}-{1}-{2}-{3}.zip", _ruc, _tipo, _serie, _correlativo);

                    if (zipcadena != "")
                    {
                        byte[] buffer = System.Convert.FromBase64String(zipcadena);

                        Response.ContentType = "application/zip";
                        Response.AddHeader("content-disposition", "attachment; filename=" + docname);
                        Response.BinaryWrite(buffer);

                    }
                    else
                    {
                        Response.Clear();
                        Response.ContentType = "text/plain";
                        Response.Write(string.Format("El archivo no fue encontrado:{0}", docname));
                    }
                }
            }

            Response.End();
        }
    }
}