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


namespace TwoTecnology.WebVentas.Formulario.General.LocalConductores
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
            string respuesta = "";

            if (Request.QueryString["ope"] == "0")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Conductor obj = new TwoTecnology.Repositorio.Conductor())
                    respuesta = obj.LoadByCodigo(id).Serialize();
            }

            if (Request.QueryString["ope"] == "1")
            {
                using (Repositorio.Conductor obj = new TwoTecnology.Repositorio.Conductor())
                {
                    string idlocal = Request.QueryString["idlocal"] ?? localcodigo;
                    string idtransportista = Request.QueryString["idtransportista"];
                    string documento = Request.QueryString["documento"];

                    respuesta = obj.LoadByLocal(ruc, idlocal, idtransportista, documento).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_1")
            {
                using (Repositorio.Conductor obj = new TwoTecnology.Repositorio.Conductor())
                {
                    string idtransportista = Request.QueryString["idtransportista"];
                    respuesta = obj.LoadByTransportista(ruc, idtransportista).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                string idtransportista = Request.QueryString["idtransportista"];
                string idlocal = Request.QueryString["idlocal"];
                string id = Request.QueryString["id"];
                string tipodocumento = Request.QueryString["tipodocumento"];
                string numero = Request.QueryString["numero"].Replace(" ", "");
                string nombres = Request.QueryString["nombres"];
                string apellidos = Request.QueryString["apellidos"];
                string licencia = Request.QueryString["licencia"].Replace(" ", "");

                using (Repositorio.Conductor obj = new TwoTecnology.Repositorio.Conductor())
                {
                    if (id == "0")
                    {
                        if (obj.ExisteByNombre(idlocal, idtransportista, tipodocumento, numero))
                            respuesta = "El Conductor existe en el local seleccionado!";
                        else
                            obj.Agregar(idlocal, idtransportista, tipodocumento, numero, nombres, apellidos, licencia);
                    }
                    else
                        obj.Editar(id, tipodocumento, numero, nombres, apellidos, licencia);
                }                
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Conductor obj = new TwoTecnology.Repositorio.Conductor())
                {
                    obj.Eliminar(id);
                }
            }



            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}