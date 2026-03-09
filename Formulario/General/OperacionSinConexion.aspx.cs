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


namespace TwoTecnology.WebVentas.Formulario.General
{
    public partial class OperacionSinConexion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string respuesta = string.Empty;

            if (Request.QueryString["ope"] == "1")
            {
                string ruc = Request.QueryString["ruc"];

                using (Repositorio.Empresa obj = new TwoTecnology.Repositorio.Empresa())
                {
                    respuesta = obj.LoadNombreByRuc(ruc);
                }
            }


            if (Request.QueryString["ope"] == "2")
            {
                string _ruc = Request.QueryString["ruc"];
                
                using (Repositorio.Empresa obj = new TwoTecnology.Repositorio.Empresa())
                {
                    string DBVentas = obj.LoadBdVentasByRuc(_ruc);
                    HttpContext.Current.Session["DBVentas"] = DBVentas;
                }

                using (Repositorio.Local obj = new TwoTecnology.Repositorio.Local())
                {

                    respuesta = obj.Load(_ruc).Serialize();
                }
            }

            if (Request.QueryString["ope"] == "3")
            {
                string _ruc = Request.QueryString["ruc"];
                string _idlocal = Request.QueryString["idlocal"];

                using (Repositorio.Empresa obj = new TwoTecnology.Repositorio.Empresa())
                {
                    string DBVentas = obj.LoadBdVentasByRuc(_ruc);
                    HttpContext.Current.Session["DBVentas"] = DBVentas;
                }

                using (Repositorio.Empleado obj = new TwoTecnology.Repositorio.Empleado())
                {
                    respuesta = obj.LoadByLocalAll(_ruc, _idlocal).Serialize();
                }
            }


            Response.Write(respuesta);
            Response.ContentEncoding = Encoding.UTF8;
            Response.Flush();
            Response.End();
        }

    }
}