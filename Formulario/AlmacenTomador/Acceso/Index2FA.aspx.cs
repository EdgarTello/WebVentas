using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.AlmacenTomador.Acceso
{
    public partial class Index2FA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblrespuesta.Text = string.Empty;

            if (!Page.IsPostBack)
            {
                string id = Request.QueryString["id"] ?? "";
                
                //if (Request.Cookies["usuario"] != null)
                //{
                //    husuario.Value = Request.Cookies["usuario"].Value;
                //}

                
                if (id != string.Empty)
                {
                    TwoTecnology.Entity.TOMADOR.ARINPED_TOK aRINPED_TOK = new TwoTecnology.Entity.TOMADOR.ARINPED_TOK();
                    TwoTecnology.Repositorio.TOMADOR.Usuario obj = new TwoTecnology.Repositorio.TOMADOR.Usuario();
                    aRINPED_TOK = obj.LoadByGuid(id);

                    if (aRINPED_TOK.trabajador_codigo != string.Empty)
                    {
                        hid.Value = id;
                        hciacod.Value = aRINPED_TOK.cia;
                        hnoemple.Value =aRINPED_TOK.no_emple;
                        htracod.Value = aRINPED_TOK.trabajador_codigo;
                        htranom.Value = aRINPED_TOK.trabajador_nombre;
                        halmcod.Value = aRINPED_TOK.almacen_codigo;

                        ViewState["empresacodigo"] = aRINPED_TOK.cia;
                        ViewState["correo"] = aRINPED_TOK.email;

                    }
                    else
                        Response.Redirect("../Acceso/Index.aspx");
                }
                else
                {
                    Response.Redirect("../Acceso/Index.aspx");
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Acceso/Index.aspx");
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string clave = string.Format("{0}{1}{2}{3}", caracter1.Value, caracter2.Value, caracter3.Value, caracter4.Value);
            string id = hid.Value;
            lblrespuesta.Text = string.Empty;

            
            if (caracter1.Value=="" || caracter2.Value == "" || caracter3.Value == "" || caracter4.Value == "") {
                lblrespuesta.Text = "Clave errada!";
                return;
            }

            TwoTecnology.Repositorio.TOMADOR.Usuario obj = new TwoTecnology.Repositorio.TOMADOR.Usuario();

            if (obj.ExisteToken(id, clave))
            {
                obj.ActualizarToken(id, clave, "U");


                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                    hnoemple.Value, DateTime.Now, DateTime.Now.AddMinutes(300), true,
                    hciacod.Value  + "|" + //0
                    hnoemple.Value + "|" + //1
                    htracod.Value  + "|" + //2
                    htranom.Value  + "|" + //3
                    halmcod.Value  + "|"   //4
                    ,
                    FormsAuthentication.FormsCookiePath);

                string encryptedCookie = FormsAuthentication.Encrypt(ticket);
                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
                cookie.Expires = DateTime.Now.AddMinutes(300);
                Response.Cookies.Add(cookie);

                TwoTecnology.Repositorio.TOMADOR.Articulo art = new TwoTecnology.Repositorio.TOMADOR.Articulo();
                this.Session["articulo"]= art.Load(hciacod.Value).Serialize();

                Response.Redirect("../Frame/Index.aspx");
            }
            else {
                caracter1.Value = "";
                caracter2.Value = "";
                caracter3.Value = "";
                caracter4.Value = "";
                
                lblrespuesta.Text = "Clave errada!";

                caracter1.Focus();
            }
            
        }
    }
}