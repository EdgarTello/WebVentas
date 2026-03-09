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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaRemision23
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
                string estado = Request.QueryString["estado"];
                string anulado = Request.QueryString["anulado"];
                string documento = Request.QueryString["documento"];
                string externo = Request.QueryString["externo"];
                string detalle = Request.QueryString["detalle"];

                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();

                Metodos.ValidateAntiXsrfToken("GR23List");


                if (idlocal.IsNumeric() && estado.IsNumeric() && anulado.IsNumeric() && externo.IsNumeric() &&
                    detalle.IsNumeric() && 
                    !fechainicio.IsInyection() && !fechafin.IsInyection())
                {

                    using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                    {
                        respuesta = obj.LoadByLocalFilter(idlocal, fechainicio, fechafin,
                            estado,
                            usuario_codigo,
                            usuario_acceso,
                            ((usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador" || usuario_acceso == "Auditor" || usuario_acceso == "Almacen") ? "" : usuario_nombre),
                            anulado,
                            documento,
                            "0",
                            externo,
                            detalle,
                            ruc).Serialize();
                    }

                }
            }

            if (Request.QueryString["ope"] == "2") { 
                string id = Request.QueryString["id"];

                Metodos.ValidateAntiXsrfToken("GR23New");


                if (id.IsNumeric())
                {
                    using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                        respuesta = obj.LoadByCodigoWithDetail(id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2_1")
            {
                string PERMAT = Request.QueryString["PERMAT"];
                string DOCMAT = Request.QueryString["DOCMAT"];
                /*
                using (srvAustral.v2.ZWS_MATMIGOClient obj = new srvAustral.v2.ZWS_MATMIGOClient())
                {
                    obj.ClientCredentials.UserName.UserName = "MSANCHEZ";
                    obj.ClientCredentials.UserName.Password = "$$0987654bB2025";

                    //srvAustral.ZWS_CONMIGOChannel
                    //srvAustral.v2.ZWS_MATMIGOChannel

                    srvAustral.v2.ZAUMM_FUN_GET_DOCMAT opt1 = new srvAustral.v2.ZAUMM_FUN_GET_DOCMAT();
                    opt1.I_PERMAT = PERMAT;
                    opt1.I_DOCMAT = DOCMAT;

                    var rpt = obj.ZAUMM_FUN_GET_DOCMAT(opt1);
                    respuesta = rpt.E_DETALLE.Serialize();
                }*/
                
                using (srvAustral.ZWS_CONMIGOClient obj = new srvAustral.ZWS_CONMIGOClient())
                {
                    obj.ClientCredentials.UserName.UserName = "webservice";
                    obj.ClientCredentials.UserName.Password = "omnia400";

                    srvAustral.ZAUMM_FUN_GET_DOCMAT opt1 = new srvAustral.ZAUMM_FUN_GET_DOCMAT();
                    opt1.I_PERMAT = PERMAT;
                    opt1.I_DOCMAT = DOCMAT;

                    var rpt = obj.ZAUMM_FUN_GET_DOCMAT(opt1);
                    respuesta= rpt.E_DETALLE.Serialize();
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.Guia guia = JsonConvert.DeserializeObject<Entity.Guia>(json);

                Metodos.ValidateAntiXsrfToken("GR23New");


                if (guia.id.IsNumeric())
                {

                    using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                    {
                        obj.ActualizarCarga(guia.id);
                    }
                }

                respuesta = guia.id;
            }

            if (Request.QueryString["ope"] == "4")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "5")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.ActualizarImpresion(id);
                }
            }

            if (Request.QueryString["ope"] == "6")
            {
                string empleado = Request.QueryString["empleado"];
                string idlocal = Request.QueryString["idlocal"];
                string clasificacion = Request.QueryString["clasificacion"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {

                    respuesta = obj.AgregarPedidoGuia(empleado, idlocal, clasificacion, ruc);
                }
            }

            if (Request.QueryString["ope"] == "7")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    respuesta= obj.Regenerar(id);
                }
            }


            if (Request.QueryString["ope"] == "10")
            {
                string idguiadetalle = "0";
                string idguia = Request.QueryString["idguia"];
                string idalmacen = Request.QueryString["idalmacen"];
                string unidad = Request.QueryString["unidad"];
                string idproducto = Request.QueryString["idproducto"];
                string cantidad = Request.QueryString["cantidad"];

                Metodos.ValidateAntiXsrfToken("GR23New");


                if (idguia.IsNumeric() && idalmacen.IsNumeric() && idproducto.IsNumeric() &&
                    cantidad.IsNumeric() && !unidad.IsInyection()  )
                {
                    var guia = new TwoTecnology.Repositorio.Guia().ValidaGuia(idguia);

                    if (guia.estado == "0" && guia.anulado == "0")
                    {
                        using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                        {
                            idguiadetalle = obj.AgregarDetalle_v2(idguia, idalmacen, idproducto, unidad, cantidad);
                        }
                    }
                }

                respuesta = idguiadetalle;
            }

            if (Request.QueryString["ope"] == "11")
            {
                string id = Request.QueryString["id"];
                string cantidad = Request.QueryString["cantidad"];

                Metodos.ValidateAntiXsrfToken("GR23New");


                if (id.IsNumeric() && !cantidad.IsInyection())
                {

                    using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                    {
                        obj.ActualizarDetalle(id, cantidad, "0");
                    }
                }

            }

            if (Request.QueryString["ope"] == "12")
            {
                string id = Request.QueryString["id"];

                Metodos.ValidateAntiXsrfToken("GR23New");


                if (id.IsNumeric())
                {
                    using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                    {
                        obj.EliminarDetalle(id);
                    }
                }
            }


            if (Request.QueryString["ope"] == "13")
            {
                string id = Request.QueryString["id"];
                string conformidad = Request.QueryString["conformidad"];
                string observacion = Request.QueryString["observacion"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.ActualizarValidacion(id, conformidad, observacion);
                }
            }

            if (Request.QueryString["ope"] == "14")
            {
                string id = Request.QueryString["id"];
                string conformidad = Request.QueryString["conformidad"];
                string observacion = Request.QueryString["observacion"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.ActualizarSalida(id, usuario_nombre, conformidad, observacion);
                }
            }

            if (Request.QueryString["ope"] == "15")
            {
                string id = Request.QueryString["id"];
                string conformidad = Request.QueryString["conformidad"];
                string observacion = Request.QueryString["observacion"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.ActualizarEntrada(id, usuario_nombre, conformidad, observacion);
                }
            }

            if (Request.QueryString["ope"] == "16")
            {
                string id = Request.QueryString["id"];
                string descripcion = Request.QueryString["descripcion"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.ActualizarDescripcion(id, descripcion);
                }
            }



            if (Request.QueryString["ope"] == "20")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.GuiaDetalle guia = JsonConvert.DeserializeObject<Entity.GuiaDetalle>(json);


                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    respuesta= obj.AgregarDetalle_NoInventariado(guia.idguia, guia.codigo,  guia.producto, guia.descripcion,  guia.unidad, guia.cantidad);
                }
            }

            if (Request.QueryString["ope"] == "30")
            {
                string id = Request.QueryString["id"];
                string productobloqueo = Request.QueryString["productobloqueo"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.ActualizaProductoBloqueo(id, productobloqueo);
                }
            }

            


            if (Request.QueryString["ope"] == "50")
            {

                string id = Request.QueryString["id"] ?? "";
                string tipo = Request.QueryString["tipo"] ?? "";
                string indicador = Request.QueryString["indicador"] ?? "";
                string serie = Request.QueryString["serie"] ?? "";
                string correlativo = Request.QueryString["correlativo"] ?? "";
                string webservice = ConfigurationSettings.AppSettings["webservice"];

                //if (webservice == "0")
                //{

                var guia = new TwoTecnology.Repositorio.Guia().LoadByCodigo(id);

                if (guia.externo == "1")
                {
                    using (servicioDocumento.DocumentoClient doc = new servicioDocumento.DocumentoClient())
                    {
                        string pdfstring = doc.ObtenerPdf(ruc, tipo, string.Format("{0}{1}", indicador, serie), correlativo);
                        respuesta = pdfstring;
                    }
                }
                else
                {
                    using (Repositorio.PdfGenerate objeto = new TwoTecnology.Repositorio.PdfGenerate())
                    {
                        var pdf = objeto.GenerarPDF_Guia(id);

                        if (pdf != null && pdf.Length > 0)
                        {
                            respuesta = Convert.ToBase64String(pdf);
                        }
                        else
                        {
                            respuesta = "";
                        }
                    }
                }
            }


            if (Request.QueryString["ope"] == "60")
            {
                
                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    respuesta= obj.SunatEstadoServicio().Serialize();
                }
            }


            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}