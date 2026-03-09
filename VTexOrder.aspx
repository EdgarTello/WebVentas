<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VTexOrder.aspx.cs" Inherits="TwoTecnology.WebVentas.VTexOrder" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Pedido</title>
        <!-- ===============================================-->
        <!--    Favicons-->
        <!-- ===============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="http://ilariainternational.com:8001/Ventas/assets/img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="http://ilariainternational.com:8001/Ventas/assets/img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="http://ilariainternational.com:8001/Ventas/assets/img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="http://ilariainternational.com:8001/Ventas/assets/img/favicons/favicon.ico">
        <link rel="manifest" href="http://ilariainternational.com:8001/Ventas/assets/img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="http://ilariainternational.com:8001/Ventas/assets/img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">
        <script src="http://ilariainternational.com:8001/Ventas/vendors/simplebar/simplebar.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/assets/js/config.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- ===============================================-->
        <!--    Stylesheets-->
        <!-- ===============================================-->
        <link href="http://ilariainternational.com:8001/Ventas/vendors/glightbox/glightbox.min.css" rel="stylesheet">
        <link href="http://ilariainternational.com:8001/Ventas/vendors/flatpickr/flatpickr.min.css" rel="stylesheet">
        <link href="http://ilariainternational.com:8001/Ventas/vendors/nouislider/nouislider.min.css" rel="stylesheet">
        <link href="http://ilariainternational.com:8001/Ventas/vendors/choices/choices.min.css" rel="stylesheet">
        <link href="http://ilariainternational.com:8001/Ventas/vendors/prism/prism-okaidia.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link href="http://ilariainternational.com:8001/Ventas/vendors/simplebar/simplebar.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
        <link href="http://ilariainternational.com:8001/Ventas/assets/css/theme.min.css" type="text/css" rel="stylesheet">
        <link href="http://ilariainternational.com:8001/Ventas/assets/css/user.min.css" type="text/css" rel="stylesheet">
    </head>
    <body>   
        <main class="main" id="top">
            <div class="content">
                <div class="pb-9">      
                    <img class="rounded w-100 object-fit-cover mb-5 mb-md-6 mb-xl-8" id="imglogo" src="<% =ViewState["imglogo"] %>" />
                    <input type="hidden" name="hid" id="hid" value="" runat="server"/>
                    <input type="hidden" name="hjson" id="hjson" value="" runat="server"/>
                    <input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("VTexOrderList") %>" />                   

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card mb-9">
                                <div class="card-body">
                                    <div class="text-center mb-8">
                                        <h1 class="lh-sm fs-6 fs-xxl-4 mb-4">Tu pedido esta listo!</h1>
                                        <p class="fw-bold fs-8 mb-2 text-primay" id="nombre"><% =ViewState["pnombre"] %></p>
                                        <p class="fs-8 mb-0 text-body-tertiary">Tu pedido ya esta disponible en tienda para que puedas pasar a recogerlo,</p>
                                        <p class="fs-8 mb-2 text-body-tertiary">¡Te esperamos!</p>
                                    </div>
                                    <div class="row">
                                        <h1 class="lh-sm fs-8 fs-xxl-4 mb-4">Datos para la entrega</h1>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="row">
                                                <div class="col-4">
                                                    <p class="fw-bold fs-8 mb-2 text-body-tertiary">Pedido</p>
                                                </div>
                                                <div class="col-8">
                                                    <p class="fs-8 mb-2 text-body-tertiary" id="porden"><% =ViewState["porden"] %></p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-4">
                                                    <p class="fw-bold fs-8 mb-2 text-body-tertiary">Entregar a</p>
                                                </div>
                                                <div class="col-8">
                                                    <p class="fs-8 mb-2 text-body-tertiary" id="pentregar"><% =ViewState["pentregar"] %></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="row">
                                                <div class="col-4">
                                                    <p class="fw-bold fs-8 mb-2 text-body-tertiary">Tienda</p>                                            
                                                </div>
                                                <div class="col-8">
                                                    <p class="fs-8 mb-2 text-body-tertiary" id="pdireccion1"><% =ViewState["pdireccion1"] %></p>
                                                    <p class="fs-8 mb-2 text-body-tertiary" id="pdireccion2"><% =ViewState["pdireccion2"] %></p>
                                                    <p class="fs-8 mb-2 text-body-tertiary" id="pdireccion3"><% =ViewState["pdireccion3"] %></p>
                                                    <p class="fs-8 mb-2 text-body-tertiary" id="pdireccion4"><% =ViewState["pdireccion4"] %></p>
                                                    <p class="fs-8 mb-2 text-body-tertiary" id="pdireccion5"><% =ViewState["pdireccion5"] %></p>
                                                </div>                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <p class="fw-bold fs-8 mb-2 text-body-tertiary">Quien recogera tu pedido?</p>
                                            <p class="fw-bold fs-8 mb-2 text-body-tertiary">Si otra persona recogerá tú pedido, envía un correo a 
												<a href="mailto:atencionalcliente@ilariainternational.com?Subject=Ilaria - Recojo en Tienda #{$porden}">atencionalcliente@ilariainternational.com</a> con el número de pedido, nombre y documento de identidad de la persona autorizada.</p>
                                        </div>
                                    </div>
                                    <div class="row mb-8">
                                        <div class="col-12">
                                            <p class="fw-bold fs-8 mb-2 text-body-tertiary">Recuerda que la persona que recoja el pedido deberá presentar su documento de identidad.</p>
                                        </div>
                                    </div>

                                    <div class="row mb-8">
                                        <div class="col-12">
                                            <p class="fw-bold fs-8 mb-2 text-body-tertiary">Detalles del recojo:</p>
                                            <p class="fs-8 mb-2 text-body-tertiary" id="padditionalinfo"><% =ViewState["padditionalinfo"] %></p>
                                        </div>
                                    </div>

                                    <div class="row g-5 mb-8">

                                        <div class="col-12 col-lg-8">
                                          <div id="cartTable">
                                            <div class="table-responsive scrollbar mx-n1 px-1">
                                              <table class="table fs-9 mb-0 border-top border-translucent">
                                                <thead>
                                                  <tr>
                                                    <th class="sort white-space-nowrap align-middle fs-10" scope="col"></th>
                                                    <th class="sort white-space-nowrap align-middle" scope="col" style="min-width:250px;">PRODUCTOS</th>
                                                  </tr>
                                                </thead>
                                                <tbody class="list" id="cart-table-body">   
                                                    <% =ViewState["tbody"] %>
                                                </tbody>
                                              </table>
                                            </div>
                                          </div>
                                        </div>

                                        <div class="col-12 col-lg-4">
                                          <div class="card">
                                            <div class="card-body">
                                              <div class="d-flex flex-between-center mb-3">
                                                <h3 class="card-title mb-0">Resumen</h3>
                                              </div>
                                              <div>
                                                <div class="d-flex justify-content-between">
                                                  <p class="text-body fw-semibold">Productos :</p>
                                                  <p class="text-body-emphasis fw-semibold" id="productsamount"><% =ViewState["productsamount"] %></p>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                  <p class="text-body fw-semibold">Descuentos :</p>
                                                  <p class="text-danger fw-semibold" id="discountsamount"><% =ViewState["discountsamount"] %></p>
                                                </div>                                                
                                              </div>
                                              <div class="d-flex justify-content-between border-y border-dashed py-3 mb-4">
                                                <h4 class="mb-0">Total :</h4>
                                                <h4 class="mb-" id="totalamount"><% =ViewState["totalamount"] %></h4>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                    </div>

                                    
                                    <div class="row">
                                        <div class="col-12">
                                            <p class="fs-8 mb-4 text-body-tertiary">Agradecemos su preferencia</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <p class="fw-bold fs-8 mb-4 text-body-tertiary">ILARIA</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </main>
    
      
        <!-- ===============================================-->
        <!--    JavaScripts-->
        <!-- ===============================================-->
        <!-- jQuery -->
        <script src="http://ilariainternational.com:8001/Ventas/plugins/jquery/jquery.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/plugins/jquery-blockuid/jquery.blockUI.min.js"></script>

        <script src="http://ilariainternational.com:8001/Ventas/vendors/popper/popper.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/bootstrap/bootstrap.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/anchorjs/anchor.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/is/is.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/fontawesome/all.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/lodash/lodash.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/list.js/list.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/feather-icons/feather.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/dayjs/dayjs.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/flatpickr/flatpickr.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/lottie/lottie.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/nouislider/nouislider.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/choices/choices.min.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/vendors/prism/prism.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/assets/js/phoenix.js"></script>
        <script src="http://ilariainternational.com:8001/Ventas/plugins/jquery/jquery.general-2.6.6.js"></script>
        
    </body>

</html>