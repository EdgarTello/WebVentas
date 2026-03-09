using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.AlmacenTomador.Acceso
{
    /// <summary>
    /// Summary description for Operacion1
    /// </summary>
    public class Operacion1 : IHttpHandler
    {
        string respuesta = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            //FormsAuthenticationTicket ticket = null;
            ////try
            ////{

            //if (context.Request.Params["ope"] == "0")
            //{
            //    bool Authenticated = false;
            //    string detalle = HttpUtility.UrlDecode(context.Request.Params["json"]);
            //    TwoTecnology.Entity.TOMADOR.ARINPED_TOK pedido = JsonConvert.DeserializeObject<TwoTecnology.Entity.TOMADOR.ARINPED_TOK>(detalle);

            //    TwoTecnology.Repositorio.TOMADOR.Usuario obj = new TwoTecnology.Repositorio.TOMADOR.Usuario();
            //    Authenticated = obj.ValidateTrabajador(pedido.empleado);

            //    if (Authenticated)
            //    {
            //        TwoTecnology.BusinessLog.Log.SaveLogSimple("authenticated");

            //        Random rnd = new Random();
            //        System.Guid miGUID = System.Guid.NewGuid();
            //        string sGUID = miGUID.ToString();
            //        string empresacorreo = ConfigurationManager.AppSettings.Get("empresacorreo");
            //        int clave1 = rnd.Next(0, 10);  // creates a number between 1 and 12
            //        int clave2 = rnd.Next(0, 10);   // creates a number between 1 and 6
            //        int clave3 = rnd.Next(0, 10);
            //        int clave4 = rnd.Next(0, 10);

            //        obj.AgregarToken(pedido.empleado, string.Format("{0}{1}{2}{3}", clave1, clave2, clave3, clave4),
            //            "A", sGUID);

            //        obj.AgregarCorreo(empresacorreo, pedido.empleado, string.Format("{0}{1}{2}{3}", clave1, clave2, clave3, clave4));

            //        respuesta = sGUID;
            //    }
            //    else {
            //        TwoTecnology.BusinessLog.Log.SaveLogSimple("not authenticated");
            //    }
            //}

            ////}
            ////catch(Exception ex)
            ////{
            ////    TwoTecnology.BusinessLog.Log.SaveLogSimple(ex.Message);
            ////    respuesta = "-1";
            ////}

            context.Response.Write(respuesta);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}