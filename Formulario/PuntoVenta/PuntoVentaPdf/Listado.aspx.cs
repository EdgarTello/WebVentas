using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVentaPdf
{
    public partial class Listado : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                else
                {
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

                    System.Threading.Thread.Sleep(5 * 1000);

                    string ruc = ticket.UserData.Split('|')[1];
                    string acceso = ticket.UserData.Split('|')[3];
                    string tipo = ticket.UserData.Split('|')[12];
                    string mm58 = ticket.UserData.Split('|')[14];
                    string mm80 = ticket.UserData.Split('|')[15];
                    string a4 = ticket.UserData.Split('|')[16];

                    string id = Request.QueryString["id"].ToString();
                    

                    var pedido = new TwoTecnology.Repositorio.Pedido().LoadByCodigo(id);
                    string tipodoc = pedido.tipo;
                    string indicador = pedido.indicador;
                    string serie = pedido.serie;
                    string correlativo = pedido.correlativo;
                    


                    using (servicioImpresionPedido.DocumentoPedidoClient doc = new servicioImpresionPedido.DocumentoPedidoClient())
                    {
                        string documento = string.Empty;

                        if(mm58=="1")
                            documento = doc.ObtenerPdf58(ruc, tipodoc, string.Format("{0}{1}", indicador, serie), correlativo);

                        if (mm80 == "1")
                            documento = doc.ObtenerPdf58(ruc, tipodoc, string.Format("{0}{1}", indicador, serie), correlativo);

                        if (a4 == "1")
                            documento = doc.ObtenerPdf58(ruc, tipodoc, string.Format("{0}{1}", indicador, serie), correlativo);

                        if (string.IsNullOrEmpty(documento))
                        {
                            Response.Clear();
                            Response.ContentType = "text/plain";
                            Response.Write(string.Format("El archivo no fue encontrado:{0}", documento));
                        }
                        else
                        {
                            Response.Clear();
                            Response.ContentType = "application/pdf";
                            byte[] file = Convert.FromBase64String(documento);
                            Response.BinaryWrite(file);
                            Response.End();
                        }
                    }
            
                }
            }
        }
    }
}