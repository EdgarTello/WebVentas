using Newtonsoft.Json;
using RestSharp.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.General.Login
{
    /// <summary>
    /// Summary description for Operacion1
    /// </summary>
    public class Operacion1 : IHttpHandler
    {
        string respuesta = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                if (context.Request.Params["ope"] == "1")
                {


                    Metodos.ValidateAntiXsrfToken("LoginList");

                    string detalle = HttpUtility.UrlDecode(context.Request.Params["detalle"]);
                    Entity.Entidad lista = JsonConvert.DeserializeObject<Entity.Entidad>(detalle);


                    if (lista.clave.IsInyection() || lista.cookie.IsInyection() || lista.usuario.IsNumeric())
                    {
                        respuesta = "Inyection Code Detected";
                    }
                    else
                    {

                        if ((lista.clave !="" && lista.usuario != "" && lista.cookie != "") )
                        {
                            TwoTecnology.Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();

                            bool blnresult = obj.ValidateClientRuc(lista.ruc,  lista.usuario, lista.clave);

                            if (!blnresult)
                            {
                                respuesta = "Hubo un error al actualizar el Cookie!";
                            }
                        }
                        else
                        {
                            respuesta = "Envio datos incorrectos!";
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