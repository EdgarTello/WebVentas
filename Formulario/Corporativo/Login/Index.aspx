<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.Corporativo.Login.Index" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>ERP|Autenticacion</title>
        <!-- ===============================================-->
        <!--    Favicons-->
        <!-- ===============================================-->
        <meta property="og:type" content="website" />
        <meta property="og:title" content="ERP: un pago rápido - TwoTecnology" />
        <meta property="og:description" content="Nos preocupamos por darle un mejor soporte!" />
        <meta property="og:url" content="http://twotecnology.online/" />

        <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css" />
        <link rel="shortcut icon" type="image/x-icon" href="../../../favicon.ico" />

        <!-- ===============================================-->
        <!--    Favicons-->
        <!-- ===============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="../../../assets/img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../../../assets/img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../../../assets/img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="../../../assets/img/favicons/favicon.ico">

        <link rel="manifest" href="../../../assets/img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="../../../assets/img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">
        <script src="../../../vendors/simplebar/simplebar.min.js"></script>
        <script src="../../../assets/js/config.js"></script>


        <!-- ===============================================-->
        <!--    Stylesheets-->
        <!-- ===============================================-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link href="../../../vendors/simplebar/simplebar.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
        <link href="../../../assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
        <link href="../../../assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">

    </head>
	<body>
        <form id="formdocument" asp-antiforgery="false" runat="server">
        
	        <asp:ScriptManager runat="server"></asp:ScriptManager>

            <!-- ===============================================-->
            <!--    Main Content-->
            <!-- ===============================================-->
            <asp:HiddenField runat="server" ID="hruc" />
            <asp:HiddenField runat="server" ID="hambiente" />
            <asp:HiddenField runat="server" ID="hlocal" />
            <asp:HiddenField runat="server" ID="hismobile" />

            <main class="main" id="top">
                <div class="container-fluid bg-body-tertiary dark__bg-gray-1200">
                    <div class="bg-holder bg-auth-card-overlay" style="background-image:url(../../../assets/img/bg/37.png);">
                    </div>
                    <!--/.bg-holder-->

                    <div class="row flex-center position-relative min-vh-100 g-0 py-1">
                        <div class="col-11 col-sm-10 col-xl-8">
                            <div class="card border border-translucent auth-card">
                                <div class="card-body pe-md-0">
                                    <div class="row align-items-center gx-0 gy-7">
                                        <div class="col-auto bg-body-highlight dark__bg-gray-1100 rounded-3 position-relative overflow-hidden auth-title-box">
                                            <div class="bg-holder" style="background-image:url(../../../assets/img/bg/38.png);">
                                            </div>
                                            <!--/.bg-holder-->

                                            <div class="position-relative px-4 px-lg-7 pt-7 pb-7 pb-sm-5 text-center text-md-start pb-lg-7 pb-md-7">
                                                <h3 class="mb-3 text-body-emphasis fs-7">TwoTecnology Autenticacion</h3>
                                                <p class="text-body-tertiary">Disfrute de un proceso de desarrollo sin complicaciones con la singularidad de TwoTecnology!</p>
                                                <ul class="list-unstyled mb-0 w-max-content w-md-auto">
                                                <li class="d-flex align-items-center"><span class="uil uil-check-circle text-success me-2"></span><span class="text-body-tertiary fw-semibold">Facil</span></li>
                                                <li class="d-flex align-items-center"><span class="uil uil-check-circle text-success me-2"></span><span class="text-body-tertiary fw-semibold">Simple</span></li>
                                                <li class="d-flex align-items-center"><span class="uil uil-check-circle text-success me-2"></span><span class="text-body-tertiary fw-semibold">Responsivo</span></li>
                                                </ul>
                                            </div>
                                            <div class="position-relative z-n1 mb-6 d-none d-md-block text-center mt-md-15">
                                                <img class="auth-title-box-img d-dark-none" src="../../../assets/img/spot-illustrations/<% =ViewState["empresa_imagen"] %>" alt="" />
                                                <img class="auth-title-box-img d-light-none" src="../../../assets/img/spot-illustrations/auth-dark.png" alt="" /></div>
                                        </div>
                                        <div class="col mx-auto">
                                            <div class="auth-form-box">
                                                <div class="text-center mb-7">
                                                    <a class="d-flex flex-center text-decoration-none mb-4">
                                                        <div class="d-flex align-items-center fw-bolder fs-3 d-inline-block">
                                                            <img src="../../../Img/logo-min_100_v2.png" alt="phoenix" width="58" />
                                                        </div>
                                                    </a>
                                                    <h3 class="text-body-highlight">Iniciar sesión</h3>
                                                    <p class="text-body-tertiary">Obtener acceso a su cuenta</p>
                                                </div>                                               
                                                <div class="mb-3 text-start">
                                                    <div class="form-floating">
                                                        <input runat="server" class="form-control form-icon-input pe-6" id="Usuario" type="text" maxlength="50" placeholder="Usuario"  />
                                                        <label for="usuario">Usuario</label>                                                        
                                                        <i class="btn px-3 py-2 h-100 position-absolute top-0 end-0 fs-7 text-body-tertiary">
                                                            <span class="uil uil-user"></span>
                                                        </i>
                                                    </div>
                                                </div>
                                                <div class="mb-3 text-start">
                                                    <div class="form-floating">
                                                        <input runat="server" class="form-control form-icon-input pe-6" id="clave" type="password" maxlength="20" placeholder="Password" data-password-input="data-password-input" />
                                                        <label for="clave">Clave</label>                                                        
                                                        <i class="btn px-3 py-2 h-100 position-absolute top-0 end-0 fs-7 text-body-tertiary" data-password-toggle="data-password-toggle">
                                                            <span class="uil uil-eye" id="togglePassword"></span>
                                                        </i>
                                                    </div>
                                                </div>
                                                <div class="row flex-between-center mb-7">
                                                    <div class="col-auto">
                                                        <div class="form-check mb-0">
                                                            <input class="form-check-input" id="basic_checkbox" type="checkbox" checked="checked" runat="server" />
                                                            <label class="form-check-label mb-0" for="basic_checkbox">Recordarme</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <a class="fs-9 fw-semibold" href="Recovery.aspx">¿Has olvidado tu contraseña?</a>
                                                    </div>
                                                </div>
                            
                                                <asp:Button runat="server" class="btn btn-primary w-100 mb-3" Text="Iniciar sesión" ID="btnLogin" OnClick="btnLogin_Click"/>
                            


                                                <div class="row">
                                                  <div class="col align-self-center">
                                                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
							                            <p class="text-danger">
								                            <asp:Literal runat="server" ID="FailureText" />
							                            </p>
						                            </asp:PlaceHolder> 
                                                  </div>
                                                </div>
                                                <%if (this.ViewState["ismobile"].ToString() == "1"){ %> 
                                                <div class="row flex-between-center mb-7">
                                                    <div class="text-center mb-7">
                                                        <button id="btnmovil" class="btn btn-phoenix-secondary w-20 mb-3" type="button" title="Mobile detectado"><i class="fas fa-mobile fa-2x"></i></button>                                                    
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </form>
    
        <!-- ===============================================-->
        <!--    End of Main Content-->
        <!-- ===============================================-->

        <!-- ===============================================-->
        <!--    JavaScripts-->
        <!-- ===============================================-->
        <script src="../../../plugins/jquery/jquery.min.js"></script>
        <script src="../../../plugins/jquery/corporativo/login/jquery.listadoweb-1.0.0.js"></script>

    </body>
</html>
