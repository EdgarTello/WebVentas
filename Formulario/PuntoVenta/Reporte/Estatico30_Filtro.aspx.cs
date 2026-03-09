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
    public partial class Estatico30_Filtro : System.Web.UI.Page
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
                string empresatipo = ticket.UserData.Split('|')[12];
                string movil = ticket.UserData.Split('|')[11];

                hruc.Value = empresaruc;
                hlocalcodigo.Value = localcodigo;

                if (!(usuario_acceso == "Administrador" || 
                    usuario_acceso == "SuperAdmin" || 
                    usuario_acceso == "Gerencia" ||
                    usuario_acceso == "Cajero" || 
                    usuario_acceso == "Contador"))
                    Response.Redirect("Salir.aspx");

                hempresatipo.Value = empresatipo;

                //cboAnio.Items.Clear();
                //cboMes.Items.Clear();
                //var lista = new TwoTecnology.Repositorio.Reporte().LoadAnios(ruc);

                //foreach (var item in lista) {
                //    cboAnio.Items.Add(new ListItem { Text = item.anio, Value = item.anio });
                //}

                //cboMes.Items.Add(new ListItem { Text = "Enero", Value = "1" });
                //cboMes.Items.Add(new ListItem { Text = "Febrero", Value = "2" });
                //cboMes.Items.Add(new ListItem { Text = "Marzo", Value = "3" });
                //cboMes.Items.Add(new ListItem { Text = "Abril", Value = "4" });
                //cboMes.Items.Add(new ListItem { Text = "Mayo", Value = "5" });
                //cboMes.Items.Add(new ListItem { Text = "Junio", Value = "6" });
                //cboMes.Items.Add(new ListItem { Text = "Julio", Value = "7" });
                //cboMes.Items.Add(new ListItem { Text = "Agosto", Value = "8" });
                //cboMes.Items.Add(new ListItem { Text = "Septiembre", Value = "9" });
                //cboMes.Items.Add(new ListItem { Text = "Octubre", Value = "10" });
                //cboMes.Items.Add(new ListItem { Text = "Noviembre", Value = "11" });
                //cboMes.Items.Add(new ListItem { Text = "Diciembre", Value = "12" });

                //fechainicio.Value = DateTime.Now.ToString("dd/MM/yyyy hh:mm");


                List<Entity.Local> listalocal = new List<Entity.Local>();
                

                cbolocal.Items.Clear();
                cbocaja.Items.Clear();
                cbocajero.Items.Clear();
                cbocierre.Items.Clear();

                
                cbocaja.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                cbocajero.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                
                cbocierre.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                cbocierre.Items.Add(new ListItem { Value = "NO", Text = "NO" });
                cbocierre.Items.Add(new ListItem { Value = "SI", Text = "SI" });


                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                {
                    listalocal = obj.LoadObject(empresaruc, "");
                    cbolocal.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                    foreach (var item in listalocal)
                    {
                        cbolocal.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                    }
                }

                LoadCombos();

                //if (usuario_acceso == "SuperAdmin")
                //{
                //    using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                //    {
                //        listalocal = obj.LoadObject(ruc, "");

                //        cbolocal.Items.Add(new ListItem { Value = "", Text = "[Todos]" });
                //        foreach (var item in listalocal)
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
                //        listalocal.Add(obj.LoadObjectByCodigo(ruc, localcodigo));

                //        foreach (var item in listalocal)
                //        {
                //            cbolocal.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                //        }

                //        LoadCombos();
                //    }
                //}
            }
        }

        protected void cbolocal_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCombos();
        }

        private void LoadCombos() {
            List<Entity.Caja> listacaja = new List<Entity.Caja>();
            List<Entity.Empleado> listaempleado = new List<Entity.Empleado>();
            List<Entity.Ubicacion> listaubicacion = new List<Entity.Ubicacion>();
            string empresaruc = hruc.Value;

            cbocaja.Items.Clear();
            cbocajero.Items.Clear();

            using (Repositorio.Caja obj = new TwoTecnology.Repositorio.Caja())
            {
                listacaja = obj.LoadByEmpresa(empresaruc, cbolocal.SelectedValue);

                cbocaja.Items.Add(new ListItem { Value = "", Text = "[Todos]" });

                foreach (var item in listacaja)
                {
                    cbocaja.Items.Add(new ListItem { Value = item.id, Text = item.nombre });
                }
            }

            using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
            {
                listaempleado = obj.LoadByAcceso(empresaruc, cbolocal.SelectedValue, "Cajero");

                cbocajero.Items.Add(new ListItem { Value = "", Text = "[Todos]" });

                foreach (var item in listaempleado)
                {
                    cbocajero.Items.Add(new ListItem { Value = item.id, Text = item.usuario });
                }
            }
        }
    }
}