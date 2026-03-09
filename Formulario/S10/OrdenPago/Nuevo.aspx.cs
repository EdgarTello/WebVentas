using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.S10.OrdenPago
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

                if (Request.QueryString["id"] != null)
                    hid.Value = Request.QueryString["id"];
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
            string empresa_ruc = ticket.UserData.Split('|')[1];
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string empresa_imagen = ticket.UserData.Split('|')[7];
            string usuario_serie = ticket.UserData.Split('|')[7];
            string puntosid = ticket.UserData.Split('|')[8];
            string ipcliente = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string mobile = ticket.UserData.Split('|')[11];
            string monedacaja = ticket.UserData.Split('|')[24];
            string monedadefault = ticket.UserData.Split('|')[25];
            string rol_id = ticket.UserData.Split('|')[29];

            string opcion = "OrdenPedido";
            string pagina = "../../Retail/OrdenPedido/Nuevo.aspx";

            using (Repositorio.RolesxPagina obj = new TwoTecnology.Repositorio.RolesxPagina())
            {
                var permiso_acceso = obj.LoadAcceso(empresa_ruc, usuario_codigo, rol_id, opcion, pagina);

                if (permiso_acceso.acceso!="1")
                {
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                }
            }


            string jsonconfig = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresa_ruc, localcodigo).Serialize();

            ViewState["empresa_imagen"] = empresa_imagen;
            hidlocal.Value = localcodigo;
            hmoneda.Value = monedadefault;
            hmuestratipo.Value = jsonconfig.Configurate("muestratipo");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestratipo").valor;
            hmuestrafamilia.Value = jsonconfig.Configurate("muestrafamilia");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestrafamilia").valor;
            hmuestracategoria.Value = jsonconfig.Configurate("muestracategoria");// new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestracategoria").valor;
            hmuestraproducto.Value = jsonconfig.Configurate("muestraproducto");// new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "muestraproducto").valor;
            hproductobusqueda.Value = jsonconfig.Configurate("productobusqueda");// new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "productobusqueda").valor;
            hproductoimagen.Value = jsonconfig.Configurate("productoimagen");// new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "productoimagen").valor;
            hfilasindividual.Value = jsonconfig.Configurate("filasindividual");//new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "filasindividual").valor;
        }
    }
}