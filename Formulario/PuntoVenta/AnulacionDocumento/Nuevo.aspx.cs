using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.AnulacionDocumento
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
                else
                {
                    if (String.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        Response.Redirect("PuntoDeVentaListadoWeb.aspx");
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
                    string movil = ticket.UserData.Split('|')[11];

                    hruc.Value = ruc;
                    hid.Value = Request.QueryString["id"];
                    hpagina.Value = Request.QueryString["pagina"];
                    hlocalcodigo.Value = localcodigo;
                    hmobile.Value = ticket.UserData.Split('|')[11];

                    htecladovisualiza.Value = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tecladovisualiza").valor;
                    string anulacion = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "anulacion").valor;
                    string anuladoobservacion = "ANULADO AUTOMATICO";

                    rol_anulacion.Value = anulacion;

                    var pedido = new TwoTecnology.Repositorio.Pedido().LoadByCodigo(hid.Value);


                    if (anulacion == "" || usuario_acceso == anulacion || usuario_acceso == "Administrador")
                    {
                        new TwoTecnology.Repositorio.Pedido().ActualizarAnulacion(hid.Value, usuario_acceso, anuladoobservacion);

                        if (pedido.cierrecaja != "0")
                        {
                            new TwoTecnology.Repositorio.CajaOperacion().ReprocesoCierre(pedido.cierrecaja);
                        }

                        switch (hpagina.Value)
                        {
                            case "21":
                                Response.Redirect("../Documento/Listado.aspx");
                                break;
                        }

                    }

                    using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                    {
                        List<Entity.Empleado> lista = obj.LoadByAccesoObject(ruc, localcodigo, anulacion);

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
                bool authenticated = obj.ValidateClientRuc(hruc.Value, usuario, clave.Value);
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

                        new TwoTecnology.Repositorio.Pedido().ActualizarAnulacion(hid.Value, usuario, anuladoobservacion);

                        var pedido = new TwoTecnology.Repositorio.Pedido().LoadByCodigo(hid.Value);

                        if (pedido.cierrecaja != "0")
                        {
                            new TwoTecnology.Repositorio.CajaOperacion().ReprocesoCierre(pedido.cierrecaja);
                        }

                        if (hmobile.Value == "1")
                            Response.Redirect("DocumentoDeVentaListadoMovil");
                        else
                        {
                            switch (hpagina.Value)
                            {
                                case "2":
                                    Response.Redirect("../Documento/Listado.aspx");
                                    break;

                                case "21":
                                    Response.Redirect("../Documento/Listado.aspx");
                                    break;


                                case "100":
                                    Response.Redirect("../Documento/Listado.aspx");
                                    break;
                            }
                        }
                    }
                }
            }
        }
    }
}