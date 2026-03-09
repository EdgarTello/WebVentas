using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.Local
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
                string ruc = ticket.UserData.Split('|')[1];
                string usuario_acceso = ticket.UserData.Split('|')[3];
                string usuario_codigo = ticket.UserData.Split('|')[4];
                string usuario_nombre = ticket.UserData.Split('|')[5];
                string usuario_serie = ticket.UserData.Split('|')[7];
                string puntosid = ticket.UserData.Split('|')[8];
                string ipcliente = ticket.UserData.Split('|')[9];
                string localcodigo = ticket.UserData.Split('|')[10];
                string movil = ticket.UserData.Split('|')[11];


                if (context.Request.Params["ope"] == "2")
                {
                    string detalle = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    Entity.Local local = JsonConvert.DeserializeObject<Entity.Local>(detalle);

                    bool blnerror = false;
                    string id = local.id;
                    string nombre = local.nombre;

                    if (nombre.Length < 3)
                    {
                        respuesta = "El nombre debe contener mas de 2 caracteres!";
                        blnerror = true;
                    }


                    if (!blnerror)
                    {
                        string a4 = local.a4;
                        string mm58 = local.mm58;
                        string mm80 = local.mm80;

                        string departamento = local.departamento;
                        string provincia = local.provincia;
                        string distrito = local.distrito;
                        string direccion = local.direccion;
                        string ubigeo = local.ubigeo;
                        string telefono = local.telefono;
                        string latitud = local.latitud;
                        string longitud = local.longitud;

                        string precuentatexto = local.precuentatexto;
                        string pedidotexto = local.pedidotexto;
                        string claveimpresion = local.claveimpresion;

                        string idalmacen = local.idalmacen;
                        string activo = local.activo;

                        string ventamensual = local.ventamensual;
                        string ventaanual = local.ventaanual;
                        string vtexid = local.vtexid;
                        string abreviatura = local.abreviatura;


                        using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                        {
                            if (id == "0")
                            {
                                if (obj.ExisteByNombre(ruc, nombre))
                                    respuesta = "El nombre de Local existe!";
                                else
                                    obj.Agregar(ruc, nombre, departamento, provincia, distrito, direccion, ubigeo,
                                        telefono, latitud, longitud, idalmacen, a4, mm58, mm80,
                                        precuentatexto, pedidotexto, claveimpresion,
                                        activo, ventamensual, ventaanual, abreviatura, vtexid);
                            }
                            else
                                obj.Editar(id, nombre, departamento, provincia, distrito, direccion, ubigeo,
                                    telefono, latitud, longitud, idalmacen, a4, mm58, mm80,
                                    precuentatexto, pedidotexto, claveimpresion,
                                    activo, ventamensual, ventaanual, abreviatura, vtexid);
                        }
                    }
                }

            }
            catch
            {
                respuesta = "-1";
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