using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.LlevarPendiente
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
            string mobile = ticket.UserData.Split('|')[11];

            hidlocal.Value = localcodigo;
            hempleado.Value = usuario_nombre;
            hmobile.Value = mobile;
            hid.Value = Request.QueryString["id"];
            hidlocal.Value = localcodigo;
            hidubicacion.Value = Request.QueryString["idubicacion"];
            hacceso.Value = usuario_acceso;

            if (usuario_acceso == "Cajero")
            {
                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    hllevaralias.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "llevaralias").valor;
                    var listado = obj.AperturaByLocalEmpleado(ruc, localcodigo, usuario_nombre);

                    foreach (var item in listado)
                    {
                        hidcaja.Value = item.idcaja;
                        hcaja.Value = item.caja;
                        hserie.Value = item.serie;
                        himpresora.Value = item.impresora;
                    }
                }
            }
        }
    }
}