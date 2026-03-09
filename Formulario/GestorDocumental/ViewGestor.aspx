<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewGestor.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.GestorDocumental.ViewGestor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="hid" />
        <asp:Button ID="btnPdf"  style="display:none" runat="server"  OnClick="btnPdf_Click" width="0px" height="0px" />
    </form>
    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script>
         $(function () {
             $("#btnPdf").trigger("click");
         });
    </script>
</body>

</html>
