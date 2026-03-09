using DevExpress.Data.Svg;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.AnulacionPedido
{
    public partial class Nuevo : System.Web.UI.Page
    {
        string urlDefault = "../PuntoVenta/Menu/Salir.aspx";
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
                    hid.Value = Request.QueryString["id"];

                    hpagina.Value = Request.QueryString["pagina"];
                    hlocalcodigo.Value = localcodigo;
                    hmobile.Value = ticket.UserData.Split('|')[11];

                    hentrega.Value = Request.QueryString["entrega"];
                    hidubicacion.Value = Request.QueryString["idubicacion"];
                    hpagado.Value = Request.QueryString["pagado"];


                    string anulacion = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "anulacion").valor ?? "";
                    htecladovisualiza.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tecladovisualiza").valor ?? "0";
                    string anuladoobservacion = "ANULADO AUTOMATICO";

                    rol_anulacion.Value = anulacion;

                    var pedido = new TwoTecnology.Repositorio.Pedido().LoadByCodigo(hid.Value);

                    if (anulacion == "" || usuario_acceso == anulacion || usuario_acceso == "Administrador" || usuario_acceso == "SuperAdmin"
                        //|| pedido.pedidodetalle.Count==0
                        )
                    {
                        new TwoTecnology.Repositorio.Pedido().ActualizarAnulacion(hid.Value, usuario_nombre, anuladoobservacion);

                        using (Repositorio.OrdenPedido ordenpedido = new TwoTecnology.Repositorio.OrdenPedido())
                        {
                            string idordenpedido = ordenpedido.GetOrdenByPedidoId(hruc.Value, hid.Value);

                            if (idordenpedido != "")
                                ordenpedido.Eliminar(hruc.Value, idordenpedido, usuario_nombre);
                        }


                        if (hpagina.Value == "1")
                            Response.Redirect("../PuntoVenta01/Listado.aspx");

                        if (hpagina.Value == "2")
                            Response.Redirect("../PuntoVenta02/Listado.aspx");

                        if (hpagina.Value == "3")
                            Response.Redirect("../Mesa/Listado.aspx");

                        if (hpagina.Value == "31")
                            Response.Redirect("../Mesa03/Listado.aspx");

                        if (hpagina.Value == "4")
                            Response.Redirect("../Mesa/Listado.aspx");

                        


                        if (hpagina.Value == "5")
                            Response.Redirect("../Delivery/Listado.aspx");

                        if (hpagina.Value == "6")
                            Response.Redirect("../DeliveryPendiente/Listado.aspx");

                        if (hpagina.Value == "7")
                            Response.Redirect("../DeliveryCobrar/Listado.aspx");


                        if (hpagina.Value == "8")
                            Response.Redirect("../LlevarPendiente/Listado.aspx");



                        if (hpagina.Value == "11")
                            Response.Redirect("../PuntoVenta01/Listado.aspx");

                        if (hpagina.Value == "12")
                            Response.Redirect("../PuntoVenta02/Listado.aspx");

                        if (hpagina.Value == "13")
                            Response.Redirect("../PuntoVenta03/Listado.aspx");

                        if (hpagina.Value == "21")
                            Response.Redirect("../PuntoVenta21/Listado.aspx");

                        if (hpagina.Value == "31")
                            Response.Redirect("../Mesa/Listado.aspx");

                        if (hpagina.Value == "32")
                            Response.Redirect("../Mesa03/Listado.aspx");

                        if(hpagina.Value == "100")
                            Response.Redirect("../PuntoVenta02/Listado.aspx");

                        if (hpagina.Value == "321")
                            Response.Redirect("../PuntoVenta02/Listado.aspx");
                    }


                    using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                    {
                        List<Entity.Empleado> lista = obj.LoadByAcceso(ruc, localcodigo, anulacion);

                        cbousuarios.Items.Clear();

                        foreach (var item in lista)
                        {
                            cbousuarios.Items.Add(item.usuario);
                        }
                    }



                    HttpCookie cookie_usuario = Request.Cookies["usuario"];
                    if (cookie_usuario != null)
                        cbousuarios.SelectedValue = cookie_usuario.Value;

                    clave.Value = string.Empty;
                    observacion.Value = string.Empty;
                }
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
                        string entrega = hentrega.Value;
                        string pagado = hpagado.Value;
                        string idubicacion = hidubicacion.Value;
                        string id = hid.Value;

                        using (Repositorio.Pedido anulacion = new TwoTecnology.Repositorio.Pedido())
                        {
                            anulacion.ActualizarAnulacion(hid.Value, usuario, anuladoobservacion);
                        }

                        using (Repositorio.OrdenPedido ordenpedido = new TwoTecnology.Repositorio.OrdenPedido())
                        {
                            string idordenpedido = ordenpedido.GetOrdenByPedidoId(hruc.Value, hid.Value);

                            if (!(idordenpedido == "0" || idordenpedido == ""))
                            {
                                ordenpedido.Eliminar(hruc.Value, idordenpedido, usuario);
                            }
                        }                        


                        if (hpagina.Value == "1")
                            Response.Redirect("../PuntoVenta01/Listado.aspx");

                        if (hpagina.Value == "2")
                            Response.Redirect("../PuntoVenta02/Listado.aspx");

                        if (hpagina.Value == "3")
                            Response.Redirect("../Mesa/Listado.aspx");

                        if (hpagina.Value == "31")
                            Response.Redirect("../Mesa03/Listado.aspx");

                        if (hpagina.Value == "4")
                            Response.Redirect("../Mesa/Listado.aspx");




                        if (hpagina.Value == "5")
                            Response.Redirect("../Delivery/Listado.aspx");

                        if (hpagina.Value == "6")
                            Response.Redirect("../DeliveryPendiente/Listado.aspx");

                        if (hpagina.Value == "7")
                            Response.Redirect("../DeliveryCobrar/Listado.aspx");


                        if (hpagina.Value == "8")
                            Response.Redirect("../LlevarPendiente/Listado.aspx");



                        if (hpagina.Value == "11")
                            Response.Redirect("../PuntoVenta01/Listado.aspx");

                        if (hpagina.Value == "12")
                            Response.Redirect("../PuntoVenta02/Listado.aspx");

                        if (hpagina.Value == "13")
                            Response.Redirect("../PuntoVenta03/Listado.aspx");

                        if (hpagina.Value == "21")
                            Response.Redirect("../PuntoVenta21/Listado.aspx");

                        if (hpagina.Value == "31")
                            Response.Redirect("../Mesa/Listado.aspx");

                        if (hpagina.Value == "32")
                            Response.Redirect("../PuntoVenta31/Listado.aspx");

                        if (hpagina.Value == "100")
                            Response.Redirect("../PuntoVenta02/Listado.aspx");

                        if (hpagina.Value == "321")
                            Response.Redirect("../PuntoVenta02/Listado.aspx");
                    }
                }
            }
        }
    }
}