using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.GestorDocumental
{
    public partial class ViewGestor : System.Web.UI.Page
    {
        protected void btnPdf_Click(object sender, EventArgs e)
        {
            FormsAuthenticationTicket ticket = null;

            try
            {
                FormsIdentity formsIdentity = HttpContext.Current.User.Identity as FormsIdentity;
                ticket = formsIdentity.Ticket;
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }




            string ver = ticket.UserData.Split('|')[29];
            string descargar = ticket.UserData.Split('|')[30];
            string editar = ticket.UserData.Split('|')[31];
            string eliminar = ticket.UserData.Split('|')[32];

            if (ver == "0")
            {
                Response.ContentType = "application/octet-stream";
                Response.Write("No cuenta con permiso de visualización de documentos!");
            }
            else
            {
                string id = hid.Value;

                using (Repositorio.GestorDocumento doc = new TwoTecnology.Repositorio.GestorDocumento())
                {
                    var documento = doc.LoadById(id);

                    if (string.IsNullOrEmpty(documento.ruta) || !File.Exists(documento.ruta))
                    {
                        Response.ContentType = "application/octet-stream";
                        Response.Write(string.Format("El archivo no fue encontrado:{0}", documento.archivo));
                    }
                    else
                    {
                        doc.ActualizaLog(id, "Ver");

                        byte[] buffer = File.ReadAllBytes(documento.ruta);

                        Response.Clear();
                        Response.ContentType = "application/pdf";
                        Response.Buffer = true;
                        Response.AddHeader("content-length", buffer.Length.ToString());
                        Response.AppendHeader("Content-Disposition", string.Format("inline; filename={0}", documento.archivo.Replace(",","")));
                        Response.BinaryWrite(buffer);
                    }
                }
            }

            Response.Flush();
            Response.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                hid.Value = Request.QueryString["id"].ToString();
                //btnPdf.Visible = false;
            }
        }
    }
}