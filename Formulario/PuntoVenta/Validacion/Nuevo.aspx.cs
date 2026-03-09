using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TwoTecnology.WebVentas.Formulario.PuntoVenta.Validacion
{
    public partial class Nuevo : System.Web.UI.Page
    {
        string urlDefault = "../PuntoVenta/Menu/Salir.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!Context.User.Identity.IsAuthenticated)
                {
                    Response.Write("<script>top.location='" + urlDefault + "';parent.location='" + urlDefault + "';</script>");
                    Response.End();
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

            string ruc = ticket.UserData.Split('|')[1];
            string acceso = ticket.UserData.Split('|')[3];
            string usuario = ticket.UserData.Split('|')[5];
            string localcodigo = ticket.UserData.Split('|')[10];
            string mobile = ticket.UserData.Split('|')[11];
            string tipo = ticket.UserData.Split('|')[12];
            bool errortipocambio = false;
            hmobile.Value = mobile;

            //using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
            //{
            //    ubicaciones = obj.LoadByLocalUbicaciones(ruc, localcodigo);
            //}

            //string tipox= ((((tipo=="01")?"1": (tipo == "02") ? "2": (tipo == "03") ? "3":"")));

            string tipocambio = new TwoTecnology.Repositorio.Configuracion().LoadObject(ruc, localcodigo, "tipocambio").valor ?? "0";

            using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
            {

                if (obj.AperturaTipoCambioByEmpresa(ruc) == "0" && tipocambio=="1")
                {
                    switch (acceso)
                    {
                        case "SuperAdmin":
                            Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=99");
                                
                            break;

                        case "Administrador":
                            Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=99");

                            break;

                        case "Vendedor":
                            Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=99");

                            break;

                        case "Cajero":
                            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "alert('No se registro el tipo de cambio del día!');", true);
                            //Response.Redirect("../../Menu.aspx");
                            Response.Redirect("../TipoCambio/Nuevo.aspx?id=0&solicitud=99");

                            break;
                        case "Mesero":
                            observaciones.Text = "No se registro el tipo de cambio del día!";
                            break;
                    }

                    errortipocambio = true;
                }
            }



            if (!errortipocambio)
            {
                string aperturacaja = "0";

                using (Repositorio.Configuracion obj = new TwoTecnology.Repositorio.Configuracion())
                {
                    aperturacaja = obj.LoadTexto(ruc, localcodigo, "aperturacaja");
                }

                using (Repositorio.CajaOperacion obj = new TwoTecnology.Repositorio.CajaOperacion())
                {
                    switch (acceso)
                    {
                        case "SuperAdmin":
                            switch (tipo)
                            {
                                case "1":
                                    Response.Redirect("../PuntoVenta01/Listado.aspx");
                                    break;

                                case "2":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "3":
                                    Response.Redirect("../Mesa/Listado.aspx");
                                    break;

                                case "31":
                                    Response.Redirect("../PuntoVenta31/Listado.aspx");
                                    break;

                                case "21":
                                    Response.Redirect("../PuntoVenta21/Listado.aspx");
                                    break;

                                case "22":
                                    Response.Redirect("../PuntoVenta22/Listado.aspx");
                                    break;

                                case "23":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "100":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "200":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "201":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "202":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "300":
                                    Response.Redirect("../Mesa/Listado.aspx");
                                    break;

                                case "301":
                                    Response.Redirect("../Mesa/Listado.aspx");
                                    break;

                                case "302":
                                    Response.Redirect("../Mesa/Listado.aspx");
                                    break;

                            }
                            break;

                        case "Administrador":
                            switch (tipo)
                            {
                                case "1":
                                    Response.Redirect("../PuntoVenta01/Listado.aspx");
                                    break;

                                case "2":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "3":
                                    Response.Redirect("../Mesa/Listado.aspx");
                                    break;

                                case "31":
                                    Response.Redirect("../PuntoVenta31/Listado.aspx");
                                    break;

                                case "21":
                                    Response.Redirect("../PuntoVenta21/Listado.aspx");
                                    break;

                                case "22":
                                    Response.Redirect("../PuntoVenta22/Listado.aspx");
                                    break;

                                case "23":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "100":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "200":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;
                                case "201":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "202":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "300":
                                    Response.Redirect("../Mesa/Listado.aspx");
                                    break;

                                case "301":
                                    Response.Redirect("../Mesa/Listado.aspx");
                                    break;

                                case "302":
                                    Response.Redirect("../Mesa/Listado.aspx");
                                    break;
                            }
                                
                            
                            break;

                        case "Vendedor":
                            switch (tipo)
                            {
                                case "1":
                                    Response.Redirect("../PuntoVenta01/Listado.aspx");
                                    break;

                                case "2":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "3":
                                    Response.Redirect("../Mesa/Listado.aspx");
                                    break;

                                case "31":
                                    Response.Redirect("../PuntoVenta31/Listado.aspx");
                                    break;

                                case "21":
                                    Response.Redirect("../PuntoVenta21/Listado.aspx");
                                    break;

                                case "22":
                                    Response.Redirect("../PuntoVenta22/Listado.aspx");
                                    break;

                                case "100":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;
                            }
                            
                            break;

                        case "Cajero":
                            if (aperturacaja == "1")
                            {
                                if (obj.AperturaExisteByLocalEmpleado(ruc, localcodigo, usuario) == "0")
                                {
                                    Response.Redirect("../OperacionCaja/Nuevo.aspx?solicitud=99");
                                }
                                else
                                {
                                    switch (tipo)
                                    {
                                        case "1":
                                            Response.Redirect("../PuntoVenta01/Listado.aspx");
                                            break;

                                        case "2":
                                            Response.Redirect("../PuntoVenta02/Listado.aspx");
                                            break;

                                        case "3":
                                            Response.Redirect("../Mesa/Listado.aspx");
                                            break;

                                        case "31":
                                            Response.Redirect("../PuntoVenta31/Listado.aspx");
                                            break;

                                        case "21":
                                            Response.Redirect("../PuntoVenta21/Listado.aspx");
                                            break;

                                        case "22":
                                            Response.Redirect("../PuntoVenta22/Listado.aspx");
                                            break;

                                        case "23":
                                            Response.Redirect("../PuntoVenta02/Listado.aspx");
                                            break;

                                        case "100":
                                            Response.Redirect("../PuntoVenta02/Listado.aspx");
                                            break;

                                        case "200":
                                            Response.Redirect("../PuntoVenta02/Listado.aspx");
                                            break;
                                        case "201":
                                            Response.Redirect("../PuntoVenta02/Listado.aspx");
                                            break;

                                        case "202":
                                            Response.Redirect("../PuntoVenta02/Listado.aspx");
                                            break;

                                        case "300":
                                            Response.Redirect("../Mesa/Listado.aspx");
                                            break;

                                        case "301":
                                            Response.Redirect("../Mesa/Listado.aspx");
                                            break;

                                        case "302":
                                            Response.Redirect("../Mesa/Listado.aspx");
                                            break;
                                    }
                                    
                                }
                            }
                            else
                            {
                                switch (tipo)
                                {
                                    case "1":
                                        Response.Redirect("../PuntoVenta01/Listado.aspx");
                                        break;

                                    case "2":
                                        Response.Redirect("../PuntoVenta02/Listado.aspx");
                                        break;

                                    case "3":
                                        Response.Redirect("../Mesa/Listado.aspx");
                                        break;

                                    case "31":
                                        Response.Redirect("../PuntoVenta31/Listado.aspx");
                                        break;

                                    case "21":
                                        Response.Redirect("../PuntoVenta21/Listado.aspx");
                                        break;

                                    case "23":
                                        Response.Redirect("../PuntoVenta02/Listado.aspx");
                                        break;

                                    case "22":
                                        Response.Redirect("../PuntoVenta22/Listado.aspx");
                                        break;

                                    case "100":
                                        Response.Redirect("../PuntoVenta02/Listado.aspx");
                                        break;

                                    case "200":
                                        Response.Redirect("../PuntoVenta02/Listado.aspx");
                                        break;
                                    case "201":
                                        Response.Redirect("../PuntoVenta02/Listado.aspx");
                                        break;

                                    case "202":
                                        Response.Redirect("../PuntoVenta02/Listado.aspx");
                                        break;

                                    case "300":
                                        Response.Redirect("../Mesa/Listado.aspx");
                                        break;

                                    case "301":
                                        Response.Redirect("../Mesa/Listado.aspx");
                                        break;

                                    case "302":
                                        Response.Redirect("../Mesa/Listado.aspx");
                                        break;

                                }

                            }
                            break;

                        case "Mesero":
                            var item = obj.AperturaExisteByLocal(ruc, localcodigo);

                            if (item.id == "0" || item.id == "") { 
                                observaciones.Text = "No existe una caja apertuarada en el local!";
                            }
                            else
                            {
                                switch (tipo)
                                {
                                    case "1":
                                        Response.Redirect("../PuntoVenta01/Listado.aspx");
                                        break;

                                    case "2":
                                        Response.Redirect("../PuntoVenta02/Listado.aspx");
                                        break;

                                    case "3":
                                        Response.Redirect("../Mesa/Listado.aspx");
                                        break;

                                    case "31":
                                        Response.Redirect("../PuntoVenta31/Listado.aspx");
                                        break;

                                    case "21":
                                        Response.Redirect("../PuntoVenta21/Listado.aspx");
                                        break;

                                    case "22":
                                        Response.Redirect("../PuntoVenta22/Listado.aspx");
                                        break;

                                    case "100":
                                        Response.Redirect("../PuntoVenta02/Listado.aspx");
                                        break;
                                }
                            }

                            break;


                        case "VisorCocina":
                            
                            switch (tipo)
                            {
                                case "1":
                                    Response.Redirect("../PuntoVenta01/Listado.aspx");
                                    break;

                                case "2":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;

                                case "3":
                                    Response.Redirect("../Mesa/Listado.aspx");
                                    break;

                                case "31":
                                    Response.Redirect("../PuntoVenta31/Listado.aspx");
                                    break;

                                case "21":
                                    Response.Redirect("../PuntoVenta21/Listado.aspx");
                                    break;

                                case "22":
                                    Response.Redirect("../PuntoVenta22/Listado.aspx");
                                    break;

                                case "100":
                                    Response.Redirect("../PuntoVenta02/Listado.aspx");
                                    break;
                            }

                            break;
                    }
                }
            }
        }
    }
}