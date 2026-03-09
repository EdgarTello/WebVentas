using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Persona
{
    public partial class Nuevo : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
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
            hmobile.Value = mobile;
            hid.Value = Request.QueryString["id"];
            hidlocal.Value = localcodigo;
            hidubicacion.Value = Request.QueryString["idubicacion"];
            hacceso.Value = usuario_acceso;
            hvalido.Value = "1";

            lblempleado.Text = string.Format("{0}:{1}", usuario_acceso, usuario_nombre);

            using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion())
            {
                lblubicacion.Text = string.Format("Mesa:{0}", obj.LoadByCodigo( hidubicacion.Value).nombre);
            }


            hpedidocomensales.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "pedidocomensales").valor;
            htecladovisualiza.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "tecladovisualiza").valor;
            haperturacaja.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "aperturacaja").valor;

            if (usuario_acceso == "Cajero" || usuario_acceso == "Administrador" || usuario_acceso == "SuperAdmin")
            {
                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    var listado = obj.AperturaByLocalEmpleado(empresaruc, localcodigo, ((usuario_acceso== "Administrador" || usuario_acceso == "SuperAdmin") ?"": usuario_nombre));

                    foreach (var item in listado)
                    {

                        hidcaja.Value = item.idcaja;
                        hcaja.Value = item.caja;
                        hserie.Value = item.serie;
                        himpresora.Value = item.impresora;
                    }
                }
            }



            using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
            {
                switch (usuario_acceso)
                {
                    case "Administrador":
                        if (haperturacaja.Value == "1")
                        {
                            var item = obj.AperturaExisteByLocal(empresaruc, localcodigo);

                            if (item.id == "0" || item.id == "")
                            {
                                Response.Redirect("../OperacionCaja/Nuevo.aspx?solicitud=3");
                            }
                        }
                        break;

                    case "Cajero":
                        if (haperturacaja.Value == "1")
                        {
                            if (obj.AperturaExisteByLocalEmpleado(empresaruc, localcodigo, usuario_nombre) == "0")
                            {
                                Response.Redirect("../OperacionCaja/Nuevo.aspx?solicitud=3");
                            }
                        }
                        break;


                    case "J.Mozo":
                        if (haperturacaja.Value == "1")
                        {
                            var item = obj.AperturaExisteByLocal(empresaruc, localcodigo);

                            if (item.id == "0" || item.id == "")
                            {
                                hvalido.Value = "0";
                            }
                        }
                        break;

                    case "Mesero":
                        if (haperturacaja.Value == "1")
                        {
                            var item = obj.AperturaExisteByLocal(empresaruc, localcodigo);

                            if (item.id == "0" || item.id == "")
                            {
                                hvalido.Value = "0";
                            }
                        }

                        break;
                }
            }
        }
    }
}