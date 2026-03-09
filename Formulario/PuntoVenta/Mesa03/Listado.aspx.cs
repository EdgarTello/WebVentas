using Ionic.Zip;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Mesa03
{
    public partial class Listado : System.Web.UI.Page
    {
        //string urlDefault = "../../General/Frame/Salir.aspx";
        string urlDefault = "../../General/Frame/Salir.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                {

                    
                    string local_empresa = Request.Cookies["local_empresa"].Value ?? "";

                    if (local_empresa == "0")
                        local_empresa = "";

                    if (Request.Cookies["ruc_empresa"] != null)
                    {
                        string ruc_empresa = Request.Cookies["ruc_empresa"].Value;
                        urlDefault = string.Format("../../Default.aspx?ruc={0}&local={1}", ruc_empresa, local_empresa);
                    }



                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                    Response.End();
                }
            }

            FormsAuthenticationTicket ticket = null;
            try
            {
                FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                ticket = formsIdentity.Ticket;


                string empresaid = ticket.UserData.Split('|')[0];
                string empresanombre = ticket.UserData.Split('|')[2];

                string empresaruc = ticket.UserData.Split('|')[1];
                string acceso = ticket.UserData.Split('|')[3];
                string usuario = ticket.UserData.Split('|')[5];
                string usuarioanum_documento = ticket.UserData.Split('|')[6];
                string localcodigo = ticket.UserData.Split('|')[10];
                string mobile = ticket.UserData.Split('|')[11];
                string tipo = ticket.UserData.Split('|')[12];
                string empresa_comercial = ticket.UserData.Split('|')[13];

                hidlocal.Value = localcodigo;
                hempleado.Value = usuario;
                husuario_acceso.Value = acceso;
                husuario_nombre.Value = usuario;
                hvalido.Value = "1";
                htipo.Value = tipo;

                

                bool errortipocambio = false;
                string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo).Serialize();

                string tipocambio = jsonconfig.Configurate("tipocambio") ?? "0";//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tipocambio").valor ?? "0";
                string mozoparallevar = jsonconfig.Configurate("mozoparallevar") ?? "0";//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "mozoparallevar").valor ?? "0";
                string jefemozosession = jsonconfig.Configurate("jefemozosession") ?? "0";//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "jefemozosession").valor ?? "0";
                string aperturacaja = jsonconfig.Configurate("jefemozosession") ?? "0";
                hjefemozosession.Value = jefemozosession;

                ViewState["mozoparallevar"] = mozoparallevar;
                ViewState["acceso"] = acceso;
                ViewState["jefemozosession"] = jefemozosession;
                ViewState["usuario"] = usuario;
                ViewState["empresaruc"] = empresaruc;
                ViewState["empresanombre"] = empresanombre;
                ViewState["usuarioanum_documento"] = usuarioanum_documento;
                ViewState["empresa_tipo"] = tipo;

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {

                    if (obj.AperturaTipoCambioByEmpresa(empresaruc) == "0" && tipocambio == "1")
                    {
                        switch (acceso)
                        {
                            case "SuperAdmin":
                                Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=3"); ;
                                break;

                            case "Administrador":
                                Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=3"); ;
                                break;

                            case "Vendedor":
                                Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=3"); ;
                                break;

                            case "Cajero":
                                Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=3"); ;
                                break;

                            case "Mesero":
                                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "alert('No se registro el tipo de cambio del día!');", true);
                                break;
                        }

                        errortipocambio = true;
                    }
                }

                if (!errortipocambio)
                {
                    //string aperturacaja = "0";

                    //using (Repositorio.Configuracion obj = new TwoTecnology.Repositorio.Configuracion())
                    //{
                    //    aperturacaja = obj.LoadTexto(empresaruc, localcodigo, "aperturacaja");
                    //}

                    using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                    {
                        switch (acceso)
                        {
                        

                            case "Cajero":
                                if (aperturacaja == "1")
                                {
                                    if (obj.AperturaExisteByLocalEmpleado(empresaruc, localcodigo, usuario) == "0")
                                    {
                                        Response.Redirect("../OperacionCaja/Nuevo.aspx?solicitud=3");
                                    }
                                }
                                break;

                            case "J.Mozo":
                                if (aperturacaja == "1")
                                {
                                    var item = obj.AperturaExisteByLocal(empresaruc, localcodigo);

                                    if (item.id == "0" || item.id == "")
                                    {
                                        hvalido.Value = "0";
                                    }
                                }

                                break;

                            case "Mesero":
                                if (aperturacaja == "1")
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

                if (tipo != "21")
                {
                    lblruc.Text = string.Format("{0}", empresaruc);
                    lblempresa.Text = string.Format("{0}", empresa_comercial);
                }

                //lblnombres.Text = string.Format("{0}-{1}", Context.User.Identity.Name, acceso);
                lblnombres.Text = string.Format("{0}", Context.User.Identity.Name);
                //lbllocal.Text = (local=="")?"(Todos)":local;
                //lblempresa.Text = string.Format("{0}", empresanombre);

                List<Entity.Local> listatmp = new List<Entity.Local>();
                local.Items.Clear();

                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                {
                    listatmp.Add(obj.LoadObjectByCodigo(empresaruc, localcodigo));

                    foreach (var item in listatmp)
                    {
                        local.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                    }
                }



            }
            catch
            {
                string local_empresa = Request.Cookies["local_empresa"].Value ?? "";

                if (local_empresa == "0")
                    local_empresa = "";

                if (Request.Cookies["ruc_empresa"] != null)
                {
                    string ruc_empresa = Request.Cookies["ruc_empresa"].Value;
                    urlDefault = string.Format("../../Default.aspx?ruc={0}&local={1}", ruc_empresa, local_empresa);
                }

                Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                Response.End();
            }

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            var absoluteReturnUrl = "../../Default.aspx";
            string local_empresa = Request.Cookies["local_empresa"].Value ?? "";

            if (local_empresa == "0")
                local_empresa = "";

            if (Request.Cookies["ruc_empresa"] != null)
            {
                string ruc_empresa = Request.Cookies["ruc_empresa"].Value;
                absoluteReturnUrl = string.Format("../../Default.aspx?ruc={0}&local={1}", ruc_empresa, local_empresa);
            }

            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect(absoluteReturnUrl);
        }
    }
}