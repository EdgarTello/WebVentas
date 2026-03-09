<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Espacio.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.GestorDocumental.Reporte.Espacio" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" data-navigation-type="default" data-navbar-horizontal-shape="default">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!-- ===============================================-->
		<!--    Document Title-->
		<!-- ===============================================-->
		<title>Documentos</title>
		<!-- ===============================================-->
		<!--    Favicons-->
		<!-- ===============================================-->
		<link rel="apple-touch-icon" sizes="180x180" href="../../../assets/img/favicons/apple-touch-icon.png" />
		<link rel="icon" type="image/png" sizes="32x32" href="../../../assets/img/favicons/favicon-32x32.png" />
		<link rel="icon" type="image/png" sizes="16x16" href="../../../assets/img/favicons/favicon-16x16.png" />
		<link rel="shortcut icon" type="image/x-icon" href="../../../assets/img/favicons/favicon.ico" />
		<link rel="manifest" href="../../../assets/img/favicons/manifest.json" />
		<meta name="msapplication-TileImage" content="../../../assets/img/favicons/mstile-150x150.png" />
		<meta name="theme-color" content="#ffffff" />
		<script src="../../../vendors/simplebar/simplebar.min.js"></script>
		<script src="../../../assets/js/config.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<!-- ===============================================-->
		<!--    Stylesheets-->
		<!-- ===============================================-->
		<link href="../../../vendors/glightbox/glightbox.min.css" rel="stylesheet">
		<link href="../../../vendors/flatpickr/flatpickr.min.css" rel="stylesheet">
		<link href="../../../vendors/prism/prism-okaidia.css" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
		<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
		<link href="../../../vendors/simplebar/simplebar.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
		<link href="../../../assets/css/theme.min.css" type="text/css" rel="stylesheet">
		<link href="../../../assets/css/user.min.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<div class="card shadow-none border mb-3" data-component-card="data-component-card">
			<div class="card-header p-2 border-bottom bg-body">
				<div class="row g-3 justify-content-between align-items-end mb-1">
					<div class="col-auto">
						<h4 class="text-body mb-0">Resumen de Espacio</h4>
						<input type="hidden" name="hid" id="hid" value="0" runat="server"/>
						<input type="hidden" name="hnombre" id="hnombre" runat="server"/>
						<input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
						<input name="__RequestVerificationToken" type="hidden" value="<%= TwoTecnology.WebVentas.Metodos.GetAntiXsrfToken("EspacioList") %>" />
					</div>
				</div>
			</div>
			<div class="card-body p-0">                
				 <div class="collapse code-collapse" id="ajax-table-code">
					 <pre class="scrollbar" style="max-height:420px"><code class="language-html"></code></pre>
				 </div>
				 <div class="p-4 code-to-copy">
						<div class="row">
							<div class="col-lg-6">
								<table id="tblgeneral" class="table table-sm fs-9 mb-0 overflow-hidden table-hover">
									<thead class="text-body bg-body-highlight">
									<tr>
										<th></th>
										<th class="text-center">Información General</th>
									</tr>
									</thead>
									<tbody id="tblbodygeneral">
									</tbody> 
								</table>
							</div>
							<div class="col-lg-6">
								<table id="tbldetalle" class="table table-sm fs-9 mb-0 overflow-hidden table-hover">
									<thead class="text-body bg-body-highlight">
									<tr>
										<th class="text-center">Areas</th>
										<th class="text-center">Documentos</th>
										<th class="text-center">Size GB</th>
									</tr>
									</thead>
									<tbody id="tblbodydetalle">
									</tbody> 
								</table>
							</div>
						</div>
				</div>
			</div>			
		</div>
		<!-- ===============================================-->
		<!--    JavaScripts-->
		<!-- ===============================================-->
		<!-- jQuery -->
		<script src="../../../plugins/jquery/jquery.min.js"></script>
		<script src="../../../plugins/jquery-ui/jquery-ui.min.js"></script>
		<script src="../../../plugins/jquery-blockuid/jquery.blockUI.min.js"></script>


		<script src="../../../plugins/jquery/jquery.general-2.6.6.js"></script>
		<script src="../../../plugins/jquery/gestordocumental/reporte/jquery.espacioweb-2.2.1.js"></script>

	</body>
</html>