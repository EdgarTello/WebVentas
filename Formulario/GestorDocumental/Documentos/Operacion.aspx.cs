using Ionic.Zip;
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
using TwoTecnology.Entity;


namespace TwoTecnology.WebVentas.Formulario.GestorDocumental.Documentos
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
            string empresa_ruc = ticket.UserData.Split('|')[1];
            string usuario_acceso = ticket.UserData.Split('|')[3];
            string usuario_codigo = ticket.UserData.Split('|')[4];
            string usuario_nombre = ticket.UserData.Split('|')[5];
            string usuario_serie = ticket.UserData.Split('|')[7];
            string puntosid = ticket.UserData.Split('|')[8];
            string ipcliente = ticket.UserData.Split('|')[9];
            string localcodigo = ticket.UserData.Split('|')[10];
            string movil = ticket.UserData.Split('|')[11];
            string respuesta = "";



            if (Request.QueryString["ope"] == "1")
            {
                string localdes = new Repositorio.Local().LoadByCodigo(empresa_ruc, localcodigo).nombre;
                string json = Request.QueryString["json"];

                Metodos.ValidateAntiXsrfToken("DocumentosList");
    
                Entity.GestorDocumento gestordoc = JsonConvert.DeserializeObject<Entity.GestorDocumento>(json);

                string indice1 = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice1").datos;
                string indice2 = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice2").datos;
                string indice3 = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice3").datos;
                string indice4ini = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice4ini").datos.ConverTo_YYYYMMDD();
                string indice4fin = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice4fin").datos.ConverTo_YYYYMMDD();
                //string indice4 = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice4").datos;
                string indice5 = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice5").datos;
                string indice6 = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice6").datos;
                string indice7 = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice7").datos;
                string indice8 = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice8").datos;
                string indice9 = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice9").datos;
                string indice10 = gestordoc.indice.FirstOrDefault(x => x.nombre == "indice10").datos;

                using (Repositorio.GestorDocumento obj = new TwoTecnology.Repositorio.GestorDocumento())
                {
                    respuesta = obj.Load(gestordoc.idlocal, gestordoc.idarchivador,
                        gestordoc.pagina,
                        gestordoc.filas,
                        indice1.Replace("--", ""),
                        indice2.Replace("--", ""),
                        indice3.Replace("--", ""),
                        indice4ini.Replace("--", ""),
                        indice4fin.Replace("--", ""),
                        //indice4.Replace("--", ""),
                        indice5.Replace("--", ""),
                        indice6.Replace("--", ""),
                        indice7.Replace("--", ""),
                        indice8.Replace("--", ""),
                        indice9.Replace("--", ""),
                        indice10.Replace("--", "")
                        ).Serialize();

                    obj.LoadRegistroHistorial(gestordoc.idlocal, gestordoc.idarchivador,
                        indice1.Replace("--", ""),
                        indice2.Replace("--", ""),
                        indice3.Replace("--", ""),
                        indice4ini.Replace("--", ""),
                        indice5.Replace("--", ""),
                        indice6.Replace("--", ""),
                        indice7.Replace("--", ""),
                        indice8.Replace("--", ""),
                        indice9.Replace("--", ""),
                        indice10.Replace("--", "")
                        );
                }
            }


            if (Request.QueryString["ope"] == "2")
            {
                string json = Request.QueryString["json"];

                Metodos.ValidateAntiXsrfToken("DocumentosList");

                List<string> listado = JsonConvert.DeserializeObject<List<string>>(json);

                using (Repositorio.GestorDocumento obj = new TwoTecnology.Repositorio.GestorDocumento())
                {
                    respuesta = obj.LoadExcel(listado).Serialize();
                }
            }

            

            if (Request.QueryString["ope"] == "20")
            {
                string id = Request.QueryString["id"];
                Metodos.ValidateAntiXsrfToken("DocumentosList");

                if (id.IsNumeric())
                {
                    using (TwoTecnology.Repositorio.GestorDocumento obj = new TwoTecnology.Repositorio.GestorDocumento())
                    {
                        var documento = obj.LoadById(id);

                        if (!(string.IsNullOrEmpty(documento.ruta) || !File.Exists(documento.ruta)))
                        {
                            obj.ActualizaLog(id, "Ver");
                            byte[] buffer = File.ReadAllBytes(documento.ruta);
                            respuesta = "data:application/pdf;base64," + Convert.ToBase64String(buffer);
                        }                        
                    }
                }
            }

            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}