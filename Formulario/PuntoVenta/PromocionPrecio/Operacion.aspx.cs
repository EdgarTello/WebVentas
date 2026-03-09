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
using RestSharp;


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.PromocionPrecio
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

                using (Repositorio.PromocionPrecio obj = new TwoTecnology.Repositorio.PromocionPrecio())
                {
                    respuesta = obj.LoadByCodigo(ruc, id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string idcategoria = Request.QueryString["idcategoria"];
                string idproducto = Request.QueryString["idproducto"];
                string estado = Request.QueryString["estado"];
                string idlocal = Request.QueryString["idlocal"];

                using (Repositorio.PromocionPrecio obj = new TwoTecnology.Repositorio.PromocionPrecio())
                {
                    respuesta = obj.Load(ruc, idcategoria, idproducto, estado, idlocal, fechainicio, fechafin).Serialize();
                }
            }

            //if (Request.QueryString["ope"] == "1_1")
            //{
            //    string idcliente = Request.QueryString["idcliente"];


            //    using (Repositorio.PromocionPrecio obj = new TwoTecnology.Repositorio.PromocionPrecio())
            //    {
            //        respuesta = obj.LoadByCliente(idcliente).Serialize();
            //    }
            //}

            if (Request.QueryString["ope"] == "2")
            {
                bool blnerror = false;
                
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.PromocionPrecio promocion = JsonConvert.DeserializeObject<Entity.PromocionPrecio>(json);


                /*
                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }*/


                if (!blnerror)
                {
                    string codigo = promocion.id; ;
                   
                    using (Repositorio.PromocionPrecio obj = new TwoTecnology.Repositorio.PromocionPrecio())
                    {
                        if (codigo == "0")
                        {
                            codigo = obj.Agregar(
                                promocion.idlocal, promocion.idproducto,
                                promocion.fechainicio.ConverTo_YYYYMMDD(), 
                                promocion.fechafin.ConverTo_YYYYMMDD(),
                                promocion.mesa, promocion.mesacantidad, promocion.mesaprecio,
                                promocion.delivery, promocion.deliverycantidad, promocion.deliveryprecio,
                                promocion.parallevar, promocion.parallevarcantidad, promocion.parallevarprecio,
                                ruc);
                        }
                        else
                        {
                            obj.Editar(promocion.id, promocion.mesa, promocion.mesacantidad, promocion.mesaprecio,
                                promocion.delivery, promocion.deliverycantidad, promocion.deliveryprecio,
                                promocion.parallevar, promocion.parallevarcantidad, promocion.parallevarprecio);
                        }

                        foreach( var item in promocion.horario){
                            obj.AgregarDetalle(codigo, item.dia, item.hora, item.estado);
                        }

                    }
                }

                respuesta = "";
            }



            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.PromocionPrecio obj = new TwoTecnology.Repositorio.PromocionPrecio())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "11")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.PromocionPrecio obj = new TwoTecnology.Repositorio.PromocionPrecio())
                {
                    obj.Activar(id);
                }
            }

            if (Request.QueryString["ope"] == "12")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.PromocionPrecio obj = new TwoTecnology.Repositorio.PromocionPrecio())
                {
                    obj.Desactivar(id);
                }
            }


            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}