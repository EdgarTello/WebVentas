using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.Logistica.Producto
{
    /// <summary>
    /// Summary description for Operacion1
    /// </summary>
    public class Operacion1 : IHttpHandler
    {
        string respuesta = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            FormsAuthenticationTicket ticket = null;
            try
            {
                FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                ticket = formsIdentity.Ticket;

                string empresaid = ticket.UserData.Split('|')[0];
                string empresaruc = ticket.UserData.Split('|')[1];
                string usuario_acceso = ticket.UserData.Split('|')[3];
                string usuario_codigo = ticket.UserData.Split('|')[4];
                string usuario_nombre = ticket.UserData.Split('|')[5];
                string usuario_serie = ticket.UserData.Split('|')[7];
                string puntosid = ticket.UserData.Split('|')[8];
                string ipcliente = ticket.UserData.Split('|')[9];
                string localcodigo = ticket.UserData.Split('|')[10];
                string movil = ticket.UserData.Split('|')[11];


                if (context.Request.Params["ope"] == "1")
                {

                    string id = context.Request.Params["id"];
                    string imagen= context.Request.Params["file"].Replace("data:image/png;base64,", string.Empty);
                    string pathtmpimg_producto = ConfigurationManager.AppSettings["pathtmpimg_producto"];
                    string urltmpimg_producto = ConfigurationManager.AppSettings["urltmpimg_producto"];
                    Guid newGuid = Guid.NewGuid();
                    string idtemp = newGuid.ToString();

                    string pathtmpimg_ruta = string.Format(pathtmpimg_producto,empresaruc, string.Format("{0}.png", idtemp));
                    urltmpimg_producto= string.Format(urltmpimg_producto, empresaruc, string.Format("{0}.png", idtemp));

                    //string pathdmesapartes_r = string.Format(@"{0}\{1}", pathdmesapartes_s, empresaruc);

                    //File.Delete(pathtmpimg_ruta);
                    File.WriteAllBytes(pathtmpimg_ruta, Convert.FromBase64String(imagen));

                    using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                    {
                        obj.EditarImagen(id, urltmpimg_producto);
                    }
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                respuesta = "Error General";
            }

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