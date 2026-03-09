using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.Corporativo.Frame
{
    public partial class Index : System.Web.UI.Page
    {
        string urlDefault = "Salir.aspx";
        string _empresagrupo = ConfigurationManager.AppSettings["empresagrupo"] ?? "";
        //string _empresaruc = ConfigurationManager.AppSettings["empresaruc"] ?? "";
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
                    string usuario_nombre = ticket.UserData.Split('|')[5];
                    string usuarioanum_documento = ticket.UserData.Split('|')[6];
                    string empresa_imagen = ticket.UserData.Split('|')[7];
                    string empresa_pago = ticket.UserData.Split('|')[8];
                    string localnombre = ticket.UserData.Split('|')[9];
                    string localcodigo = ticket.UserData.Split('|')[10];
                    string ismobile = ticket.UserData.Split('|')[11];
                    string empresa_tipo = ticket.UserData.Split('|')[12];
                    string empresa_comercial = ticket.UserData.Split('|')[13];
                    string dashboarpantalla = ticket.UserData.Split('|')[19];
                    string telefonosoporte = ticket.UserData.Split('|')[20];

                    string pathdocumento = ticket.UserData.Split('|')[21];
                    string ver = ticket.UserData.Split('|')[22];
                    string descargar = ticket.UserData.Split('|')[23];
                    string editar = ticket.UserData.Split('|')[24];
                    string eliminar = ticket.UserData.Split('|')[25];
                    string usuarionombres = string.Empty;

                    hempleadoid.Value = usuario_codigo;

                    ViewState["acceso"] = usuario_acceso;
                    ViewState["usuario"] = usuario_nombre;
                    ViewState["empresaruc"] = empresaruc;
                    ViewState["empresanombre"] = empresanombre;
                    ViewState["usuarioanum_documento"] = usuarioanum_documento;
                    ViewState["empresa_imagen"] = empresa_imagen;
                    ViewState["empresa_tipo"] = empresa_tipo;
                    ViewState["telefonosoporte"] = telefonosoporte;
                    ViewState["ismobile"] = ismobile;

                    string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo).Serialize();

                    hismobile.Value = ismobile;
                    htelefonosoporte.Value = telefonosoporte;
                    hpaginatab.Value= jsonconfig.Configurate("paginatab");

                    if (empresa_pago != "0")
                    {
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text",
                           string.Format("alert('Tiene monto de deuda pendiente de pago, el sistema sera bloqueado dentro de {0} !');", empresa_pago), true);

                    }

                    lblrol.Text = $"{usuario_acceso}";

                    //if (!(empresa_tipo == "21" || empresa_tipo == "103"))
                    //{
                    //    lblruc.Text = string.Format("{0}", empresaruc);
                    //    lblempresa.Text = string.Format("{0}", empresa_comercial);
                    //}

                    using (Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario())
                    {
                        Entity.Usuario usu = obj.GetUsuario(empresaruc, usuario_nombre);
                        usuarionombres = usu.cliente_nombre;
                        hpaginadefecto.Value=usu.paginadefecto;
                    }

                    lblnombres.Text = string.Format("Bienvenido {0}!", ((usuarionombres=="")?Context.User.Identity.Name:usuarionombres));
                    
                }
            }
        }
    }
}