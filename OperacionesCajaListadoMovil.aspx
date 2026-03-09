<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperacionesCajaListadoMovil.aspx.cs" Inherits="TwoTecnology.WebVentas.OperacionesCajaListadoMovil" %>

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
    <script src="Scripts/jquery.CajaOperacionlistadomovil-1.0.0.js"></script>
    <script src="Scripts/jquery.blockUI.js"></script>
    <script src="Scripts/jquery.general-1.6.0.js"></script>
    <script src="Scripts/jquery.maskedinput.js"></script>
    
    <script src="Scripts/jquery.tabletoCSV.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" />

    <link type="text/css" href="DataTables/datatables.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="DataTables/datatables.min.js"></script>

    <link href="ribbon/ribbon-dark.css" rel="stylesheet" type="text/css" />
	<link href="soft_button.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="ribbon/ribbon.js"></script>

    <script src="Scripts/jquery.table2excel.min.js"></script>
    <link href="Content/table.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBJN04gt3w85bnsJ_381PyjvqC1RDoAtVw&sensor=false"></script>

</head>
<body>
    <form id="formdocument" asp-antiforgery="false" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 

        <div id="ribbon">
		    <span class="ribbon-window-title">Mantenimiento de Operaciones de Caja</span>
		    <div class="ribbon-tab" id="operacion-tab">
			    <span class="ribbon-title">Operación</span>
			    <div class="ribbon-section">
				    <div class="ribbon-button ribbon-button-large" id="add-page-btn">   
					    <span class="button-title">Apertura</span>
					    <img class="ribbon-icon ribbon-normal" src="icons/normal/new-page.png" />
					    <img class="ribbon-icon ribbon-hot" src="icons/hot/new-page.png" />
					    <img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-page.png" />
				    </div>
				    <div class="ribbon-button ribbon-button-large disabled" id="open-page-btn">
					    <span class="button-title">Editar</span>
					    <img class="ribbon-icon ribbon-normal" src="icons/normal/open-page.png" />
					    <img class="ribbon-icon ribbon-hot" src="icons/hot/open-page.png" />
					    <img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-page.png" />
				    </div>
				    <div class="ribbon-button ribbon-button-large disabled" id="del-page-btn">
					    <span class="button-title">Eliminar</span>
					    <img class="ribbon-icon ribbon-normal" src="icons/normal/delete-page.png" />
					    <img class="ribbon-icon ribbon-hot" src="icons/hot/delete-page.png" />
					    <img class="ribbon-icon ribbon-disabled" src="icons/disabled/delete-page.png" />
				    </div>
                    <div class="ribbon-button ribbon-button-large disabled" id="exportar-page-btn">
                        <span class="button-title">Save</span>
					    <img class="ribbon-icon ribbon-normal" src="icons/normal/excel.png" alt="Save" />
					    <img class="ribbon-icon ribbon-disabled" src="icons/normal/excel.png" alt="Save" />
				    </div>
			    </div>
			
                <div class="ribbon-section">
				    <div class="ribbon-button ribbon-button-large">
                         <div class="row margin-top-05">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-5">
                                <div class="row margin-top-05"><b>Inicio</b></div>
                                <div class="row margin-top-05">
                                    <input id="fechainicio" maxlength="8" class="form-control input-normal" style="width:100px" readonly="true"/>
                                </div>
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-5">
                                <div class="row margin-top-05"><b></b></div>
                                <div class="row margin-top-05">
                                    <input id="fecha" maxlength="8" class="form-control input-normal" style="width:100px" readonly="true" />
                                </div>
                            </div>
                        </div>
				    </div>
                </div>
                <div class="ribbon-section">
                    <div class="ribbon-button ribbon-button-large" id="search-btn">
                        <span class="button-title">Buscar</span>
					    <img class="ribbon-icon ribbon-normal" src="icons/normal/search.png" />
                    </div>
			    </div>
                <div class="ribbon-section">
                    <div class="ribbon-button ribbon-button-large" id="resultado-btn">
                        <br />
                        <b><p style="color:black;font-size:small" id="registros"></p></b>
                    </div>
			    </div>

                <div class="ribbon-section">
                    <div class="ribbon-button ribbon-button-large" id="documentointerno-btn">
                        <br />
                        <b><p style="color:black;font-size:small" id="documentointerno"></p></b>
                    </div>
			    </div>
			
			    <div class="ribbon-section">
				    <div class="ribbon-button ribbon-button-large" id="retornar-btn">
					    <span class="button-title">Retornar</span>
					    <span class="button-help">This button will repeat something.</span>
					    <img class="ribbon-icon ribbon-normal" src="icons/normal/return.png" />
				    </div>
			    </div>

		    </div>
	    </div>

        <div class="table-responsive">
            <table id="tbldetalle" class="table"></table>
        </div>

        <div id="dialogocierre" title="Reporte de Cierre" >
           <div class="content">
              
           </div>
           <div class="footer">
           </div>
        </div>

        <div id="dialog" title="Apertura Caja" >
           <div class="content">
                <div class="row margin-top-05">
                    <div class="col-lg-4">
                        <div class="row margin-top-05"><b>Local</b></div>
                        <div class="row margin-top-05">
                            <select id="cbolocal" name="cbolocal" class="form-control"></select>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row margin-top-05"><b>Caja</b></div>
                        <div class="row margin-top-05">
                            <select id="cbocaja" name="cbocaja" class="form-control"></select>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row margin-top-05"><b>Serie</b></div>
                        <div class="row margin-top-05">
                            <input id="serie" name="serie" class="form-control" disabled="disabled" />
                        </div>
                    </div>
                </div>
               <div class="row margin-top-05">
                    <br />
                </div>
                <div class="row margin-top-05">
                    <div class="col-lg-4">
                        <div class="row margin-top-05"><b>Efectivo Apertura</b></div>
                        <div class="row margin-top-05">
                            <input type="text" name="efectivoapertura" id="efectivoapertura" class="form-control input-normal" style="width:100px" onkeypress="return isNumberKey(event);"/>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row margin-top-05"><b>Efectivo Cierre</b></div>
                        <div class="row margin-top-05">
                            <input type="text" name="efectivocierre" id="efectivocierre" class="form-control input-normal" style="width:100px" onkeypress="return isNumberKey(event);"/>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row margin-top-05"><b>Tarjeta Cierre</b></div>
                        <div class="row margin-top-05">
                            <input type="text" name="tarjetacierre" id="tarjetacierre" class="form-control input-normal" style="width:100px" onkeypress="return isNumberKey(event);"/>
                        </div>
                    </div>
                </div>
                <div class="row margin-top-05">
                    <br />
                </div>
                
               <div class="table-responsive">
                <table id="tblmonedero" class="table"></table>
            </div>
           </div>
           <div class="footer">
               <div class="row margin-top-05">
                    <div class="col-lg-6">
                        <input type="hidden" name="hid" id="hid"/>
                        <input type="hidden" name="hsolicitud" id="hsolicitud" value="0"/>
                        <input type="hidden" name="hnombre" id="hnombre"/>
                        <input type="hidden" name="hdocumentointerno" id="hdocumentointerno" value="0"/>
                    </div>
                     <div class="col-lg-3">
                        <input type="button" class="btn btn-export" onclick="cancelar();" value="cancelar" title="Cancelar" />
                    </div>
                    <div class="col-lg-3">
                        <input type="button" class="btn btn-primary" onclick="grabar();" value="Grabar" title="Grabar" />
                    </div>
                </div>
           </div>
        </div>
    </form>
</body>
</html>

