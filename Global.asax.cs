using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace TwoTecnology.WebVentas
{
    public class Global_asax : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

       
        protected void Application_PreSendRequestHeaders()
        {
            // ensure that if GZip/Deflate Encoding is applied that headers are set
            // also works when error occurs if filters are still active
            HttpResponse response = HttpContext.Current.Response;
            if (response.Filter is GZipStream && response.Headers["Content-encoding"] != "gzip")
                response.AppendHeader("Content-encoding", "gzip");
            else if (response.Filter is DeflateStream && response.Headers["Content-encoding"] != "deflate")
                response.AppendHeader("Content-encoding", "deflate");

            if (HttpContext.Current != null)
            {
                HttpContext.Current.Response.Headers.Remove("Server");
            }
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //Exception ex = Server.GetLastError();
            //Server.ClearError();

            //string url = HttpContext.Current.Request.Url.AbsolutePath.ToLower();

            //if (!url.Contains("default.aspx"))
            //    Response.Redirect("~/Default.aspx");
            //else
            //    Response.Write("Se produjo un error inesperado.");
        }


        //void Application_Error(object sender, EventArgs e)
        //{
        //    Response.Redirect("Default.aspx");
        //}

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends.
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer
            // or SQLServer, the event is not raised.
            System.Web.Security.FormsAuthentication.SignOut();
            System.Web.Security.FormsAuthentication.RedirectToLoginPage();

        }
    }
}