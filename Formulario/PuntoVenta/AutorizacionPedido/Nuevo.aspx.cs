using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.AutorizacionPedido
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


                    var entrega = Request.QueryString["entrega"] ?? "";
                    hentrega.Value = entrega;

                    var pagina = Request.QueryString["pagina"];
                    hpagina.Value = pagina;

                    var id = Request.QueryString["id"];
                    hid.Value = id;

                    if (pagina.IsNumeric() && id.IsNumeric() && !entrega.IsInyection())
                    {

                        string empresaid = ticket.UserData.Split('|')[0];
                        string empresaruc = ticket.UserData.Split('|')[1];
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

                        hruc.Value = empresaruc;
                        hlocalcodigo.Value = localcodigo;
                        hmobile.Value = ticket.UserData.Split('|')[11];
                        htipo.Value = tipo;
                        husuario.Value = usuario_nombre;

                        string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo).Serialize();
                        string imprimedi = jsonconfig.Configurate("imprimedi");
                        string rapidodi = jsonconfig.Configurate("rapidodi");

                        string permiso_descuento = jsonconfig.Configurate("descuento");
                        string permiso_docinterno = jsonconfig.Configurate("generardi");
                        string permiso_cambioprecio = jsonconfig.Configurate("autorizacioncambioprecio");
                        htecladovisualiza.Value = jsonconfig.Configurate("tecladovisualiza");

                        //string imprimedi = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "imprimedi").valor;
                        //string rapidodi = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "rapidodi").valor;

                        //string permiso_descuento = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "descuento").valor;
                        //string permiso_docinterno = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "generardi").valor;
                        //string permiso_cambioprecio = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "autorizacioncambioprecio").valor;
                        //htecladovisualiza.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tecladovisualiza").valor;

                        //hgenerardi.Value = permiso_docinterno;
                        hrapidodi.Value = rapidodi;

                        string descuentoobservacion = "ANULADO AUTOMATICO";
                        string acceso_autoriza = string.Empty;
                        //rol_acceso.Value = descuento;

                        var pedido = new TwoTecnology.Repositorio.Pedido().LoadHaderByCodigo(hid.Value);
                        htipopedido.Value = pedido.tipo;
                        hpreciocambio.Value = pedido.preciocambio;


                        descuento_item.Value = pedido.descuentoitem;
                        descuento_global.Value = pedido.descuentoglobal;

                        bool bdescuento = (((Convert.ToDouble(pedido.descuentoitem) +
                                             Convert.ToDouble(pedido.descuentoglobal)
                                             ) > 0.00) ? true : false);

                        bool bcambioprecio = ((Convert.ToDouble(pedido.preciocambio) > 0.00) ? true : false);



                        HttpCookie cookie_usuario = Request.Cookies["usuario"];
                        if (cookie_usuario != null)
                            cbousuarios.SelectedValue = cookie_usuario.Value;

                        clave.Value = string.Empty;



                        if (pedido.estado == "0")
                        {
                            if (pedido.autorizacion == "1")
                            {
                                GrabarVentaRapida(usuario_nombre);
                                RedirectPagina(pagina, entrega, tipo);
                            }
                            else
                            {
                                bool blnaccesorapido = false;
                                bool blnaccesoprecio = true;
                                bool blnaccesodescuento = true;
                                bool blnaccesotipo = true;

                                if (!bcambioprecio && !bdescuento && pedido.tipo != "99")
                                {
                                    blnaccesorapido = true;
                                }
                                else
                                {
                                    if (bcambioprecio)
                                    {
                                        if (!(permiso_cambioprecio == "" || usuario_acceso == permiso_cambioprecio || usuario_acceso == "Administrador"))
                                            blnaccesoprecio = false;
                                    }

                                    if (bdescuento)
                                    {
                                        if (!(permiso_descuento == "" || usuario_acceso == permiso_descuento || usuario_acceso == "Administrador"))
                                            blnaccesodescuento = false;
                                    }

                                    if (pedido.tipo == "99")
                                    {
                                        if (!(permiso_docinterno == "" || usuario_acceso == permiso_docinterno || usuario_acceso == "Administrador"))
                                            blnaccesotipo = false;
                                    }

                                    if (bcambioprecio || bdescuento || pedido.tipo == "99")
                                    {
                                        if (blnaccesoprecio && blnaccesodescuento && blnaccesotipo)
                                        {
                                            blnaccesorapido = true;
                                        }
                                    }
                                }

                                if (blnaccesorapido)
                                {
                                    new TwoTecnology.Repositorio.Pedido().ActualizarAutorizacion(hid.Value, usuario_nombre, observacion.Value);
                                    GrabarVentaRapida(usuario_nombre);
                                    RedirectPagina(pagina, entrega, tipo);
                                }
                            }


                            rol_acceso.Value = ((permiso_docinterno == "Administrador" || permiso_descuento == "Administrador" || permiso_cambioprecio == "Administrador") ?
                                "Administrador" : ((permiso_docinterno == "Cajero" || permiso_descuento == "Cajero" || permiso_cambioprecio == "Cajero") ? "Cajero" : ""));
                            acceso_autoriza = rol_acceso.Value;


                            using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                            {
                                List<Entity.Empleado> lista = obj.LoadByAcceso(empresaruc, localcodigo, rol_acceso.Value);

                                cbousuarios.Items.Clear();

                                foreach (var item in lista)
                                {
                                    cbousuarios.Items.Add(item.usuario);
                                }
                            }

                        }
                        else
                        {

                            string cajarapida = new TwoTecnology.Repositorio.Configuracion().LoadObject(hruc.Value, hlocalcodigo.Value, "cajarapida").valor;

                            switch (hpagina.Value)
                            {
                                case "2":
                                    if (rapidodi == "1" && cajarapida == "1" && htipopedido.Value != "07")
                                        Response.Redirect("../PuntoVenta02/Nuevo.aspx");
                                    else
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
                    else
                    {
                        Response.Redirect("../Frame/Index.aspx");
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
                bool authenticated = obj.ValidateAcceso(hruc.Value, rol_acceso.Value, usuario, clave.Value);
                hdescuentovalido.Value = (authenticated) ? "1" : "0";
                lblmensaje.Text = string.Empty;
                string anuladoobservacion = observacion.Value;

                string rapidodi = hrapidodi.Value;
                string cajarapida = new TwoTecnology.Repositorio.Configuracion().LoadObject(hruc.Value, hlocalcodigo.Value, "cajarapida").valor;

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

                        new TwoTecnology.Repositorio.Pedido().ActualizarAutorizacion(hid.Value, usuario, anuladoobservacion);

                        GrabarVentaRapida(husuario.Value);

                        switch (pagina)
                        {


                            case "2":
                                if (htipopedido.Value== "07")
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                else
                                    Response.Redirect(string.Format("../PuntoPago02/Nuevo.aspx?pagina=2&entrega={0}&id={1}", entrega, hid.Value, tipo));

                                break;

                            case "4":
                                Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=4&entrega={0}&id={1}", entrega, hid.Value, tipo));
                                break;

                            case "5":
                                Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=5&entrega={0}&id={1}", entrega, hid.Value, tipo));
                                break;

                            case "6":
                                Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=6&entrega={0}&id={1}", entrega, hid.Value, tipo));
                                break;

                            case "7":
                                Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=7&entrega={0}&id={1}", entrega, hid.Value, tipo));
                                break;

                            case "8":
                                Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=8&entrega={0}&id={1}", entrega, hid.Value, tipo));
                                break;

                            case "13":
                                Response.Redirect("../PuntoVenta03/Listado.aspx");
                                break;

                            case "21":
                                Response.Redirect(string.Format("../PuntoPago21/Nuevo.aspx?pagina=21&entrega={0}&id={1}", entrega, hid.Value, tipo));
                                break;

                            case "31":
                                Response.Redirect(string.Format("../PuntoPago31/Nuevo.aspx?pagina=31&entrega={0}&id={1}", entrega, hid.Value, tipo));
                                break;

                            case "100":
                                Response.Redirect("../Documento/Listado.aspx");
                                break;
                        }
                    }
                }
            }
        }

        private void GrabarVentaRapida(string usuario)
        {
            string rapidodi = hrapidodi.Value;
            string cajarapida = new TwoTecnology.Repositorio.Configuracion().LoadObject(hruc.Value, hlocalcodigo.Value, "cajarapida").valor;

            if (htipopedido.Value == "07" ||  htipopedido.Value == "91" || ( htipopedido.Value == "99" && rapidodi=="1" ) )
            {
                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    using (Repositorio.Documento doc = new TwoTecnology.Repositorio.Documento())
                    {
                        doc.AgregarDirecta(hid.Value, usuario);
                        obj.ActualizarStock(hid.Value);
                    }
                }

                string pagina = hpagina.Value;

                switch (pagina)
                {
                    case "2":
                        
                        if(rapidodi=="1" && cajarapida=="1")
                            if(htipopedido.Value == "07")
                                Response.Redirect("../PuntoVenta02/Listado.aspx");
                            else
                                Response.Redirect("../PuntoVenta02/Nuevo.aspx");
                        else
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

                    case "221":
                        Response.Redirect("../PuntoVenta02/Listado.aspx");
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

        private void RedirectPagina(string pagina, string entrega, string tipo)
        {
            string rapidodi = hrapidodi.Value;
            string cajarapida = new TwoTecnology.Repositorio.Configuracion().LoadObject(hruc.Value, hlocalcodigo.Value, "cajarapida").valor;

            switch (pagina)
            {
                case "2":
                    if(htipopedido.Value == "07")
                        Response.Redirect("../PuntoVenta02/Nuevo.aspx");
                    else
                        Response.Redirect(string.Format("../PuntoPago02/Nuevo.aspx?pagina=2&entrega={0}&id={1}", entrega, hid.Value, tipo));

                    break;

                case "221":
                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                    break;

                case "4":
                    Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=4&entrega={0}&id={1}", entrega, hid.Value, tipo));
                    break;

                case "5":
                    Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=5&entrega={0}&id={1}", entrega, hid.Value, tipo));
                    break;

                case "6":
                    Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=6&entrega={0}&id={1}", entrega, hid.Value, tipo));
                    break;

                case "7":
                    Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=7&entrega={0}&id={1}", entrega, hid.Value, tipo));
                    break;

                case "8":
                    Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=8&entrega={0}&id={1}", entrega, hid.Value, tipo));
                    break;

                case "21":
                    Response.Redirect(string.Format("../PuntoPago21/Nuevo.aspx?pagina=21&entrega={0}&id={1}", entrega, hid.Value, tipo));
                    break;

                case "22":
                    Response.Redirect(string.Format("../PuntoPago22/Nuevo.aspx?pagina=22&entrega={0}&id={1}", entrega, hid.Value, tipo));
                    break;

                case "31":
                    Response.Redirect(string.Format("../PuntoPago31/Nuevo.aspx?pagina=31&entrega={0}&id={1}", entrega, hid.Value, tipo));
                    break;

                case "100":
                    Response.Redirect("../Documento/Listado.aspx");
                    break;

                case "321":
                    Response.Redirect(string.Format("../PuntoPago03/Nuevo.aspx?pagina=321&entrega={0}&id={1}", entrega, hid.Value, tipo));
                    break;

            }
            
        }
    }
}