using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Documents;
using TwoTecnology.Entity;


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.OperacionCaja
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
            string empresaruc = ticket.UserData.Split('|')[1];
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
                string localid = Request.QueryString["localid"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Caja obj = new TwoTecnology.Repositorio.Caja())
                {
                    respuesta = obj.Load(localid, nombre).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "01")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Caja obj = new TwoTecnology.Repositorio.Caja())
                {
                    respuesta = obj.LoadSerieByCodigo(codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "02")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    respuesta = obj.LoadByCodigo(codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "03")
            {
                string codigo = Request.QueryString["codigo"];

                using (Repositorio.Caja obj = new TwoTecnology.Repositorio.Caja())
                {
                    respuesta = obj.LoadByCodigo(codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {
                string idlocal = Request.QueryString["idlocal"];
                string idcaja = Request.QueryString["idcaja"];
                string fechainicio = Request.QueryString["fechainicio"].ConverTo_YYYYMMDD();
                string fechafin = Request.QueryString["fechafin"].ConverTo_YYYYMMDD();
                string estado = Request.QueryString["estado"];

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    respuesta = obj.Load(empresaruc, idlocal, idcaja, fechainicio, fechafin, estado,
                                         ((usuario_acceso=="Cajero")? usuario_nombre : "") ).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {
                string id = Request.QueryString["id"];
                string efectivoapertura = Request.QueryString["efectivoapertura"];
                string efectivocierre = Request.QueryString["efectivocierre"];
                string tarjetacierre = Request.QueryString["tarjetacierre"];
                string caja = Request.QueryString["caja"];
                string cajades = string.Empty;
                string serie = Request.QueryString["serie"];
                string idimpresora = Request.QueryString["idimpresora"];
                string detalle = HttpUtility.UrlDecode(Request.QueryString["detalle"]);
                //usuario_nombre
                List<Entity.Monedero> listamoneda = JsonConvert.DeserializeObject<List<Entity.Monedero>>(detalle);

                try
                {
                    using (Repositorio.Caja obj = new TwoTecnology.Repositorio.Caja())
                    {
                        cajades = obj.LoadByCodigo(caja)[0].nombre;
                    }
                }
                catch(Exception ex){ 
                }

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    if (id == "0")
                    {
                        if (obj.AperturaExisteByDatos(empresaruc, caja))
                            respuesta = "La caja esta aperturada, debe cerrarla previamente!";
                        else
                        {

                            if (obj.AperturaExisteByEmpleado(empresaruc, usuario_nombre))
                                respuesta = string.Format( "El empleado {0} tiene la caja aperturada {1}, debe cerrarla previamente para aperturar otra caja!", 
                                    usuario_nombre, cajades);
                            else
                            {
                                id = obj.Agregar(empresaruc, caja, serie, usuario_nombre,
                                efectivoapertura);

                                foreach (var item in listamoneda)
                                {
                                    obj.AgregarDetalle(id, item.moneda, item.tipo,
                                        item.valor, item.cantidad);
                                }
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

                    if (!(idimpresora == "0" || idimpresora == "")) {
                        obj.ActualizarImpresora(id, idimpresora);
                    }

                }

            }


            if (Request.QueryString["ope"] == "2_1")
            {
                string id = Request.QueryString["id"];
                string efectivoapertura = Request.QueryString["efectivoapertura"];
                string idimpresora = Request.QueryString["idimpresora"];

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    obj.EditarCaja(id, efectivoapertura, idimpresora);
                }
                
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];
                string idlocal = Request.QueryString["idlocal"];
                string idcaja = Request.QueryString["idcaja"];
                string tipo = Request.QueryString["tipo"];
                respuesta = string.Empty;


                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    if (usuario_acceso == "Administrador" || obj.UsuarioPermisodeCierre(id, usuario_nombre))
                    {
                        if (tipo == "0")
                        {
                            respuesta = obj.ExisteDocumentosPendientes_Parcial(empresaruc, idlocal, idcaja);

                        }
                        else
                        {
                            respuesta = obj.ExisteDocumentosPendientes_Total(empresaruc, idlocal);
                            
                        }
                    }
                    else
                    {
                        respuesta = "El usuario que intenta cerrar la caja debe ser un Administrador o en su defecto debe ser el usuario que aperturo la caja!";

                    }
                }
            }


            if (Request.QueryString["ope"] == "4")
            {
                string id = Request.QueryString["id"];
                string idlocal = Request.QueryString["idlocal"];
                string idcaja = Request.QueryString["idcaja"];
                string tipo = Request.QueryString["tipo"];
                respuesta = string.Empty;


                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    if (usuario_acceso == "Administrador" || obj.UsuarioPermisodeCierre(id, usuario_nombre))
                    {
                        if (obj.AperturaExisteByDatos(empresaruc, idcaja))
                        {
                            obj.Cierre(id, idlocal, idcaja, tipo, empresaruc);
                        }
                        else {
                            respuesta = "La caja se encuetra cerrada!";
                        }
                    }
                    else
                    {
                        respuesta = "El usuario que intenta cerrar la caja debe ser un Administrador o en su defecto debe ser el usuario que aperturo la caja!";

                    }
                }
            }


            //valida que no existan cajas abiertas al realizar el cierre total
            if (Request.QueryString["ope"] == "5")
            {
                string id = Request.QueryString["id"];
                string idlocal = Request.QueryString["idlocal"];
                string idcaja = Request.QueryString["idcaja"];
                respuesta = string.Empty;


                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    if (usuario_acceso == "Administrador" || obj.UsuarioPermisodeCierre(id, usuario_nombre))
                    {
                        respuesta = obj.ExisteCajasAperturada(idlocal, idcaja);
                    }
                    else
                    {
                        respuesta = "El usuario que intenta cerrar la caja debe ser un Administrador o en su defecto debe ser el usuario que aperturo la caja!";

                    }
                }
            }

            if (Request.QueryString["ope"] == "6")
            {
                string aperturacaja = new TwoTecnology.Repositorio.Configuracion().LoadObject(empresaruc, localcodigo, "aperturacaja").valor;

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    switch (usuario_acceso)
                    {
                        case "Administrador":
                            if (aperturacaja == "1")
                            {
                                var item = obj.AperturaExisteByLocal(empresaruc, localcodigo);

                                if (item.id == "0" || item.id == "")
                                {
                                    respuesta = "Debe existir una caja aperturada en el local!";
                                }
                            }
                            break;

                        case "Cajero":
                            if (aperturacaja == "1")
                            {
                                if (obj.AperturaExisteByLocalEmpleado(empresaruc, localcodigo, usuario_nombre) == "0")
                                {
                                    respuesta = "Debe aperturada una caja!";
                                }
                            }
                            break;


                        case "J.Mozo":
                            if (aperturacaja == "1")
                            {
                                var item = obj.AperturaExisteByLocal(empresaruc, localcodigo);

                                if (item.id == "0" || item.id == "")
                                {
                                    respuesta = "Debe existir una caja aperturada en el local!";
                                }
                            }
                            break;

                        case "Mesero":
                            if (aperturacaja == "1")
                            {
                                var item = obj.AperturaExisteByLocal(empresaruc, localcodigo);

                                if (item.id == "0" || item.id == "")
                                {
                                    respuesta = "Debe existir una caja aperturada en el local!";
                                }
                            }

                            break;
                    }
                }
            }

            if (Request.QueryString["ope"] == "10")
            {
                string idlocal = Request.QueryString["idlocal"];
                string id = Request.QueryString["id"];

                using (TwoTecnology.Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadByCajaOperacion(empresaruc, idlocal, id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "11")
            {
                string idoperacion = Request.QueryString["idoperacion"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    obj.EliminarCajaOperacion(idoperacion);

                }
            }

            if (Request.QueryString["ope"] == "12")
            {
                string idoperacion = Request.QueryString["idoperacion"];
                string idempleado = Request.QueryString["idempleado"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    obj.AgregarCajaOperacion(idoperacion, idempleado);

                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}