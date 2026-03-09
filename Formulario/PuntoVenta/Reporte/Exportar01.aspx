<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exportar01.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte.Exportar01" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845DCD8080CC91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Registro de Ventas</title>
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
</head>
<body>
    <form id="formdocument" asp-antiforgery="false" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
        
    </form>
</body>
</html>