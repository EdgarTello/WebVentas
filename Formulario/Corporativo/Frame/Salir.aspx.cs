using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.Corporativo.Frame
{
    public partial class Salir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string absoluteReturnUrl = VirtualPathUtility.ToAbsolute("~/Default.aspx");
            //Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            //Response.Redirect(absoluteReturnUrl);
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("https://login.microsoftonline.com/common/oauth2/logout?post_logout_redirect_uri=https://twotecnology.online/dcgroup");
        }
    }
}