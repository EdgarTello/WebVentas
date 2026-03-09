using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta02Importar
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

                string empresa_id = ticket.UserData.Split('|')[0];
                string empresa_ruc = ticket.UserData.Split('|')[1];
                string usuario_acceso = ticket.UserData.Split('|')[3];
                string usuario_codigo = ticket.UserData.Split('|')[4];
                string usuario_nombre = ticket.UserData.Split('|')[5];
                string usuario_serie = ticket.UserData.Split('|')[7];
                string puntosid = ticket.UserData.Split('|')[8];
                string ipcliente = ticket.UserData.Split('|')[9];
                string local_codigo = ticket.UserData.Split('|')[10];
                string movil = ticket.UserData.Split('|')[11];


                if (context.Request.Params["ope"] == "2")
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    List<Entity.ClienteImportar> listado = JsonConvert.DeserializeObject<List<Entity.ClienteImportar>>(json);

                    foreach (var item in listado)
                    {
                        try
                        {
                            if (item.valido == "NO" || item.valido == "0")
                            {

                                //string cadena = "Q45616780";
                                //string patron = @"[Q]\d{8}"; // Patrón para un número de teléfono
                                //string numero = item.licencia;
                                //string dni = numero.Replace("Q", "");
                                string dni = item.licencia;

                                //if (Regex.IsMatch(numero, patron))
                                //{
                                Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente();
                                bool existe_buscado = obj.ExisteBuscadoByDocumento(empresa_ruc, ((dni.Length == 8) ? "1" : "4"), dni);
                                bool existe_cliente = obj.ExisteByDocumento(empresa_ruc, ((dni.Length == 8) ? "1" : "4"), dni);

                                if (!existe_cliente)
                                {
                                    if (dni.Length == 8)
                                    {
                                        if (!existe_buscado)
                                        {
                                            string url = string.Format("https://api.apis.net.pe/v2/reniec/dni?numero={0}", dni);
                                            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                                            var client = new RestClient(url);
                                            //client.Authenticator = new OAuth2AuthorizationRequestHeaderAuthenticator("apis-token-3395.fk-GkEjdkkrwWZIO1C9fCYQuqHlRTedK", "Bearer");
                                            client.Timeout = 10 * 1000;
                                            var request = new RestRequest(Method.GET);
                                            request.Parameters.Clear();
                                            request.AddHeader("Accept", "application/json");
                                            request.AddHeader("Authorization", "Bearer " + "apis-token-8291.C3YOD-zuKC8fgN4rL4hqZjaHxVMHswct");

                                            IRestResponse response = client.Execute(request);
                                            //respuesta = response.Content;

                                            var data = JsonConvert.DeserializeObject<Entity.Persona>(response.Content);
                                            bool data_reniec = false;

                                            if (data != null)
                                            {
                                                if (!(data.numeroDocumento == string.Empty || data.numeroDocumento == null))
                                                {
                                                    data_reniec = true;
                                                }
                                            }

                                            if (data_reniec)
                                            {
                                                obj.AgregarSimple(
                                                    string.Format("{0} {1} {2}", data.apellidoPaterno, data.apellidoMaterno, data.nombres),
                                                    data.tipoDocumento,
                                                    data.numeroDocumento,
                                                    "",
                                                    "LIMA",
                                                    "LIMA",
                                                    "LIMA",
                                                    item.correo,
                                                    "1",
                                                    empresa_ruc);

                                                item.valido = "1";
                                                item.proceso = "OK";
                                            }
                                            else
                                            {
                                                obj.AgregarSimple(
                                                    item.nombre,
                                                    "1",
                                                    dni,
                                                    "",
                                                    "LIMA",
                                                    "LIMA",
                                                    "LIMA",
                                                    item.correo,
                                                    "0",
                                                    empresa_ruc);

                                                item.valido = "0";
                                                item.proceso = "OK";
                                                item.mensaje = "DNI encontrado sin datos.";
                                            }
                                        }
                                        else
                                        {
                                            obj.AgregarSimple(
                                                    item.nombre,
                                                    "1",
                                                    dni,
                                                    "",
                                                    "LIMA",
                                                    "LIMA",
                                                    "LIMA",
                                                    item.correo,
                                                    "0",
                                                    empresa_ruc);

                                            item.valido = "0";
                                            item.proceso = "OK";
                                            item.mensaje = "DNI encontrado sin datos.";

                                        }
                                    }
                                    else
                                    {
                                        
                                        if (dni.Length > 8)
                                        {
                                            obj.AgregarSimple(
                                                            item.nombre,
                                                            "4",
                                                            dni,
                                                            "",
                                                            "LIMA",
                                                            "LIMA",
                                                            "LIMA",
                                                            item.correo,
                                                            "1",
                                                            empresa_ruc);

                                            item.valido = "0";
                                            item.proceso = "OK";
                                        }
                                        else
                                        {
                                            obj.AgregarSimple(
                                                            item.nombre,
                                                            "4",
                                                            dni,
                                                            "",
                                                            "LIMA",
                                                            "LIMA",
                                                            "LIMA",
                                                            item.correo,
                                                            "0",
                                                            empresa_ruc);

                                            item.valido = "0";
                                            item.proceso = "OK";
                                        }
                                        
                                    }
                                }
                                else {
                                    item.proceso = "OK";
                                }
                            }
                            else {
                                item.proceso = "OK";
                            }
                        }
                        catch (Exception ex)
                        {
                            item.proceso = "ERROR";
                            item.mensaje = ex.Message;
                        }
                    }

                    respuesta = listado.Serialize();
                }

                if (context.Request.Params["ope"] == "3")
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    List<Entity.ClienteImportar> listado = JsonConvert.DeserializeObject<List<Entity.ClienteImportar>>(json);
                    List<string> lista = new List<string>();

                    foreach (var item in listado)
                    {
                        lista.Add(string.Format("insert into clientemasivo(id, tipo_documento, num_documento, correo, ruc) " +
                            "values ({0}, {1},'{2}','{3}','{4}')",
                            item.codigo,
                            ((item.licencia.Length==8)?"1": "4"),
                            item.licencia,
                            item.correo,
                            empresa_ruc));
                    }

                    Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente();
                    obj.UpdateMasivoCorreo(empresa_ruc);
                    obj.ValidarMasivo(empresa_ruc, lista);

                    respuesta = obj.LoadMasivoValido(empresa_ruc).Serialize();
                }

                if (context.Request.Params["ope"] == "4")
                {
                    string json = HttpUtility.UrlDecode(context.Request.Params["json"]);
                    List<Entity.ClienteImportar> listado = JsonConvert.DeserializeObject<List<Entity.ClienteImportar>>(json);
                    List<string> lista = new List<string>();
                    //Request.QueryString["fechainicio"].ConverTo_YYYYMMDD()
                    foreach (var item in listado)
                    {
                        //if (item.licencia.Length > 7 && (item.valido == "SI" || item.valido == "1"))
                        
                        lista.Add(string.Format("insert into clientemasivo(                         " +
                            "id, tipo_documento, num_documento, monto , idcaja, serie, correo, nombre, fecha, ruc) " +
                            "values ({0}, {1}, '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}')",
                            item.codigo,
                            ((item.licencia.Length == 8) ? "1" : "4"),
                            item.licencia,
                            item.monto,
                            item.idcaja,
                            item.serie,
                            item.correo,
                            item.nombre.Replace("'", "''"),
                            item.fecha.ConverTo_YYYYMMDD(),
                            empresa_ruc));
                        
                    }

                    using (TwoTecnology.Repositorio.Pedido objped = new TwoTecnology.Repositorio.Pedido())
                    {
                        using (TwoTecnology.Repositorio.Producto objpro = new TwoTecnology.Repositorio.Producto())
                        {
                            string idpro = objpro.GetMasivoByRuc(empresa_ruc);

                            using (TwoTecnology.Repositorio.Cliente objcli = new TwoTecnology.Repositorio.Cliente())
                            {
                                objcli.ValidarMasivo(empresa_ruc, lista);

                                var listcliente = objcli.LoadMasivoValido(empresa_ruc);

                                foreach (var item in listcliente)
                                {
                                    string idpedido = "0";

                                    if (item.valido == "1")
                                    {
                                        idpedido = objped.Agregar(
                                            empresa_ruc, local_codigo, item.codigointerno, "","","", "",
                                            item.idcaja, item.serie, usuario_nombre,
                                            "03", item.monto, "B", item.fecha);
                                    }
                                    else {
                                        idpedido = objped.Agregar(
                                                empresa_ruc, local_codigo,"", 
                                                "1", "99999999", item.nombre, item.correo,
                                                item.idcaja, item.serie, usuario_nombre,
                                                "03", item.monto, "B", item.fecha);
                                    }


                                    objped.AgregarDetalle_v2(idpedido, idpro, "1", item.monto, item.monto,
                                        "0.00", "0.00", "0.00", "0.00", item.monto);

                                    objped.AgregarForma(idpedido, "Contado", "PEN", "0.00", "");

                                    objped.AgregarPago(idpedido, "Efectivo", "PEN", item.monto, "0.00","","");

                                    objped.GenerarMasivo(idpedido);
                                }
                            }
                        }
                    }

                    respuesta = "0";

                }

            }
            catch(Exception ex)
            {
                respuesta = string.Format("{0}", ex.Message);
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