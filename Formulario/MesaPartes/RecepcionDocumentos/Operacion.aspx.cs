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


namespace TwoTecnology.WebVentas.Formulario.MesaPartes.RecepcionDocumentos
{
    public partial class Operacion : System.Web.UI.Page
    {
        string urlDefault = "../../../Formulario/MesaPartes/Frame/Salir.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Clear();
                    Header.Controls.Add(new LiteralControl(@"
                    <script type=""text/javascript"">
                    top.location = ""../../../Default.aspx"";
                    parent.location = ""../../../Default.aspx"";
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
            string respuesta = "";

            if (Request.QueryString["ope"] == "003" && usuario_acceso == "Recepcion")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                {
                    respuesta = obj.LoadSimpleByCodigo(ruc, id).Serialize();
                }

            }

            if (Request.QueryString["ope"] == "000" && (usuario_acceso == "Gerencia" || usuario_acceso == "Operador" || usuario_acceso == "Derivador" || usuario_acceso == "Recepcion"))
            {
                string id = Request.QueryString["id"];
                
                using (Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento()){
                    respuesta = obj.LoadByCodigo(ruc, id).Serialize();
                }
                
            }

            if (Request.QueryString["ope"] == "001" && (usuario_acceso == "Gerencia" || usuario_acceso == "Operador" || usuario_acceso == "Recepcion" || usuario_acceso == "Derivador" || usuario_acceso == "Operador"))
            {
                string id = Request.QueryString["id"];

                using (TwoTecnology.Repositorio.MPArchivo obj = new TwoTecnology.Repositorio.MPArchivo())
                    respuesta = obj.LoadByCodigo(ruc, id ).Serialize();
            }

            if (Request.QueryString["ope"] == "002" && (usuario_acceso == "Gerencia" || usuario_acceso == "Operador" || usuario_acceso == "Recepcion" || usuario_acceso == "Derivador" || usuario_acceso == "Operador"))
            {
                string codigointerno_r = Request.QueryString["codigointerno_r"];

                using (Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                {
                    respuesta = obj.LoadByCodigoInterno(ruc, codigointerno_r).Serialize();
                }

            }

            if (Request.QueryString["ope"] == "100" && usuario_acceso == "Recepcion")
            {
                using (TwoTecnology.Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento())
                {
                    if (usuario_acceso == "Recepcion")
                    {
                        string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                        string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();

                        //respuesta = obj.LoadRecepcion(ruc, fechainicio, fecha, usuario_nombre ).Serialize();
                    }
                }
            }

           

            if (Request.QueryString["ope"] == "300" && usuario_acceso == "Recepcion")
            {
                string id = Request.QueryString["id"];
                using (Repositorio.MPDocumento obj = new TwoTecnology.Repositorio.MPDocumento()) 
                {
                    obj.Eliminar(id, usuario_codigo, usuario_nombre, "1");
                }

            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}