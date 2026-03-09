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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.LocalVehiculos
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

                using (Repositorio.Transporte obj = new TwoTecnology.Repositorio.Transporte())
                    respuesta = obj.LoadByCodigo(id).Serialize();
            }

            if (Request.QueryString["ope"] == "1")
            {
                using (Repositorio.Transporte obj = new TwoTecnology.Repositorio.Transporte())
                {
                    string idlocal = Request.QueryString["idlocal"] ?? localcodigo;
                    string idtransportista = Request.QueryString["idtransportista"];
                    string documento = Request.QueryString["documento"];

                    respuesta = obj.LoadByLocal(idlocal, idtransportista, documento).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_1")
            {
                using (Repositorio.Transporte obj = new TwoTecnology.Repositorio.Transporte())
                {
                    string idtransportista = Request.QueryString["idtransportista"];
                    respuesta = obj.LoadByTransportista(idtransportista).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idtransportista = Request.QueryString["idtransportista"];
                string id = Request.QueryString["id"];
                string placa = Request.QueryString["placa"].Replace(" ", "");
                string marca = Request.QueryString["marca"];
                string modelo = Request.QueryString["modelo"];

                string idautorizacionguia = Request.QueryString["idautorizacionguia"]  ?? "0";
                string numeroautorizacion = Request.QueryString["numeroautorizacion"] ?? "";

                using (Repositorio.Transporte obj = new TwoTecnology.Repositorio.Transporte())
                {
                    if (id == "0")
                    {
                        if (obj.ExisteByNombre(idlocal, idtransportista, placa))
                            respuesta = "El Transporte existe en el local seleccionado!";
                        else
                            obj.Agregar(idlocal, idtransportista, placa, marca, modelo,
                                idautorizacionguia, numeroautorizacion);
                    }
                    else
                        obj.Editar(id, placa, marca, modelo, idautorizacionguia, numeroautorizacion);
                }                
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Transporte obj = new TwoTecnology.Repositorio.Transporte()){
                    obj.Eliminar(id);
                }
            }



            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}