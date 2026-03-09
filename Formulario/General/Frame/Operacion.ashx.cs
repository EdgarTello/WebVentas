using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.General.Frame
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
                string usuariocodigo = ticket.UserData.Split('|')[4];


                if (context.Request.Params["ope"] == "1")
                {
                    Metodos.ValidateAntiXsrfToken("FrameIndex");

                    string detalle = HttpUtility.UrlDecode(context.Request.Params["detalle"]);
                    Entity.Entidad lista = JsonConvert.DeserializeObject<Entity.Entidad>(detalle);


                    if (lista.clave1.IsInyection() || lista.clave2.IsInyection())
                    {
                        respuesta = "Inyection Code Detected";
                    }
                    else
                    {

                        if ((lista.clave1 == lista.clave2) && (lista.clave1.Length > 5 && lista.clave2.Length > 5) )
                        {
                            TwoTecnology.Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();
                            bool blnresult = obj.CambiarClave(empresaruc, usuariocodigo, lista.clave2);

                            if (!blnresult)
                            {
                                respuesta = "Hubo un error al actualizar las credenciales!";
                            }
                        }
                        else
                        {
                            respuesta = "Las credenciales son diferentes!";
                        }
                    }
                }

            }
            catch
            {
                respuesta = "Hubo un error interno";
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