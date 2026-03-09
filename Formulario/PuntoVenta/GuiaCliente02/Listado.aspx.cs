using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.GuiaCliente02
{
    public partial class Listado : System.Web.UI.Page
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

            hempleado.Value = usuario_nombre;
            hacceso.Value = usuario_acceso;
            hidlocal.Value = localcodigo;

            bool errortipocambio = false;
            string tipocambio = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tipocambio").valor ?? "0";

            using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
            {

                if (obj.AperturaTipoCambioByEmpresa(ruc) == "0" && tipocambio == "1")
                {
                    switch (usuario_acceso)
                    {
                        case "SuperAdmin":
                            Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=50"); ;

                            break;

                        case "Administrador":
                            Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=50"); ;

                            break;


                        case "Cajero":
                            Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=50"); ;

                            break;

                    }

                    errortipocambio = true;
                }
            }

            if (!errortipocambio)
            {
                string aperturacaja = "0";

                using (Repositorio.Configuracion obj = new TwoTecnology.Repositorio.Configuracion())
                {
                    aperturacaja = obj.LoadTexto(ruc, localcodigo, "aperturacaja");
                }

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    switch (usuario_acceso)
                    {


                        case "Cajero":
                            if (aperturacaja == "1")
                            {
                                if (obj.AperturaExisteByLocalEmpleado(ruc, localcodigo, usuario_nombre) == "0")
                                {
                                    Response.Redirect("../OperacionCaja/Nuevo.aspx?solicitud=50");
                                }
                            }
                            break;


                    }
                }
            }

            using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion()) {
               var listado= obj.AperturaByLocalEmpleado(ruc, localcodigo, usuario_nombre);

                foreach (var item in listado) {
                    hidcaja.Value = item.idcaja;
                    hcaja.Value = item.caja;
                    himpresora.Value = item.impresora;
                }
            }
        }
    }
}