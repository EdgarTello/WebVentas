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
using System.Web.Helpers;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Producto
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
            string ipProducto = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            if (Request.QueryString["ope"] == "0")
            {
                string codigo = Request.QueryString["id"];

                if (codigo.IsNumeric())
                {
                    using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                    {
                        respuesta = obj.LoadByCodigo(codigo).Serialize();
                    }
                }
            }

            if (Request.QueryString["ope"] == "1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idtipo = Request.QueryString["idtipo"];
                string idfamilia = Request.QueryString["idfamilia"];
                string idcategoria = Request.QueryString["idcategoria"];
                string nombre = Request.QueryString["nombre"];
                string tipo = Request.QueryString["tipo"];

                //valida el cookie de la pagina si es valido
                Metodos.ValidateAntiXsrfToken("ProductoList");
               

                if (idlocal.IsNumeric() && idtipo.IsNumeric() && idfamilia.IsNumeric() && idcategoria.IsNumeric() &&
                    tipo.IsNumeric() && !nombre.IsInyection())
                {

                    using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                    {
                        respuesta = obj.Load(ruc, tipo, nombre, idtipo, idfamilia, idcategoria, idlocal).Serialize();
                    }
                }
               


            }

            if (Request.QueryString["ope"] == "1_1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idtipo = Request.QueryString["idtipo"];
                string idcategoria = Request.QueryString["idcategoria"];
                string idfamilia = Request.QueryString["idfamilia"];
                string nombre = Request.QueryString["nombre"];
                string tipo = Request.QueryString["tipo"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {
                    respuesta = obj.LoadPlantilla(ruc, tipo, nombre, idtipo, idfamilia, idcategoria, idlocal);
                }

                Response.ContentType = "application/csv";
                Response.Charset = "";
                Response.AddHeader("Content-Disposition", "attachment; filename=plantilla.csv");
                Response.ContentEncoding = Encoding.Unicode;
                Response.BinaryWrite(Encoding.Unicode.GetPreamble());
                Response.Write(respuesta);
                Response.End();
            }

            if (Request.QueryString["ope"] == "1_2")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcategoria = Request.QueryString["idcategoria"];
                string tipo = Request.QueryString["tipo"];
                string idfamilia = Request.QueryString["idfamilia"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByLocalCategoria_v2(ruc, idlocal, idcategoria, idfamilia, tipo).Serialize();
                }
            }

            

            if (Request.QueryString["ope"] == "1_3")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcategoria = Request.QueryString["idcategoria"];
                string tipo = Request.QueryString["tipo"];
                string idfamilia = Request.QueryString["idfamilia"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByLocalCategoria_SinPrecio(ruc, idlocal, idcategoria, idfamilia, tipo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_4")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcategoria = Request.QueryString["idcategoria"];
                string tipo = Request.QueryString["tipo"];
                string idfamilia = Request.QueryString["idfamilia"];
                string producto = Request.QueryString["producto"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByLocalCategoria_SinPrecio(ruc, idlocal, idcategoria, idfamilia, tipo, producto).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_5")
            {
                string idlocal = Request.QueryString["idlocal"];

                string idtipo = Request.QueryString["idtipo"];
                string idfamilia = Request.QueryString["idfamilia"];
                string idcategoria = Request.QueryString["idcategoria"];
                
                
                string producto = Request.QueryString["producto"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByFiltros(ruc, idlocal, idtipo, idfamilia, idcategoria, producto).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_6")
            {
                string idcategoria = Request.QueryString["idcategoria"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByCategoria_v1(idcategoria).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_7")
            {
                string idcategoria = Request.QueryString["idcategoria"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByCategoria_v2(idcategoria).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string tipo = Request.QueryString["tipo"];
                string codigointerno = Request.QueryString["codigointerno"];
                string codigobarra = Request.QueryString["codigobarra"];
                string nombre = Request.QueryString["nombre"];
                string idcategoria = Request.QueryString["idcategoria"];
                string idfamilia = Request.QueryString["idfamilia"];

                string idpresentacion = Request.QueryString["idpresentacion"];
                string unidad = Request.QueryString["unidad"];

                string idpresentacion1 = Request.QueryString["idpresentacion1"];
                string unidades1 = Request.QueryString["unidades1"];

                string idpresentacion2 = Request.QueryString["idpresentacion2"];
                string unidades2 = Request.QueryString["unidades2"];



                

                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }


                if (idcategoria == "0")
                {
                    respuesta = "Debe seleccionar un categoria.";
                    blnerror = true;
                }

                if (!blnerror)
                {
                    string descripcion = HttpUtility.UrlDecode(Request.QueryString["descripcion"]);
                    string activo = Request.QueryString["activo"];
                    string compuesto = Request.QueryString["compuesto"];
                    string combo = Request.QueryString["combo"];
                    string fsc = Request.QueryString["fsc"];
                    string topping = Request.QueryString["topping"];
                    string tipocobro = Request.QueryString["tipocobro"];
                    string tolerancia = Request.QueryString["tolerancia"];

                    using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                    {
                        if (id == "0")
                        {
                            if (obj.ExisteByCodigoInterno(ruc, codigointerno))
                                respuesta = "Codigo Interno de producto existe!";
                            else
                            {
                                id = obj.Agregar(ruc, tipo, codigointerno, nombre, descripcion, idcategoria,
                                    idpresentacion, unidad, idpresentacion1, unidades1, idpresentacion2, unidades2,
                                    compuesto, combo, activo, codigobarra, tipocobro, tolerancia, fsc, idfamilia, topping);

                                respuesta = id;
                                string idimpuestodefecto = new TwoTecnology.Repositorio.Impuesto().LoadImpuestoDefecto(ruc);

                                if (idimpuestodefecto != "")
                                {
                                    new TwoTecnology.Repositorio.Impuesto().AgregarImpuestoProducto(id, idimpuestodefecto, "1");
                                }
                            }
                        }
                        else
                        {
                            obj.Editar(id, codigointerno, nombre, descripcion, idcategoria,
                                idpresentacion, unidad, idpresentacion1, unidades1, idpresentacion2, unidades2,
                                compuesto, combo, activo, codigobarra, tipocobro, tolerancia, fsc, idfamilia, topping);
                            respuesta = id;
                        }

                    }
                }
            }

            if (Request.QueryString["ope"] == "2_1")
            {
                string idalmacen = Request.QueryString["idalmacen"];
                string idproducto = Request.QueryString["idproducto"];
                string idpresentacion = Request.QueryString["idpresentacion"];
                string valor = Request.QueryString["valor"];
                string precio = Request.QueryString["precio"];
                string preciomesa = Request.QueryString["preciomesa"];
                string preciodelivery = Request.QueryString["preciodelivery"];
                string stock = Request.QueryString["stock"];
                string comisionpor1 = Request.QueryString["comisionpor1"];
                string idarea1 = Request.QueryString["idarea1"];
                string idarea2 = Request.QueryString["idarea2"];


                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {
                    obj.EditarAlmacenProducto(idalmacen, idproducto, idpresentacion, valor,
                        precio, preciomesa, preciodelivery, stock, comisionpor1, 
                        usuario_acceso, idarea1,
                        idarea2, ruc);

                    obj.ActualizarStock(idalmacen, idproducto, stock , usuario_acceso);
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "4")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {
                    respuesta = obj.LoadLocalesByCodigo(ruc, id, localcodigo);
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}