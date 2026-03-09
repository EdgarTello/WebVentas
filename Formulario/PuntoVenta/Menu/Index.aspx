<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Menu.Index" %>

<!DOCTYPE html>
<html lang="en" class="js-focus-visible" data-js-focus-visible="" style="height: auto;">
<head>
  <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	<title>ERP - TwoTecnology</title>	
    <meta name="apple-itunes-app" content="app-id=378649517" />
    <meta name="description" content="Nos preocupamos por ti.  En la banca por internet de Interbank encontrarás todo para tus necesidades financieras. ¡Maneja tu dinero de manera segura!" />
	<meta name="robots" content="index, follow"/>
    <meta name="viewport" content="initial-scale=1, minimum-scale=1, shrink-to-fit=no, width=device-width" />

	<meta property="og:type" content="website" />
	<meta property="og:title" content="ERP: un pago rápido - TwoTecnology" />
	<meta property="og:description" content="Nos preocupamos por darle un mejor soporte!" />
	<meta property="og:url" content="http://twotecnology.online/" />

  <!-- Google Font: Source Sans Pro -->
  <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">-->
  <!-- <link rel="stylesheet" href="../../../fonts/glyphicons-halflings-regular.woff2">-->
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../../dist/css/adminlte.min.css?v=3.2.0">
  <link rel="stylesheet" href="../../../plugins/overlayScrollbars/css/OverlayScrollbars.min.css" />
  <link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>
