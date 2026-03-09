using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Frame
{
    public partial class Salir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var absoluteReturnUrl = "Default.aspx";
            string local_empresa = Request.Cookies["local_empresa"].Value ?? "";
            string licencia_empresa = Request.Cookies["licencia_empresa"].Value ?? "";
            string acceso_empresa = Request.Cookies["acceso_empresa"].Value ?? "";
            bool bsession = false;

            try
            {
                if (Session["jefemozosession"] != null)
                {
                    if (Session["jefemozosession"] == "1")
                    {
                        bsession = true;
                    }
                }
            }
            catch (Exception ex) {
                Console.WriteLine(ex.Message);
            }

            if (local_empresa == "0")
                local_empresa = "";

            if (Request.Cookies["ruc_empresa"] != null)
            {
                string ruc_empresa = Request.Cookies["ruc_empresa"].Value;
                string urltemp = "../..";
                //string urltemp = "https://twotecnology.online/Ventas/";

                
                
                #if DEBUG
                    urltemp = "../../..";
                #else
                    urltemp = "https://twotecnology.online/Ventas/";
                #endif


                absoluteReturnUrl = string.Format("{0}/Default.aspx?ruc={1}&local={2}&licencia={3}&acceso={4}",
                    urltemp, ruc_empresa, local_empresa, licencia_empresa, acceso_empresa);
            }

            if (bsession==false)
                Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);


            Response.Redirect(absoluteReturnUrl);
        }
    }
}