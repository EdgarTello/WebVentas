using System;
using System.Configuration;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;


namespace TwoTecnology.WebVentas.Formulario.Logistica.GuiaRemision
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

            //if (Request.QueryString["ope"] == "0")
            //{
            //    string id = Request.QueryString["id"];
               
            //    Metodos.ValidateAntiXsrfToken("OrdenPedidoList");

            //    if (id.IsNumeric())
            //    {



            //        using (TwoTecnology.Repositorio.GuiaRemision obj = new TwoTecnology.Repositorio.GuiaRemision())
            //        {
            //            respuesta = obj.LoadById(
            //                empresa_ruc,
            //                id).Serialize();
            //        }
            //    }
            //}

            if (Request.QueryString["ope"] == "1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idalmacen = Request.QueryString["idalmacen"];
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string idmotivo = Request.QueryString["idmotivo"];
                string anulado = Request.QueryString["anulado"];
                string documento = Request.QueryString["documento"];
                

                Metodos.ValidateAntiXsrfToken("GuiaRemisionList");

                if (idalmacen.IsNumeric() && idlocal.IsNumeric() && idmotivo.IsNumeric() && 
                     anulado.IsNumeric() &&
                    !documento.IsInyection() &&
                    !fechainicio.IsInyection() && !fechafin.IsInyection())
                {

                    

                        using (TwoTecnology.Repositorio.GuiaRemision obj = new TwoTecnology.Repositorio.GuiaRemision())
                        {
                            respuesta = obj.Load(
                                empresa_ruc,
                                idalmacen,
                                idlocal,
                                fechainicio,
                                fechafin,
                                idmotivo,
                                usuario_nombre,
                                anulado,
                                documento).Serialize();
                        }
                }
            }


            if (Request.QueryString["ope"] == "10")
            {
                string id = Request.QueryString["id"];

                Metodos.ValidateAntiXsrfToken("GuiaRemisionList");

                if (id.IsNumeric())
                {

                    using (TwoTecnology.Repositorio.GuiaRemision obj = new TwoTecnology.Repositorio.GuiaRemision())
                    {
                        respuesta = obj.LoadDetail(empresa_ruc, id).Serialize();

                    }
                }
            }

            if (Request.QueryString["ope"] == "11")
            {
                string id = Request.QueryString["id"];

                Metodos.ValidateAntiXsrfToken("GuiaRemisionList");

                if (id.IsNumeric())
                {

                    using (TwoTecnology.Repositorio.GuiaRemision obj = new TwoTecnology.Repositorio.GuiaRemision())
                    {
                        respuesta = obj.LoadHistory(empresa_ruc, id).Serialize();

                    }
                }
            }

            if (Request.QueryString["ope"] == "20")
            {
                string id = Request.QueryString["id"] ?? "";

                Metodos.ValidateAntiXsrfToken("GuiaRemisionList");

                if (id.IsNumeric())
                {
                    string tipo = Request.QueryString["tipo"] ?? "";
                    string indicador = Request.QueryString["indicador"] ?? "";
                    string serie = Request.QueryString["serie"] ?? "";
                    string correlativo = Request.QueryString["correlativo"] ?? "";
                    string webservice = ConfigurationSettings.AppSettings["webservice"];


                    var guia = new TwoTecnology.Repositorio.GuiaRemision().LoadById( empresa_ruc, id);

                    if (guia.externo == "1")
                    {
                        using (servicioDocumento.DocumentoClient doc = new servicioDocumento.DocumentoClient())
                        {
                            string pdfstring = doc.ObtenerPdf(empresa_ruc, tipo, string.Format("{0}{1}", indicador, serie), correlativo);

                            if (!string.IsNullOrEmpty(pdfstring))
                            {
                                respuesta = "data:application/pdf;base64," + pdfstring;
                            }
                        }
                    }
                    else
                    {
                        using (Repositorio.PdfGenerate objeto = new TwoTecnology.Repositorio.PdfGenerate())
                        {
                            var pdf = objeto.GenerarPDF_Guia(id);

                            if (pdf != null && pdf.Length > 0)
                            {
                                string base64String = Convert.ToBase64String(pdf);
                                respuesta = "data:application/pdf;base64," + base64String;
                            }
                        }
                    }
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}