<body class="hold-transition sidebar-mini layout-fixed" data-panel-auto-height-mode="height">
<!-- Site wrapper -->
<form id="formdocument" asp-antiforgery="false" runat="server">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button" id="pushmenu"><i class="fas fa-bars"></i></a>
        </li>
        <%if (this.ViewState["empresa_tipo"].ToString() != "21")
        { %> 
        <li class="nav-item">
            <a class="nav-link">
                <asp:Literal runat="server" ID="lblruc"></asp:Literal>
            </a>    
        </li>

        <li class="nav-item">
            <a class="nav-link">
                <asp:Literal runat="server" ID="lblempresa"></asp:Literal>
            </a>    
        </li>
        
        <li class="nav-item">
            <a class="nav-link">
                <i class="fas fa-industry"></i>
            </a>
        </li>
        <%}%>
        
        <li class="nav-item">
              <asp:DropDownList ID="local" CssClass="form-control" runat="server"></asp:DropDownList> 
        </li>
        <li class="nav-item">
            <%--<marquee direction="left" class="text-danger">Tiene un plazo de 72 horas para cancerlar su deuda, evite las reconexiones!</marquee>--%>
        </li>
        
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      
      <!-- Navbar Search -->
      <li class="nav-item">
        <a  class="nav-link" href="#">    
            <img src="../../../images/whatsapp.png"   />
            <span id="stelefonosoporte" onclick="openchat();" class="text-secondary">+<%=this.ViewState["telefonosoporte"].ToString()%> </span>
        </a>
      </li>

      <%if (this.ViewState["empresa_tipo"].ToString() != "21")
      { %> 
      <li class="nav-item">
        <a class="nav-link">           
            <i class="fas fa-user"></i>                       
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link">           
            <b><asp:Literal runat="server" ID="lblnombres"></asp:Literal></b>
        </a>
      </li>
      <%}%>
      <li class="nav-item">
        <a id="fechavista" class="nav-link"></a>
      </li>
      <li class="nav-item">
        <a href="#" class="nav-link" onclick="openclave();">
            <i class="fas fa-key"></i>
        </a>
      </li> 
      <li class="nav-item">
        <asp:LoginStatus ID="LoginStatus1" runat="server" 
            LogoutAction="Redirect"
            onclick="$('#dialogLogin').modal('show'); return false;"
            LogoutText="<span class='nav-link'><i class='fas fa-sign-out-alt'></i></span>" 
            LogoutPageUrl="~/"  />
      </li> 
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-light-primary elevation-4 custom_sidebar">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
        <center>
            <img src="../../../img/empresa/<% =ViewState["empresa_imagen"] %>" class="img-thumbnail" style="opacity:.8;width:140px;height:60px"/>
            <input type="hidden" id="hempresatipo" name="hempresatipo" runat="server" />
            <input type="hidden" id="husuarioacceso" name="husuarioacceso" runat="server" />

            <input type="hidden" id="hcajeroreporte" name="hcajeroreporte" runat="server" />
            <input type="hidden" id="hcajeroproducto" name="hcajeroproducto" runat="server" />

            <input type="hidden" id="hcajeroparallevar" name="hcajeroparallevar" runat="server" />
            <input type="hidden" id="hcajerodelivery" name="hcajerodelivery" runat="server" />
            <input type="hidden" id="hcajerodashboard" name="hcajerodashboard" runat="server" />
            <input type="hidden" id="hdashboarpantalla" name="hdashboarpantalla" runat="server" />

            <input type="hidden" id="htelefonosoporte" name="htelefonosoporte" runat="server" />
        </center>
        <center>
            <span class="">
                Gestión del Negocio 
            </span>
        </center>
      <%--<span class="brand-text font-weight-light">
          <asp:Literal runat="server" ID="lblempresa"></asp:Literal>
      </span>--%>
    </a>

    <!-- Sidebar -->
    <div class="sidebar os-host os-theme-light os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition">
     
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu">
         
            <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
                  this.ViewState["acceso"].ToString() == "Administrador" ||
                  this.ViewState["acceso"].ToString() == "Admin" ||
                  this.ViewState["acceso"].ToString() == "AdminAlmacen" ||
                  (this.ViewState["acceso"].ToString() == "Cajero" && this.ViewState["cajerodashboard"].ToString() == "1") || 
                  this.ViewState["acceso"].ToString() == "Gerencia")
            { %> 
            <li class="nav-item">
                <a href="../DashBoard/Listado.aspx" class="nav-link" id="menu02">
                    <i class="nav-icon fas fa-tachometer-alt"></i>
                    <p>DashBoard</p>
                </a>
            </li>
            <%}%>

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
                <i class="nav-icon fas fa-shopping-bag"></i>
              <p>Operaciones de Venta
                  <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

           <%if  
                 (
                 this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                 this.ViewState["acceso"].ToString() == "Cajero" || 
                 this.ViewState["acceso"].ToString() == "Admin" || 
                 this.ViewState["acceso"].ToString() == "Administrador" )
            { %> 
            <li class="nav-item menu-item">
                <a href="../OperacionCaja/Listado.aspx" class="nav-link">
                    <i class="nav-icon fas fa-cash-register"></i>
                    <p>Operación de Caja</p>
                </a>
            </li>
          <%}%>

         <%--  <%if (this.ViewState["acceso"].ToString() == "Vendedor" || this.ViewState["acceso"].ToString() == "Administrador")
            { %> 
            <li class="nav-item">
                <a id="A23" href="RegistroDeVentaWeb" class="nav-link">
                    <i class="nav-icon fas fa-shopping-cart"></i>
                    <p>Registro de Venta</p>
                </a>
            </li>
          <%}%>--%>

         
          <%if ( ( this.ViewState["empresa_tipo"].ToString() == "2" ||
                   this.ViewState["empresa_tipo"].ToString() == "200" ||
                   this.ViewState["empresa_tipo"].ToString() == "201" ||
                   this.ViewState["empresa_tipo"].ToString() == "202") 
                   && 
                  ( 
                   this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                   this.ViewState["acceso"].ToString() == "Cajero" || 
                   this.ViewState["acceso"].ToString() == "Admin" || 
                   this.ViewState["acceso"].ToString() == "Administrador"))
              { %>
          <li class="nav-item menu-item">
            <a href="../Cotizacion02/Listado.aspx" class="nav-link" id="menu54">
                <i class="nav-icon fas fa-boxes"></i>
                <p>Cotización</p>
             </a>
          </li>
           <%}%>

          <%if ( this.ViewState["empresa_tipo"].ToString() == "2" && this.ViewState["acceso"].ToString() == "Vendedor")
              { %>
          <li class="nav-item menu-item">
            <a href="../PuntoVenta02/Listado.aspx" class="nav-link">
                <i class="nav-icon fas fa-boxes"></i>
                <p>Pedidos</p>
             </a>
          </li>
           <%}%>
         

          <%if (
                 (
                  !( this.ViewState["empresa_tipo"].ToString() == "3" ||
                     //this.ViewState["empresa_tipo"].ToString() == "23" ||
                     this.ViewState["empresa_tipo"].ToString() == "300" ||
                     this.ViewState["empresa_tipo"].ToString() == "301" ||
                     this.ViewState["empresa_tipo"].ToString() == "302")) 
                   && 
                    (this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                    this.ViewState["acceso"].ToString() == "Cajero" || 
                    this.ViewState["acceso"].ToString() == "Mesero" || 
                    this.ViewState["acceso"].ToString() == "J.Mozo" || 
                    this.ViewState["acceso"].ToString() == "Admin" || 
                    this.ViewState["acceso"].ToString() == "Administrador"))
              { %>
          <li class="nav-item menu-item">
            <a href="../Validacion/Nuevo.aspx" class="nav-link" id="menu01">
                <i class="nav-icon fas fa-boxes"></i>
                <p>Punto de Venta</p>
             </a>
          </li>
           <%}%>


          <%if ( ( this.ViewState["empresa_tipo"].ToString() == "3" ||
                   this.ViewState["empresa_tipo"].ToString() == "300" ||
                   this.ViewState["empresa_tipo"].ToString() == "301" ||
                   this.ViewState["empresa_tipo"].ToString() == "302") 
                   && 
                  ( 
                   this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                   this.ViewState["acceso"].ToString() == "Cajero" || 
                   this.ViewState["acceso"].ToString() == "Admin" || 
                   this.ViewState["acceso"].ToString() == "Administrador"))
              { %>
          <li class="nav-item menu-item">
            <a href="../PuntoVenta03/Listado.aspx" class="nav-link" id="menu04">
                <i class="nav-icon fas fa-boxes"></i>
                <p>Pedidos</p>
             </a>
          </li>
           <%}%>

          

          
          <%if (this.ViewState["empresa_tipo"].ToString() == "31" && 
                  (this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                    this.ViewState["acceso"].ToString() == "Administrador" ||
                    this.ViewState["acceso"].ToString() == "Admin" ||
                    this.ViewState["acceso"].ToString() == "Cajero" || 
                    this.ViewState["acceso"].ToString() == "Mesero" ||
                    this.ViewState["acceso"].ToString() == "J.Mozo"
                    ))
            { %> 
            <li class="nav-item menu-item">
                <a href="../Mesa/Listado.aspx" class="nav-link" id="menu31">
                    <i class="nav-icon fas fa-car-alt"></i>
                    <p>Vehiculos</p>
                </a>
            </li>
          <%}%>

          <%if (  (this.ViewState["empresa_tipo"].ToString() == "3" || 
                   this.ViewState["empresa_tipo"].ToString() == "300" ||
                   this.ViewState["empresa_tipo"].ToString() == "301" ||
                   this.ViewState["empresa_tipo"].ToString() == "302" ) && 
                  (this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                    this.ViewState["acceso"].ToString() == "Administrador" ||
                    this.ViewState["acceso"].ToString() == "Admin" ||
                    this.ViewState["acceso"].ToString() == "Cajero" || 
                    this.ViewState["acceso"].ToString() == "J.Mozo" || 
                    this.ViewState["acceso"].ToString() == "Mesero"
                    ))
            { %> 
            <li class="nav-item menu-item">
                <a href="../Mesa/Listado.aspx" class="nav-link" id="menu03">
                    <i class="nav-icon fas fa-store-alt"></i>
                    <p>Mesas</p>
                </a>
            </li>
          <%}%>

           <%if ( (this.ViewState["empresa_tipo"].ToString() == "2" || 
                   this.ViewState["empresa_tipo"].ToString() == "200" ||
                   this.ViewState["empresa_tipo"].ToString() == "201" ||
                   this.ViewState["empresa_tipo"].ToString() == "202" ||
                   this.ViewState["empresa_tipo"].ToString() == "3" ||
                   this.ViewState["empresa_tipo"].ToString() == "300" ||
                   this.ViewState["empresa_tipo"].ToString() == "301" ||
                   this.ViewState["empresa_tipo"].ToString() == "302" ) && (
                   this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                   (
                   this.ViewState["acceso"].ToString() == "Cajero" &&  
                   ViewState["cajerodelivery"].ToString()=="1") ||
                   this.ViewState["acceso"].ToString() == "Admin" ||
                   this.ViewState["acceso"].ToString() == "Administrador"))
            { %> 
            <li class="nav-item menu-item">
                <a id="A24" href="../Delivery/Listado.aspx" class="nav-link">
                    <i class="nav-icon fas fa-truck"></i>
                    <p>Delivery</p>
                </a>
            </li>
          <%}%>

          <%if ( (this.ViewState["empresa_tipo"].ToString() == "3" || 
                  this.ViewState["empresa_tipo"].ToString() == "300" ||
                  this.ViewState["empresa_tipo"].ToString() == "301" ||
                  this.ViewState["empresa_tipo"].ToString() == "302") && (
                  this.ViewState["acceso"].ToString() == "SuperAdmin" ||
                  (this.ViewState["acceso"].ToString() == "Cajero" && ViewState["cajeroparallevar"].ToString() == "1") ||
                  this.ViewState["acceso"].ToString() == "Admin" ||
                  this.ViewState["acceso"].ToString() == "Administrador"))
            { %> 
            <li class="nav-item menu-item">
                <a id="A29" href="../LlevarPendiente/Listado.aspx" class="nav-link">
                    <i class="nav-icon fas fa-box"></i>
                    <p>Para Llevar</p>
                </a>
            </li>
          <%}%>
          
         <%if (     this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                    this.ViewState["acceso"].ToString() == "Cajero" ||  
                    this.ViewState["acceso"].ToString() == "Admin" || 
                    this.ViewState["acceso"].ToString() == "Administrador" || 
                    this.ViewState["acceso"].ToString() == "Contador")
              { %>
          <li class="nav-item menu-item">
            <a href="../Documento/Listado.aspx" class="nav-link">
                <i class="nav-icon fas fa-file"></i>
                <p>Documentos</p>
             </a>
          </li>
          <%}%>

           </ul>
         </li>

         <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-address-book"></i>
              <p>Gestión del Cliente
                  <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
               
                 <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
                      this.ViewState["acceso"].ToString() == "Administrador" ||
                      this.ViewState["acceso"].ToString() == "Admin" ||
                      this.ViewState["acceso"].ToString() == "Almacenero" ||
                      this.ViewState["acceso"].ToString() == "Cajero" )
              { %>
              <li class="nav-item menu-item">
                <a href="../Cliente/Listado.aspx" class="nav-link">
                    <i class="nav-icon fas fas fa-user"></i>
                    <p>Clientes</p>
                 </a>
              </li>
                <%}%>

               

                <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
                      this.ViewState["acceso"].ToString() == "Admin" ||
                      this.ViewState["acceso"].ToString() == "Administrador"  )
                {%>
                <li class="nav-item menu-item">
                    <a href="../ClienteCategoria/Listado.aspx" class="nav-link">
                        <i class="nav-icon fas fa-box"></i>
                        <p>Categoría</p>
                    </a>
                </li>

                <li class="nav-item menu-item">
                    <a href="../Dinamico/Listado.aspx" class="nav-link">
                        <i class="nav-icon fas fa-chart-line"></i>
                        <p>Dinamico</p>
                    </a>
                </li>
                <%}%>
            </ul>
          </li>


        <%if ((this.ViewState["acceso"].ToString() == "SuperAdmin" || 
              this.ViewState["acceso"].ToString() == "Administrador" || 
              this.ViewState["acceso"].ToString() == "Admin" || 
              this.ViewState["acceso"].ToString() == "Contador") &&
              (
              this.ViewState["empresa_tipo"].ToString()=="2" ||
              this.ViewState["empresa_tipo"].ToString() == "200" ||
              this.ViewState["empresa_tipo"].ToString() == "201" ||
              this.ViewState["empresa_tipo"].ToString() == "202" ||
              this.ViewState["empresa_tipo"].ToString()=="3" ||
              this.ViewState["empresa_tipo"].ToString() == "300" ||
              this.ViewState["empresa_tipo"].ToString() == "301" ||
              this.ViewState["empresa_tipo"].ToString() == "302") )
        { %>
         <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-shopping-cart"></i>
              <p>
                  Gestión de Ventas
                  <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

              <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                   this.ViewState["acceso"].ToString() == "Admin" ||
                    this.ViewState["acceso"].ToString() == "Administrador" ) 
                  { %>
              <li class="nav-item menu-item">
                <a href="../PromocionPrecio/Listado.aspx" class="nav-link">
                    <i class="nav-icon fas fa-gift"></i>
                    <p>Promocion x Precio</p>
                 </a>
              </li>
             <%}%>
              
             <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
                   this.ViewState["acceso"].ToString() == "Administrador" || 
                   this.ViewState["acceso"].ToString() == "Admin" ||
                   this.ViewState["acceso"].ToString() == "Contador") 
                  { %>
              <li class="nav-item menu-item">
                <a href="../ValesConsumo/Listado.aspx" class="nav-link">
                    <i class="nav-icon fas fa-barcode"></i>
                    <p>Vales Consumo</p>
                 </a>
              </li>
              <%}%>

            </ul>
          </li>
         <%}%>
        
        <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
              this.ViewState["acceso"].ToString() == "Contador")
        { %>
         <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-folder-open"></i>
              <p>
                  Tesorería
                  <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
               
              <li class="nav-item menu-item">
                <a href="../CuentasxCobrar/Listado.aspx" class="nav-link">
                    <i class="nav-icon fas fas fa-business-time""></i>
                    <p>Cuentas x Cobrar</p>
                 </a>
              </li>
               

            </ul>
          </li>
          <%}%>

         <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-city"></i>
              <p>
                  Almacen
                  <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
               
              <%if ((this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                      this.ViewState["acceso"].ToString() == "Cajero" || 
                      this.ViewState["acceso"].ToString() == "Almacen" || 
                      this.ViewState["acceso"].ToString() == "AdminAlmacen" || 
                      this.ViewState["acceso"].ToString() == "Almacenero" || 
                      this.ViewState["acceso"].ToString() == "Admin" || 
                      this.ViewState["acceso"].ToString() == "Administrador" )) 
                  { %>
              <li class="nav-item menu-item">
                <a href="../GuiaRemision23/Listado.aspx" class="nav-link" id="menu10">
                    <i class="nav-icon fas fa-file-alt"></i>
                    <p>Generación de Guía</p>
                 </a>
              </li>
              <%}%>



              <%if (  this.ViewState["empresa_tipo"].ToString() != "23" &&
                      (this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                      this.ViewState["acceso"].ToString() == "Cajero" || 
                      this.ViewState["acceso"].ToString() == "Admin" || 
                      this.ViewState["acceso"].ToString() == "Administrador" ))
                  { %>
              <li class="nav-item menu-item">
                <a href="../GuiaRemision01/Listado.aspx" class="nav-link">
                    <i class="nav-icon fas fa-file-alt"></i>
                    <p>Ingreso de Guía</p>
                 </a>
              </li>
              <%}%>

            </ul>
        </li>
          


          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-warehouse"></i>
              <p>
                  Maestros
                  <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

           
          

               <%if ( this.ViewState["acceso"].ToString() == "SuperAdmin" || 
                       this.ViewState["acceso"].ToString() == "AdminAlmacen" || 
                       this.ViewState["acceso"].ToString() == "Admin" || 
                      this.ViewState["acceso"].ToString() == "Administrador")
                {%>
              <li class="nav-item menu-item">
                <a href="../Colaborador/Listado.aspx" class="nav-link">
                    <i class="nav-icon fas fa-user-tie"></i>
                    <p>Colaboradores</p>
                 </a>
              </li>
               <%}%>


               
                
                

               <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
                       this.ViewState["acceso"].ToString() == "Administrador" ||
                       this.ViewState["acceso"].ToString() == "Admin" ||
                       this.ViewState["acceso"].ToString() == "Almacenero" ||
                       (
                        this.ViewState["acceso"].ToString() == "Cajero" &&
                        this.ViewState["cajeroproducto"].ToString() == "1"
                       ))
                {%>
              <li class="nav-item menu-item">
                <a href="../Producto/Listado.aspx" class="nav-link">
                    <i class="nav-icon fas fa-barcode"></i>
                    <p>Producto</p>
                 </a>

                 <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" ||
                      this.ViewState["acceso"].ToString() == "Admin" ||
                      this.ViewState["acceso"].ToString() == "Administrador"  )
                {%>
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-address-book"></i>
                        <p>
                            Configuracion
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item menu-item">
                        <a href="../Tipo/Listado.aspx" class="nav-link">
                            <i class="nav-icon fas fa-box"></i>
                            <p>Tipo</p>
                            </a>
              
                        <li class="nav-item menu-item">
                        <a href="../Familia/Listado.aspx" class="nav-link">
                            <i class="nav-icon fas fa-box"></i>
                            <p>Familia</p>
                            </a>
                        </li>
             
                        <li class="nav-item menu-item">
                        <a href="../Categoria/Listado.aspx" class="nav-link">
                            <i class="nav-icon fas fa-box"></i>
                            <p>Categoría</p>
                            </a>
                        </li>

                        <li class="nav-item menu-item">
                        <a href="../Presentacion/Listado.aspx" class="nav-link">
                            <i class="nav-icon fas fa-briefcase"></i>
                            <p>Presentación</p>
                            </a>
                        </li>

                        <%if (
                        this.ViewState["empresa_tipo"].ToString() != "23" &&
                        (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
                         this.ViewState["acceso"].ToString() == "Admin" || 
                         this.ViewState["acceso"].ToString() == "Administrador"))
                        {%>
                        <li class="nav-item menu-item">
                        <a href="../Grupos/Listado.aspx" class="nav-link">
                            <i class="nav-icon fas fa-book"></i>
                            <p>Grupos</p>
                            </a>
                        </li>

                        <li class="nav-item menu-item">
                        <a href="../Personalizar/Listado.aspx" class="nav-link">
                            <i class="nav-icon fas fa-book"></i>
                            <p>Personalizar</p>
                            </a>
                        </li>
                        <%}%>

                        <li class="nav-item menu-item">
                        <a href="../Horario/Listado.aspx" class="nav-link">
                            <i class="nav-icon fas fa-calendar"></i>
                            <p>Horario</p>
                            </a>
                        </li>
                    </ul>


                <%}%>
              </li>


              
              <%}%>

                

                

              

                <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
                      this.ViewState["acceso"].ToString() == "AdminAlmacen" ||
                      this.ViewState["acceso"].ToString() == "Admin" ||
                      this.ViewState["acceso"].ToString() == "Administrador")
                {%>
                <li class="nav-item menu-item">
                    <a href="../Almacen/Listado.aspx" class="nav-link">
                    <%--<a href="LocalesListadoWeb" class="nav-link">--%>
                        <i class="nav-icon fas fa-city"></i>
                        <p>Almacenes</p>
                    </a>
                </li>
                <%}%>

                <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
                      this.ViewState["acceso"].ToString() == "Admin" || 
                      this.ViewState["acceso"].ToString() == "Administrador")
                {%>
                <li class="nav-item menu-item">
                    <a href="../Local/Listado.aspx" class="nav-link">
                    <%--<a href="LocalesListadoWeb" class="nav-link">--%>
                        <i class="nav-icon fas fa-city"></i>
                        <p>Locales</p>
                    </a>
                </li>
                <%}%>

              

                 <%if (
                       (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
                       this.ViewState["acceso"].ToString() == "Admin" || 
                       this.ViewState["acceso"].ToString() == "Administrador" || 
                       this.ViewState["acceso"].ToString() == "Cajero"))
                {%>
                <li class="nav-item menu-item">
                    <a href="../TipoCambio/Listado.aspx" class="nav-link">
                        <i class="nav-icon fas fa-dollar-sign"></i>
                        <p>Tipo de Cambio</p>
                    </a>
                </li>
                <%}%>

                
            </ul>
        </li>
            
        
          
        <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
              this.ViewState["acceso"].ToString() == "Admin" || 
              this.ViewState["acceso"].ToString() == "Administrador" || 
              this.ViewState["acceso"].ToString() == "Gerencia" ||                    
              this.ViewState["acceso"].ToString() == "Contador" ||
              (
                this.ViewState["acceso"].ToString() == "Cajero" &&
                this.ViewState["cajeroreporte"].ToString() == "1" )
              )
                {%>
          <li class="nav-item">
            <a href="../Reporte/Listado.aspx" class="nav-link">
                <i class="nav-icon fas fa-chart-line"></i>
                <p>Reporte</p>
             </a>
          </li>
          <%}%>

        <%if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
            this.ViewState["acceso"].ToString() == "Administrador" || 
            this.ViewState["acceso"].ToString() == "Admin" || 
            this.ViewState["acceso"].ToString() == "Gerencia" ||                    
            this.ViewState["acceso"].ToString() == "Contador" ||
            this.ViewState["acceso"].ToString() == "Cajero" )
          {%>
               
            <li class="nav-item">
	            <a href="#" class="nav-link">
	                <i class="nav-icon fas fa-university"></i>
	                <p>SIRE
		                <i class="right fas fa-angle-left"></i>
	                </p>
	            </a>
	            <ul class="nav nav-treeview">
		           
                    <li class="nav-item menu-item">
			            <a href="../Sire/Compras/Listado.aspx" class="nav-link">
				            <i class="nav-icon fa fa-credit-card"></i>
				            <p>Compras</p>
			            </a>
		            </li>
	            </ul>
            </li>
        
          
          <%}%>


        <%
        if (this.ViewState["acceso"].ToString() == "SuperAdmin" || 
            this.ViewState["acceso"].ToString() == "Administrador" || 
            this.ViewState["acceso"].ToString() == "Admin" || 
            this.ViewState["acceso"].ToString() == "Gerencia")
        {%>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-microchip"></i>
              <p>
                  Configuración
                  <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item menu-item">
                <a id="A39" href="../Configuracion/Nuevo.aspx" class="nav-link">
                    <i class="nav-icon fas fa-archive"></i>
                    <p>Parametros</p>
                 </a>
              </li>

              <%if ((
                    this.ViewState["acceso"].ToString() == "SuperAdmin" ||  
                    this.ViewState["acceso"].ToString() == "Admin" ||  
                    this.ViewState["acceso"].ToString() == "Administrador"))
                {%>
                <li class="nav-item menu-item">
                    <a href="../Impuesto/Listado.aspx" class="nav-link">
                        <i class="nav-icon fas fa-money-check-alt"></i>
                        <p>Impuesto</p>
                    </a>
                </li>
               
                <li class="nav-item menu-item">
                    <a href="../Retencion/Listado.aspx" class="nav-link">
                        <i class="nav-icon fas fa-file-invoice-dollar"></i>
                        <p>Retención</p>
                    </a>
                </li>

                <li class="nav-item menu-item">
                    <a href="../Detraccion/Listado.aspx" class="nav-link">
                        <i class="nav-icon fas fa-file-invoice-dollar"></i>
                        <p>Detracción</p>
                    </a>
                </li>
              
                <li class="nav-item menu-item">
                    <a href="../TipoPago/Listado.aspx" class="nav-link">
                        <i class="nav-icon fas fa-id-card"></i>
                        <p>TipoPago</p>
                    </a>
                </li>
                <%}%>
            </ul>
          <%}%>
         
         <li class="nav-item">
            <a href="../Contrasena/Listado.aspx" class="nav-link" id="mcontrasena">
               <i class="fas fa-key"></i>
                <p>Contraseña</p>
             </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable">
        <div class="os-scrollbar-track">
            <div class="os-scrollbar-handle" style="width: 100%; transform: translate(0px, 0px);">
            </div>
        </div>
    </div>
    <div class="os-scrollbar os-scrollbar-vertical">
        <div class="os-scrollbar-track">
            <div class="os-scrollbar-handle" style="height: 10.0221%; transform: translate(0px, 8.35381px);">
            </div>
        </div>
    </div>
    <div class="os-scrollbar-corner"></div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper iframe-mode" data-widget="iframe" data-loading-screen="750">
  <div class="nav navbar navbar-expand navbar-white navbar-light border-bottom p-0">
    <!--
    <div class="nav-item dropdown">
        <a class="nav-link bg-secondary dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Cerrar</a>
        <div class="dropdown-menu mt-0">
            <a class="dropdown-item" href="#" data-widget="iframe-close" data-type="all">Todos</a>
            <a class="dropdown-item" href="#" data-widget="iframe-close" data-type="all-other">Todos menos este</a>
        </div>
    </div>
    -->
    <a class="nav-link bg-light" href="#" data-widget="iframe-scrollleft"><i class="fas fa-angle-double-left"></i></a>
    <ul class="navbar-nav overflow-hidden" role="tablist"></ul>
    <a class="nav-link bg-light" href="#" data-widget="iframe-scrollright"><i class="fas fa-angle-double-right"></i></a>
    <a class="nav-link bg-light" href="#" data-widget="iframe-fullscreen"><i class="fas fa-expand"></i></a>
   </div>
   <div class="tab-content">
      <div class="tab-empty">
        <h2 class="display-4">Seleccione alguna opcion de menu!</h2>
      </div>
      <div class="tab-loading">
        <div>
          <h2 class="display-4">Cargando ... <i class="fa fa-sync fa-spin"></i></h2>
        </div>
      </div>
    </div>
  </div>
