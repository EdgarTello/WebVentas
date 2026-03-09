using DevExpress.ClipboardSource.SpreadsheetML;
using DevExpress.DataProcessing;
using Microsoft.Ajax.Utilities;
using Org.BouncyCastle.Ocsp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TwoTecnology.Entity.ChatGPT;

namespace TwoTecnology.WebVentas
{
    public partial class VTexOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {   
                string guid= Request.QueryString["guid"] ?? "";

                if (!string.IsNullOrEmpty(guid))
                {

                    using (TwoTecnology.Repositorio.VTex.ItemOrder obj = new TwoTecnology.Repositorio.VTex.ItemOrder())
                    {
                        var id = obj.LoadByGuid(guid);

                        if (!string.IsNullOrEmpty(id))
                        {
                            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls13;

                            var d= obj.LoadByIdWithDetail(id);
                            string urlorderlogo = ConfigurationManager.AppSettings["urlorderlogo"] ?? "";
                            //string urllogo = "http://ilariainternational.com:8001/Ventas/Img/Empresa/ilaria.png";

                            using (WebClient client = new WebClient())
                            {
                                byte[] imageData = client.DownloadData(urlorderlogo);
                                string base64Image = Convert.ToBase64String(imageData);
                                ViewState["imglogo"] = string.Format("data:image/png;base64, {0}", base64Image);
                            }

                            
                            ViewState["pnombre"] = string.Format("Hola {0}" , d.clientname);
                            ViewState["porden"] = string.Format("# {0}" , d.orderid);
                            ViewState["pentregar"] = d.shippingreceivername;
                            ViewState["pdireccion1"] = string.Format("Ilaria, {0}" , d.shippingneighborhood);
                            ViewState["pdireccion2"] = string.Format("{0} {1}" , d.shippingstreet, d.shippingnumber);
                            ViewState["pdireccion3"] = string.Format("{0}-{1}-{2}", d.shippingcity, d.shippingstate, d.shippingcountry);
                            ViewState["pdireccion4"] = string.Format("{0}" , d.shippingpostalcode);
                            ViewState["pdireccion5"] = string.Format("{0} {1}" , d.shippinggeox , d.shippinggeoy);
                            ViewState["padditionalinfo"] = string.Format("{0}", d.additionalinfo);
                            
                            ViewState["productsamount"] = string.Format("{0} {1}", d.currencysymbol, Convert.ToDecimal(d.productsamount).ToString(",0"));
                            ViewState["discountsamount"] = string.Format("{0} {1}", d.currencysymbol, Convert.ToDecimal(d.discountsamount).ToString(",0"));
                            ViewState["totalamount"] = string.Format("{0} {1}", d.currencysymbol, Convert.ToDecimal(d.totalamount).ToString(",0"));
                            StringBuilder detail = new StringBuilder();

                            foreach (var item in d.detail)
                            {
                                var descripcion = string.Format("{0} unid. {1} {2}",item.quantity, d.currencysymbol, Convert.ToDecimal(item.costprice).ToString(",0"));
                                string base64Image = string.Empty;

                                using (WebClient client = new WebClient())
                                {
                                    byte[] imageData = client.DownloadData(item.url);
                                    base64Image = Convert.ToBase64String(imageData);                                    
                                }

                                detail.AppendLine( 
                                    string.Format("<tr>" +
                                    "<td>" +
                                    " <a><img src='{0}' class='rounded mx-auto d-block' width='120'/></a>" +
                                    "</td>" +
                                    "<td>" +
                                    "   <a style='font-size: 1.1rem!important;'>{1}</a>" +
                                    "   <a style='font-size: 1.1rem!important;'>{2}</a>'" +
                                    "</td>" +
                                    "</tr>",
                                    string.Format("data:image/jpg;base64, {0}", base64Image),
                                    item.name,
                                    descripcion
                                    ));

                                
                            }

                            ViewState["tbody"]= detail.ToString();
                            //hjson.Value = respuesta.Serialize();
                        }
                    }
                }                
            }
        }
    }
}