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


namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Login04
{
    public partial class Operacion : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            string respuesta = string.Empty;

            if (Request.QueryString["ope"] == "1")
            {

                string rucempresa = Request.QueryString["ruc"].ToString();
                string localempresa = Request.QueryString["local"].ToString();
                string accesoempresa = Request.QueryString["acceso"].ToString();

                using (Repositorio.Usuario obj = new TwoTecnology.Repositorio.Usuario())
                {
                    respuesta = obj.LoadByLocal(rucempresa, localempresa, accesoempresa);
                }

                Response.Write(respuesta);
                Response.ContentEncoding = Encoding.UTF8;
                Response.End();
            }


            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.End();
        }
    }
}