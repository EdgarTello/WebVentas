<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" validateRequest="false" Inherits="TwoTecnology.WebVentas.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
</head>
<body>
	
    <form id="form1" runat="server">
	    <asp:ScriptManager runat="server"></asp:ScriptManager>

		<div class="container">
			<div class="d-flex justify-content-center h-100" >
				<div class="card">
                    <div class="card-body">
                        <input type="hidden" name="hruc" id="hruc" runat="server"/>
                        <input type="hidden" name="hidlocal" id="hidlocal" runat="server"/>
                        <input type="hidden" name="husername" id="husername" runat="server"/>

                        <input type="hidden" name="hsamlssohabillitar" id="hsamlssohabillitar" runat="server"/>
                        <input type="hidden" name="hsamlssologin" id="hsamlssologin" runat="server"/>
                        <input type="hidden" name="hsamlssocertificado" id="hsamlssocertificado" runat="server"/>
                        <input type="hidden" name="hsamlssourlcliente" id="hsamlssourlcliente" runat="server"/>

                        <br />
                        Security Assertion Markup Language (SAML) is a login standard that helps users access applications based on sessions in another context. It’s a single sign-on (SSO) login method offering more secure authentication (with a better user experience) than usernames and passwords.

                        In this eBook, you’ll learn:

                        The advantages to SAML Authentication
                        How to set up a SAML identity provider
                        How SAML Authentication works with Auth0
                        SAML Configurations for SSO Integrations
                        <br />
                        <br />
        
                        <asp:TextBox ID="TextBox1" runat="server" Height="125px" TextMode="MultiLine" Width="838px"></asp:TextBox>
                
                        
				        <br />
                        <br />
                        <asp:Button ID="btnLogin" runat="server" Text="Login SSO" OnClick="btnLogin_Click"  />
                
                        
				    </div>
				    <div class="card-footer">
					    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
						    <p class="text-danger">
							    <asp:Literal runat="server" ID="FailureText" />
						    </p>
					    </asp:PlaceHolder> 
				    </div>
                </div>
            </div>
        </div>
    </form>
	
    </body>
</html>
