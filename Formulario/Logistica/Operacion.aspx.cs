using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Text;
using System.Web.Security;
using Newtonsoft.Json;
using RestSharp;
using System.Configuration;

namespace TwoTecnology.WebVentas.Formulario.Logistica
{
    public partial class Operacion : System.Web.UI.Page
    {

        string urlDefault = "Formulario/PuntoVenta/Menu/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            string respuesta = "";
            string ruc_empresa = "";

            if (Request.Cookies["ruc_empresa"] != null) {
                ruc_empresa= Request.Cookies["ruc_empresa"].Value;
                urlDefault = string.Format("Default.aspx?ruc={0}", ruc_empresa);
            }

            

            if (Request.QueryString["ope"] == "102_2")
            {

                string rucempresa = Request.QueryString["ruc"].ToString();

                using (Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario())
                {
                    respuesta = obj.Load(rucempresa);
                }

                Response.Write(respuesta);
                Response.ContentEncoding = Encoding.UTF8;
                Response.End();
            }



            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Clear();
                    Header.Controls.Add(new LiteralControl(@"
                    <script type=""text/javascript"">
                    top.location = ""Default.aspx"";
                    parent.location = ""Default.aspx"";
                    </script>
                    "));
                    Response.End();
                    // This is an unauthorized, authenticated request...
                    //Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                }
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
            


            if (Request.QueryString["ope"] == "329")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.LoadByProducto(ruc, id);
                }
            }

            if (Request.QueryString["ope"] == "810")
            {
                using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                    respuesta = obj.LoadListActivo(ruc);
            }

            if (Request.QueryString["ope"] == "812")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcategoria = Request.QueryString["idcategoria"];
                string tipo = Request.QueryString["tipo"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByLocalCategoria_v1(ruc, idlocal, idcategoria, tipo);
                }
            }

            if (Request.QueryString["ope"] == "813")
            {
                string idalmacen = Request.QueryString["idalmacen"] ?? "0";
                string idlocal = Request.QueryString["idlocal"];
                string idcategoria = Request.QueryString["idcategoria"] ?? "0";
                string tipo = Request.QueryString["tipo"];
                string busqueda = Request.QueryString["busqueda"] ?? "";

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByLocalCategoria_v3(ruc, idlocal, idalmacen, idcategoria, tipo, busqueda);
                }
            }

            if (Request.QueryString["ope"] == "815")
            {
                string idproducto = Request.QueryString["idproducto"];
                string idlocal = Request.QueryString["idlocal"];
                string idalmacen = Request.QueryString["idalmacen"];
                string idpresentacion = Request.QueryString["idpresentacion"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByAlmacen_v1(ruc, idproducto, idlocal,idalmacen, idpresentacion).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "816")
            {
                string codigointerno = Request.QueryString["codigointerno"];
                
                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByAlmacen_v2(ruc, codigointerno).Serialize();
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }

        public static MemoryStream GenerateStreamFromString(string value)
        {
            return new MemoryStream(Encoding.UTF8.GetBytes(value ?? ""));
        }

    }
}