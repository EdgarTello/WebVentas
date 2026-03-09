using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.OperacionCaja
{
    public partial class Listado : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated){

                    string local_empresa = Request.Cookies["local_empresa"].Value ?? "";

                    if (local_empresa == "0")
                        local_empresa = "";

                    if (Request.Cookies["ruc_empresa"] != null)
                    {
                        string ruc_empresa = Request.Cookies["ruc_empresa"].Value;
                        urlDefault = string.Format("../../Default.aspx?ruc={0}&local={1}", ruc_empresa, local_empresa);
                    }

                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                    Response.End();
                }
            }

            FormsAuthenticationTicket ticket = null;

            
            FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
            ticket = formsIdentity.Ticket;

            string empresa_id = ticket.UserData.Split('|')[0];
            string empresa_ruc = ticket.UserData.Split('|')[1];            
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string localcodigo = ticket.UserData.Split('|')[10];
            string rol_id = ticket.UserData.Split('|')[29];
            string usuario_acceso = ticket.UserData.Split('|')[3];


            //string opcion = "Proceso";
            //string pagina = "../../GestorDocumental/Documentos/Listado.aspx";


            //using (Repositorio.RolesxPagina obj = new TwoTecnology.Repositorio.RolesxPagina())
            //{
            //    var permiso_acceso = obj.LoadAcceso(empresa_ruc, usuario_codigo, rol_id, opcion, pagina);

            //    if (permiso_acceso.acceso!="1") { 
            //        Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
            //    }
            //}

            hidlocal.Value = localcodigo;
            hpreviewcaja.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresa_ruc, localcodigo, "previewcaja").valor;
            hreportecaja.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresa_ruc, localcodigo, "reportecaja").valor;
            hempleadocaja.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresa_ruc, localcodigo, "empleadocaja").valor; 
            husuarioacceso.Value = usuario_acceso;

           
        }
    }
}