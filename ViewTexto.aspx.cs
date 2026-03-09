using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas
{
    public partial class ViewTexto : System.Web.UI.Page
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
                Response.Redirect("DefaultMovil.aspx");
            }

            string ruc = ticket.UserData.Split('|')[1];
            
            //Response.Expires = -1;
            

            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                    // This is an unauthorized, authenticated request...
                    Response.Redirect("DefaultMovil.aspx");
            }

            string id = Request.QueryString["id"].ToString();

            Response.ContentType = "text/plain";

            using (servicioImpresionPedido.DocumentoPedidoClient doc = new servicioImpresionPedido.DocumentoPedidoClient())
            {
                var documento = doc.ObtenerTextoByCodigo(id, "48");

                if (string.IsNullOrEmpty(documento))
                    Response.Write(string.Format("El archivo no fue encontrado:{0}", documento));
                else
                {
                    Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.txt", id));
                    Response.Write(documento);
                }

                Response.Flush();
                Response.End();
            }


        }
    }
}