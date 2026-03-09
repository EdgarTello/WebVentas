using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Menu
{
    public partial class Index : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                {
                    // This is an unauthorized, authenticated request...
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                    Response.End();
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
                    string empresaruc = ticket.UserData.Split('|')[1];
                    string empresanombre = ticket.UserData.Split('|')[2];
                    string usuario_acceso = ticket.UserData.Split('|')[3];
                    string usuario_codigo = ticket.UserData.Split('|')[4];
                    string usuario = ticket.UserData.Split('|')[5];
                    string usuarioanum_documento = ticket.UserData.Split('|')[6];
                    string empresa_imagen = ticket.UserData.Split('|')[7];
                    string empresa_pago = ticket.UserData.Split('|')[8];
                    string localnombre = ticket.UserData.Split('|')[9];
                    string localcodigo = ticket.UserData.Split('|')[10];
                    string movil = ticket.UserData.Split('|')[11];
                    string empresa_tipo = ticket.UserData.Split('|')[12];
                    string empresa_comercial = ticket.UserData.Split('|')[13];
                    string dashboarpantalla = ticket.UserData.Split('|')[19];
                    string telefonosoporte = ticket.UserData.Split('|')[20];
                    //string jsonconfigurate = ticket.UserData.Split('|')[40];



                    ViewState["acceso"] = usuario_acceso;
                    ViewState["usuario"] = usuario;
                    ViewState["empresaruc"] = empresaruc;
                    ViewState["empresanombre"] = empresanombre;
                    ViewState["usuarioanum_documento"] = usuarioanum_documento;
                    ViewState["empresa_imagen"] = empresa_imagen;
                    ViewState["empresa_tipo"] = empresa_tipo;
                    ViewState["telefonosoporte"] = telefonosoporte;

                    htelefonosoporte.Value = telefonosoporte;
                    hempresatipo.Value = empresa_tipo;
                    husuarioacceso.Value = usuario_acceso;

                    string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo).Serialize();


                    hcajeroreporte.Value = jsonconfig.Configurate("cajeroreporte");// new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "cajeroreporte").valor;
                    hcajeroproducto.Value = jsonconfig.Configurate("cajeroproducto");//new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "cajeroproducto").valor;

                    hcajeroparallevar.Value = jsonconfig.Configurate("cajeroparallevar") ?? "0";//new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "cajeroparallevar").valor ?? "0";
                    hcajerodelivery.Value = jsonconfig.Configurate("cajerodelivery") ?? "0";//new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "cajerodelivery").valor ?? "0";
                    hcajerodashboard.Value = jsonconfig.Configurate("cajerodashboard") ?? "0";//new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "cajerodashboard").valor ?? "0";
                    hdashboarpantalla.Value = jsonconfig.Configurate("dashboarpantalla") ?? "0";//new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "dashboarpantalla").valor ?? "0";

                    ViewState["cajeroparallevar"] = hcajeroparallevar.Value;
                    ViewState["cajerodelivery"] = hcajerodelivery.Value;
                    ViewState["cajerodashboard"] = hcajerodashboard.Value;

                    ViewState["cajeroreporte"] = hcajeroreporte.Value;
                    ViewState["cajeroproducto"] = hcajeroproducto.Value;

                    //if (empresa_pago != "0")
                    //{
                    //    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text",
                    //       string.Format("alert('Tiene monto de deuda pendiente de pago, el sistema sera bloqueado dentro de {0} !');", empresa_pago), true);

                    //}

                    if (empresa_tipo != "21")
                    {
                        lblruc.Text = string.Format("{0}", empresaruc.Trim());
                        lblempresa.Text = string.Format("{0}", empresa_comercial.Trim());
                    }

                    lblnombres.Text = string.Format("Bienvenido {0}!", Context.User.Identity.Name);
                    //lbllocal.Text = (local=="")?"(Todos)":local;
                    //lblempresa.Text = string.Format("{0}", empresanombre);

                    List<TwoTecnology.Entity.Local> listatmp = new List<TwoTecnology.Entity.Local>();
                    local.Items.Clear();

                    if (usuario_acceso == "SuperAdmin")
                    {
                        using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                        {
                            listatmp = obj.LoadByRuc(empresaruc);

                            local.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                            foreach (var item in listatmp)
                            {
                                local.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                            }
                        }
                    }
                    else
                    {


                        if (usuario_acceso == "Administrador" && dashboarpantalla=="1")
                        {
                            Response.Redirect("../Dashboard/Listado.aspx");
                        }
                        else
                        {
                            if (empresa_tipo == "3" && usuario_acceso == "Visor")
                            {
                                Response.Redirect("../Visor03/Listado.aspx");
                            }
                            else
                            {
                                if (empresa_tipo == "3" && (usuario_acceso == "Mesero" || usuario_acceso == "J.Mozo"))
                                {
                                    Response.Redirect("../Mesa03/Listado.aspx");
                                }
                                else
                                {

                                    if (empresa_tipo == "23" && (usuario_acceso == "Supervisor" || usuario_acceso == "Operador" || usuario_acceso == "Auditor"))
                                    {
                                        Response.Redirect("../GuiaRemision23/Listado.aspx");
                                    }
                                    else
                                    {
                                        using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                                        {
                                            listatmp= obj.LoadLocalesByEmpleado(empresaruc, usuario_codigo);

                                            foreach (var item in listatmp)
                                            {
                                                local.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        //protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        //{
        //    var absoluteReturnUrl = "Default.aspx";
        //    string local_empresa = Request.Cookies["local_empresa"].Value ?? "";

        //    if (local_empresa == "0")
        //        local_empresa = "";

        //    if (Request.Cookies["ruc_empresa"] != null)
        //    {
        //        string ruc_empresa = Request.Cookies["ruc_empresa"].Value;
        //        absoluteReturnUrl = string.Format("../../Default.aspx?ruc={0}&local={1}", ruc_empresa, local_empresa);
        //    }

        //    Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        //    Response.Redirect(absoluteReturnUrl);
        //}

    }
}