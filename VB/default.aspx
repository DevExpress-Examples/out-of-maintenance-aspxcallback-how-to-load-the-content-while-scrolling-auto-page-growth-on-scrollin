<%@ Page Language="vb" AutoEventWireup="true" CodeFile="default.aspx.vb" Inherits="_default" EnableViewState="false" %>

<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallback" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxLoadingPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>How to load the content while scrolling - Auto page growth on scrolling down</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <h1>Loading the content while scrolling</h1>
    <form id="form1" runat="server">
    <script type="text/javascript">
        var currentPage = 0;
        var inCallBack = false;

        function windowScroll(evt) {
            if (inCallBack)
                return;
            var windowHeight = ASPxClientUtils.GetDocumentClientHeight();
            var documentHeight = document.body.clientHeight;
            var scrollTop = ASPxClientUtils.GetDocumentScrollTop();

            var scrollDelta = documentHeight - windowHeight - scrollTop;
            if (scrollDelta <= 50)
                LoadItems();
        }
        function LoadItems() {
            var isAllDataLoaded = currentPage === -1;
            if (!isAllDataLoaded) {
                loadingPanel.Show();
                callbackControl.PerformCallback(currentPage + 1);
                inCallBack = true;
            }
        }

        function callbackControlInit(s, e) {
            ASPxClientUtils.AttachEventToElement(window, 'scroll', windowScroll);
        }
        function callbackControlComplete(s, e) {
            loadingPanel.Hide();
            if (e.result != "") {
                var dataContainerElement = document.getElementById("dataContainer");
                dataContainerElement.innerHTML = dataContainerElement.innerHTML + e.result;
                currentPage++;
            }
            if (callbackControl.cpIsEnd) {
                currentPage = -1;
                pnLoadingContainer.SetVisible(false);
            }
            inCallBack = false;
        }
    </script>
    <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="callbackControl"
        OnCallback="ASPxCallback1_Callback">
        <ClientSideEvents Init="callbackControlInit" CallbackComplete="callbackControlComplete" />
    </dx:ASPxCallback>
    <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="loadingPanel"
        ContainerElementID="pnLoadingContainer" Modal="True" EnableDefaultAppearance="False">
        <LoadingDivStyle BackColor="White">
        </LoadingDivStyle>
        <Border BorderStyle="None" />
    </dx:ASPxLoadingPanel>
    <div id="dataContainer" style="width: 100%">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div style="height: 100px;">
                    <img id="imgCover" runat="server" alt='<%#Eval("Title")%>' src='<%#"~/Images/Discs/" & Eval("ID") & ".jpg"%>' /><br />
                </div>
                <span>
                    <%#Eval("Year")%></span><br />
                <a href='<%#"javascript:void(" & Eval("ID") & ");"%>'>
                    <%#Eval("Title")%></a><br />
                <span>
                    <%#Eval("Price")%></span>
                <hr class="separator" />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <dx:ASPxPanel ID="pnLoadingContainer" runat="server" Width="100%" Height="64px" RenderMode="Table"
        ClientInstanceName="pnLoadingContainer" CssClass="pnLoadingContainer">
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <a class="linkbutton" href="javascript:LoadItems();">Show More Items</a>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
    <div id="loadingPanelContainer" class="loadingPanelContainer">
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/discs.mdb"
        SelectCommand="SELECT * FROM [Discs]"></asp:AccessDataSource>
    </form>
</body>
</html>