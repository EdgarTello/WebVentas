using Ionic.Zip;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Visor04
{
    public partial class Listado : System.Web.UI.Page
    {
        //string urlDefault = "../../General/Frame/Salir.aspx";
        string urlDefault = "../../General/Frame/Salir.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                {

                    
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
            try
            {
                FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                ticket = formsIdentity.Ticket;


                string empresaid = ticket.UserData.Split('|')[0];
                string empresanombre = ticket.UserData.Split('|')[2];

                string ruc = ticket.UserData.Split('|')[1];
                string acceso = ticket.UserData.Split('|')[3];
                string usuario = ticket.UserData.Split('|')[5];
                string usuarioanum_documento = ticket.UserData.Split('|')[6];
                string localcodigo = ticket.UserData.Split('|')[10];
                string mobile = ticket.UserData.Split('|')[11];
                string tipo = ticket.UserData.Split('|')[12];
                string empresa_comercial = ticket.UserData.Split('|')[13];
                string areas = ticket.UserData.Split('|')[18];

                ViewState["acceso"] = acceso;
                ViewState["usuario"] = usuario;
                ViewState["empresaruc"] = ruc;
                ViewState["empresanombre"] = empresanombre;
                ViewState["usuarioanum_documento"] = usuarioanum_documento;
                ViewState["empresa_tipo"] = tipo;

                

                if (tipo != "21")
                {
                    lblruc.Text = string.Format("{0}", ruc);
                    lblempresa.Text = string.Format("{0}", empresa_comercial);
                    lblareas.Text = string.Format("Áreas:{0}", areas);
                }

                lblnombres.Text = string.Format("{0}-{1}", Context.User.Identity.Name, acceso);
                //lbllocal.Text = (local=="")?"(Todos)":local;
                //lblempresa.Text = string.Format("{0}", empresanombre);

                List<Entity.Local> listatmp = new List<Entity.Local>();
                local.Items.Clear();

                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                {
                    listatmp.Add(obj.LoadObjectByCodigo(ruc, localcodigo));

                    foreach (var item in listatmp)
                    {
                        local.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                    }
                }



            }
            catch
            {
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

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            var absoluteReturnUrl = "../../Default.aspx";
            string local_empresa = Request.Cookies["local_empresa"].Value ?? "";

            if (local_empresa == "0")
                local_empresa = "";

            if (Request.Cookies["ruc_empresa"] != null)
            {
                string ruc_empresa = Request.Cookies["ruc_empresa"].Value;
                absoluteReturnUrl = string.Format("../../Default.aspx?ruc={0}&local={1}", ruc_empresa, local_empresa);
            }

            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect(absoluteReturnUrl);
        }
    }
}