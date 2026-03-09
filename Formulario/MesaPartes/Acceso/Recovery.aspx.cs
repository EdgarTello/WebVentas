using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.MesaPartes.Acceso
{
    public partial class Recovery : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                hruc.Value = ConfigurationManager.AppSettings["empresaruc"];
                ViewState["empresacodigo"] = new TwoTecnology.Repositorio.Empresa().LoadByRucObject(hruc.Value).Id;
                
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            //if (txtVerificationCode.Text.ToLower() != Session["CaptchaVerify"].ToString())            {
                
            //    FailureText.Text = "Ingrese captcha correcto!";
            //    ErrorMessage.Visible = true;
            //    return;
            //}

            //int screenwidth = Request.Browser.ScreenPixelsWidth; //Always returns 640 ?
            //if (Request.Browser.IsMobileDevice == true) { ismobile = true; } //Doesn't detect mobile device ?

            if (IsValid)
            {
                if (husuario.Value.Length > 5)
                {
                    string userName = husuario.Value;
                    string userRuc = hruc.Value;
                    

                    Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();
                    var objeto = obj.GetUsuario(userRuc, userName);


                    if (objeto!=null)
                    {
                        if (objeto.bloqueado == "1")
                        {
                            FailureText.Text = "La cuenta se encuentra bloqueada!";
                            ErrorMessage.Visible = true;
                        }
                        else
                        {

                            obj.Recuperar(userRuc, userName);
                            FailureText.Text = string.Format("Se envío la notificación a {0}!", objeto.correo);
                            ErrorMessage.Visible = true;
                            btnLogin.Enabled = false;
                        }
                        
                    }
                    else
                    {
                        FailureText.Text = "La cuenta no esta registrada!";
                        ErrorMessage.Visible = true;
                    }
                }
                else {
                    FailureText.Text = "La cuenta debe ser mayor a 5 caracteres!";
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