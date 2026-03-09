using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaRemision23
{
    public partial class Nuevo : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                    Response.End();
                }


                if (Request.QueryString["id"] != null)
                    hid.Value = Request.QueryString["id"];
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
            string empresaruc = ticket.UserData.Split('|')[1];
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string usuario_serie = ticket.UserData.Split('|')[7];
            string puntosid = ticket.UserData.Split('|')[8];
            string ipcliente = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string mobile = ticket.UserData.Split('|')[11];

            hempleado.Value = usuario_nombre;
            hidlocal.Value = localcodigo;
            hmobile.Value = mobile;


            string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo).Serialize();


            hmuestraalmacenexterno.Value = jsonconfig.Configurate("muestraalmacenexterno");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            hmuestracodigoproducto.Value = jsonconfig.Configurate("muestracodigoproducto");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;

            htipocambio.Value = new TwoTecnology.Repositorio.TipoCambio().LoadMontoCompraLast(empresaruc);

            hstock.Value = jsonconfig.Configurate("stock");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stock").valor;
            hstockver.Value = jsonconfig.Configurate("stockver");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "stockver").valor;

            lblempleado.Text = string.Format("{0}:{1}", usuario_acceso, usuario_nombre);

            hfamiliapedido.Value = jsonconfig.Configurate("familiapedido");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            hguiaupload.Value = jsonconfig.Configurate("guiaupload");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            hguiaproductows.Value = jsonconfig.Configurate("guiaproductows");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            hguiafiltros.Value = jsonconfig.Configurate("guiafiltros");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            

            ViewState["guiaupload"] = hguiaupload.Value;
            ViewState["guiaproductows"] = hguiaproductows.Value;

            if (hid.Value != "0")
            {
                var guia = new TwoTecnology.Repositorio.Guia().LoadByCodigo(hid.Value);

                if (guia.estado == "0")
                {
                    new TwoTecnology.Repositorio.Guia().RemoverTransaccion(hid.Value);
                    hestado.Value = guia.estado;
                    lblbloqueo.Text = (guia.productobloqueo == "1") ? "Bloqueado" : "";
                }
                else
                {
                    Response.Redirect("../GuiaRemision23/Listado.aspx");
                }
            }
        }
    }
}