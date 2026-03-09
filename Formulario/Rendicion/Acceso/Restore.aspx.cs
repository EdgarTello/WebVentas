using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Rendicion.Acceso
{
    public partial class Restore : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                hruc.Value = ConfigurationManager.AppSettings["empresaruc"];
                ViewState["empresacodigo"] = new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).Id;

                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("Index.aspx");
                    
                }
                else {

                    
                    Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();

                    try
                    {

                        var objeto = obj.GetUsuarioByGuid(hruc.Value, Request.QueryString["id"]);


                        if (objeto == null)
                        {
                            //FailureText.Text = "Objeto nulo!";
                            //ErrorMessage.Visible = true;
                            Response.Redirect("Index.aspx");
                        }
                        else
                        {
                            hid.Value = objeto.codigo;
                            husuario.Value = objeto.usuario;
                        }
                    }
                    catch(Exception ex) {

                        //FailureText.Text = ex.Message;
                        //ErrorMessage.Visible = true;

                        Response.Redirect("Index.aspx");
                    }
                }
                
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            if (IsValid)
            {
                if (Password1.Value.Length > 5)
                {

                    if (Password1.Value ==Password2.Value)
                    {
                        string userName = husuario.Value;
                        string userRuc = hruc.Value;
                        
                        Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();
                        var objeto = obj.GetUsuarioByCodigo(hid.Value);


                        if (objeto != null)
                        {
                            if (objeto.bloqueado == "1")
                            {
                                FailureText.Text = "La cuenta se encuentra bloqueada.";
                                ErrorMessage.Visible = true;
                            }
                            else
                            {

                                obj.CambiarClave(userRuc, hid.Value, Password1.Value);
                                FailureText.Text = "La crendencial fue actualizada.";
                                ErrorMessage.Visible = true;
                                btnLogin.Enabled = false;
                                Password1.Disabled = true;
                                Password2.Disabled = true;
                            }

                        }
                        else
                        {
                            FailureText.Text = "La cuenta no esta registrada.";
                            ErrorMessage.Visible = true;
                        }
                    }
                    else
                    {
                        FailureText.Text = "Las claves deben ser iguales.";
                        ErrorMessage.Visible = true;
                    }
                }
                else {
                    FailureText.Text = "La clave de ser mayor a 6 caracteres.";
                    ErrorMessage.Visible = true;
                }
            }
        }

        protected void btnRetornar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}