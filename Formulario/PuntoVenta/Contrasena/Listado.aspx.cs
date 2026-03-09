using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Contrasena
{
    public partial class Listado : System.Web.UI.Page
    {
        string urlDefault = "../../General/Frame/Salir.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                else
                {
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

                    hempresaruc.Value = ticket.UserData.Split('|')[1];
                    husuariocodigo.Value = ticket.UserData.Split('|')[4];
                }
            }
        }

        protected void btnCambio_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                FailureText.Text = "";
                ErrorMessage.Visible = false;


                if(husuariocodigo.Value.IsInyection() || !NewPassword.Value.IsInyection())
                {
                    FailureText.Text = "Inyeccion de Codigo Detectado!";
                    ErrorMessage.Visible = true;
                }
                else
                {
                    if (CurrentPassword.Value == NewPassword.Value)
                    {
                        Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario();
                        bool blnresult = obj.CambiarClave(hempresaruc.Value, husuariocodigo.Value, NewPassword.Value);


                        if (blnresult)
                        {
                            FailureText.Text = "Clave modificada!";
                            ErrorMessage.Visible = true;
                            btnCambio.Enabled = false;
                        }
                        else
                        {
                            FailureText.Text = "clave inválido!";
                            ErrorMessage.Visible = true;
                        }
                    }
                    else
                    {
                        FailureText.Text = "La clave deben ser iguales!";
                        ErrorMessage.Visible = true;
                    }
                }
            }
        }
    }

}