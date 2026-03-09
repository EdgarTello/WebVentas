using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.Script.Serialization;
using System.IO;
using System.Text;
using System.Configuration;
using System.Web.Security;
using System.Web.Services;
using Newtonsoft.Json;
using TwoTecnology.Entity;
using RestSharp;


namespace TwoTecnology.WebVentas.Formulario.General
{
    public partial class OperacionGeneral : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Clear();
                    Header.Controls.Add(new LiteralControl(@"
                    <script type=""text/javascript"">
                    top.location = ""Default.aspx"";
                    parent.location = ""Default.aspx"";
                    </script>
                    "));
                    Response.End();
                    // This is an unauthorized, authenticated request...
                    //Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                }
            }



            FormsAuthenticationTicket ticket = null;
            try
            {
                FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                ticket = formsIdentity.Ticket;
            }
            catch
            {
                Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
            }

            string empresa_id = ticket.UserData.Split('|')[0];
            string empresa_ruc = ticket.UserData.Split('|')[1];
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string usuario_serie = ticket.UserData.Split('|')[7];
            string puntosid = ticket.UserData.Split('|')[8];
            string ipcliente = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";



            if (Request.QueryString["ope"] == "1")
            {
                using (Repositorio.TipoDocumento obj = new TwoTecnology.Repositorio.TipoDocumento())
                {
                    respuesta = obj.Load(empresa_ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "001")
            {
                using (Repositorio.TipoCambio obj = new TwoTecnology.Repositorio.TipoCambio())
                {
                    respuesta = obj.LoadMontoCompraLast(empresa_ruc);
                }
            }

            if (Request.QueryString["ope"] == "002")
            {
                using (Repositorio.Ubigeo obj = new TwoTecnology.Repositorio.Ubigeo())
                {
                    respuesta = obj.Load().Serialize();
                }
            }

            //if (Request.QueryString["ope"] == "003")
            //{
            //    string monedacaja = Request.QueryString["monedacaja"];
            //    string monedadefault = Request.QueryString["monedadefault"];
            //    string moneda = monedadefault;

            //    if (!(monedacaja == "0" || monedacaja == "")) {
            //        moneda = monedacaja;
            //    }


            //    using (Repositorio.Monedero obj = new TwoTecnology.Repositorio.Monedero())
            //    {
            //        respuesta = obj.Load(empresa_ruc, moneda).Serialize();
            //    }
            //}

            if (Request.QueryString["ope"] == "004")
            {
                using (Repositorio.TipoEgreso obj = new TwoTecnology.Repositorio.TipoEgreso())
                {
                    respuesta = obj.Load(empresa_ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "005")
            {
                using (Repositorio.TipoMoneda obj = new TwoTecnology.Repositorio.TipoMoneda())
                {
                    respuesta = obj.Load(empresa_ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "006")
            {
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    respuesta = obj.Load(empresa_ruc, nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "007")
            {
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                {
                    respuesta = obj.Load(empresa_ruc, nombre).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "008")
            {
                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadDocumento(empresa_ruc).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "009")
            {

                string numero_documento = Request.QueryString["numero_documento"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadNombreByDocumento(empresa_ruc, numero_documento);
                }
            }

            if (Request.QueryString["ope"] == "010")
            {

                string numero_documento = Request.QueryString["numero_documento"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadCodigoByDocumento(empresa_ruc, numero_documento);
                }
            }

            if (Request.QueryString["ope"] == "011")
            {
                string localid = Request.QueryString["localid"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Caja obj = new TwoTecnology.Repositorio.Caja())
                {
                    respuesta = obj.Load(localid, nombre).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "012")
            {
                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    if (usuario_acceso == "Cajero" || usuario_acceso == "Administrador")
                        respuesta = obj.LoadByLocalEmpleado(empresa_ruc, localcodigo, usuario_nombre);
                    else
                        respuesta = obj.LoadByLocalEmpleado(empresa_ruc, localcodigo, "");//, usuario_nombre);
                }
            }


            if (Request.QueryString["ope"] == "020")
            {
                string tipo = Request.QueryString["tipo"];

                using (Repositorio.Puertos obj = new TwoTecnology.Repositorio.Puertos())
                {
                    respuesta = obj.LoadByTipo(tipo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "030")
            {
                using (Repositorio.RolPrincipal obj = new TwoTecnology.Repositorio.RolPrincipal())
                {
                    respuesta = obj.Load(empresa_ruc).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "031")
            {
                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadAlmacenesById(empresa_ruc, usuario_codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "032")
            {

                string idlocal = Request.QueryString["idlocal"];

                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                {
                    respuesta = obj.LoadMotivosGuiaByCodigo(empresa_ruc, idlocal).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "040")
            {
                string idalmacen = Request.QueryString["idalmacen"];

                using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                    respuesta = obj.LoadListId(empresa_ruc, idalmacen).Serialize();
            }

            if (Request.QueryString["ope"] == "033")
            {
                string idalmacen = Request.QueryString["idalmacen"];

                using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                    respuesta = obj.LoadListNotId(empresa_ruc, idalmacen).Serialize();
            }

            if (Request.QueryString["ope"] == "034")
            {
                string idalmacen = Request.QueryString["idalmacen"];

                using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                    respuesta = obj.LoadListSeries(empresa_ruc, idalmacen).Serialize();
            }

            if (Request.QueryString["ope"] == "035")
            {
                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.Load(empresa_ruc, "2").Serialize();
                }
            }

            if (Request.QueryString["ope"] == "036")
            {
                using (Repositorio.Transporte obj = new TwoTecnology.Repositorio.Transporte())
                {
                    respuesta = obj.LoadByLocalv2(empresa_ruc).Serialize();                }
            }

            if (Request.QueryString["ope"] == "037")
            {
                using (Repositorio.Conductor obj = new TwoTecnology.Repositorio.Conductor())
                {
                    respuesta = obj.LoadByLocal_v2(empresa_ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "038")
            {
                using (Repositorio.Familia obj = new TwoTecnology.Repositorio.Familia())
                {
                    respuesta = obj.LoadActivo(empresa_ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "039")
            {
                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.LoadActivo(empresa_ruc,"").Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2000")
            {
                string rucbusqueda = Request.QueryString["ruc"];

                using (Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
                {
                    respuesta = obj.ConsultaRUC(rucbusqueda);
                }


            }

            if (Request.QueryString["ope"] == "710")
            {
                string tipo = Request.QueryString["tipo"];
                string numero = Request.QueryString["numero"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadByNumero(empresa_ruc, tipo, numero).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "712")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.ClienteDireccion obj = new TwoTecnology.Repositorio.ClienteDireccion())
                {
                    respuesta = obj.LoadByClienteValidateUbigeo(id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2001")
            {
                string rucbusqueda = Request.QueryString["dni"];

                using (Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
                {
                    respuesta = obj.ConsultaDNI(rucbusqueda);
                }

            }

            if (Request.QueryString["ope"] == "2002")
            {
                string numero = base.Request.QueryString["dni"];
                string url = string.Format("https://api.apis.net.pe/v2/reniec/dni?numero={0}", numero);
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                var client = new RestClient(url);
                //client.Authenticator = new OAuth2AuthorizationRequestHeaderAuthenticator("apis-token-3395.fk-GkEjdkkrwWZIO1C9fCYQuqHlRTedK", "Bearer");
                client.Timeout = 10 * 1000;
                var request = new RestRequest(Method.GET);
                request.Parameters.Clear();
                request.AddHeader("Accept", "application/json");
                request.AddHeader("Authorization", "Bearer " + "apis-token-8291.C3YOD-zuKC8fgN4rL4hqZjaHxVMHswct");

                IRestResponse response = client.Execute(request);
                respuesta = response.Content;
            }

            if (Request.QueryString["ope"] == "2003")
            {
                string numero = base.Request.QueryString["ruc"];
                string url = string.Format("https://api.apis.net.pe/v2/sunat/ruc?numero={0}", numero);
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                var client = new RestClient(url);
                //client.Authenticator = new OAuth2AuthorizationRequestHeaderAuthenticator("apis-token-3395.fk-GkEjdkkrwWZIO1C9fCYQuqHlRTedK", "Bearer");
                client.Timeout = 10 * 1000;
                var request = new RestRequest(Method.GET);
                request.Parameters.Clear();
                request.AddHeader("Accept", "application/json");
                request.AddHeader("Authorization", "Bearer " + "apis-token-8291.C3YOD-zuKC8fgN4rL4hqZjaHxVMHswct");

                IRestResponse response = client.Execute(request);
                respuesta = response.Content;

            }

            //if (Request.QueryString["ope"] == "2002")
            //{
            //    string numero = base.Request.QueryString["dni"];
            //    string url = string.Format("https://api.reniec.cloud/dni/{0}", numero);
            //    System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            //    var client = new RestClient(url);
            //    client.Timeout = -1;
            //    var request = new RestRequest(Method.GET);
            //    request.AddHeader("Content-Type", "application/json; charset=utf-8");
            //    IRestResponse response = client.Execute(request);
            //    respuesta = response.Content;
            //}

            //if (Request.QueryString["ope"] == "2003")
            //{
            //    string numero = base.Request.QueryString["ruc"];
            //    string url = string.Format("http://api.sunat.binvoice.net/consulta.php?nruc={0}", numero);
            //    var client = new RestClient(url);
            //    client.Timeout = -1;
            //    var request = new RestRequest(Method.POST);
            //    IRestResponse response = client.Execute(request);
            //    respuesta = response.Content;

            //}

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }


    }
}