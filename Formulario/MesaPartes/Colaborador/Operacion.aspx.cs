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

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.Colaborador
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
            string ipColaborador = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";

            if (Request.QueryString["ope"] == "0" )
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadByCodigo(ruc, id).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {

                string acceso = Request.QueryString["acceso"];
                string nombre = Request.QueryString["nombre"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.Load(ruc, nombre, localcodigo, usuario_acceso, acceso).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "100")
            {

                string idarea = Request.QueryString["idarea"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.Load(ruc, idarea).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "101")
            {

                string idarea = Request.QueryString["idarea"];
                string idempleado = Request.QueryString["idempleado"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadJefatura(ruc, idarea, idempleado).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2_0" && (usuario_acceso == "SuperAdmin" || usuario_acceso == "Administrador"))
            {
                bool blnerror = false;

                string json = HttpUtility.UrlDecode(Request.QueryString["json"]);
                Entity.Empleado empleado = JsonConvert.DeserializeObject<Entity.Empleado>(json);

                string id = empleado.id;
                string nombre = empleado.nombre;
                string apellidos = empleado.apellidos;
                string usuario = empleado.usuario;
                string password = empleado.password;

                if (usuario.Length < 6)
                {
                    respuesta = "El usuario debe contener mas de 6 caracteres!";
                    blnerror = true;
                }

                if (password.Length < 6 && id == "0")
                {
                    respuesta = "La contraseña debe contener mas de 6 caracteres!";
                    blnerror = true;
                }

                if ((password.Length > 1 && password.Length < 6) && id != "0")
                {
                    respuesta = "La contraseña debe contener mas de 6 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string sexo = empleado.sexo;
                    string fecha_nacimiento = empleado.fecha_nacimiento;
                    string tipo_documento = empleado.tipo_documento;
                    string num_documento = empleado.num_documento;
                    string direccion = empleado.direccion;
                    string telefono = empleado.telefono;
                    string email = empleado.email;
                    string acceso = empleado.acceso;
                    string departamento = empleado.departamento;
                    string provincia = empleado.provincia;
                    string distrito = empleado.distrito;
                    string idlocal = empleado.idlocal;
                    string idarea = empleado.idarea;
                    string logueo = empleado.logueo;
                    string dashboard = empleado.dashboard;
                    string horariotrabajo = empleado.horariotrabajo;

                    string idcaja = empleado.idcaja;
                    string serie = empleado.serie;
                    string bloqueado = empleado.bloqueado;
                    string jefatura = empleado.jefatura ?? "0";
                    string idjefatura = empleado.idjefatura ?? "0";
                    string flujo = empleado.flujo;
                    string flujo2_aprobacion_directa = empleado.flujo2_aprobacion_directa ?? "0";

                    using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                    {

                        if (id == "0")
                        {
                            if (obj.ExisteLoginByLocal(ruc, idlocal, usuario))
                            {

                                respuesta = "El colaborador se encuentra registrado en el local!";
                            }
                            else
                            {

                                id=obj.Agregar_v2(ruc, nombre, apellidos, sexo, fecha_nacimiento, tipo_documento, num_documento,
                                departamento, provincia, distrito, direccion, telefono, email,
                                acceso, usuario, password, idlocal, logueo, dashboard, horariotrabajo,
                                idcaja, serie, idarea, bloqueado, jefatura, idjefatura, flujo, flujo2_aprobacion_directa);


                               
                            }

                        }
                        else
                        {
                            obj.Editar_v2(id, nombre, apellidos, sexo, fecha_nacimiento, tipo_documento, num_documento,
                                departamento, provincia, distrito, direccion, telefono, email,
                                acceso, usuario, password, idlocal, logueo, dashboard, horariotrabajo,
                                idcaja, serie, idarea, bloqueado, jefatura, idjefatura, flujo, flujo2_aprobacion_directa);

                        }

                        
                        //obj.EliminarEmpleadoArea(id);

                        //foreach (var iarea in empleado.areas)
                        //{
                        //    obj.AgregarEmpleadoArea(id, iarea.nombre, ruc);
                        //}
                        

                    }
                }
            }

            if (Request.QueryString["ope"] == "2" && usuario_acceso == "SuperAdmin")
            {
                bool blnerror = false;
                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];
                string apellidos = Request.QueryString["apellidos"];
                string usuario = Request.QueryString["usuario"];
                string password = Request.QueryString["password"];
                string macaddress = Request.QueryString["password"] ?? "";

                if (usuario.Length < 6)
                {
                    respuesta = "El usuario debe contener mas de 6 caracteres!";
                    blnerror = true;
                }

                if (password.Length < 6 && id == "0")
                {
                    respuesta = "La contraseña debe contener mas de 6 caracteres!";
                    blnerror = true;
                }

                if ( (password.Length>1 && password.Length < 6) && id != "0")
                {
                    respuesta = "La contraseña debe contener mas de 6 caracteres!";
                    blnerror = true;
                }


                if (!blnerror)
                {
                    string sexo = Request.QueryString["sexo"];
                    string fecha_nacimiento = Request.QueryString["fecha_nacimiento"];
                    string tipo_documento = Request.QueryString["tipo_documento"];
                    string num_documento = Request.QueryString["num_documento"];
                    string direccion = Request.QueryString["direccion"];
                    string telefono = Request.QueryString["telefono"];
                    string email = Request.QueryString["email"];
                    string acceso = Request.QueryString["acceso"];
                    string departamento = Request.QueryString["departamento"];
                    string provincia = Request.QueryString["provincia"];
                    string distrito = Request.QueryString["distrito"];
                    string idlocal = Request.QueryString["idlocal"];
                    string idarea = Request.QueryString["idarea"];
                    string logueo = Request.QueryString["logueo"];
                    string dashboard = Request.QueryString["dashboard"];
                    string horariotrabajo = Request.QueryString["horariotrabajo"];

                    string idcaja = Request.QueryString["idcaja"];
                    string serie = Request.QueryString["serie"];
                    string bloqueado = Request.QueryString["bloqueado"];
                    string jefatura = Request.QueryString["jefatura"] ?? "0";
                    string jefaturacorreos = Request.QueryString["jefaturacorreos"] ?? "";

                    using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                    {
                       
                        if (id == "0")
                        {
                            if (obj.ExisteLoginByLocal(ruc, idlocal, usuario))
                            {

                                respuesta = "El colaborador se encuentra registrado en el local!";
                            }
                            else
                            {

                                obj.Agregar(ruc, nombre, apellidos, sexo, fecha_nacimiento, tipo_documento, num_documento,
                                departamento, provincia, distrito, direccion, telefono, email,
                                acceso, usuario, password, idlocal, logueo, dashboard, horariotrabajo, 
                                idcaja, serie, idarea, bloqueado, jefatura, jefaturacorreos, macaddress);
                            }
                            
                        }
                        else
                        {
                            obj.Editar(id, nombre, apellidos, sexo, fecha_nacimiento, tipo_documento, num_documento,
                                departamento, provincia, distrito, direccion, telefono, email,
                                acceso, usuario, password, idlocal, logueo, dashboard, horariotrabajo,
                                idcaja, serie, idarea, bloqueado, jefatura, jefaturacorreos, macaddress);

                        }
                        
                    }
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
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