<div class="modal fade" id="dialogLogin" tabindex="-1" role="dialog" aria-labelledby="dialogLoginLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="dialogLoginLabel">Administrador</h5>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">
            Esta seguro de salir del aplicativo? 
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <button type="button" class="btn btn-danger" id="btncontinuar" onclick="logout()">Salir</button>
        </div>
        </div>
    </div>
</div>    
  <!-- /.content-wrapper -->

  <%--<footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.1.0
    </div>
    <strong>Copyright &copy; 2020-2021 <a href="https://www.twotecnology.com" target="_blank">Two Tecnology</a>.</strong> All rights reserved.
  </footer>--%>
</div>
</form>
<!-- jQuery -->
<script src="../../../plugins/jquery/jquery.min.js"></script>
<script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>

<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
<!-- Bootstrap 4 -->
<script src="../../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../dist/js/adminlte.min.js"></script>


<script>
    $(function () {


        setInterval(
            function () {
                $("#fechavista").text(getDateTime());
            }, 1000);

        var pagina = getParameterByName('pagina');

        

        if (pagina != '') {

            if (pagina == '1') {
                setTimeout(
                    function () {
                        $('#menu01').click();
                        $('#pushmenu').click();
                        //$('#fullscreen').click();
                    }, 500);
            }

            if (pagina == '2' || pagina == '200' || pagina == '201' || pagina == '202') {
                setTimeout(
                    function () {
                        $('#menu02').click();
                        $('#pushmenu').click();
                        //$('#fullscreen').click();
                    }, 500);
            }

            if (pagina == '3' || pagina == '300' || pagina == '301' || pagina == '302') {

                setTimeout(
                    function () {
                        $('#menu03').click();
                        $('#pushmenu').click();
                        //$('#fullscreen').click();
                    }, 500);
            }

            if (pagina == '10') {

                setTimeout(
                    function () {
                        $('#menu10').click();
                        $('#pushmenu').click();
                        //$('#fullscreen').click();
                    }, 500);
            }

            if (pagina == '101') {

                setTimeout(
                    function () {
                        $('#menu10').click();
                        $('#pushmenu').click();
                        //$('#fullscreen').click();
                    }, 500);
            }

            if (pagina == '102') {

                setTimeout(
                    function () {
                        $('#menu01').click();
                        $('#pushmenu').click();
                        //$('#fullscreen').click();
                    }, 500);
            }

        }
        else {
            $('#pushmenu').click();
        }
    });

    function openclave() {

        $('#mcontrasena').click();
    }

    function openchat() {

        var telefonosoporte = $("#htelefonosoporte").val();

        var url = "https://wa.me/" + telefonosoporte + "?text=Hola deseo contactarme con ustedes";

        window.open(url, "_blank");
        //window.location.href = url;
    }
   
    function logout() {
        window.location.href = '../Menu/Salir.aspx';
    }
   

    function getParameterByName(name) {
        var regexS = "[\\?&]" + name + "=([^&#]*)",
            regex = new RegExp(regexS),
            results = regex.exec(window.location.search);
        if (results == null) {
            return "";
        } else {
            return decodeURIComponent(results[1].replace(/\+/g, " "));
        }
    }
</script>
<style>
    .navbar {
        padding: 0.1rem 0.1rem !important;
    }

    .menu-item {
        padding-left:1rem !important;
    }
</style>
</body>
</html>

