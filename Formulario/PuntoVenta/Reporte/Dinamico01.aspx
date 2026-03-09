<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dinamico01.aspx.cs" Inherits="TwoTecnology.WebVentas.Formulario.PuntoVenta.Reporte.Dinamico01" %>


<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Venta por Producto</title>
	
	<script src="Scripts/jquery-3.1.1.js"></script>
    
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
</head>
<body>
    <form id="formdocument" asp-antiforgery="false" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 

        <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
    
       <table style="width:100%">
        <tr>
            <td style="padding-right: 8px;">
                <dx:ASPxPivotCustomizationControl ID="ASPxPivotCustomizationControl1" 
                    ClientInstanceName="ASPxPivotCustomizationControl1"
                    runat="server"  Layout="BottomPanelOnly1by4" 
                    AllowedLayouts="BottomPanelOnly1by4, BottomPanelOnly2by2, StackedDefault, StackedSideBySide"
                    AllowSort="true" AllowFilter="true" ASPxPivotGridID="ASPxPivotGrid1" Theme="Metropolis" />
            </td>
            <td>
                <dx:ASPxPivotGrid ID="ASPxPivotGrid1" ClientInstanceName="ASPxPivotGrid1" runat="server" 
                    OptionsData-DataProcessingEngine="Optimized" CssClass="dxpgControl" Width="100%"
                    OptionsCustomization-CustomizationFormStyle="Excel2007" 
                    Height="500px" ClientIDMode="AutoID" 
                    DataSourceID="SqlDataSourceDB" EnableTheming="True" Theme="Office365" >
                <Styles>
                    <FieldValueStyle Wrap="False" />
                </Styles>
                <Fields>
                   
                    <dx:PivotGridField Area="RowArea" AreaIndex="0" Caption="Documento" FieldName="documento"
                        ID="PivotGridFieldDocumento" />
                  
                     <dx:PivotGridField Area="ColumnArea" AreaIndex="0" Caption="Categoria" FieldName="categoria"
                        ID="PivotGridFieldCategoria" />

                    <dx:PivotGridField Area="DataArea" AreaIndex="0" Caption="Cantidad" FieldName="cantidad"
                        ID="fieldcantidad" CellFormat-FormatString="N" CellFormat-FormatType="Numeric"/>
                                    

                    <dx:PivotGridField Area="FilterArea" AreaIndex="0" Caption="AÑO" FieldName="fecha"
                        ID="fieldtotalanio" GroupInterval="DateYear" />
                    <dx:PivotGridField Area="FilterArea" AreaIndex="1" Caption="MES" FieldName="fecha"
                        ID="fieldtotalmes" GroupInterval="DateMonth"  />
                    <dx:PivotGridField Area="FilterArea" AreaIndex="2" Caption="DIA" FieldName="fecha"
                        ID="fielddia" GroupInterval="DateDay" />
                  
                   
                    <dx:PivotGridField Area="FilterArea" AreaIndex="3" Caption="Local" FieldName="local"
                        ID="PivotGridFieldLocal" />

                    <dx:PivotGridField Area="FilterArea" AreaIndex="4" Caption="Caja" FieldName="caja"
                        ID="PivotGridFieldCaja" />

                    <dx:PivotGridField Area="FilterArea" AreaIndex="5" Caption="Moneda" FieldName="moneda"
                        ID="PivotGridFieldMoneda" />

                    <dx:PivotGridField Area="FilterArea" AreaIndex="6" Caption="TipoDocu" FieldName="tipodocumento"
                        ID="PivotGridFieldTipoDocumento" />

                    <dx:PivotGridField Area="FilterArea" AreaIndex="7" Caption="ClienteTipo" FieldName="clientetipo"
                        ID="PivotGridFieldClienteTipo" />

                    <dx:PivotGridField Area="FilterArea" AreaIndex="8" Caption="ClienteNom" FieldName="clientenombre"
                        ID="PivotGridFieldClienteNombre" />

                    <dx:PivotGridField Area="FilterArea" AreaIndex="10" Caption="Producto" FieldName="producto"
                        ID="PivotGridProducto" />

                    <dx:PivotGridField Area="FilterArea" AreaIndex="11" Caption="Hora" FieldName="hora"
                        ID="PivotGridFieldHorIni" />

                    
                    <dx:PivotGridField Area="FilterArea" AreaIndex="13" Caption="Igv" FieldName="igv"
                        ID="PivotGridIgv" CellFormat-FormatString="N" CellFormat-FormatType="Numeric"/>

                    <dx:PivotGridField Area="FilterArea" AreaIndex="14" Caption="Rc" FieldName="rc"
                        ID="PivotGridRc" CellFormat-FormatString="n0" CellFormat-FormatType="Numeric" />

                    <dx:PivotGridField Area="FilterArea" AreaIndex="12" Caption="Total" FieldName="total"
                        ID="PivotGridTotal" CellFormat-FormatString="n0" CellFormat-FormatType="Numeric" />
                     
                </Fields>
                <OptionsPager Visible="false"/>
                <OptionsView HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" RowTotalsLocation="Tree" 
                    ShowTotalsForSingleValues="True"
                    ShowColumnHeaders="False" ShowDataHeaders="False" ShowFilterHeaders="False" ShowRowHeaders="False" />
                <OptionsCustomization CustomizationFormStyle="Excel2007"/>
                <ClientSideEvents Init="function(s, e) {
                                if(typeof(ASPxPivotCustomizationControl1) == 'undefined')
                                    return;
                                setTimeout( 
                                    function(){
                                        if(ASPxPivotGrid1.GetMainDiv().clientHeight &gt; 400)
                                        ASPxPivotCustomizationControl1.SetHeight(ASPxPivotGrid1.GetMainElement().offsetHeight); 
                                        else 
                                        ASPxPivotCustomizationControl1.SetHeight(400);
                                    }, 100);
                                }" />
                </dx:ASPxPivotGrid>
            </td>
        </tr>
     </table>
       <asp:SqlDataSource ID="SqlDataSourceDB"  runat="server" 
           ConnectionString="<%$ ConnectionStrings:dbventas %>"> 
            <%--SelectCommand="SELECT * FROM [vDOCUMENTO_REPORTE_DETALLE]  where EMPRESA_RUC='@ruc'">
          <selectparameters>
              <asp:QueryStringParameter name="ruc" Type="String" QueryStringField="qruc" />
          </selectparameters>--%>
       </asp:SqlDataSource>

        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1" Visible="False" />

        <dx:ASPxFormLayout runat="server" ID="OptionsFormLayout" ClientInstanceName="optionsFormLayout">
            <Items>
                <dx:LayoutGroup Caption="Export Settings">
                    <Items>
                        <dx:LayoutItem Caption="Export Mode">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxComboBox ID="listExportFormat" runat="server" Style="vertical-align: middle" SelectedIndex="6"
                                        ValueType="System.String" Width="220px" >
                                        <Items>
                                            <dx:ListEditItem Text="Pdf" Value="0" />
                                            <dx:ListEditItem Text="Excel" Value="1" />
                                            <dx:ListEditItem Text="Mht" Value="2" />
                                            <dx:ListEditItem Text="Rtf" Value="3" />
                                            <dx:ListEditItem Text="Text" Value="4" />
                                            <dx:ListEditItem Text="Html" Value="5" />
                                            <dx:ListEditItem Text="Excel (Data Aware)" Value="6" />
                                        </Items>
                                        <ClientSideEvents
                                            Init="function(s, e) {
                                            var fieldHeaderOptionsPanel = optionsFormLayout.GetItemByName('fieldHeaderOptionsPanel');
                                            fieldHeaderOptionsPanel.SetVisible(false);
                                            var fieldValuesOptionsPanel = optionsFormLayout.GetItemByName('fieldValuesOptionsPanel');
                                            fieldValuesOptionsPanel.SetVisible(false);
                                            var dataAwareOptionsPanel = optionsFormLayout.GetItemByName('dataAwareOptionsPanel');
                                            dataAwareOptionsPanel.SetVisible(true);
                                            checkCustomFormattedValuesAsText.SetEnabled(false);
                                        }"
                                            SelectedIndexChanged="function(s, e) {
                                            var selectedIndex = s.GetSelectedIndex(),
                                                isExportToExcel = selectedIndex == 1,
                                                isDataAwareExport = selectedIndex == 6;
                                            var fieldHeaderOptionsPanel = optionsFormLayout.GetItemByName('fieldHeaderOptionsPanel');
                                            fieldHeaderOptionsPanel.SetVisible(!isDataAwareExport);
                                            var fieldValuesOptionsPanel = optionsFormLayout.GetItemByName('fieldValuesOptionsPanel');
                                            fieldValuesOptionsPanel.SetVisible(!isDataAwareExport);
                                            var dataAwareOptionsPanel = optionsFormLayout.GetItemByName('dataAwareOptionsPanel');
                                            dataAwareOptionsPanel.SetVisible(isDataAwareExport);
                                            checkCustomFormattedValuesAsText.SetEnabled(isExportToExcel);
                                        }" />
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxButton ID="ASPxButton3" ClientInstanceName="buttonSaveAs" runat="server" ToolTip="Export and Save"
                                        OnClick="buttonSaveAs_Click" Text="Export" Width="220px" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Data Aware Options" Name="dataAwareOptionsPanel">
                    <Items>
                        <dx:LayoutItem Caption="Allow grouping columns/rows">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="allowGroupingCheckBox" ClientInstanceName="allowGroupingCheckBox" runat="server" Checked="True" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Allow fixed ColumnArea and RowArea">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="allowFixedColumns" ClientInstanceName="allowFixedColumns" runat="server" Checked="True" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Export cell values as display text">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="exportCellValuesAsText" ClientInstanceName="exportCellValuesAsText" runat="server" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Export raw data">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="exportRawData" ClientInstanceName="exportRawData" runat="server" CheckState="Unchecked" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Field Header Options" Name="fieldHeaderOptionsPanel" >
                    <Items>
                        <dx:LayoutItem Caption="Print filter field headers">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="checkPrintFilterFieldHeaders" runat="server" Checked="True" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Print column field headers">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="checkPrintColumnFieldHeaders" runat="server" Checked="True" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Print row field headers">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="checkPrintRowFieldHeaders" runat="server" Checked="True" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Print data field headers">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="checkPrintDataFieldHeaders" runat="server" Checked="True" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Field Values Options" Name="fieldValuesOptionsPanel">
                    <Items>
                        <dx:LayoutItem Caption="Print column area on every page">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="checkPrintColumnAreaOnEveryPage" runat="server" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Print row area on every page">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="checkPrintRowAreaOnEveryPage" runat="server" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Merge values of outer column fields">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="checkMergeColumnFieldValues" runat="server" Checked="True" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Merge values of outer row fields">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="checkMergeRowFieldValues" runat="server" Checked="True" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Export custom formatted values as text">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxCheckBox ID="checkCustomFormattedValuesAsText" ClientInstanceName="checkCustomFormattedValuesAsText" runat="server" Checked="True" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>
    
    </form>

    <script>
        $(function () {
            $('body').on("keydown", function (e) {
                if (e.ctrlKey && e.which === 73) { // CTRL+I

                    e.preventDefault();
                    $("#hdocumentointerno").val('1');
                    $("#spandi").html('(DI)');
                }
            });

            $('body').on("keydown", function (e) {
                if (e.ctrlKey && e.which === 76) { // CTRL+L
                    e.preventDefault();
                    $("#hdocumentointerno").val('0');
                    $("#spandi").html('');
                }
            });
        });
    </script>
</body>
</html>