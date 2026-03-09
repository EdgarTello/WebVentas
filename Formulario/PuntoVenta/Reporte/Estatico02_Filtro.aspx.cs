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

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte
{
    public partial class Estatico02_Filtro : System.Web.UI.Page
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
                string empresaruc = ticket.UserData.Split('|')[1];
                string usuario_acceso = ticket.UserData.Split('|')[3];
                string usuario_codigo = ticket.UserData.Split('|')[4];
                string usuario_nombre = ticket.UserData.Split('|')[5];
                string usuario_serie = ticket.UserData.Split('|')[7];
                string puntosid = ticket.UserData.Split('|')[8];
                string ipcliente = ticket.UserData.Split('|')[9];
                string localcodigo = ticket.UserData.Split('|')[10];
                string movil = ticket.UserData.Split('|')[11];

                hruc.Value = empresaruc;
                hlocalcodigo.Value = localcodigo;

                cboanio.Items.Clear();
                cbomes.Items.Clear();
                var lista = new TwoTecnology.Repositorio.Reporte().LoadAnios(empresaruc);

                foreach (var item in lista) {
                    cboanio.Items.Add(new ListItem { Text = item.anio, Value = item.anio });
                }

                cbomes.Items.Add(new ListItem { Text = "Enero", Value = "1" });
                cbomes.Items.Add(new ListItem { Text = "Febrero", Value = "2" });
                cbomes.Items.Add(new ListItem { Text = "Marzo", Value = "3" });
                cbomes.Items.Add(new ListItem { Text = "Abril", Value = "4" });
                cbomes.Items.Add(new ListItem { Text = "Mayo", Value = "5" });
                cbomes.Items.Add(new ListItem { Text = "Junio", Value = "6" });
                cbomes.Items.Add(new ListItem { Text = "Julio", Value = "7" });
                cbomes.Items.Add(new ListItem { Text = "Agosto", Value = "8" });
                cbomes.Items.Add(new ListItem { Text = "Septiembre", Value = "9" });
                cbomes.Items.Add(new ListItem { Text = "Octubre", Value = "10" });
                cbomes.Items.Add(new ListItem { Text = "Noviembre", Value = "11" });
                cbomes.Items.Add(new ListItem { Text = "Diciembre", Value = "12" });

                List<Entity.Local> listalocal = new List<Entity.Local>();
                cbolocal.Items.Clear();

                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                {
                    listalocal = obj.LoadObject(empresaruc, "");
                    cbolocal.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                    foreach (var item in listalocal)
                    {
                        cbolocal.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                    }
                }


                //if (usuario_acceso == "SuperAdmin")
                //{
                //    using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                //    {
                //        listatmp = obj.LoadObject(ruc, "");

                //        cbolocal.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                //        foreach (var item in listatmp)
                //        {
                //            cbolocal.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                //        }
                //    }
                //}

                //if (usuario_acceso == "Administrador" || 
                //    usuario_acceso == "Gerencia" || 
                //    usuario_acceso == "Cajero" || 
                //    usuario_acceso == "Contador")
                //{
                //    using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                //    {
                //        listatmp.Add(obj.LoadObjectByCodigo(ruc, localcodigo));

                //        foreach (var item in listatmp)
                //        {
                //            cbolocal.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                //        }
                //    }
                //}



            }

            if (hdocumentointerno.Value == "1")
            {
                spandi.InnerHtml = "(DI)";
            }
        }

        
    }
}