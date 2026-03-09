<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CajaOperacionListadoWeb.aspx.cs" Inherits="TwoTecnology.WebVentas.CajaOperacionListadoWeb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Operaciones de Caja</title>
	
	<script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/jquery.validate.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script src="Scripts/jquery.CajaOperacionlistadoweb-1.0.6.js"></script>
    <script src="Scripts/jquery.blockUI.js"></script>
    <script src="Scripts/jquery.general-1.6.0.js"></script>
    <script src="Scripts/jquery.maskedinput.js"></script>
    
    <script src="Scripts/jquery.tabletoCSV.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" />

    <link type="text/css" href="DataTables/datatables.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="DataTables/datatables.min.js"></script>

    <script src="Scripts/jquery.table2excel.min.js"></script>
    <link href="Content/table.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBJN04gt3w85bnsJ_381PyjvqC1RDoAtVw&sensor=false"></script>
</head>
<body>
    <form id="formdocument" asp-antiforgery="false" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 

        <div class="row bg-warning margin-top-botoom-03">
            <div class="col-sm-4">
                <a href="#" onclick="nuevo();">
                    <img  src="icons/normal/new-page.png" title="Apertura" alt="Apertura" />
                </a>
               <%-- <a href="#" onclick="modificar();">
                    <img  src="icons/normal/open-page.png" title="Editar" alt="Editar"/>
                </a>
                <a href="#" onclick="eliminar();">
                    <img  src="icons/normal/delete-page.png" title="Eliminar" alt="Eliminar"/>
                </a>--%>
                <a href="#" onclick="exportar();">
                    <img  src="icons/normal/excel.png" title="Exportar" alt="Exportar"/>
                </a>
            </div>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-sm-1">
                        <p style="color:black;font-size:small;"><b>Inicio</b></p>
                    </div>
                    <div class="col-sm-2">
                        <input id="fechainicio" maxlength="8" class="form-control input-normal" style="width:100px;text-align:center" readonly="true"/>
                    </div>
                    <div class="col-sm-1">
                        <p style="color:black;font-size:small;"><b></b></p>
                    </div>
                    <div class="col-sm-2">
                        <input id="fecha" maxlength="8" class="form-control input-normal" style="width:100px;text-align:center" readonly="true" />
                    </div>
                    <div class="col-sm-2">
                        <a href="#" onclick="buscar();">
                            <img  src="icons/normal/search.png" />
                        </a>
                    </div>
                    <div class="col-sm-2">
                        <p style="color:black;font-size:small" id="documentointerno"></p>
                    </div> 
                    <div class="col-sm-2">       
                        <p style="color:black;font-size:small" id="registros"></p>
                        <input type="hidden" name="hruc" id="hruc" value="" runat="server"/>
                        <input type="hidden" name="hlocalcodigo" id="hlocalcodigo" value="" runat="server"/>
                    </div>
                    
                </div>
            </div>
        </div>

        <div class="table-responsive margin-top-03">
            <table id="tbldetalle" class="table"></table>
        </div>

      
        <div id="dialog" title="Apertura Caja" >
           <div class="content">
                <div class="row margin-top-05">
                    
                    <div class="col-sm-4">
                        <div class="row"><b>Caja</b></div>
                        <div class="row">
                            <select id="cbocaja" name="cbocaja" class="form-control"></select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="row"><b>Serie</b></div>
                        <div class="row">
                            <input id="serie" name="serie" class="form-control" style="text-align:center" disabled="disabled" />
                        </div>
                    </div>
           
                    <div class="col-sm-4">
                        <div class="row"><b>Efectivo Apertura</b></div>
                        <div class="row">
                            <input type="text" name="efectivoapertura" id="efectivoapertura" class="form-control input-normal" style="text-align:center" onkeypress="return isNumberKey(event);"/>
                        </div>
                    </div>
                </div>
               
                <div class="table-responsive margin-top-03">
                    <table id="tblmonedero" class="table"></table>
                </div>
           </div>
           <div class="footer">
               <div class="row margin-top-05">
                    <div class="col-sm-6">
                        <input type="hidden" name="hid" id="hid"/>
                        <input type="hidden" name="hsolicitud" id="hsolicitud" value="0"/>
                        <input type="hidden" name="hnombre" id="hnombre"/>
                        <input type="hidden" name="hdocumentointerno" id="hdocumentointerno" value="0"/>
                    </div>
                     <div class="col-sm-3">
                        <input type="button" class="btn btn-export" onclick="cancelar();" value="cancelar" title="Cancelar" />
                    </div>
                    <div class="col-sm-3">
                        <input type="button" class="btn btn-primary" onclick="grabar();" value="Grabar" title="Grabar" />
                    </div>
                </div>
           </div>
        </div>
    </form>
</body>
</html>

