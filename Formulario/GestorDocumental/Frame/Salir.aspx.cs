using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.GestorDocumental.Frame
{
    public partial class Salir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var absoluteReturnUrl = "Default.aspx";
            string _empresaruc = ConfigurationManager.AppSettings["empresaruc"] ?? "";
            string ruc_empresa = Request.Cookies["ruc_empresa"].Value ?? "";

            if (_empresaruc != "")
                absoluteReturnUrl = "../../../Default.aspx";
            else {
                absoluteReturnUrl = string.Format("../../../Default.aspx?ruc={0}", ruc_empresa);
            }

            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);

            Response.Redirect(absoluteReturnUrl);
        }
    }
}