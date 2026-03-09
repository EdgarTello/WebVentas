using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.AnulacionComanda
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
                    //Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                }
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

                    hruc.Value = ruc;
                    hlocalcodigo.Value = localcodigo;
                    hmobile.Value = ticket.UserData.Split('|')[11];
                    hid.Value = Request.QueryString["id"];
                    hpagina.Value = Request.QueryString["pagina"];
                    hentrega.Value = Request.QueryString["entrega"];
                    hidubicacion.Value = Request.QueryString["idubicacion"];
                    hpagado.Value = Request.QueryString["pagado"];
                    hidpedidodetalle.Value = Request.QueryString["idpedidodetalle"];

                    htecladovisualiza.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tecladovisualiza").valor;
                    string anulacioncomanda = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "anulacioncomanda").valor;
                    string anuladoobservacion = "ANULADO AUTOMATICO";

                    rol_anulacion.Value = anulacioncomanda;

                    if (anulacioncomanda == "" || usuario_acceso == anulacioncomanda || usuario_acceso == "Administrador")
                    {
                        using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                        {
                            obj.EliminarDetalle(hidpedidodetalle.Value, usuario_nombre, anuladoobservacion);
                            obj.ActualizarCabecera(hid.Value);
                        }

                        
                            

                        if (hpagina.Value == "3")
                            Response.Redirect(
                            string.Format("../PuntoVenta03/Nuevo.aspx?pagina=3&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));



                        if (hpagina.Value == "4")
                            Response.Redirect(
                            string.Format("../PuntoVenta04/Nuevo.aspx?pagina=4&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));

                        if (hpagina.Value == "41")
                            Response.Redirect(
                            string.Format("../PuntoVenta03/Nuevo.aspx?pagina=41&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));

                        if (hpagina.Value == "6")
                            Response.Redirect(
                            string.Format("../PuntoVenta04/Nuevo.aspx?pagina=6&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));

                        if (hpagina.Value == "8")
                            Response.Redirect(
                            string.Format("../PuntoVenta04/Nuevo.aspx?pagina=8&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));

                        if (hpagina.Value == "31")
                            Response.Redirect(
                            string.Format("../PuntoVenta03/Nuevo.aspx?pagina=31&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));

                        if (hpagina.Value == "32")
                            Response.Redirect(
                            string.Format("../PuntoVenta03/Nuevo.aspx?pagina=32&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));


                    }

                    using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                    {
                        List<Entity.Empleado> lista = obj.LoadByAcceso(ruc, localcodigo, anulacioncomanda);

                        cbousuarios.Items.Clear();

                        foreach (var item in lista)
                        {
                            cbousuarios.Items.Add(item.usuario);
                        }
                    }


                    HttpCookie cookie_usuario = Request.Cookies["usuario"];
                    if (cookie_usuario != null)
                        cbousuarios.SelectedValue = cookie_usuario.Value;
                }


                clave.Value = string.Empty;
                observacion.Value = string.Empty;
            }

        }

        protected void btnAutorizar_Click(object sender, EventArgs e)
        {
            if (cbousuarios.SelectedValue != null)
            {
                string usuario = cbousuarios.SelectedValue;
                Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();
                bool authenticated = obj.ValidateAcceso(hruc.Value, rol_anulacion.Value, usuario, clave.Value);
                lblmensaje.Text = string.Empty;
                string anuladoobservacion = observacion.Value;

                if (!authenticated)
                {
                    lblmensaje.Text = "Clave no inválida";
                }
                else
                {
                    if (anuladoobservacion == "")
                    {
                        lblmensaje.Text = "Debe ingresar una observación!";
                    }
                    else
                    {
                        using (Repositorio.Pedido ped = new TwoTecnology.Repositorio.Pedido())
                        {
                            ped.EliminarDetalle(hidpedidodetalle.Value, usuario, anuladoobservacion);
                            ped.ActualizarCabecera(hid.Value);
                        }

                        string entrega = hentrega.Value;
                        string pagado = hpagado.Value;
                        string idubicacion = hidubicacion.Value;
                        string id = hid.Value;


                        if (hpagina.Value == "3")
                            Response.Redirect(
                            string.Format("../PuntoVenta03/Nuevo.aspx?pagina=3&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));

                        if (hpagina.Value == "4")
                            Response.Redirect(
                            string.Format("../PuntoVenta04/Nuevo.aspx?pagina=4&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));

                        if (hpagina.Value == "6")
                            Response.Redirect(
                            string.Format("../PuntoVenta04/Nuevo.aspx?pagina=6&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));

                        if (hpagina.Value == "8")
                            Response.Redirect(
                            string.Format("../PuntoVenta04/Nuevo.aspx?pagina=8&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));

                        if (hpagina.Value == "31")
                            Response.Redirect(
                            string.Format("../PuntoVenta03/Nuevo.aspx?pagina=31&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                            hentrega.Value,
                            hpagado.Value,
                            hidubicacion.Value,
                            hid.Value
                            ));

                    }
                }
            }
        }
    }
}