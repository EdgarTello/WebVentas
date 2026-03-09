using System;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.Security;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Archivador
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
                string codigo = Request.QueryString["id"];

                using (Repositorio.GestorArchivador obj = new TwoTecnology.Repositorio.GestorArchivador())
                {
                    respuesta = obj.LoadByCodigo(ruc, codigo).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1")
            {;

                using (Repositorio.GestorArchivador obj = new TwoTecnology.Repositorio.GestorArchivador())
                {
                    respuesta = obj.Load("0", ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "1_2")
            {
                
                using (Repositorio.GestorArchivador obj = new TwoTecnology.Repositorio.GestorArchivador())
                {
                    respuesta = obj.LoadActivo(ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "2")
            {

                string id = Request.QueryString["id"];
                string nombre = Request.QueryString["nombre"];


                using (Repositorio.GestorArchivador obj = new TwoTecnology.Repositorio.GestorArchivador())
                {
                    if (id == "0")
                        if (obj.ExisteByNombre(ruc, "0", nombre))
                            respuesta = "La Archivador existe!";
                        else
                            obj.Agregar("0",nombre, ruc);
                    else
                        obj.Editar(id, "0", nombre);

                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string id = Request.QueryString["id"];

                using (Repositorio.GestorArchivador obj = new TwoTecnology.Repositorio.GestorArchivador())
                {
                    obj.Eliminar(id);
                }
            }

            if (Request.QueryString["ope"] == "5")
            {

                string id = Request.QueryString["id"];

                using (Repositorio.GestorArchivador obj = new TwoTecnology.Repositorio.GestorArchivador())
                {
                    obj.Activar(id);

                }
            }

            if (Request.QueryString["ope"] == "6")
            {

                string id = Request.QueryString["id"];

                using (Repositorio.GestorArchivador obj = new TwoTecnology.Repositorio.GestorArchivador())
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