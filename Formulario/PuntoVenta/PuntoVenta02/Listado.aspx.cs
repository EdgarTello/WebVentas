using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PuntoVenta02
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

                    string empresa_id = ticket.UserData.Split('|')[0];
                    string empresa_ruc = ticket.UserData.Split('|')[1];
                    string usuario_acceso = ticket.UserData.Split('|')[3];
                    string usuario_codigo = ticket.UserData.Split('|')[4];
                    string usuario = ticket.UserData.Split('|')[5];
                    string tipo = ticket.UserData.Split('|')[12];
                    string mm58 = ticket.UserData.Split('|')[14];
                    string mm80 = ticket.UserData.Split('|')[15];
                    string a4 = ticket.UserData.Split('|')[16];
                    string localcodigo = ticket.UserData.Split('|')[10];
                    string rol_id = ticket.UserData.Split('|')[29];

                    htipo.Value = tipo;
                    hidlocal.Value = localcodigo;
                    hacceso.Value = usuario_acceso;

                    ViewState["ticket"] = "0";
                    ViewState["acceso"] = usuario_acceso;

                    //string opcion = "Proceso";
                    //string pagina = "../../GestorDocumental/Documentos/Listado.aspx";


                    //using (Repositorio.RolesxPagina obj = new TwoTecnology.Repositorio.RolesxPagina())
                    //{
                    //    var permiso_acceso = obj.LoadAcceso(empresa_ruc, usuario_codigo, rol_id, opcion, pagina);

                    //    if (permiso_acceso.acceso!="1"){
                    //        Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                    //    }
                    //}


                    hmm58.Value = mm58;
                    hmm80.Value = mm80;
                    ha4.Value = a4;

                    string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresa_ruc, localcodigo).Serialize();

                    hcajerogavetatecla.Value = jsonconfig.Configurate("cajerogavetatecla");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cajerogavetatecla").valor;
                    hcajarapida.Value = jsonconfig.Configurate("cajarapida");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cajarapida").valor;
                    hnotacreditoexterna.Value = jsonconfig.Configurate("notacreditoexterna");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "cajarapida").valor;
                    ViewState["notacreditoexterna"] = hnotacreditoexterna.Value;

                    string tipocambio = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresa_ruc, localcodigo, "tipocambio").valor ?? "0";
                    string aperturacaja = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresa_ruc, localcodigo, "aperturacaja").valor ?? "0";

                    if (usuario_acceso == "Vendedor")
                    {
                        
                    }
                    else
                    {

                        using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                        {
                            if (obj.AperturaTipoCambioByEmpresa(empresa_ruc) == "0" && tipocambio == "1")
                            {
                                haperturatipocambio.Value = "1";
                            }

                            if (obj.AperturaExisteByLocalEmpleado(empresa_ruc, localcodigo, usuario) == "0")
                            {
                                haperturacaja.Value = "1";
                            }
                        }
                    }
                }
            }
        }
    }
}