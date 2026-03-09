using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.Logistica.Seguridad
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
                    string conformidad = context.Request.Params["conformidad"];
                    string observacion = context.Request.Params["observacion"];

                    Metodos.ValidateAntiXsrfToken("SeguridadList");

                    using (TwoTecnology.Repositorio.GuiaRemision obj = new TwoTecnology.Repositorio.GuiaRemision())
                    {
                        var estado = false;// obj.ActualizarEntrada(id, usuario_nombre, conformidad, observacion);

                        if (estado)
                        {
                            respuesta = id;
                        }
                        else
                            respuesta = string.Format("La GRE {0} no se puede procesar!", id);
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