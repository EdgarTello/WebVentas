using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Web.Security;
using Microsoft.Reporting.WebForms;
using System.Data;

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.Reporte
{
    public partial class Dinamico01_Filtro : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                    // This is an unauthorized, authenticated request...
                    Response.Redirect("Default.aspx");

                FormsAuthenticationTicket ticket = null;
                try
                {
                    FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                    ticket = formsIdentity.Ticket;
                }
                catch
                {
                    Response.Redirect("Default.aspx");
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
                string empresatipo = ticket.UserData.Split('|')[12];
                string movil = ticket.UserData.Split('|')[11];

                hruc.Value = ruc;
                hlocalcodigo.Value = localcodigo;

                if (!(usuario_acceso == "Administrador" ||
                    usuario_acceso == "SuperAdmin" ||
                    usuario_acceso == "Derivador" ||
                    usuario_acceso == "Operador" ||
                    usuario_acceso == "Recepcion" ||
                    usuario_acceso == "Gerencia" ||
                    usuario_acceso == "Cajero" ||
                    usuario_acceso == "Contador"))
                {
                    Response.Redirect("Salir.aspx");
                }


                hempresatipo.Value = empresatipo;

                cbolocal.Items.Clear();
                cboarea.Items.Clear();
                cboetapa.Items.Clear();
                cboope.Items.Clear();

                if (usuario_acceso == "Administrador" ||
                    usuario_acceso == "Derivador" ||
                    usuario_acceso == "Operador" ||
                    usuario_acceso == "Recepcion" ||
                    usuario_acceso == "Gerencia" ||
                    usuario_acceso == "Cajero" ||
                    usuario_acceso == "Contador")
                {
                    using (Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        List<Entity.Local> listalocal = obj.LoadLocalesObject(ruc);

                        cbolocal.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                        foreach (var item in listalocal)
                        {
                            cbolocal.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                        }
                    }

                    using (Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                    {
                        List<Entity.Area> listaarea = obj.LoadAreasObject(ruc);

                        cboarea.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                        foreach (var item in listaarea)
                        {
                            cboarea.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                        }
                    }

                    cboope.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                    cboope.Items.Add(new ListItem { Value = "E", Text = "ENTRADA" });
                    cboope.Items.Add(new ListItem { Value = "S", Text = "SALIDA" });

                    LoadCombos();
                }
            }
        }
        protected void cboope_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCombos();
        }

        private void LoadCombos()
        {

            cboetapa.Items.Clear();
            cboetapa.Items.Add(new ListItem { Value = "0", Text = "[Todos]" });

            if (cboope.SelectedValue == "E")
            {
                cboetapa.Items.Add(new ListItem { Value = "1", Text = "RECEPCIONADO" });
                cboetapa.Items.Add(new ListItem { Value = "10", Text = "DERIVADO" });
                cboetapa.Items.Add(new ListItem { Value = "20", Text = "ACEPTADO" });
                cboetapa.Items.Add(new ListItem { Value = "30", Text = "RESPONDIDO" });
                cboetapa.Items.Add(new ListItem { Value = "99", Text = "FINALIZADO" });
            }

            if (cboope.SelectedValue == "S")
            {
                cboetapa.Items.Add(new ListItem { Value = "110", Text = "SOLICITUD" });
                cboetapa.Items.Add(new ListItem { Value = "120", Text = "ACEPTADO" });
                cboetapa.Items.Add(new ListItem { Value = "199", Text = "FINALIZADO" });
            }
        }
    }
}