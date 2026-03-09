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

namespace TwoTecnology.WebVentas.Formulario.MesaPartes
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
            



            if (Request.QueryString["ope"] == "1")
            {
                using (Repositorio.Impresora obj = new TwoTecnology.Repositorio.Impresora())
                {
                    respuesta = obj.LoadByCodigo(localcodigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "002")
            {
                using (Repositorio.Ubigeo obj = new TwoTecnology.Repositorio.Ubigeo())
                {
                    respuesta = obj.Load().Serialize();
                }
            }

            //if (Request.QueryString["ope"] == "003")
            //{
            //    using (Repositorio.Monedero obj = new TwoTecnology.Repositorio.Monedero())
            //    {
            //        respuesta = obj.Load(ruc).Serialize();
            //    }
            //}

            //if (Request.QueryString["ope"] == "101")
            //{
            //    string sTipo = Request.QueryString["Tipo"].ToString();
            //    string sSerie = Request.QueryString["Serie"].ToString();
            //    string sCorrelativo = Request.QueryString["Correlativo"].ToString();
            //    string sFechaInicio = string.Empty;
            //    string sFechaFin = string.Empty;

            //    if (Request.QueryString["FechaInicio"].ToString() != "")
            //        sFechaInicio = Request.QueryString["FechaInicio"].ToString().ConverTo_YYYYMMDD();

            //    if (Request.QueryString["FechaFin"].ToString() != "")
            //        sFechaFin = Request.QueryString["FechaFin"].ToString().ConverTo_YYYYMMDD();

            //    string sUsuario = Context.User.Identity.Name;

            //    string sEstado = Request.QueryString["estado"] ?? "";
            //    string sSunat = Request.QueryString["sunat"] ?? "";

            //    if (sSerie == "" && usuario_acceso == "Vendedor")
            //        sSerie = usuario_serie;

            //    using (Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
            //    {
            //        respuesta = obj.Load(empresaid, sTipo, sSerie, sCorrelativo, sFechaInicio, sFechaFin, sEstado, sSunat);
            //    }
            //}

            if (Request.QueryString["ope"] == "102")
            {

                string sCliente = Request.QueryString["cliente"].ToString();

                using (Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario())
                {
                    respuesta = obj.GetUsuariosByNombreToJson(empresaid, sCliente);
                }
            }

            if (Request.QueryString["ope"] == "102_1")
            {

                string acceso = Request.QueryString["acceso"].ToString();
                string usuario = Request.QueryString["usuario"].ToString();
                string clave = Request.QueryString["clave"].ToString();

                using (Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario())
                {
                    if (obj.ValidateAcceso(ruc, acceso, usuario, clave))
                        respuesta = "1";
                    else
                        respuesta = "0";
                }
            }

            

            if (Request.QueryString["ope"] == "103")
            {
                string sTop = Request.QueryString["Top"] ?? "";
                string sDocumento = Request.QueryString["Documento"].ToString();

                using (Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
                {
                    respuesta = obj.Load(empresaid, sDocumento, sTop);
                }
            }

            if (Request.QueryString["ope"] == "104")
            {
                string empresa = Request.QueryString["empresa"];
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
                {
                    obj.Imprimir(empresaid, codigo);
                }
            }

            if (Request.QueryString["ope"] == "105")
            {
                using (Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
                {
                    //respuesta = obj.LoadDocumento(empresaid, ruc);
                }
            }

            if (Request.QueryString["ope"] == "106")
            {
                respuesta = usuario_serie;

            }




            //if (Request.QueryString["ope"] == "112")
            //{
            //    string codigo = Request.QueryString["codigo"];

            //    using (Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
            //    {
            //        obj.AgregarTransaccion(ruc, codigo);

            //        respuesta = obj.LoadTransaccion(ruc, codigo);
            //    }
            //}

            //if (Request.QueryString["ope"] == "113")
            //{
            //    string id = Request.QueryString["id"];

            //    using (Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
            //    {
            //        obj.Eliminar(id);
            //    }
            //}

            /*-----------------------------  BEGIN TIPO PAGO    210 --------------------------*/
            //#region CATEGORIA
            

            //if (Request.QueryString["ope"] == "211_1")
            //{
            //    string defecto = Request.QueryString["defecto"];

            //    using (Repositorio.TipoPago obj = new TwoTecnology.Repositorio.TipoPago())
            //    {
            //        respuesta = obj.LoadbyDefecto(ruc, defecto).Serialize();
            //    }
            //}


            //#endregion
            /*-----------------------------  END CATEGORIA          --------------------------*/

            /*-----------------------------  BEGIN CATEGORIA    310 --------------------------*/
            #region CATEGORIA
            if (Request.QueryString["ope"] == "310")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "311")
            {
                string nombre = Request.QueryString["nombre"];
                string tipo = Request.QueryString["tipo"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.LoadTodos(ruc, tipo, nombre);
                }
            }

            if (Request.QueryString["ope"] == "311_1")
            {
                string nombre = Request.QueryString["nombre"];
                string tipo = Request.QueryString["tipo"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.Load(ruc, tipo, nombre).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "312")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string activo = Request.QueryString["activo"];

                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string descripcion = Request.QueryString["descripcion"];

                    using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                    {
                        if (id == "0")
                        {
                            if (obj.ExisteByNombre(ruc, nombre))
                                respuesta = "El nombre de Categoria existe!";
                            else
                                obj.Agregar("1", nombre, descripcion,"","","", "1", ruc);
                        }
                        else
                            obj.Editar(id, nombre, descripcion,"","","", "1");

                    }
                }
            }

            if (Request.QueryString["ope"] == "313")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {

                    //if (obj.ExisteByNombre(ruc, nombre))
                    //{
                    //    respuesta = "La categoria contiene productos existentes!";
                    //}
                    //else
                    //{
                        obj.Eliminar(id);
                    //}
                }
            }

            if (Request.QueryString["ope"] == "314")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcategoria = Request.QueryString["idcategoria"];
                string idlocalimpresora = Request.QueryString["idlocalimpresora"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                    obj.EditarLocalCategoria(idlocal, idcategoria, idlocalimpresora);
            }

            if (Request.QueryString["ope"] == "319")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.LoadLocalImpresoraByCodigo(ruc, codigo);
                }
            }
            #endregion
            /*-----------------------------  END CATEGORIA          --------------------------*/

            /*-----------------------------  BEGIN PRESENTACION 320 --------------------------*/
            #region PRESENTACION
            if (Request.QueryString["ope"] == "320")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo);
                }
            }


            if (Request.QueryString["ope"] == "321")
            {
                string nombre = Request.QueryString["nombre"];
                string tipo = Request.QueryString["tipo"];

                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.Load(ruc, tipo, nombre).Serialize();
                }
            }



            if (Request.QueryString["ope"] == "322")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string tipo = Request.QueryString["tipo"];
                string nombre = Request.QueryString["nombre"];
                string codigosunat = Request.QueryString["codigosunat"];

                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }

                if (codigosunat.Length < 3)
                {
                    respuesta = "El codigo sunat debe contener mas de 2 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string descripcion = Request.QueryString["descripcion"];

                    using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                    {
                        if (id == "0")
                        {
                            if (obj.ExisteByNombre(ruc, nombre))
                                respuesta = "El nombre de Presentación existe!";
                            else
                                obj.Agregar(ruc, tipo, nombre, descripcion, codigosunat);
                        }
                        else
                            obj.Editar(id, nombre, descripcion, codigosunat);

                    }
                }
            }

            if (Request.QueryString["ope"] == "323")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "329")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Presentacion obj = new TwoTecnology.Repositorio.Presentacion())
                {
                    respuesta = obj.LoadByProducto(ruc, id);
                }
            }
            #endregion
            /*-----------------------------  END PRESENTACION       --------------------------*/

            /*-----------------------------  BEGIN PRODUCTO     340 --------------------------*/
            #region PRODUCTO
            if (Request.QueryString["ope"] == "340")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo);
                }
            }



            if (Request.QueryString["ope"] == "341_1")
            {
                string idlocal = Request.QueryString["idlocal"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {
                    respuesta = obj.LoadAutoComplete(ruc);
                }
            }

            if (Request.QueryString["ope"] == "341_2")
            {
                string idlocal = Request.QueryString["idlocal"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {
                    respuesta = obj.LoadAutoCompleteNombre(ruc, idlocal);
                }
            }

            if (Request.QueryString["ope"] == "341_3")
            {
                string idlocal = Request.QueryString["idlocal"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {
                    respuesta = obj.LoadAutoCompleteCodigo(ruc, idlocal);
                }
            }

            

            if (Request.QueryString["ope"] == "344")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idproducto = Request.QueryString["idproducto"];
                string idpresentacion = Request.QueryString["idpresentacion"];
                string valor = Request.QueryString["valor"];
                string precio = Request.QueryString["precio"];
                string precioindividual = Request.QueryString["precioindividual"];
                string stock = Request.QueryString["stock"];
                string dsctom = Request.QueryString["dsctom"];
                string dsctop = Request.QueryString["dsctop"];
                string idarea1 = Request.QueryString["idarea1"];
                string idarea2 = Request.QueryString["idarea2"];


                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                    obj.EditarLocalProducto(idlocal, idproducto, idpresentacion, valor,
                        precio, precioindividual, stock, dsctom, dsctop, ruc, usuario_acceso, idarea1,
                        idarea2);
            }

            

            if (Request.QueryString["ope"] == "349")
            {
                string codigo = Request.QueryString["codigo"];
               
                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {
                    respuesta = obj.LoadLocalesByCodigo(ruc, codigo, localcodigo);
                }
            }
            #endregion
            /*-----------------------------  END PRODUCTO           --------------------------*/

            /*-----------------------------  BEGIN CLIENTE      700 --------------------------*/
            #region CLIENTE
            if (Request.QueryString["ope"] == "700")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "701")
            {

                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.Load(ruc, nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "701_1")
            {
                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadAutocomplete(ruc);
                }
            }


            if (Request.QueryString["ope"] == "702")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string tipo_documento = Request.QueryString["tipo_documento"];
                string num_documento = Request.QueryString["num_documento"];
                string nombre = HttpUtility.UrlDecode(Request.QueryString["nombre"]);


                if (tipo_documento == "1")
                {
                    if (num_documento.Length != 8)
                    {
                        respuesta = "El tipo de documento DNI debe contener 8 caracteres!";
                        blnerror = true;
                    }
                }

                if (tipo_documento == "6")
                {
                    if (num_documento.Length != 11)
                    {
                        respuesta = "El tipo de documento RUC debe contener 11 caracteres!";
                        blnerror = true;
                    }
                }


                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string sexo = Request.QueryString["sexo"];
                    string fecha_nacimiento = Request.QueryString["fecha_nacimiento"];

                    string departamento = Request.QueryString["departamento"];
                    string provincia = Request.QueryString["provincia"];
                    string distrito = Request.QueryString["distrito"];
                    string direccion = HttpUtility.UrlDecode(Request.QueryString["direccion"]);
                    string referencia = HttpUtility.UrlDecode(Request.QueryString["referencia"]);
                    string ubigeo = Request.QueryString["ubigeo"];
                    string telefonofijo = Request.QueryString["telefonofijo"];
                    string telefonocelular = Request.QueryString["telefonocelular"];
                    string email = Request.QueryString["email"];
                    string latitud = Request.QueryString["latitud"];
                    string longitud = Request.QueryString["longitud"];

                    using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                    {
                        if (id == "0")
                        {
                            if (obj.ExisteByDocumento(ruc, num_documento))
                                respuesta = "Numero de documento existe!";
                            else
                                obj.Agregar(ruc, nombre, sexo, fecha_nacimiento, tipo_documento, num_documento,
                                        departamento, provincia, distrito, direccion, referencia, ubigeo,
                                        telefonofijo, telefonocelular, email, latitud, longitud, "","","", "0", "");
                        }
                        else
                            if (obj.ExisteByDocumentoEditar(ruc, id, num_documento))
                            respuesta = "Numero de documento existe!";
                        else
                            obj.Editar(id, nombre, sexo, fecha_nacimiento, tipo_documento, num_documento,
                                departamento, provincia, distrito, direccion, referencia, ubigeo,
                                telefonofijo, telefonocelular, email, latitud, longitud, "", "","", "0", "");

                    }
                }
            }

            if (Request.QueryString["ope"] == "703")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    obj.Eliminar(id);
                }
            }


            if (Request.QueryString["ope"] == "710")
            {
                string tipo = Request.QueryString["tipo"];
                string numero = Request.QueryString["numero"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadByNumero(ruc, tipo, numero).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "711")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.ClienteDireccion obj = new TwoTecnology.Repositorio.ClienteDireccion())
                {
                    respuesta = obj.LoadByCliente(id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "712")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.ClienteDireccion obj = new TwoTecnology.Repositorio.ClienteDireccion())
                {
                    respuesta = obj.LoadByClienteValidateUbigeo(id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "713")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadByCodigo(ruc, id).Serialize();
                }
            }
            #endregion
            /*-----------------------------  END CLIENTE            --------------------------*/

            /*-----------------------------  BEGIN CITAS      730 --------------------------*/
            #region CITAS
            if (Request.QueryString["ope"] == "730")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Citas obj = new TwoTecnology.Repositorio.Citas())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo);
                }
            }


            if (Request.QueryString["ope"] == "731")
            {

                string cliente = Request.QueryString["cliente"];
                string idlocal = Request.QueryString["idlocal"];
                string idestado = Request.QueryString["idestado"];
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();

                using (Repositorio.Citas obj = new TwoTecnology.Repositorio.Citas())
                {
                    respuesta = obj.Load(ruc, idlocal, cliente, idestado, fechainicio, fechafin);
                }
            }


            if (Request.QueryString["ope"] == "732")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string idlocal = Request.QueryString["idlocal"];
                string idcliente = Request.QueryString["idcliente"];
                string idproducto = Request.QueryString["idproducto"];
                string fecha = Request.QueryString["fecha"].ConverTo_YYYYMMDD();
                string horario = Request.QueryString["horario"];
                string estado = Request.QueryString["estado"];
                string observacion = Request.QueryString["observacion"];


                if (idlocal == "0" || string.IsNullOrEmpty(idlocal))
                {
                    respuesta = "Debe seleccionar un  Local!";
                    blnerror = true;
                }

                if (idcliente == "0" || string.IsNullOrEmpty(idcliente))
                {
                    respuesta = "Debe seleccionar un Cliente!";
                    blnerror = true;
                }

                if (idproducto == "0" || string.IsNullOrEmpty(idproducto))
                {
                    respuesta = "Debe seleccionar un Producto!";
                    blnerror = true;
                }


                if (!blnerror)
                {

                    using (Repositorio.Citas obj = new TwoTecnology.Repositorio.Citas())
                    {
                        if (id == "0")
                            obj.Agregar(idlocal, idcliente, idproducto, fecha, horario, estado, observacion, ruc);
                        else
                            obj.Editar(id, idlocal, idcliente, idproducto, fecha, horario, estado, observacion);

                    }
                }
            }

            if (Request.QueryString["ope"] == "733")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Citas obj = new TwoTecnology.Repositorio.Citas())
                {
                    obj.Eliminar(id);
                }
            }


            #endregion
            /*-----------------------------  END Citas            --------------------------*/

            /*-----------------------------  BEGIN EMPLEADO     900 --------------------------*/
            #region EMPLEADO

            if (Request.QueryString["ope"] == "900")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "901")
            {

                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.Load(ruc, nombre,"","", "").Serialize();
                }
            }

            if (Request.QueryString["ope"] == "901_1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string acceso = Request.QueryString["acceso"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadByAcceso(ruc, idlocal, acceso).Serialize();
                }
            }


            

            if (Request.QueryString["ope"] == "904")
            {


                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadDocumento(ruc);
                }
            }

            if (Request.QueryString["ope"] == "905")
            {

                string numero_documento = Request.QueryString["numero_documento"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadNombreByDocumento(ruc, numero_documento);
                }
            }

            if (Request.QueryString["ope"] == "906")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadByArea(codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "907")
            {
                string idarea = Request.QueryString["idarea"];
                string idempleado = Request.QueryString["idempleado"];
                string activo = Request.QueryString["activo"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    obj.AgregarArea(idarea, idempleado, activo);

                }
            }

            #endregion
            /*-----------------------------  END EMPLEADO           --------------------------*/

            /*-----------------------------  BEGIN LOCALES      120 --------------------------*/
            #region LOCALES

            if (Request.QueryString["ope"] == "120")
            {
                string codigo = Request.QueryString["codigo"];
                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                    respuesta = obj.LoadByCodigo(ruc, codigo).Serialize();
            }


            if (Request.QueryString["ope"] == "121")
            {
                string nombre = Request.QueryString["nombre"];
                
                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                {
                    respuesta = obj.Load(ruc, nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "121_1")
            {
                string nombre = Request.QueryString["nombre"];

                if (usuario_acceso == "SuperAdmin")
                {
                    using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                    {
                        respuesta = obj.Load(ruc, nombre).Serialize();
                    }
                }

                if (usuario_acceso == "Cajero" || usuario_acceso == "Administrador")
                {
                    using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                        respuesta = obj.LoadByCodigo(ruc, localcodigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "122")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];

                if (nombre.Length < 3)
                {
                    respuesta = "El nombre debe contener mas de 2 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string departamento = Request.QueryString["departamento"];
                    string provincia = Request.QueryString["provincia"];
                    string distrito = Request.QueryString["distrito"];
                    string direccion = Request.QueryString["direccion"];
                    string ubigeo = Request.QueryString["ubigeo"];
                    string telefono = Request.QueryString["telefono"];
                    string latitud = Request.QueryString["latitud"];
                    string longitud = Request.QueryString["longitud"];
                    string idalmacen = Request.QueryString["idalmacen"];

                    string abreviatura = Request.QueryString["abreviatura"] ?? "";
                    string vtexid = Request.QueryString["vtexid"] ?? "";

                    using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                    {
                        if (id == "0")
                        {
                            if (obj.ExisteByNombre(ruc, nombre))
                                respuesta = "El nombre de Local existe!";
                            else
                                obj.Agregar(ruc, nombre, departamento, provincia, distrito, direccion, ubigeo,
                                    telefono, latitud, longitud, idalmacen, "0", "0", "0","","","","1", "", "",
                                    abreviatura, vtexid);
                        }
                        else
                            obj.Editar(id, nombre, departamento, provincia, distrito, direccion, ubigeo,
                                telefono, latitud, longitud, idalmacen, "0", "0", "0", "", "", "", "1", "", "",
                                abreviatura, vtexid);
                    }
                }
            }

            if (Request.QueryString["ope"] == "123")
            {
                string id = Request.QueryString["id"];
                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                    obj.Eliminar(id);
            }

            /*-----------------------------  END LOCALES --------------------------*/

            /*-----------------------------  BEGIN CONFIGURACION --------------------------*/

            if (Request.QueryString["ope"] == "131")
            {
                string idlocal = Request.QueryString["idlocal"];

                using (Repositorio.Configuracion obj = new TwoTecnology.Repositorio.Configuracion())
                {
                    respuesta = obj.LoadByLocal(ruc, idlocal);
                }
            }

            if (Request.QueryString["ope"] == "131_1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Configuracion obj = new TwoTecnology.Repositorio.Configuracion())
                {
                    respuesta = obj.Load(ruc, idlocal, nombre);
                }
            }

            if (Request.QueryString["ope"] == "131_2")
            {
                string idlocal = Request.QueryString["idlocal"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Configuracion obj = new TwoTecnology.Repositorio.Configuracion())
                {
                    respuesta = obj.LoadTexto(ruc, idlocal, nombre);
                }
            }


            if (Request.QueryString["ope"] == "132")
            {
                //string idlocal = Request.QueryString["idlocal"];
                //string nombre = Request.QueryString["nombre"];
                //string texto = Request.QueryString["texto"];
                //string valor = Request.QueryString["valor"];

                string detalle = HttpUtility.UrlDecode(Request.QueryString["detalle"]);
                List<Entity.Entidad> lista = JsonConvert.DeserializeObject<List<Entity.Entidad>>(detalle);

                using (Repositorio.Configuracion obj = new TwoTecnology.Repositorio.Configuracion())
                {
                    foreach(var item in lista){
                        obj.Editar(ruc, item.idlocal, item.nombre, item.texto, item.valor);
                    }
                }
            }
            #endregion
            /*-----------------------------  END CONFIGURACION      --------------------------*/

            /*-----------------------------  BEGIN SERIES       910 --------------------------*/
            #region SERIES
            if (Request.QueryString["ope"] == "910")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    respuesta = obj.LoadByCodigo(codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "911")
            {
                string localid = Request.QueryString["localid"];
                string serie = Request.QueryString["serie"];

                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    respuesta = obj.Load(localid, serie).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "911_1")
            {
                string localid = Request.QueryString["localid"];
                string serie = Request.QueryString["serie"];

                if (usuario_acceso == "Administrador")
                {

                    using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                    {
                        respuesta = obj.LoadGroupBySerie(localid).Serialize();
                    }
                }

                if (usuario_acceso == "Cajero")
                {
                    List<Entity.Serie> listatmp = new List<Entity.Serie>();

                    listatmp.Add(new Entity.Serie
                    {
                        id = usuario_serie,
                        nombre = usuario_serie
                    });

                    respuesta = listatmp.Serialize();

                    //JavaScriptSerializer serializer = new JavaScriptSerializer();
                    //respuesta = serializer.Serialize(listatmp);
                }
            }

            if (Request.QueryString["ope"] == "911_2")
            {
                string localid = Request.QueryString["localid"];

                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    respuesta = obj.LoadGroupBySerie(localid).Serialize();
                }
            }



           

            if (Request.QueryString["ope"] == "913")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    obj.Eliminar(id);
                }
            }
            #endregion
            /*-----------------------------  END SERIES             --------------------------*/

            /*-----------------------------  BEGIN CAJAS        920 --------------------------*/
            #region CAJAS
            if (Request.QueryString["ope"] == "920")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Caja obj = new TwoTecnology.Repositorio.Caja())
                {
                    respuesta = obj.LoadByCodigo(codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "921")
            {
                string localid = Request.QueryString["localid"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Caja obj = new TwoTecnology.Repositorio.Caja())
                {
                    respuesta = obj.Load(localid, nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "922")
            {
                string localid = Request.QueryString["localid"];
                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string idubicacion = Request.QueryString["idubicacion"];
                string idimpresora = Request.QueryString["idimpresora"];
                string serie = Request.QueryString["serie"];

                using (Repositorio.Caja obj = new TwoTecnology.Repositorio.Caja())
                {
                    if (id == "0")
                    {
                        if (obj.ExisteByNombre(localid, nombre))
                            respuesta = "Nombre de caja existe!";
                        else
                            obj.Agregar(localid, nombre, idubicacion, idimpresora, serie);
                    }
                    else
                        obj.Editar(id, nombre, idubicacion, idimpresora, serie);

                }
            }

            if (Request.QueryString["ope"] == "923")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Caja obj = new TwoTecnology.Repositorio.Caja())
                {
                    obj.Eliminar(id);
                }
            }
            #endregion
            /*-----------------------------  END CAJAS              --------------------------*/

            /*-----------------------------  BEGIN AREAS        960 --------------------------*/
            #region CAJAS
            if (Request.QueryString["ope"] == "960")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Area obj = new TwoTecnology.Repositorio.Area())
                {
                    respuesta = obj.LoadByCodigo(codigo).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "961")
            {
                string localid = Request.QueryString["localid"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Area obj = new TwoTecnology.Repositorio.Area())
                {
                    respuesta = obj.Load(localid, nombre).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "961_1")
            {
                string codigo = Request.QueryString["codigo"];
                string idlocal = Request.QueryString["idlocal"];

                using (Repositorio.Area obj = new TwoTecnology.Repositorio.Area())
                {
                    respuesta = obj.LoadByLocal(codigo, idlocal).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "961_2")
            {
                using (Repositorio.Area obj = new TwoTecnology.Repositorio.Area())
                {
                    respuesta = obj.Load(localcodigo).Serialize();
                }
            }
            
            
            if (Request.QueryString["ope"] == "962")
            {
                string localid = Request.QueryString["localid"];
                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Area obj = new TwoTecnology.Repositorio.Area())
                {
                    if (id == "0")
                    {
                        if (obj.ExisteByNombre(localid, nombre))
                            respuesta = "Nombre de caja existe!";
                        else
                            obj.Agregar(localid, nombre);
                    }
                    else
                        obj.Editar(id, nombre);

                }
            }

            if (Request.QueryString["ope"] == "963")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Area obj = new TwoTecnology.Repositorio.Area())
                {
                    obj.Eliminar(id);
                }
            }


            if (Request.QueryString["ope"] == "964")
            {
                string idarea = Request.QueryString["idarea"];
                string idimpresora = Request.QueryString["idimpresora"];
                string activo = Request.QueryString["activo"];

                using (Repositorio.Area obj = new TwoTecnology.Repositorio.Area())
                {
                    obj.AgregarImpresora(idarea, idimpresora, activo);

                }
            }
            #endregion
            /*-----------------------------  END AREAS              --------------------------*/

            /*-----------------------------  BEGIN PERSONALIZAR     970 --------------------------*/
            #region CAJAS
            if (Request.QueryString["ope"] == "970")
            {
                string idcategoria = Request.QueryString["idcategoria"];

                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    respuesta = obj.LoadByCategoria(idcategoria, ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "970_1")
            {
                string idcategoria = Request.QueryString["idcategoria"];

                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    respuesta = obj.Load(idcategoria, ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "970_2")
            {
                string idproducto = Request.QueryString["idproducto"];

                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    respuesta = obj.LoadByProducto(idproducto, ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "970_3")
            {
                string iddetalle = Request.QueryString["iddetalle"];

                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    respuesta = obj.LoadPersonalizarToppingByDetalle(iddetalle, ruc).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "970_4")
            {
                string iddetalle = Request.QueryString["iddetalle"];

                using (Repositorio.Personalizar obj = new TwoTecnology.Repositorio.Personalizar())
                {
                    respuesta = obj.LoadProductoTopingByDetalle(iddetalle, ruc).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "974")
            {
                string idpersonalizar = Request.QueryString["idpersonalizar"];
                string idcategoria = Request.QueryString["idcategoria"];
                string activo = Request.QueryString["activo"];

                using (Repositorio.CategoriaPersonalizar obj = new TwoTecnology.Repositorio.CategoriaPersonalizar())
                {
                    obj.AgregarCategoria(idpersonalizar, idcategoria, activo);

                }
            }
            #endregion
            /*-----------------------------  END PERSONALIZAR              --------------------------*/


            /*-----------------------------  BEGIN UBICACION    940 --------------------------*/
            #region UBICACION

            if (Request.QueryString["ope"] == "940")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion())
                {
                    respuesta = obj.LoadByCodigo(codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "941")
            {
                string localid = Request.QueryString["localid"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion())
                {
                    respuesta = obj.Load(localid, nombre);
                }
            }

            if (Request.QueryString["ope"] == "941_1")
            {
                string localid = Request.QueryString["localid"];

                using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion())
                {
                    respuesta = obj.LoadByPadre(localid).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "942")
            {
                string localid = Request.QueryString["localid"];
                string id = Request.QueryString["id"];
                string idubicacion = Request.QueryString["idubicacion"];
                string usaalias = Request.QueryString["usaalias"]; 
                string nombre = Request.QueryString["nombre"];
                string minimo = Request.QueryString["minimo"];
                string maximo = Request.QueryString["maximo"];
                string orden = Request.QueryString["orden"];

                using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion())
                {
                    if (id == "0")
                    {
                        if (obj.ExisteByNombre(localid, nombre))
                            respuesta = "Nombre de ubicación existe!";
                        else
                            obj.Agregar(localid, nombre, idubicacion, usaalias, minimo, maximo, orden);
                    }
                    else
                        obj.Editar(id, nombre, idubicacion, usaalias, minimo, maximo, orden);

                }
            }

            if (Request.QueryString["ope"] == "943")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "944")
            {
                string idlocal = Request.QueryString["idlocal"];

                using (Repositorio.Ubicacion obj = new TwoTecnology.Repositorio.Ubicacion())
                {
                    respuesta = obj.LoadByLocal(idlocal, ruc).Serialize();
                }
            }
            #endregion
            /*-----------------------------  END UBICACION          --------------------------*/

            /*-----------------------------  BEGIN IMPRESORAS   950 --------------------------*/
            #region IMPRESORAS

            if (Request.QueryString["ope"] == "950")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Impresora obj = new TwoTecnology.Repositorio.Impresora())
                {
                    respuesta = obj.LoadByCodigo(codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "951")
            {
                string localid = Request.QueryString["localid"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Impresora obj = new TwoTecnology.Repositorio.Impresora())
                {
                    respuesta = obj.Load(localid, nombre);
                }
            }

            if (Request.QueryString["ope"] == "951_1")
            {
                string localid = Request.QueryString["localid"];

                using (Repositorio.Impresora obj = new TwoTecnology.Repositorio.Impresora())
                {
                    respuesta = obj.LoadByLocalImpresion(localid);
                }
            }

            if (Request.QueryString["ope"] == "952")
            {
                string localid = Request.QueryString["localid"];
                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string ip = Request.QueryString["ip"];

                using (Repositorio.Impresora obj = new TwoTecnology.Repositorio.Impresora())
                {
                    if (id == "0")
                    {
                        if (obj.ExisteByNombre(localid, nombre))
                            respuesta = "Nombre de impresora existe!";
                        else
                            obj.Agregar(localid, nombre, ip, "0", "0", "0");
                    }
                    else
                        obj.Editar(id, nombre, ip, "0", "0", "0");

                }
            }

            if (Request.QueryString["ope"] == "953")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Impresora obj = new TwoTecnology.Repositorio.Impresora())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "954")
            {
                string idlocal = Request.QueryString["idlocal"];

                using (Repositorio.Impresora obj = new TwoTecnology.Repositorio.Impresora())
                {
                    respuesta = obj.LoadByLocal(idlocal).Serialize();
                }
            }
            #endregion
            /*-----------------------------  END IMPRESORAS         --------------------------*/

            /*-----------------------------  BEGIN OPERACIONCAJA 930--------------------------*/
            #region  OPERACIONCAJA

            if (Request.QueryString["ope"] == "930")
            {
                string fechainicio = Request.QueryString["fechainicio"];
                string fechafin = Request.QueryString["fechafin"];

                //using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                //{
                //    respuesta = obj.LoadByCodigo(fechainicio, fecha);
                //}
            }

            if (Request.QueryString["ope"] == "931")
            {
                string fechainicio = Request.QueryString["fechainicio"].ToString();

                if (!(fechainicio == "" || fechainicio == "undeed"))
                    fechainicio = fechainicio.ConverTo_YYYYMMDD();
                else
                    fechainicio = string.Empty;


                string fechafin = Request.QueryString["fechafin"].ToString();

                if (!(fechafin == "" || fechafin == "undeed"))
                    fechafin = fechafin.ConverTo_YYYYMMDD();
                else
                    fechafin = string.Empty;


                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    respuesta = obj.Load(ruc, localcodigo, fechainicio, fechafin, "",
                            ((usuario_acceso == "Cajero") ? usuario_nombre : "")).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "932")
            {
                string id = Request.QueryString["id"];
                string efectivoapertura = Request.QueryString["efectivoapertura"];
                string efectivocierre = Request.QueryString["efectivocierre"];
                string tarjetacierre = Request.QueryString["tarjetacierre"];
                string caja = Request.QueryString["caja"];
                string serie = Request.QueryString["serie"];
                string detalle = HttpUtility.UrlDecode(Request.QueryString["detalle"]);
                //usuario_nombre
                List<Entity.Monedero> listamoneda = JsonConvert.DeserializeObject<List<Entity.Monedero>>(detalle);

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    if (id == "0")
                    {
                        if (obj.AperturaExisteByDatos(ruc, caja))
                            respuesta = "La caja esta aperturada, debe cerrarla previamente!";
                        else
                        {
                            string idoperacion = obj.Agregar(ruc, caja, serie, usuario_nombre,
                                efectivoapertura);

                            foreach (var item in listamoneda)
                            {
                                obj.AgregarDetalle(idoperacion, item.moneda, item.tipo,
                                    item.valor, item.cantidad);
                            }
                        }
                    }
                    else
                    {
                        obj.Editar(id, efectivocierre, tarjetacierre);

                        foreach (string line in detalle.Split(';'))
                        {
                            string[] item = line.Split(',');

                            obj.AgregarDetalle(id, item[0], item[1], item[2], item[3]);
                        }
                    }

                }
            }

            if (Request.QueryString["ope"] == "933")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    obj.Eliminar(id);
                }
            }

            //if (Request.QueryString["ope"] == "934")
            //{
            //    string id = Request.QueryString["id"];
            //    string idcaja = Request.QueryString["idcaja"];
                
            //    using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
            //    {
            //        if (usuario_acceso == "Administrador" || obj.UsuarioPermisodeCierre(id, usuario_nombre))
            //        {
            //            respuesta = obj.ExisteDocumentosPendientes_Parcial(ruc, "0", idcaja);

            //            if(respuesta=="")
            //            {
            //                obj.Cierre(id, idcaja);
            //            }
            //        }
            //        else
            //        {
            //            respuesta = "El usuario que intenta cerrar lacaja debe ser un Administrador o en su defecto debe ser el usuario que aperturo la caja!";

            //        }
            //    }
            //}


            //if (Request.QueryString["ope"] == "934")
            //{

            //    using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
            //    {
            //        respuesta= obj.AperturaExisteByCajero(ruc, usuario_nombre);
            //    }
            //}

            if (Request.QueryString["ope"] == "935")
            {
                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    if (usuario_acceso == "Cajero" || usuario_acceso == "Administrador")
                        respuesta = obj.LoadByLocalEmpleado(ruc, localcodigo, usuario_nombre);
                    else
                        respuesta = obj.LoadByLocalEmpleado(ruc, localcodigo, "");//, usuario_nombre);
                }
            }
            #endregion
            /*-----------------------------  END OPERACIONES DE CAJA--------------------------*/

            /*-----------------------------  BEGIN TIPO CAMBIO   800--------------------------*/
            #region TIPO DE CAMBIO

            if (Request.QueryString["ope"] == "800")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.TipoCambio obj = new TwoTecnology.Repositorio.TipoCambio())
                    respuesta = obj.LoadByCodigo(ruc, id).Serialize();
            }

            if (Request.QueryString["ope"] == "801")
            {
                using (Repositorio.TipoCambio obj = new TwoTecnology.Repositorio.TipoCambio())
                    respuesta = obj.Load(ruc).Serialize();
            }

            if (Request.QueryString["ope"] == "802")
            {

                string id = Request.QueryString["id"];
                string fecha = Request.QueryString["fecha"];
                string venta = Request.QueryString["venta"];
                string compra = Request.QueryString["compra"];


                using (Repositorio.TipoCambio obj = new TwoTecnology.Repositorio.TipoCambio())
                {
                    if (id == "0")
                    {
                        //if (obj.ExisteByFecha(ruc, fecha))
                        //    respuesta = "La fecha del tipo de cambio existe!";
                        //else
                        obj.Agregar(ruc, fecha, venta, compra, usuario_nombre);
                    }
                    else
                    {
                        obj.Editar(id, fecha, venta, compra);
                    }

                }
            }

            if (Request.QueryString["ope"] == "803")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.TipoCambio obj = new TwoTecnology.Repositorio.TipoCambio())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "804")
            {


                using (Repositorio.TipoCambio obj = new TwoTecnology.Repositorio.TipoCambio())
                {
                    respuesta = obj.LoadMontoCompraLast(ruc);
                }
            }
            #endregion
            /*-----------------------------  END TIPO CAMBIO        --------------------------*/

            /*-----------------------------  BEGIN PUNTO DE VENTA 810--------------------------*/
            #region PUNTO DE VENTA
            if (Request.QueryString["ope"] == "810")
            {
                using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                    respuesta = obj.LoadListActivo(ruc);
            }

            if (Request.QueryString["ope"] == "810_1")
            {
                using (Repositorio.Almacen obj = new TwoTecnology.Repositorio.Almacen())
                    respuesta = obj.LoadListActivo(ruc, usuario_nombre);
            }



            if (Request.QueryString["ope"] == "811")
            {
                string idalmacen = Request.QueryString["idalmacen"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                    respuesta = obj.LoadByAlmacen(ruc, idalmacen);
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

            if (Request.QueryString["ope"] == "812_1")
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
                string idlocal = Request.QueryString["idlocal"];
                string tipo = Request.QueryString["tipo"];

                using (Repositorio.Categoria obj = new TwoTecnology.Repositorio.Categoria())
                {
                    respuesta = obj.LoadByLocal(ruc, idlocal, "0", tipo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "814")
            {
                string idlocal = Request.QueryString["idlocal"];
                string tipo = Request.QueryString["tipo"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByLocalNombre_v1(ruc, idlocal, tipo, nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "814_1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string tipo = Request.QueryString["tipo"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByLocalNombre_v1(ruc, idlocal, tipo, nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "815")
            {
                string idlocal = Request.QueryString["idlocal"];
                string tipo = Request.QueryString["tipo"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
                {

                    respuesta = obj.LoadByLocalBarra(ruc, idlocal, tipo, nombre).Serialize();
                }
            }



            //if (Request.QueryString["ope"] == "141")
            //{
            //    string idproducto = Request.QueryString["idproducto"];

            //    using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
            //        respuesta = obj.LoadByCodigo(ruc, idproducto);
            //}
            #endregion
            /*-----------------------------  END PUNTO DE VENTA      --------------------------*/

            /*-----------------------------  BEGIN PEDIDO        820 --------------------------*/
            #region PEDIDO
            if (Request.QueryString["ope"] == "820")
            {
                string idpedido = Request.QueryString["idpedido"];
                string orden = Request.QueryString["orden"]  ?? "";

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta = obj.LoadByCodigoWithDetail(idpedido, orden).Serialize();
                }
            }

            

            if (Request.QueryString["ope"] == "820_1")
            {
                string idpedido = Request.QueryString["idpedido"];
                string orden = Request.QueryString["orden"] ?? "";

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                    respuesta = obj.LoadDetail(idpedido, orden).Serialize();
            }

            if (Request.QueryString["ope"] == "820_2")
            {
                string idpedido = Request.QueryString["idpedido"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                    respuesta = obj.LoadByCodigoWithoutDetail(idpedido).Serialize();
            }

            if (Request.QueryString["ope"] == "821")
            {
                string idcaja = Request.QueryString["idcaja"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                    respuesta = obj.LoadByCaja(idcaja);
            }

            if (Request.QueryString["ope"] == "821_1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcaja = Request.QueryString["idcaja"];
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string estado = Request.QueryString["estado"];
                string anulado = Request.QueryString["anulado"];
                string documento = Request.QueryString["documento"];
                string di = Request.QueryString["di"];
                string tipodocumento = Request.QueryString["tipodocumento"];

                if (usuario_acceso == "Administrador" || usuario_acceso == "SuperAdmin" ||
                    usuario_acceso == "Cajero") {

                    if (movil == "1")
                    {
                        using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                        {
                            respuesta = obj.LoadByCajaMobilSinCierreFilter("", "", ruc);
                        }
                    }
                    else
                    {
                        using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                        {
                            respuesta = obj.LoadByCajaSinCierreFilter(
                                idlocal,
                                ((usuario_acceso == "SuperAdmin" || usuario_acceso == "Admin") ? "" : idcaja),
                                fechainicio,
                                fechafin,
                                estado,
                                "",
                                anulado,
                                documento,
                                di,
                                tipodocumento,
                                ruc);
                        }
                    }
                }

            }

            if (Request.QueryString["ope"] == "821_2")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcaja = Request.QueryString["idcaja"];
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string estado = Request.QueryString["estado"];
                string anulado = Request.QueryString["anulado"];
                string documento = Request.QueryString["documento"];
                string di = Request.QueryString["di"];
                string tipodocumento = Request.QueryString["tipodocumento"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta = obj.LoadByCajaConCierreFilter(
                        idlocal,
                        ((usuario_acceso == "Administrador" || usuario_acceso == "SuperAdmin") ? "" : idcaja),
                        fechainicio, fechafin,
                        estado,
                        anulado,
                        documento,
                        di,
                        tipodocumento,
                        ruc);
                }
            }

            if (Request.QueryString["ope"] == "822")
            {
                string codigo = "0";
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                string tipo = Request.QueryString["tipo"];
                string idcaja = Request.QueryString["idcaja"];
                string caja = Request.QueryString["caja"];
                string serie = Request.QueryString["serie"];
                string impresora = Request.QueryString["impresora"];
                string contingencia = Request.QueryString["contingencia"];
                string indicador = string.Empty;

                Entity.Pedido pedido = JsonConvert.DeserializeObject<Entity.Pedido>(json);


                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    if (pedido.id == "0")
                    {
                        codigo = obj.Agregar(ruc, pedido.idlocal, pedido.idcaja, pedido.caja, pedido.serie, pedido.empleado,
                            pedido.idalmacen, pedido.idubicacion, pedido.tipocambio, pedido.tipo, pedido.subtotal,
                            pedido.descuento, pedido.total, pedido.imprimir, pedido.indicador, pedido.moneda);

                        if (contingencia == "1")
                        {
                            indicador = "0";
                        }
                        else
                        {
                            switch (tipo)
                            {
                                case "01":
                                    indicador = "F";
                                    break;
                                case "03":
                                    indicador = "B";
                                    break;
                                case "91":
                                    indicador = "B";
                                    break;
                                case "99":
                                    indicador = "I";
                                    break;
                            }
                        }

                        obj.ActualizarTipo(codigo, tipo, indicador, idcaja, caja, serie, impresora,"0", "0", "","");

                        if (caja.Trim() == "" && serie.Trim() == "")
                        {
                            obj.ActualizarSerie(codigo);
                        }


                        foreach (var item in pedido.pedidodetalle)
                        {
                            obj.AgregarDetalle_v2(codigo, item.idproducto, item.idalmacen, item.cantidad, item.precio, item.subtotal,
                                item.descuento, item.igv, item.isc, item.icb, item.gratuito, item.total, "");
                        }

                        obj.ActualizarCabecera(codigo);
                        respuesta = codigo;
                    }
                    else
                    {
                        codigo = obj.Actualizar(pedido.id, pedido.tipo, pedido.indicador, pedido.subtotal, pedido.descuento,
                            pedido.igv, pedido.isc, pedido.icb, pedido.total, pedido.moneda);

                        if (caja.Trim() == "" && serie.Trim() == "")
                        {
                            obj.ActualizarSerie(codigo);
                        }

                        foreach (var item in pedido.pedidodetalle)
                        {
                            obj.ActualizarDetalle(pedido.id, item.idproducto, item.cantidad, item.precio, item.subtotal,
                                item.descuento, item.igv, item.isc, item.icb, item.gratuito, item.total, "");
                        }

                        obj.ActualizarCabecera(pedido.id);



                        respuesta = pedido.id;
                    }


                }
            }

            if (Request.QueryString["ope"] == "822_0")
            {
                string codigo = "0";
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);

                Entity.Pedido pedido = JsonConvert.DeserializeObject<Entity.Pedido>(json);


                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {

                    codigo = obj.Agregar_VentaNormal(ruc, pedido.idlocal, pedido.idcaja, pedido.caja, pedido.serie, 
                        pedido.correlativo, pedido.empleado,
                        pedido.idalmacen, pedido.idubicacion, pedido.tipocambio, pedido.tipo, pedido.subtotal,
                        pedido.descuento, pedido.total, pedido.totalpago, pedido.totalvuelto, pedido.imprimir,
                        pedido.idcliente, pedido.vendedor, pedido.impresora,
                        pedido.indicador,
                        pedido.fecha.ConverTo_YYYYMMDD() + ' ' + System.DateTime.Now.ToString("HH:mm:ss"),
                        pedido.tiporeferencia, pedido.documentoreferencia,
                        pedido.codigoreferencia, pedido.motivoreferencia,
                        pedido.glosa,
                        pedido.moneda,
                        pedido.formapago
                        );

                    foreach (var item in pedido.pedidodetalle)
                    {
                        obj.AgregarDetalle_Normal(codigo, item.idproducto, item.codigointerno,
                            item.nombre, item.referencia, item.cantidad, item.precio, item.subtotal,
                            item.descuento, item.igv, item.isc, item.icb, item.total, ruc);

                    }

                    foreach (var item in pedido.pedidopago)
                    {
                        obj.AgregarPago(codigo, 
                            item.tipopago, 
                            item.moneda, 
                            item.monto, 
                            item.propina, 
                            item.operacion, 
                            item.fecha.ConverTo_YYYYMMDD());
                    }
                }

                using (Repositorio.Documento doc = new TwoTecnology.Repositorio.Documento())
                {
                    var documento = doc.AgregarVentaNormal(codigo);
                    respuesta = string.Format("{0}|{1}", codigo, documento);
                }
            }

            if (Request.QueryString["ope"] == "822_1")
            {
                string errortexto = string.Empty;
                string idcajaoperacion = string.Empty;
                bool errortipocambio = false;

                string tipocambio = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tipocambio").valor ?? "0";

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {

                    if (obj.AperturaTipoCambioByEmpresa(ruc) == "0" && tipocambio == "1")
                    {
                        switch (usuario_acceso)
                        {
                            case "Administrador":
                                errortexto = "Debe ingresar un tipo de cambio del día";
                                break;
                            case "Cajero":
                                errortexto = "Debe ingresar un tipo de cambio del día";
                                break;
                            case "Mesero":
                                errortexto = "No cuenta por permisos para esta acción";
                                break;
                        }

                        errortipocambio = true;
                    }
                }

                

                if (!errortipocambio)
                {
                    using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                    {
                        switch (usuario_acceso)
                        {
                            case "Cajero":

                                string aperturacaja = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "aperturacaja").valor ?? "0";

                                idcajaoperacion = obj.AperturaExisteByLocalEmpleado(ruc, localcodigo, usuario_nombre);

                                if (idcajaoperacion == "0" && aperturacaja=="1")
                                {
                                    errortexto = "Debe apertura un caja!";
                                }
                                break;

                            case "Mesero":
                                errortexto = "No cuenta por permisos para esta acción";
                                break;
                        }
                    }
                }




                if (!string.IsNullOrEmpty(errortexto))
                {
                    respuesta = errortexto;
                }
                else
                {
                    string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                    Entity.Pedido pedido = JsonConvert.DeserializeObject<Entity.Pedido>(json);

                    if (pedido.opcion == "0") { //opcion==0-->Individual

                        List<Entity.PedidoDetalle> listadetalle = pedido.pedidodetalle;

                        foreach (Entity.PedidoDetalle pedidodetalle in listadetalle)
                        {

                            using (Repositorio.Guia doc = new TwoTecnology.Repositorio.Guia())
                            {
                                respuesta = doc.GenerarPedidoIndividual(pedidodetalle.id, idcajaoperacion, localcodigo, usuario_nombre, ruc);

                                //foreach (var item in pedido.pedidodetalle)
                                //{
                                //    doc.ActualizarIdPedido(item.id, "999");
                                //}
                            }
                        }
                    }
                    else
                    { //opcion==1-->Grupal

                        using (Repositorio.Guia doc = new TwoTecnology.Repositorio.Guia())
                        {
                            foreach (var item in pedido.pedidodetalle)
                            {
                                doc.ActualizarIdPedido(item.id, "-1");
                            }

                            respuesta = doc.GenerarPedidoGrupo("-1", idcajaoperacion, localcodigo, usuario_nombre, ruc);


                        }

                    }
                }
            }

            if (Request.QueryString["ope"] == "822_2")
            {
                string id = Request.QueryString["id"];
                string id2 = Request.QueryString["id"];
                string tipo = Request.QueryString["tipo"];
                string idcaja = Request.QueryString["idcaja"];
                string caja = Request.QueryString["caja"];
                string serie = Request.QueryString["serie"];
                string impresora = Request.QueryString["impresora"];
                string contingencia = Request.QueryString["contingencia"];
                string imprimir = "0";
                string imprimirtmp = "0";

                if (Request.QueryString["imprimir"] != null) {
                    imprimir = Request.QueryString["imprimir"];
                }

                if (Request.QueryString["imprimirtmp"] != null)
                {
                    imprimirtmp = Request.QueryString["imprimirtmp"];
                }

                string indicador = string.Empty;
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                List<Entity.PedidoSimple> listapedidoplato = JsonConvert.DeserializeObject<List<Entity.PedidoSimple>>(json);

                if (contingencia == "1")
                {
                    indicador = "0";
                }
                else
                {
                    switch (tipo)
                    {
                        case "01":
                            indicador = "F";
                            break;
                        case "03":
                            indicador = "B";
                            break;
                        case "91":
                            indicador = "B";
                            break;
                        case "99":
                            indicador = "I";
                            break;
                    }
                }

                if (listapedidoplato.Count > 0)
                {
                    using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                    {
                        id2 = doc.Agregar_VentaPorPlato(id);

                        foreach (var item in listapedidoplato)
                        {
                            doc.AgregarDetalle_PagoPorPlato(id2, item.id);
                            doc.EliminarDetalle_NoComandar(item.id, "PAGOPORPLATO", "AUTOMATICO");
                        }

                        doc.ActualizarCabecera(id2);
                        doc.ActualizarCabecera(id);
                        doc.ActualizarTipo(id2, tipo, indicador, idcaja, caja, serie, impresora, "0", "0", "","");
                    }

                }
                else 
                {
                    using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                    {
                        doc.ActualizarCabecera(id2);
                        doc.ActualizarTipo(id2, tipo, indicador, idcaja, caja, serie, impresora, imprimir , imprimirtmp, "","");
                        
                    }
                }
                

                respuesta = id2;
            }


            if (Request.QueryString["ope"] == "822_3")
            {
                string id = string.Empty;
                string idpedido_origen = Request.QueryString["idpedido_origen"];
                string idpedido_destino = Request.QueryString["idpedido_destino"];
                string idubicacion_origen = Request.QueryString["idubicacion_origen"];
                string idubicacion_destino = Request.QueryString["idubicacion_destino"];

                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                List<Entity.PedidoDetalle> listapedidodetalle = JsonConvert.DeserializeObject<List<Entity.PedidoDetalle>>(json);

                if (idpedido_destino == "0")
                {
                    using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                    {
                        id = doc.Agregar_Transferencia(idpedido_origen, idubicacion_origen, idubicacion_destino);
                    }
                }
                else {

                    using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                    {
                        doc.Update_Transferencia(idpedido_destino, idpedido_origen, idubicacion_origen, idubicacion_destino);
                        
                    }

                    id = idpedido_destino;
                }

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    foreach (Entity.PedidoDetalle detalle in listapedidodetalle) {

                        obj.AgregarDetalle_Transferencia(id, idpedido_origen, detalle.id, idubicacion_origen, idubicacion_destino, usuario_nombre);
                        obj.EliminarDetalle_NoComandar(detalle.id, usuario_nombre, "Transferencia");
                    }
                }

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    doc.Actualizar_Descuentov2(idpedido_origen, "0" );
                    doc.Actualizar_Cabecera_Anulacion(idpedido_origen, idpedido_destino);
                    doc.ActualizarCabecera(idpedido_origen);
                    doc.ActualizarCabecera(idpedido_destino);
                    //doc.ActualizarCabecera(idpedido_origen, ruc);
                    //doc.ActualizarCabecera(id, ruc);

                }


                respuesta = id;
            }

            if (Request.QueryString["ope"] == "822_4")
            {
                string id = Request.QueryString["id"];
                string indicador = Request.QueryString["indicador"];
                string tipo = Request.QueryString["tipo"];
                string idcaja = Request.QueryString["idcaja"];
                string caja = Request.QueryString["caja"];
                string serie = Request.QueryString["serie"];
                string motivoid = Request.QueryString["motivoid"];
                string motivotext = HttpUtility.UrlDecode(Request.QueryString["motivotext"]);

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    doc.ActualizarCabecera(id);
                    doc.ActualizarTipo(id, tipo, indicador, idcaja, caja, serie, "", "0", "0", motivoid, motivotext);

                }
                
                respuesta = id;
            }

            //if (Request.QueryString["ope"] == "822_4")
            //{
            //    string id = Request.QueryString["id"];
            //    string indicador = Request.QueryString["indicador"];
            //    string tipo = Request.QueryString["tipo"];
            //    string idcaja = Request.QueryString["idcaja"];
            //    string caja = Request.QueryString["caja"];
            //    string serie = Request.QueryString["serie"];
            //    string motivoid = Request.QueryString["motivoid"];
            //    string motivotext = HttpUtility.UrlDecode(Request.QueryString["motivotext"]);

            //    using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
            //    {
            //        doc.ActualizarCabecera(id, ruc);
            //        doc.ActualizarTipo(id, tipo, indicador, idcaja, caja, serie, "", "0", motivoid, motivotext);

            //    }

            //    respuesta = id;
            //}


            if (Request.QueryString["ope"] == "822_5")
            {
                string id = Request.QueryString["id"];
                string mesero = Request.QueryString["mesero"];
                
                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarMesero(id, mesero);
                }

                respuesta = id;
            }



            if (Request.QueryString["ope"] == "822_6")
            {
                string idpedido = Request.QueryString["idpedido"];
                string iddetalle = Request.QueryString["iddetalle"];
                string cantidad = Request.QueryString["cantidad"];
                string cantidadoriginal = Request.QueryString["cantidadoriginal"];
                
                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    if (Convert.ToInt32(cantidad) == Convert.ToInt32(cantidadoriginal))
                    {
                        for (int i = 1; i < Convert.ToInt32(cantidad); i++)
                        {
                            var id = obj.AgregarDetalle_Item(iddetalle);
                            obj.ActualizarDetalle_Cantidad_Recalculo(ruc, id, "1");
                        }

                        obj.ActualizarDetalle_Cantidad_Recalculo(ruc, iddetalle, "1");
                    }
                    else {

                        for (int i = 1; i <= Convert.ToInt32(cantidad); i++)
                        {
                            var id = obj.AgregarDetalle_Item(iddetalle);
                            obj.ActualizarDetalle_Cantidad_Recalculo(ruc, id, "1");
                        }

                        var nuevacantidad = Convert.ToInt32(cantidadoriginal) - Convert.ToInt32(cantidad);
                        obj.ActualizarDetalle_Cantidad_Recalculo(ruc, iddetalle, nuevacantidad.ToString());
                    }

                    using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                    {
                        doc.Actualizar_Descuentov2(idpedido, "0");
                        //doc.ActualizarCabecera(idpedido, ruc);
                    }
                }

                respuesta = iddetalle;
            }


            if (Request.QueryString["ope"] == "822_7")
            {
                string id = Request.QueryString["id"];
                string id2 = Request.QueryString["id2"];

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    //doc.AgregarDetalle_Transfer(id, id2);
                    doc.EliminarDetalle_PagoporPlato(id, "PAGOPORPLATO-EXT", usuario_nombre);
                    doc.Eliminar(id , "PAGOPORPLATO-EXT", usuario_nombre );
                    
                    doc.RemoverEliminar_Detalle_PagoporPlato(id, "PAGOPORPLATO-DEV", usuario_nombre);

                    doc.ActualizarCabecera(id2);
                }

                respuesta = id;
            }

            if (Request.QueryString["ope"] == "822_8")
            {
                string idpedido_destino = string.Empty;
                string idpedido_origen = Request.QueryString["idpedido_origen"];
                string idubicacion = Request.QueryString["idubicacion"];
                
                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    idpedido_destino = doc.Agregar_Regeneracion(idpedido_origen, idubicacion);
                    doc.AgregarDetalle_Regeneracion(idpedido_origen, idpedido_destino);
                    doc.Actualizar_Regeneracion(idpedido_origen, idpedido_destino);
                }

                respuesta = idpedido_destino;
            }

            if (Request.QueryString["ope"] == "822_9")
            {
                string id = Request.QueryString["id"];
                string motorizado = Request.QueryString["motorizado"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarMotorizado(id, motorizado);
                }

                respuesta = id;
            }

            if (Request.QueryString["ope"] == "822_10")
            {
                string id = string.Empty;
                string idpedido = Request.QueryString["idpedido"];

                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                List<Entity.PedidoDetalle> listapedidodetalle = JsonConvert.DeserializeObject<List<Entity.PedidoDetalle>>(json);

              

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.EliminarDetalle_Cortesia(idpedido);

                    foreach (Entity.PedidoDetalle detalle in listapedidodetalle)
                    {
                        obj.AgregarDetalle_Cortesia(idpedido, detalle.id);
                    }
                }


                respuesta = id;
            }

            if (Request.QueryString["ope"] == "822_11")
            {
                string idpedidodetalle = Request.QueryString["idpedidodetalle"];

               
                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.RemoverDetalle_Cortesia(idpedidodetalle);
                }
            }

            if (Request.QueryString["ope"] == "822_12")
            {
                string id = Request.QueryString["id"];


                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta = obj.LoadHaderByCodigo(id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "823")
            {
                string idpedidodetalle = "0";
                string idpedido = Request.QueryString["idpedido"];
                string idproducto = Request.QueryString["idproducto"];
                string idalmacen = Request.QueryString["idalmacen"];
                string cantidad = Request.QueryString["cantidad"];
                string precio = Request.QueryString["precio"];
                string subtotal = Request.QueryString["subtotal"];
                string descuento = Request.QueryString["descuento"];
                string igv = Request.QueryString["igv"];
                string isc = Request.QueryString["isc"];
                string icb = Request.QueryString["icb"];
                string gratuito = Request.QueryString["gratuito"];
                string total = Request.QueryString["total"];
                string referencia = Request.QueryString["referencia"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    idpedidodetalle = obj.AgregarDetalle_v2(idpedido, idproducto, idalmacen, cantidad, precio, subtotal,
                        descuento, igv, isc, icb, gratuito, total, referencia);

                    obj.ActualizarCabecera(idpedido);
                }

                respuesta = idpedidodetalle;
            }

            if (Request.QueryString["ope"] == "823_1")
            {
                string idpedidodetalle = "0";
                string idpedido = Request.QueryString["idpedido"];
                string idproducto = Request.QueryString["idproducto"];
                string idalmacen = Request.QueryString["idalmacen"];
                string cantidad = Request.QueryString["cantidad"];
                string precio = Request.QueryString["precio"];
                string subtotal = Request.QueryString["subtotal"];
                string descuento = Request.QueryString["descuento"];
                string igv = Request.QueryString["igv"];
                string isc = Request.QueryString["isc"];
                string icb = Request.QueryString["icb"];
                string total = Request.QueryString["total"];
                string gratuito = Request.QueryString["gratuito"];
                string referencia = Request.QueryString["referencia"] ?? "";

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    idpedidodetalle = obj.AgregarDetalle_v2(idpedido, idproducto, idalmacen, cantidad, precio, subtotal,
                        descuento, igv, isc, icb, gratuito, total, referencia);

                    obj.ActualizarCabecera(idpedido);
                }

                respuesta = idpedidodetalle;
            }

            if (Request.QueryString["ope"] == "823_2")
            {
                string idpedidodetalle = "0";
                string idpedido = Request.QueryString["idpedido"];
                string idproducto = Request.QueryString["idproducto"];
                string idalmacen = Request.QueryString["idalmacen"];
                string cantidad = Request.QueryString["cantidad"];
                string precio = Request.QueryString["precio"];
                string subtotal = Request.QueryString["subtotal"];
                string descuento = Request.QueryString["descuento"];
                string igv = Request.QueryString["igv"];
                string isc = Request.QueryString["isc"];
                string icb = Request.QueryString["icb"];
                string total = Request.QueryString["total"];
                string gratuito = Request.QueryString["gratuito"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    idpedidodetalle = obj.AgregarDetalle_v3(idpedido, idproducto, idalmacen, cantidad, precio, subtotal,
                        descuento, igv, isc, icb, gratuito, total);

                    obj.ActualizarCabecera(idpedido);
                }

                respuesta = idpedidodetalle;
            }

            if (Request.QueryString["ope"] == "824")
            {
                string idpedido = Request.QueryString["idpedido"];
                string idpedidodetalle = Request.QueryString["idpedidodetalle"];

                string anulacion = string.Empty;
                if (!(Request.QueryString["anulacion"] == null)) {
                    anulacion = HttpUtility.UrlDecode(Request.QueryString["anulacion"]);
                }

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.EliminarDetalle(idpedidodetalle, usuario_acceso, anulacion);
                    obj.ActualizarCabecera(idpedido);
                }


            }

            if (Request.QueryString["ope"] == "824_1")
            {
                string id = Request.QueryString["id"];
                string idproducto = Request.QueryString["idproducto"];

                string anulacion = string.Empty;
                if (!(Request.QueryString["anulacion"] == null))
                {
                    anulacion = HttpUtility.UrlDecode(Request.QueryString["anulacion"]);
                }

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.EliminarDetalle(id, idproducto, usuario_acceso, anulacion);
                    obj.ActualizarCabecera(id);
                }
            }

            if (Request.QueryString["ope"] == "824_2")
            {
                string idpedido = Request.QueryString["idpedido"];
                string idproducto = Request.QueryString["idproducto"];

                string anulacion = string.Empty;

                if (!(Request.QueryString["anulacion"] == null))
                {
                    anulacion = HttpUtility.UrlDecode(Request.QueryString["anulacion"]);
                }

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.EliminarDetalle(idpedido, idproducto, usuario_acceso, anulacion);
                    obj.ActualizarCabecera(idpedido);
                }
            }

            if(Request.QueryString["ope"] == "824_3")
            {
                string idpedido = Request.QueryString["idpedido"];
                string iddetalle = Request.QueryString["iddetalle"];

                string anulacion = string.Empty;

                if (!(Request.QueryString["anulacion"] == null))
                {
                    anulacion = HttpUtility.UrlDecode(Request.QueryString["anulacion"]);
                }

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.EliminarDetalle_v2(idpedido, iddetalle, usuario_acceso, anulacion);
                    obj.ActualizarCabecera(idpedido);
                }
            }

            if (Request.QueryString["ope"] == "825")
            {
                string id = Request.QueryString["id"];
                string impresora = string.Empty;
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                string iddetalle = string.Empty;


                if (json != null)
                {
                    List<Entity.PedidoCliente> listapedido = JsonConvert.DeserializeObject<List<Entity.PedidoCliente>>(json);
                    iddetalle = string.Join(",", listapedido.Select(c => c.id));
                }

                if (Request.QueryString["impresora"]!=null)
                    impresora= HttpUtility.UrlDecode(Request.QueryString["impresora"]);

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarPrecuenta(id, impresora, iddetalle);
                }

                //System.Threading.Thread.Sleep(sleep);
            }


            if (Request.QueryString["ope"] == "825_1")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    doc.ActualizarComanda(id);
                }
                //System.Threading.Thread.Sleep(sleep);
            }

            if (Request.QueryString["ope"] == "825_1_1")//***
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta=doc.TieneItemsPorComandar(id);
                }
            }

            if (Request.QueryString["ope"] == "825_1_2") //**
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta = doc.EstaCerrado(id);
                }
            }

            if (Request.QueryString["ope"] == "825_1_3")//**
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta = doc.EstaAnulado(id);
                }
            }

            if (Request.QueryString["ope"] == "825_1_4")//**
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta = doc.ValidaPedido(id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "825_2")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    doc.ActualizarComandaDetalle(id);
                }

                //System.Threading.Thread.Sleep(sleep);
            }

            if (Request.QueryString["ope"] == "825_3")
            {
                string id = Request.QueryString["id"];
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                List<Entity.PedidoCliente> listapedido = JsonConvert.DeserializeObject <List<Entity.PedidoCliente>>(json);
                string iddetalle = string.Join(",", listapedido.Select(c => c.id));


                using (Repositorio.Pedido doc = new TwoTecnology.Repositorio.Pedido())
                {
                    doc.ActualizarComandaTodos(id, iddetalle);
                }

                //System.Threading.Thread.Sleep(sleep);
            }

            if (Request.QueryString["ope"] == "825_4")
            {
                string id = Request.QueryString["id"];
                string idcaja = Request.QueryString["idcaja"];
                string di = Request.QueryString["di"];
                string fechacierre = Request.QueryString["fechacierre"].ToString();

                string imprimirdocumento = Request.QueryString["imprimirdocumento"].ToString();
                string imprimirproducto = Request.QueryString["imprimirproducto"].ToString();


                if (fechacierre == "")
                {
                    using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                    {
                        obj.Cierre_Tmp(id, idcaja);
                    }
                }

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    obj.ActualizarImpresion(id, imprimirdocumento, imprimirproducto, di);
                }

            }

            if (Request.QueryString["ope"] == "826")
            {
                string id = Request.QueryString["id"];
                string iddetalle = Request.QueryString["iddetalle"];
                string idproducto = Request.QueryString["idproducto"];
                string cantidad = Request.QueryString["cantidad"];
                string subtotal = Request.QueryString["subtotal"];
                string igv = Request.QueryString["igv"];
                string total = Request.QueryString["total"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    if(iddetalle=="0")
                        obj.ActualizarDetalle_Cantidad(id, idproducto, cantidad, subtotal, igv, total);
                    else 
                        obj.ActualizarDetalle_Cantidad(iddetalle, cantidad, subtotal, igv, total);


                    obj.ActualizarCabecera(id);
                }
            }

            if (Request.QueryString["ope"] == "826_1")
            {
                string id = Request.QueryString["id"];
                string iddetalle = Request.QueryString["iddetalle"];
                string descuento = Request.QueryString["descuento"];
                string gratuito = Request.QueryString["gratuito"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarDetalle_Descuento(iddetalle, descuento, gratuito);
                    obj.ActualizarCabecera(id);
                }
            }

            if (Request.QueryString["ope"] == "826_2")
            {
                string id = Request.QueryString["id"];
                string descuento = Request.QueryString["descuento"];
                string total = Request.QueryString["total"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.Actualizar_Descuento(id, descuento, total);
                    //obj.ActualizarCabecera(id);
                }
            }

            if (Request.QueryString["ope"] == "826_1_1")
            {
                string id = Request.QueryString["id"];
                string iddetalle = Request.QueryString["iddetalle"];
                string descuento = Request.QueryString["descuento"];
                string porcentaje = Request.QueryString["porcentaje"];
                string gratuito = Request.QueryString["gratuito"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarDetalle_Descuento_v2(iddetalle, descuento, porcentaje, gratuito);
                    obj.ActualizarCabecera(id);
                }
            }

            if (Request.QueryString["ope"] == "826_3")
            {
                string id = Request.QueryString["id"];
                string idproducto = Request.QueryString["idproducto"];
                string descuento = Request.QueryString["descuento"];
                string igv = Request.QueryString["igv"];
                string total = Request.QueryString["total"];
                string gratuito = Request.QueryString["gratuito"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarDetalle_Descuento(id, idproducto, descuento, igv, gratuito, total);
                    obj.ActualizarCabecera(id);
                }
            }


            if (Request.QueryString["ope"] == "826_4")
            {
                string id = Request.QueryString["id"];
                string iddetalle = Request.QueryString["iddetalle"];
                string precio = Request.QueryString["precio"];
                
                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarDetalle_Precio(iddetalle, precio, usuario_nombre);
                    obj.ActualizarCabecera(id);
                }
            }

            if (Request.QueryString["ope"] == "826_5")
            {
                string id = Request.QueryString["id"];
                string iddetalle = Request.QueryString["iddetalle"];
                string idproducto = Request.QueryString["idproducto"];
                string referencia = Request.QueryString["referencia"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    if(iddetalle=="0")
                        obj.ActualizarDetalle_Referencia(id, idproducto, referencia);
                    else 
                        obj.ActualizarDetalle_Referencia(iddetalle, referencia);

                }
            }

            

            if (Request.QueryString["ope"] == "827")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.PedidoCliente pedido = JsonConvert.DeserializeObject<Entity.PedidoCliente>(json);

                string correlativoexterno = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "correlativoexterno").valor;


                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    if (obj.EnTransaccion(pedido.id))
                    {
                        obj.ActualizarPedido(
                            pedido.id, 
                            pedido.tipo, 
                            pedido.idcliente, 
                            pedido.tipocliente,
                            pedido.numerodocumento,
                            pedido.nombre, 
                            pedido.direccion, 
                            pedido.referencia,
                            pedido.departamento, 
                            pedido.provincia, 
                            pedido.distrito,
                            pedido.telefonofijo, 
                            pedido.telefonocelular, 
                            pedido.email,
                            pedido.totalefectivo, 
                            pedido.vuelto,
                            pedido.imprimir,
                            
                            pedido.glosa,
                            ((pedido.formapagotexto == "") ? "Contado" : pedido.formapagotexto),
                            pedido.impresora,
                            pedido.vendedor,
                            pedido.pagoconsumo,
                            pedido.tipocambio,
                            pedido.ordencompra,
                            pedido.numeroguia,
                            ""
                            );

                        foreach (var item in pedido.pedidopago)
                        {
                            obj.AgregarPago(pedido.id, item.tipopago, item.moneda, item.monto, item.propina, 
                                item.operacion, item.fecha);
                        }

                        foreach (var item in pedido.formapago)
                        {
                            obj.AgregarForma(pedido.id, item.nombre, item.moneda, item.monto, item.fecha);
                        }

                        obj.ActualizarCierre(pedido.id);

                        obj.ActualizarStock(pedido.id);

                        if (correlativoexterno == "1") {
                            obj.ActualizarExterno(pedido.id);

                        }

                        respuesta = "Documento Generado!";
                    }
                    else
                    {
                        respuesta = "Documento en transacción!";
                    }

                }
            }

            if (Request.QueryString["ope"] == "827_9")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.PedidoCliente pedido = JsonConvert.DeserializeObject<Entity.PedidoCliente>(json);


                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    
                    
                    obj.Eliminar_FormaPago(pedido.id);

                    foreach (var item in pedido.formapago)
                    {
                        obj.AgregarForma(pedido.id, item.nombre, item.moneda, item.monto, item.fecha);
                    }

                    //obj.ActualizarCierre(pedido.id);

                    obj.ActualizarStock(pedido.id);

                    respuesta = "Forma de pago actualizado!";
                    

                }
            }

            if (Request.QueryString["ope"] == "827_1")
            {
                string ninos = Request.QueryString["ninos"];
                string adultos = Request.QueryString["adultos"];
                string ancianos = Request.QueryString["ancianos"];
                string hombres = Request.QueryString["hombres"];
                string mujeres = Request.QueryString["mujeres"];
                string personas = Request.QueryString["personas"];
                string idubicacion = Request.QueryString["idubicacion"];
                string empleado = Request.QueryString["empleado"];
                string idlocal = Request.QueryString["idlocal"];
                string entrega = Request.QueryString["entrega"];
                string pagado = Request.QueryString["pagado"];
                string idcaja = Request.QueryString["idcaja"];
                string caja = Request.QueryString["caja"];
                string serie = Request.QueryString["serie"];
                string impresora = Request.QueryString["impresora"];
                string alias = string.Empty;

                if (!(Request.QueryString["alias"] == null))
                    alias = HttpUtility.UrlDecode(Request.QueryString["alias"].ToString());

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {

                    respuesta = obj.AgregarPersonas(idubicacion, ninos, adultos,
                        ancianos, hombres, mujeres, personas, empleado, idlocal,
                        entrega, pagado, alias, idcaja, caja, serie, impresora, 
                        ((usuario_acceso== "Mesero")?empleado:""),"","","00","00","",
                        ruc);
                }
            }

            if (Request.QueryString["ope"] == "827_2")
            {
                string idpedidodetalle = Request.QueryString["idpedidodetalle"];
                string numero = Request.QueryString["numero"];
                string idpersonalizar1 = Request.QueryString["idpersonalizar1"];
                string idpersonalizar2 = Request.QueryString["idpersonalizar2"];
                string idpersonalizar3 = Request.QueryString["idpersonalizar3"];
                string observacion = Request.QueryString["observacion"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {

                    respuesta = obj.AgregarPersonalizacion(idpedidodetalle, numero, 
                        idpersonalizar1, idpersonalizar2, idpersonalizar3, observacion);
                }
            }

            if (Request.QueryString["ope"] == "827_3")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.PedidoCliente pedido = JsonConvert.DeserializeObject<Entity.PedidoCliente>(json);


                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {

                    obj.ActualizarPedido(pedido.id, pedido.tipo, pedido.idcliente, pedido.tipocliente,
                        pedido.numerodocumento,
                        pedido.nombre, pedido.direccion, pedido.referencia,
                        pedido.departamento, pedido.provincia, pedido.distrito,
                        pedido.telefonofijo, pedido.telefonocelular, pedido.email,
                        pedido.totalefectivo, pedido.vuelto,
                        pedido.imprimir, pedido.glosa,
                        ((pedido.formapagotexto == "") ? "Contado": pedido.formapagotexto),
                        "", 
                        "0",
                        "0",
                        "1.00",
                        pedido.ordencompra,
                        pedido.numeroguia,
                        ""
                        ) ;

                    foreach (var item in pedido.pedidopago)
                    {
                        obj.AgregarPago(pedido.id, item.tipopago, item.moneda, item.monto, item.propina, item.operacion, item.fecha);
                    }

                    obj.ActualizarPagado(pedido.id);

                    obj.ActualizarStock(pedido.id);

                    respuesta = "Documento Generado!";

                }
            }


            if (Request.QueryString["ope"] == "827_4")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.PedidoCliente pedido = JsonConvert.DeserializeObject<Entity.PedidoCliente>(json);


                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarVuelto(pedido.id, pedido.vuelto, pedido.totalefectivo);

                    obj.RemoverPago(pedido.id);

                    foreach (var item in pedido.pedidopago)
                    {
                        obj.AgregarPago(pedido.id, item.tipopago, item.moneda, item.monto, item.propina, item.operacion, item.fecha);
                    }

                    obj.ActualizarPagado(pedido.id);

                    respuesta = "Documento Generado!";

                }
            }

            if (Request.QueryString["ope"] == "827_5")
            {
                string id = Request.QueryString["id"];
                string columnas = Request.QueryString["columnas"];


                using (servicioImpresionPedido.DocumentoPedidoClient doc = new servicioImpresionPedido.DocumentoPedidoClient())
                {
                    var documento = doc.ObtenerTextoByCodigo(id, "48");

                    respuesta = documento;
                }
            }

            if (Request.QueryString["ope"] == "827_6")
            {
                string idpedidodetalle = Request.QueryString["idpedidodetalle"];
                string entrada = Request.QueryString["entrada"];
                string observacion = Request.QueryString["observacion"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.AgregarEntradaObservacion(idpedidodetalle, entrada, observacion);
                }
            }

            if (Request.QueryString["ope"] == "827_7")
            {
                string iddetalle = Request.QueryString["iddetalle"];
                

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta= obj.LoadDetalleEntrada(iddetalle).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "827_8")
            {

                string idpedido = Request.QueryString["idpedido"];
                string iddetraccion = Request.QueryString["iddetraccion"];
                string tipocambiodetraccion = new TwoTecnology.Repositorio.TipoCambio().LoadMontoCompraLast(ruc);

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.AgregarDetraccion(idpedido, iddetraccion, tipocambiodetraccion);
                    respuesta = "1";
                }
            }

            if (Request.QueryString["ope"] == "828")
            {
                string id = Request.QueryString["id"];
                string impresora = Request.QueryString["impresora"] ?? "";

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarImpresion(id, impresora);
                }
            }

            if (Request.QueryString["ope"] == "828_1")
            {
                string id = Request.QueryString["id"];
                string ancianos = Request.QueryString["ancianos"];
                string adultos = Request.QueryString["adultos"];
                string ninos = Request.QueryString["ninos"];
                string hombres = Request.QueryString["hombres"];
                string mujeres = Request.QueryString["mujeres"];
                string personas = Request.QueryString["personas"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarPersonas(id, ancianos, adultos, ninos, hombres, 
                        mujeres, personas);
                }
            }

            if (Request.QueryString["ope"] == "828_2")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.ActualizarPagado(id);
                }
            }

            if (Request.QueryString["ope"] == "829")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    obj.Eliminar(id,"",usuario_nombre);
                }
            }

            if (Request.QueryString["ope"] == "829_1")
            {
                string numerooperacion = Request.QueryString["numerooperacion"];
                
                using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
                {
                    respuesta= obj.LoadByNumeroOperacion(ruc, numerooperacion);
                }
            }
            #endregion
            /*-----------------------------  END PEDIDO              --------------------------*/

            /*-----------------------------  BEGIN IMPUESTO       830--------------------------*/
            #region IMPUESTO

            if (Request.QueryString["ope"] == "830")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                    respuesta = obj.LoadByCodigo(ruc, id).Serialize();
            }

            if (Request.QueryString["ope"] == "831")
            {
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    respuesta = obj.Load(ruc, nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "832")
            {

                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string formula = Request.QueryString["formula"];
                string porcentaje = Request.QueryString["porcentaje"];
                string monto = Request.QueryString["monto"];
                string operacioncodigo = Request.QueryString["operacioncodigo"];
                string tributocodigo = Request.QueryString["tributocodigo"];
                string tributonombre = Request.QueryString["tributonombre"];
                string tributocode = Request.QueryString["tributocode"];
                string rango = Request.QueryString["rango"];


                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    if (id == "0")
                        if (obj.ExisteByNombre(ruc, nombre))
                            respuesta = "El impuesto existe!";
                        else
                            obj.Agregar(nombre, formula, porcentaje, monto, operacioncodigo, tributocodigo,
                                tributonombre, tributocode, rango, "0", "0", "0", "", ruc);
                    else
                        obj.Editar(id, nombre, formula, porcentaje, monto, operacioncodigo, tributocodigo,
                                tributonombre, tributocode, rango, "0", "0", "0", "");

                }
            }

            if (Request.QueryString["ope"] == "833")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    obj.Eliminar(id);
                }
            }
            #endregion
            /*-----------------------------  END IMPUESTO            --------------------------*/

            /*-----------------------------  BEGIN PRODUC IMP    840 --------------------------*/
            #region BEGIN PRODUC IMP

            if (Request.QueryString["ope"] == "840")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    respuesta = obj.LoadImpuestoProducto(id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "841")
            {
                string productoid = Request.QueryString["productoid"];

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    respuesta = obj.LoadByProducto(productoid).Serialize();
                }
            }



            if (Request.QueryString["ope"] == "842")
            {
                string id = Request.QueryString["id"];
                string idimpuesto = Request.QueryString["idimpuesto"];
                string idproducto = Request.QueryString["idproducto"];
                string orden = Request.QueryString["orden"];

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    if (id == "0")
                    {
                        if (obj.ExisteByImpuestoProducto(idproducto, idimpuesto))
                            respuesta = "El impuesto ya esta vinculado al prodcuto!";
                        else
                            obj.AgregarImpuestoProducto(idproducto, idimpuesto, orden);
                    }
                    else
                    {
                        obj.EditarImpuestoProducto(id, orden);
                    }
                }
            }

            if (Request.QueryString["ope"] == "843")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Impuesto obj = new TwoTecnology.Repositorio.Impuesto())
                {
                    obj.EliminarImpuestoProducto(id);
                }
            }
            #endregion
            /*-----------------------------  END BEGIN PRODUC IMP    --------------------------*/


            /*-----------------------------  BEGIN GUIA DE REMISION 850 --------------------------*/
            #region GUIA DE REMISION
            if (Request.QueryString["ope"] == "850")
            {
                string idguia = Request.QueryString["idguia"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                    respuesta = obj.LoadByCodigoWithDetail(idguia).Serialize();
            }

            



            if (Request.QueryString["ope"] == "851")
            {
                string idcaja = Request.QueryString["idcaja"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                    respuesta = obj.LoadByCaja(idcaja);
            }

            if (Request.QueryString["ope"] == "851_1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string estado = Request.QueryString["estado"];
                string anulado = Request.QueryString["anulado"];
                string externo = Request.QueryString["externo"];
                string detalle = Request.QueryString["detalle"];

               
                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    respuesta = obj.LoadByLocalFilter(idlocal, fechainicio, fechafin,
                        estado,
                        usuario_codigo,
                        usuario_acceso,
                        usuario_nombre, 
                        anulado, 
                        "", 
                        "0", 
                        externo, 
                        detalle, 
                        ruc).Serialize();
                }
            }



            if (Request.QueryString["ope"] == "852")
            {
                string codigo = "0";
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);

                Entity.Guia guia = JsonConvert.DeserializeObject<Entity.Guia>(json);


                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    if (guia.id == "0")
                    {
                        codigo = obj.Agregar(ruc, guia.idlocal, guia.serie, guia.empleado, guia.idalmacen,
                            guia.tipo, guia.total, guia.imprimir);

                        foreach (var item in guia.guiadetalle)
                        {
                            obj.AgregarDetalle(codigo, item.idproducto, item.cantidad, item.precio, item.total);
                        }

                        respuesta = codigo;
                    }
                    else
                    {

                        codigo = obj.Actualizar(guia.id, guia.tipo, guia.total);

                        foreach (var item in guia.guiadetalle)
                        {
                            obj.ActualizarDetalle(guia.id, item.idproducto, item.cantidad, item.precio, item.total);
                        }

                        respuesta = codigo;
                    }
                }
            }

            if (Request.QueryString["ope"] == "852_1")
            {

                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.Guia guia = JsonConvert.DeserializeObject<Entity.Guia>(json);

                if (guia.opcion == "0")
                { //opcion==0-->Individual

                    List<Entity.GuiaDetalle> listadetalle = guia.guiadetalle;

                    foreach (Entity.GuiaDetalle guiadetalle in listadetalle)
                    {

                        using (Repositorio.Pedido pedido = new TwoTecnology.Repositorio.Pedido())
                        {
                            //respuesta = pedido.GenerarPedidoIndividual(pedidodetalle.id, idcajaoperacion, localcodigo, usuario_nombre, ruc);
                            respuesta = pedido.GenerarGuiaIndividual(guiadetalle.id, localcodigo, usuario_nombre, ruc);
                            //foreach (var item in pedido.pedidodetalle)
                            //{
                            //    doc.ActualizarIdPedido(item.id, "999");
                            //}
                        }
                    }
                }
                else
                { //opcion==1-->Grupal

                    using (Repositorio.Pedido pedido = new TwoTecnology.Repositorio.Pedido())
                    {
                        foreach (var item in guia.guiadetalle)
                        {
                            pedido.ActualizarIdGuia(item.id, "-2");
                        }

                        //respuesta = doc.GenerarPedidoGrupo("-1", idcajaoperacion, localcodigo, usuario_nombre, ruc);
                        respuesta = pedido.GenerarGuiaGrupal("-2", localcodigo, usuario_nombre, ruc);

                    }

                }
            }

            if (Request.QueryString["ope"] == "853")
            {
                string idpedido = Request.QueryString["idpedido"];
                string idproducto = Request.QueryString["idproducto"];
                string cantidad = Request.QueryString["cantidad"];
                string precio = Request.QueryString["precio"];
                string total = Request.QueryString["total"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.AgregarDetalle(idpedido, idproducto, cantidad, precio, total);
                }
            }

            if (Request.QueryString["ope"] == "854")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.EliminarDetalle(id);
                }
            }

            if (Request.QueryString["ope"] == "855")
            {
                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    if (usuario_acceso == "Cajero")
                        respuesta = obj.LoadByLocalEmpleado(ruc, localcodigo, usuario_nombre);
                    else
                        respuesta = obj.LoadByLocalEmpleado(ruc, localcodigo, "");
                }
            }

            if (Request.QueryString["ope"] == "856")
            {
                string id = Request.QueryString["id"];
                string cantidad = Request.QueryString["cantidad"];
                string total = Request.QueryString["total"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.ActualizarDetalle(id, cantidad, total);
                }
            }


            if (Request.QueryString["ope"] == "857")
            {
                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.GuiaCliente guia = JsonConvert.DeserializeObject<Entity.GuiaCliente>(json);


                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {

                    if (obj.EnTransaccion(guia.id))
                    {
                        obj.ActualizarGuia(guia.id, guia.tipo, guia.idmotivo, guia.unidad, guia.cantidad, 
                            guia.bultos, guia.idtransporte, guia.idconductor , "","","", "","","","0", "","","0");

                        respuesta = "Documento Generado!";
                    }
                    else
                    {
                        respuesta = "Documento en transacción!";
                    }

                }
            }

            if (Request.QueryString["ope"] == "858")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.ActualizarImpresion(id);
                }
            }

            if (Request.QueryString["ope"] == "859")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Guia obj = new TwoTecnology.Repositorio.Guia())
                {
                    obj.Eliminar(id);
                }
            }

            //if (Request.QueryString["ope"] == "828")
            //{
            //    string codigo = Request.QueryString["id"];
            //    string tipo = Request.QueryString["tipo"];
            //    string json = HttpUtility.UrlDecode(Request.QueryString["json"]);

            //    Entity.Pedido pedido = JsonConvert.DeserializeObject<Entity.Pedido>(json);


            //    using (Repositorio.Pedido obj = new TwoTecnology.Repositorio.Pedido())
            //    {
            //        if (tipo == "01" || tipo == "03")
            //        {
            //            string indicador = (tipo == "01") ? "F" : "B";

            //            using (Repositorio.Documento doc = new TwoTecnology.Repositorio.Documento())
            //            {
            //                if (codigo != "0")
            //                {
            //                    doc.Agregar(codigo, tipo, indicador);
            //                }
            //            }
            //        }
            //    }
            //}
            #endregion
            /*-----------------------------  END GUIA DE REMISION --------------------------*/

            if (Request.QueryString["ope"] == "860_1")
            {
                string codigo = Request.QueryString["codigo"];
                string idlocal = Request.QueryString["idlocal"];

                using (Repositorio.Perfil obj = new TwoTecnology.Repositorio.Perfil())
                {
                    respuesta = obj.LoadByLocal(codigo, idlocal).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "864")
            {
                string idperfil = Request.QueryString["idperfil"];
                string idarchivador = Request.QueryString["idarchivador"];
                string ver = Request.QueryString["ver"];
                string crear = Request.QueryString["crear"];
                string editar = Request.QueryString["editar"];
                string eliminar = Request.QueryString["eliminar"];

                using (Repositorio.Perfil obj = new TwoTecnology.Repositorio.Perfil())
                {
                    obj.AgregarArchivador(idperfil, idarchivador, ver, crear, editar, eliminar);

                }
            }

            if (Request.QueryString["ope"] == "501")
            {
                using (Repositorio.Puntos obj = new TwoTecnology.Repositorio.Puntos())
                {
                    respuesta = obj.Load(ruc);
                }
            }

            if (Request.QueryString["ope"] == "502")
            {
                using (Repositorio.Puntos obj = new TwoTecnology.Repositorio.Puntos())
                {
                    respuesta = obj.LoadMesa(ruc, puntosid);
                }
            }

            if (Request.QueryString["ope"] == "503")
            {
                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadByRol(ruc, "Mesero");
                }
            }


            if (Request.QueryString["ope"] == "704")
            {


                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadDocumento(ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "705")
            {

                string numero_documento = Request.QueryString["numero_documento"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadNombreByDocumento(ruc, numero_documento);
                }
            }

            if (Request.QueryString["ope"] == "705_1")
            {

                string numero_documento = Request.QueryString["numero_documento"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadCodigoByDocumento(ruc, numero_documento);
                }
            }

            if (Request.QueryString["ope"] == "706")
            {


                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadNombre(ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "707")
            {

                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadDocumentoByNombre(ruc, nombre);
                }
            }

            if (Request.QueryString["ope"] == "708")
            {

                string tipo = Request.QueryString["tipo"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadDocumentoByTipoDocu(ruc, tipo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "709")
            {
                string tipo = Request.QueryString["tipo"];

                using (Repositorio.Cliente obj = new TwoTecnology.Repositorio.Cliente())
                {
                    respuesta = obj.LoadNombreByTipoDocu(ruc, tipo).Serialize();
                }
            }

           

            if (Request.QueryString["ope"] == "914")
            {
                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    string idlocal = Request.QueryString["idlocal"];
                    string tipo = Request.QueryString["tipo"];
                    string indicador = Request.QueryString["indicador"];
                    respuesta = obj.LoadSerie(idlocal, tipo, indicador);
                }
            }



            if (Request.QueryString["ope"] == "914_1")
            {
                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    string idlocal = Request.QueryString["idlocal"];
                    string tipo = Request.QueryString["tipo"];
                    string indicador = Request.QueryString["indicador"];
                    respuesta = obj.LoadSeries(idlocal, tipo, indicador).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "915")
            {
                using (Repositorio.Serie obj = new TwoTecnology.Repositorio.Serie())
                {
                    respuesta = obj.LoadSelect(ruc);
                }
            }

            if (Request.QueryString["ope"] == "981")
            {
                string anio = Request.QueryString["anio"];
                string mes = Request.QueryString["mes"];

                using (TwoTecnology.Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
                {
                    respuesta = obj.Resumen(empresaid, anio, mes);
                }
            }


            if (Request.QueryString["ope"] == "982")
            {   

                using (TwoTecnology.Repositorio.MPEtiqueta obj = new TwoTecnology.Repositorio.MPEtiqueta())
                {
                    respuesta = obj.LoadSelect(ruc).Serialize();
                }
            }


            if (Request.QueryString["ope"] == "2000")
            {
                string rucbusqueda = Request.QueryString["ruc"];

                using (Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
                {
                    respuesta = obj.ConsultaRUC(rucbusqueda);
                }


            }

            if (Request.QueryString["ope"] == "2001")
            {
                string rucbusqueda = Request.QueryString["dni"];

                using (Repositorio.Documento obj = new TwoTecnology.Repositorio.Documento())
                {
                    respuesta = obj.ConsultaDNI(rucbusqueda);
                }

            }

            if (Request.QueryString["ope"] == "2002")
            {
                string numero = base.Request.QueryString["dni"];
                string url = string.Format("https://api.apis.net.pe/v2/reniec/dni?numero={0}", numero);
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                var client = new RestClient(url);
                //client.Authenticator = new OAuth2AuthorizationRequestHeaderAuthenticator("apis-token-3395.fk-GkEjdkkrwWZIO1C9fCYQuqHlRTedK", "Bearer");
                client.Timeout = 10*1000;
                var request = new RestRequest(Method.GET);
                request.Parameters.Clear();
                request.AddHeader("Accept", "application/json");
                request.AddHeader("Authorization", "Bearer " + "apis-token-8291.C3YOD-zuKC8fgN4rL4hqZjaHxVMHswct");
 
                IRestResponse response = client.Execute(request);
                respuesta=response.Content;
            }

            if (Request.QueryString["ope"] == "2003")
            {
                string numero = base.Request.QueryString["ruc"];
                string url = string.Format("https://api.apis.net.pe/v2/sunat/ruc?numero={0}", numero);
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                var client = new RestClient(url);
                //client.Authenticator = new OAuth2AuthorizationRequestHeaderAuthenticator("apis-token-3395.fk-GkEjdkkrwWZIO1C9fCYQuqHlRTedK", "Bearer");
                client.Timeout = 10 * 1000;
                var request = new RestRequest(Method.GET);
                request.Parameters.Clear();
                request.AddHeader("Accept", "application/json");
                request.AddHeader("Authorization", "Bearer " + "apis-token-8291.C3YOD-zuKC8fgN4rL4hqZjaHxVMHswct");

                IRestResponse response = client.Execute(request);
                respuesta = response.Content;

            }

            

            if (base.Request.QueryString["ope"] == "3001")
            {
                string periodo = base.Request.QueryString["periodo"];

                using (Repositorio.Reporte obj = new TwoTecnology.Repositorio.Reporte())
                {
                    respuesta = obj.LoadReporte101(empresaid, periodo);
                }
            }

           
            //if (base.Request.QueryString["ope"] == "4001")
            //{
            //    string codigo = Request.QueryString["codigo"];
            //    string nombre = Request.QueryString["nombre"];
            //    string stock = Request.QueryString["stock"];
            //    string precio = Request.QueryString["precio"];
            //    string serie = Request.QueryString["serie"];
            //    string bonificacion = Request.QueryString["bonificacion"];

            //    using (Repositorio.Producto obj = new TwoTecnology.Repositorio.Producto())
            //    {
            //        obj.AgregarMasivo(ruc, codigo, nombre, serie, stock, precio, bonificacion);
            //    }
            //}

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



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