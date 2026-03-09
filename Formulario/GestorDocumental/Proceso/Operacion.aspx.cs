using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.Script.Serialization;
using System.IO;
using System.Text;
using System.Configuration;
using System.Web.Security;
using System.Web.Services;
using Newtonsoft.Json;
using TwoTecnology.Entity;


namespace TwoTecnology.WebVentas.Formulario.GestorDocumental.Proceso
{
    public partial class Operacion : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
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
            string ruta_principal = ticket.UserData.Split('|')[35];
            string ruta_documento = ticket.UserData.Split('|')[36];
            string respuesta = "";

           
            if (Request.QueryString["ope"] == "1")
            {
                string busqueda = Request.QueryString["busqueda"].Trim();
                string tipo = Request.QueryString["tipo"].Trim();

                Metodos.ValidateAntiXsrfToken("ProcesoList");

                if (!busqueda.IsInyection() && tipo.IsNumeric())
                {
                    using (TwoTecnology.Repositorio.GestorTemporal obj = new TwoTecnology.Repositorio.GestorTemporal())
                    {
                        respuesta = obj.Load(ruc, localcodigo, tipo, busqueda, ruta_documento).Serialize();
                    }
                }
            }

            if (Request.QueryString["ope"] == "2")
            {                
                Metodos.ValidateAntiXsrfToken("ProcesoList");

                using (TwoTecnology.Repositorio.GestorRequisito obj = new TwoTecnology.Repositorio.GestorRequisito())
                {
                    respuesta = obj.Load(ruc).Serialize();
                }
                
            }

            if (Request.QueryString["ope"] == "3"){

                string id = Request.QueryString["id"];
                string formato = Request.QueryString["formato"];

                Metodos.ValidateAntiXsrfToken("ProcesoNew");

                if (id.IsNumeric() && !formato.IsInyection())
                {
                    using (TwoTecnology.Repositorio.GestorTemporal obj = new TwoTecnology.Repositorio.GestorTemporal())
                    {
                        respuesta = obj.LoadById(ruc, id, formato, ruta_documento).Serialize();
                    }
                }
            }

            if(Request.QueryString["ope"] == "4"){

                string id = Request.QueryString["id"];
                string archivo = Request.QueryString["archivo"];

                Metodos.ValidateAntiXsrfToken("ProcesoNew");

                if (id.IsNumeric() && !archivo.IsInyection())
                {

                    using (TwoTecnology.Repositorio.GestorTemporal obj = new TwoTecnology.Repositorio.GestorTemporal())
                        respuesta = obj.LoadByArchivo(ruc, id, archivo, ruta_documento);
                }
            }

            if (Request.QueryString["ope"] == "5")
            {   
                string grupo = Request.QueryString["grupo"];
                string reserva = Request.QueryString["reserva"];
                string cantidad = Request.QueryString["cantidad"];

                Metodos.ValidateAntiXsrfToken("ProcesoList");

                if (grupo.IsNumeric() && reserva.IsNumeric() && cantidad.IsNumeric())
                {

                    using (TwoTecnology.Repositorio.GestorTemporal obj = new TwoTecnology.Repositorio.GestorTemporal())
                        obj.ActualizarPersona(ruc, localcodigo, grupo, reserva, cantidad);
                }
            }

            if (Request.QueryString["ope"] == "10")
            {

                //Metodos.ValidateAntiXsrfToken("ProcesoNew");

                var drequisito = new TwoTecnology.Repositorio.GestorRequisito();
                respuesta= drequisito.Loadv2(ruc).Serialize();
            }


            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}