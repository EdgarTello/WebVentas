using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TwoTecnology.Entity;
using TwoTecnology.Repositorio;


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta02
{
    public partial class Operacion : System.Web.UI.Page
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
                Response.End();
            }

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
            string respuesta = "";

            

            if (Request.QueryString["ope"] == "1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcaja = Request.QueryString["idcaja"];
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string estado = Request.QueryString["estado"];
                string anulado = Request.QueryString["anulado"];
                string documento = Request.QueryString["documento"];
                string di = Request.QueryString["di"];
                string tipodocumento = Request.QueryString["tipodocumento"];

                Metodos.ValidateAntiXsrfToken("PuntoVenta02List");


                if (idlocal.IsNumeric() && !idcaja.IsInyection() && estado.IsNumeric() && anulado.IsNumeric() &&
                    di.IsNumeric() && tipodocumento.IsNumeric() &&
                    !documento.IsInyection() &&
                    !fechainicio.IsInyection() && !fechafin.IsInyection())
                {

                    if (usuario_acceso == "Administrador" || usuario_acceso == "SuperAdmin" ||
                        usuario_acceso == "Cajero"        || usuario_acceso == "Vendedor")
                    {


                        using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                        {
                            respuesta = obj.LoadByCajaSinCierreFilter(
                                idlocal,
                                ((usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador" || usuario_acceso == "Cajero") ? "" : idcaja),
                                fechainicio,
                                fechafin,
                                estado,
                                ((usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador" || usuario_acceso == "Cajero") ? "" : usuario_nombre),
                                anulado,
                                documento,
                                di,
                                tipodocumento,
                                ruc);
                        }

                    }
                }

            }


            if (Request.QueryString["ope"] == "2")
            {
                string id = Request.QueryString["id"];
                string impresora = Request.QueryString["impresora"] ?? "";

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarImpresion(id, impresora);
                }
            }

            if (Request.QueryString["ope"] == "21")
            {
                string id = Request.QueryString["id"];
                
                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarAnticipo(id);
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                
                Entity.Pedido pedido = JsonConvert.DeserializeObject<Entity.Pedido>(json);

                string tipo = pedido.tipo;
                string serie = pedido.serie;
                string documento = pedido.documento;

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    string id = obj.ObtenerPedidoByParameter(tipo, serie, documento, ruc);

                    if (id == "0")
                    {
                        string as400_servidor = ConfigurationManager.AppSettings.Get("as400_servidor");
                        string tipodocu = pedido.tipo;
                        string idlciente = "0";

                        if (tipo == "01")
                            tipodocu = "FC";

                        if (tipo == "03")
                            tipodocu = "BV";

                        using (TwoTecnology.Repositorio.Ilaria.Pedido pedext = new TwoTecnology.Repositorio.Ilaria.Pedido())
                        {
                            var detail = pedext.LoadDetail(as400_servidor, tipodocu, serie, documento);
                            var header = pedext.LoadHeader(as400_servidor, serie, detail.First().nume);

                            using (TwoTecnology.Repositorio.Cliente cliext = new TwoTecnology.Repositorio.Cliente())
                            {
                                bool cliente_existe = false;

                                cliente_existe= cliext.ExisteByDocumento(ruc, header.cliente_tdoc, header.cliente_numdocumento );

                                if (cliente_existe){
                                    idlciente= cliext.LoadCodigoByDocumento(ruc, header.cliente_tdoc, header.cliente_numdocumento );
                                }
                                else {
                                    idlciente = cliext.AgregarSimple( header.cliente_nombre, header.cliente_tdoc, header.cliente_numdocumento, "0", ruc);
                                }
                            }

                            id = obj.Agregar_VentaNormal(ruc, pedido.idlocal, pedido.idcaja, pedido.caja, serie,documento, "sistemas_nc", 
                            header.almacen , "0", "0", tipo, header.valorventa, "0", header.total, header.total, "0", "0", idlciente, "","",
                            tipodocu.Substring(0,1), header.fecha ,"", "","", "", "", header.moneda, "Contado");

                            foreach (var det in detail) {

                                Entity.Producto producto = new Entity.Producto();   

                                using (TwoTecnology.Repositorio.Producto proext = new TwoTecnology.Repositorio.Producto())
                                {
                                    producto = proext.LoadByCodigoInterno(ruc, det.codigo);
                                }

                                obj.AgregarDetalle_Normal(id, producto.id,  det.codigo, producto.nombre,"",  det.cantidad, 
                                    ( Convert.ToDecimal(det.monto)/ Convert.ToDecimal(det.cantidad) ).ToString("F2") ,
                                    (Convert.ToDecimal(det.monto) - Convert.ToDecimal(det.igv)).ToString("F2"),
                                    "0",  det.igv, "0" , "0", det.monto, ruc );
                            }

                            obj.ActualizarCierreExterno(id);

                        }
                        //externo
                        //obj.Generara_Documento_Externo(tipo, serie, documento, ruc);    

                    }

                    respuesta = obj.Generara_Documento_Header_NC(id, localcodigo);

                    foreach (var detalle in pedido.pedidodetalle)
                        obj.Generara_Documento_Detail_NC(id, respuesta, detalle.idproducto, detalle.cantidad);

                    obj.ActualizarCabecera(respuesta);
                }
                
            }

            if (Request.QueryString["ope"] == "4")
            {
                string id = Request.QueryString["id"];
                
                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta = obj.Generara_Documento_NC(id);
                }
                
            }

            if (Request.QueryString["ope"] == "31")
            {
                
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                List<Entity.Pedido> lista_anticipos = JsonConvert.DeserializeObject<List<Entity.Pedido>>(json);
                string id2 = "0";

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    foreach (Entity.Pedido item in lista_anticipos)
                    {
                        id2 = obj.Generara_Documento_AN(item.id);
                        break;
                    }

                    foreach (Entity.Pedido item in lista_anticipos)
                    {
                        obj.AgregarDetalle_AN(item.id, id2);
                    }

                    foreach (Entity.Pedido item in lista_anticipos)
                    {
                        obj.AgregarDetalle_Anticipo(id2, item.id, item.idcliente, item.total);
                    }

                    obj.ActualizarCabecera(id2);

                    respuesta = id2;

                }
            }

            if (Request.QueryString["ope"] == "4")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta = obj.GenerarAperturaGaveta(id, localcodigo);

                }
            }

            if (Request.QueryString["ope"] == "10")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta = obj.LoadDetailVenta(id, "").Serialize();

                }
            }

            if (Request.QueryString["ope"] == "11")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcaja = Request.QueryString["idcaja"];
                string documento = Request.QueryString["documento"];
                string tipodocumento = Request.QueryString["tipodocumento"];

                if (usuario_acceso == "Administrador" || usuario_acceso == "SuperAdmin" ||
                    usuario_acceso == "Cajero")
                {


                    using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                    {
                        respuesta = obj.LoadByCajaSinCierreFilter(
                            idlocal,
                            ((usuario_acceso == "SuperAdmin" || usuario_acceso == "Admin") ? "" : idcaja),
                            documento,
                            tipodocumento,
                            ruc);
                    }
                }
            }

            if (Request.QueryString["ope"] == "91")
            {
                using (Repositorio.Configuracion obj = new TwoTecnology.Repositorio.Configuracion())
                {
                    respuesta = obj.LoadTexto(ruc, localcodigo, "aperturacaja");
                }
            }

            if (Request.QueryString["ope"] == "92")
            {
                using (TwoTecnology.Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    respuesta = obj.AperturaExisteByLocalEmpleado(ruc, localcodigo, usuario_nombre);
                }
            }

            if (Request.QueryString["ope"] == "101")
            {
                string id = Request.QueryString["id"];

                using (TwoTecnology.Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ReprocesoError(ruc, id);
                }
            }

            if (Request.QueryString["ope"] == "102")
            {
                string id = Request.QueryString["id"];

                using (TwoTecnology.Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.EditarError(ruc, id);
                }
            }

            if (Request.QueryString["ope"] == "110")
            {
                string tipo = Request.QueryString["tipo"];
                string serie = Request.QueryString["serie"];
                string documento = Request.QueryString["documento"];
                string as400_servidor = ConfigurationManager.AppSettings.Get("as400_servidor");

                using (TwoTecnology.Repositorio.Ilaria.Pedido obj = new TwoTecnology.Repositorio.Ilaria.Pedido())
                {
                    if (tipo == "01")
                        tipo = "FC";

                    if (tipo == "03")
                        tipo = "BV";

                    respuesta = obj.LoadDetail(as400_servidor, tipo, serie, documento).Serialize();

                }
            }


            if (Request.QueryString["ope"] == "20")
            {
                string idcaja = Request.QueryString["idcaja"];

                using (TwoTecnology.Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadByCaja(ruc, idcaja).Serialize();
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}