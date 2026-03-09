using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.CortesiaPedido
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
                    //Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                }
                else
                {
                    var entrega = Request.QueryString["entrega"];
                    hentrega.Value = entrega;

                    var pagina = Request.QueryString["pagina"];
                    hpagina.Value = pagina;

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
                    string tipo = ticket.UserData.Split('|')[12];
                    tipo = ((tipo != "3") ? "" : tipo);

                    hruc.Value = ruc;
                    hlocalcodigo.Value = localcodigo;
                    hmobile.Value = ticket.UserData.Split('|')[11];
                    htipo.Value = tipo;
                    hid.Value = Request.QueryString["id"];
                    husuario.Value = usuario_nombre;

                    string imprimedi = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "imprimedi").valor;
                    string descuento = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "descuento").valor;
                    string generardi = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "generardi").valor;
                    string rapidodi = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "rapidodi").valor;
                    string autorizacionpedidocortesia = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "autorizacionpedidocortesia").valor;
                    htecladovisualiza.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tecladovisualiza").valor;

                    hgenerardi.Value = generardi;
                    hrapidodi.Value = rapidodi;

                    string descuentoobservacion = "ANULADO AUTOMATICO";

                    rol_cortesia.Value = descuento;

                    var pedido = new TwoTecnology.Repositorio.Pedido().LoadHaderByCodigo(hid.Value);
                    htipopedido.Value = pedido.tipo;
                    hpreciocambio.Value = pedido.preciocambio;


                    cortesia_total.Value = pedido.cortesia_total;

                   

                    HttpCookie cookie_usuario = Request.Cookies["usuario"];
                    if (cookie_usuario != null)
                        cbousuarios.SelectedValue = cookie_usuario.Value;

                    clave.Value = string.Empty;




                    if (pedido.estado == "0")
                    {
                        
                        if (autorizacionpedidocortesia == "" || usuario_acceso == autorizacionpedidocortesia || usuario_acceso == "Administrador")
                        {
                            new TwoTecnology.Repositorio.Pedido().CortesiaAutorizacion(hid.Value, usuario_nombre, observacion.Value);

                            Response.Redirect(
                              string.Format("../PuntoVenta04/Nuevo.aspx?pagina=4&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
                              hentrega.Value,
                              hpagado.Value,
                              hidubicacion.Value,
                              hid.Value
                              ));
                        }
                        

                        using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                        {
                            List<Entity.Empleado> lista = obj.LoadByAcceso(ruc, localcodigo, descuento);

                            cbousuarios.Items.Clear();

                            foreach (var item in lista)
                            {
                                cbousuarios.Items.Add(item.usuario);
                            }
                        }

                    }
                    else {

                        
                        switch (hpagina.Value)
                        {
                            case "2":
                                Response.Redirect("../PuntoVenta02/Listado.aspx");
                                break;

                            case "3":
                                Response.Redirect("../PuntoVenta03/Listado.aspx");
                                break;

                            case "4":
                                Response.Redirect("../Mesa/Listado.aspx");
                                break;

                            case "5":
                                Response.Redirect("../Delivery/Listado.aspx");
                                break;

                            case "6":
                                Response.Redirect("../DeliveryPendiente/Listado.aspx");
                                break;

                            case "7":
                                Response.Redirect("../DeliveryCobrado/Listado.aspx");
                                break;

                            case "8":
                                Response.Redirect("../LlevarPendiente/Listado.aspx");
                                break;

                            case "21":
                                Response.Redirect("../PuntoVenta21/Listado.aspx?id=" + hid.Value);
                                break;

                            case "22":
                                Response.Redirect("../PuntoVenta22/Listado.aspx?id=" + hid.Value);
                                break;

                            case "31":
                                Response.Redirect("../Mesa/Listado.aspx");
                                break;

                            case "100":
                                Response.Redirect("../Documento/Listado.aspx");
                                break;

                        }
                    }
                }
            }
        }

        protected void btnAutorizar_Click(object sender, EventArgs e)
        {
            if (cbousuarios.SelectedValue != null)
            {
                string pagina = hpagina.Value;
                string entrega = hentrega.Value;
                string tipo = htipo.Value;
                
                string usuario = cbousuarios.SelectedValue;
                Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();
                bool authenticated = obj.ValidateAcceso(hruc.Value, rol_cortesia.Value, usuario, clave.Value);
                hcortesiavalido.Value = (authenticated) ? "1" : "0";
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

                        new TwoTecnology.Repositorio.Pedido().CortesiaAutorizacion(hid.Value, usuario, anuladoobservacion);

                        Response.Redirect(
                           string.Format("../PuntoVenta04/Nuevo.aspx?pagina=4&entrega={0}&pagado={1}&idubicacion={2}&id={3}",
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