using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using RestSharp;
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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Dashboard
{
    public partial class Operacion : System.Web.UI.Page
    {
        string urlDefault = "Default.aspx";

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

            if (Request.QueryString["ope"] == "0")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string Di = Request.QueryString["DI"];
                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteVentasTipoPago(idLocal, ruc, fechaini, fechafin, Di).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }
            if (Request.QueryString["ope"] == "1")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteDocumentosAnulados(idLocal, ruc, fechaini, fechafin).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }
            if (Request.QueryString["ope"] == "2")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string Di = Request.QueryString["DI"];

                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteVentasxMesero(idLocal, ruc, fechaini, fechafin, Di).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }
            if (Request.QueryString["ope"] == "3")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string Di = Request.QueryString["DI"];
                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteVentasxTipoPedido(idLocal, ruc, fechaini, fechafin, Di).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "4")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string Di = Request.QueryString["DI"];
                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteVentasNetas(idLocal, ruc, fechaini, fechafin, Di).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "5")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string Di = Request.QueryString["DI"];
                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteTotalIgv(idLocal, ruc, fechaini, fechafin, Di).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "8")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string Di = Request.QueryString["DI"];
                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteTotalVentas(idLocal, ruc, fechaini, fechafin, Di).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "6")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();

                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteTotalxTipoDocumento(idLocal, ruc, "factura", fechaini, fechafin).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }
            if (Request.QueryString["ope"] == "7")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();

                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteTotalxTipoDocumento(idLocal, ruc, "boleta", fechaini, fechafin).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }
            
            if (Request.QueryString["ope"] == "9")
            {
                string idLocal = Request.QueryString["idlocal"];
                string Di = Request.QueryString["DI"];
                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteComparativoAnual(idLocal, ruc, Di).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }
            if (Request.QueryString["ope"] == "10")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteClientesDashBoard(ruc, idLocal.ToString(), fechaini, fechafin).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "11")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteProductosDashBoard(ruc, idLocal.ToString(), fechaini, fechafin).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "12")
            {
                string idLocal = Request.QueryString["idlocal"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string Di = Request.QueryString["DI"];
                respuesta = "";
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporteTotalRc(idLocal, ruc, fechaini, fechafin, Di).Serialize();

                    Response.Write(respuesta);
                    //Response.ContentEncoding = Encoding.UTF8;
                    Response.End();

                }
            }

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            if (Request.QueryString["ope"] == "100")
            {
                string idlocal = Request.QueryString["idlocal"];
                string opcion = Request.QueryString["opcion"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string horainicio = Request.QueryString["horainicio"];
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string horafin = Request.QueryString["horafin"];
                string di = Request.QueryString["di"];
                
                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadVentasTotales(ruc, idlocal, opcion, fechaini, horainicio, fechafin, horafin, di).Serialize();

                    Response.Write(respuesta);
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "101")
            {
                string idlocal = Request.QueryString["idlocal"];
                string opcion = Request.QueryString["opcion"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string horainicio = Request.QueryString["horainicio"];
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string horafin = Request.QueryString["horafin"];
                string di = Request.QueryString["di"];

                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadVentasTipoPago(ruc, idlocal, opcion, fechaini, horainicio, fechafin, horafin, di).Serialize();

                    Response.Write(respuesta);
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "102")
            {
                string idlocal = Request.QueryString["idlocal"];
                string opcion = Request.QueryString["opcion"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string horainicio = Request.QueryString["horainicio"];
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string horafin = Request.QueryString["horafin"];
                string di = Request.QueryString["di"];

                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadVentasEntrega(ruc, idlocal, opcion, fechaini, horainicio, fechafin, horafin, di).Serialize();

                    Response.Write(respuesta);
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "103")
            {
                string idlocal = Request.QueryString["idlocal"];
                string opcion = Request.QueryString["opcion"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string horainicio = Request.QueryString["horainicio"];
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string horafin = Request.QueryString["horafin"];
                string di = Request.QueryString["di"];

                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadVentasProducto(ruc, idlocal, opcion, fechaini, horainicio, fechafin, horafin, di).Serialize();

                    Response.Write(respuesta);
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "104")
            {
                string idlocal = Request.QueryString["idlocal"];
                string opcion = Request.QueryString["opcion"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string horainicio = Request.QueryString["horainicio"];
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string horafin = Request.QueryString["horafin"];
                string di = Request.QueryString["di"];

                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadVentasMesero(ruc, idlocal, opcion, fechaini, horainicio, fechafin, horafin, di).Serialize();

                    Response.Write(respuesta);
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "105")
            {
                string idlocal = Request.QueryString["idlocal"];
                string opcion = Request.QueryString["opcion"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string horainicio = Request.QueryString["horainicio"];
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string horafin = Request.QueryString["horafin"];
                string di = Request.QueryString["di"];

                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadVentasComanda(ruc, idlocal, opcion, fechaini, horainicio, fechafin, horafin, di).Serialize();

                    Response.Write(respuesta);
                    Response.End();

                }
            }

            if (Request.QueryString["ope"] == "106")
            {
                string idlocal = Request.QueryString["idlocal"];
                string opcion = Request.QueryString["opcion"];
                string fechaini = Request.QueryString["fechaini"].ConverTo_YYYYMMDD();
                string horainicio = Request.QueryString["horainicio"];
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string horafin = Request.QueryString["horafin"];
                string di = Request.QueryString["di"];

                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadVentasLocales(ruc, idlocal, opcion, fechaini, horainicio, fechafin, horafin, di).Serialize();

                    Response.Write(respuesta);
                    Response.End();

                }
            }
        }
    }
}