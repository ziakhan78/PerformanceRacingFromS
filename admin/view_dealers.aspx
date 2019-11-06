<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_dealers.aspx.cs" Inherits="admin_view_dealers" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/JavaScript">
<!--
    function MM_openBrWindow(theURL, winName, features) { //v2.0
        window.open(theURL, winName, features);
    }
    //-->
    </script>

    <style type="text/css">
       
        .AlphabetPager a, .AlphabetPager span
        {
            font-family: Arial, Tahoma, Times New Roman, verdana;
            font-size: 11px;
            display: inline-block;
            height: 15px;
            line-height: 15px;
            min-width: 15px;
            text-align: center;
            text-decoration: none;
            font-weight: normal;
            padding: 0 1px 0 1px;
        }
        .AlphabetPager a
        {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }
        .AlphabetPager span
        {
            background-color: #df0909;
            color: #fff;
            border: 1px solid #e9e5e5;
        }
        .space {
            padding-bottom: 4px;
            margin-bottom:5px;
            
        }

        .AlphabetPager a:hover
        {
            background-color: #df0909;
            color: #fff;
            border: 1px solid;
        }
      

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">
                <tr>
                    <td align="center" colspan="2" class="header_title">View Dealers</td>
                </tr>

                <tr>
                   
                     <td valign="top" >
                        <div style="width: 170px; border: 1px solid #f4f4f4; vertical-align:middle; text-align:center;  margin-bottom:10px; padding-top:5px; background-color:#f2f2f2; height:20px;">
                           
                                        <b>::&nbsp;Alphabetic Search&nbsp;::</b>
                                   
                        </div>
                        <div class="AlphabetPager" style="width:160px;">
                            <asp:Repeater ID="rptAlphabets" runat="server" >
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text='<%#Eval("Value")%>' Visible='<%# !Convert.ToBoolean(Eval("Selected"))%>'
                                        OnClick="Alphabet_Click" CssClass="space" />
                                    <asp:Label runat="server" Text='<%#Eval("Value")%>' Visible='<%# Convert.ToBoolean(Eval("Selected"))%>' />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </td>

                    <td valign="top" width="300px" align="right">
                        <asp:Panel ID="SearchPanel1" runat="server" DefaultButton="btnSearch">

                            <table width="100%">


                                <tr>
                                    <td valign="top" align="left">
                                        <asp:RadioButtonList ID="rbtnSearch" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="0">Company</asp:ListItem>
                                            <asp:ListItem Value="1">City</asp:ListItem>
                                            <asp:ListItem Value="2">State</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>



                                <tr>
                                    <td valign="top" align="left">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="txtBox" Width="300px"></asp:TextBox>

                                        <%-- <telerik:RadComboBox ID="DDLProductName" runat="server" DataSourceID="dsProductName"
                                                        Width="200px" EmptyMessage="Click Here to Enter Product Name."
                                                        DataTextField="productName" DataValueField="pid"
                                                        EnableAutomaticLoadOnDemand="True" ItemsPerRequest="10"
                                                        ShowMoreResultsBox="True" EnableVirtualScrolling="True" AutoPostBack="True" OnSelectedIndexChanged="DDLProductName_SelectedIndexChanged">
                                                    </telerik:RadComboBox>                                               

                                                    <telerik:RadComboBox ID="DDLSku" runat="server" DataSourceID="dsSku"
                                                        Width="200px" EmptyMessage="Click Here to Enter Sku #."
                                                        DataTextField="sku" DataValueField="pid"
                                                        EnableAutomaticLoadOnDemand="True" ItemsPerRequest="10"
                                                        ShowMoreResultsBox="True" EnableVirtualScrolling="True" AutoPostBack="True" OnSelectedIndexChanged="DDLSku_SelectedIndexChanged">
                                                    </telerik:RadComboBox>--%>
                                    
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Button ID="btnSearch" runat="server" CssClass="btn"
                                            OnClick="btnSearch_Click" Text="Search" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>

                <tr>
                    <td colspan="2"></td>
                </tr>
                <!-- search and sort end -->


                <tr>
                    <td colspan="2">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                            AllowSorting="True" Skin="Default" PageSize="25" OnItemCommand="RadGrid1_ItemCommand" GridLines="None" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged" OnSortCommand="RadGrid1_SortCommand">
                            <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id">
                                <RowIndicatorColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </RowIndicatorColumn>

                                <ExpandCollapseColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </ExpandCollapseColumn>
                                <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                <Columns>

                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn HeaderText="Company" SortExpression="CompanyName">
                                        <ItemTemplate>
                                            <a href="javascript:void(0)" onclick="MM_openBrWindow('view_dealer_details.aspx?id=<%# Eval("Id") %>','01111','width=650, height=550')"><%# Eval("CompanyName") %></a>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="true" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                    </telerik:GridTemplateColumn>

                                    <%-- <telerik:GridBoundColumn DataField="CompanyName" HeaderText="Company"
                                        SortExpression="CompanyName" UniqueName="CompanyName">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>--%>

                                    <%--   <telerik:GridBoundColumn DataField="Address1" HeaderText="Address"
                                        SortExpression="Address1" UniqueName="Address1">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>--%>

                                    <telerik:GridTemplateColumn HeaderText="Address">
                                        <ItemTemplate>
                                            <%# Eval("Address1") %>&nbsp;<%# Eval("Address2") %>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="city" HeaderText="City"
                                        SortExpression="city" UniqueName="city">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="state" HeaderText="State"
                                        SortExpression="state" UniqueName="state">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <%--  <telerik:GridBoundColumn DataField="Phone1" HeaderText="Phone"
                                        SortExpression="Phone1" UniqueName="Phone1">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>--%>

                                    <telerik:GridBoundColumn DataField="EmailId" HeaderText="Email-Id"
                                        SortExpression="EmailId" UniqueName="EmailId">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_dealers.aspx?id=<%# Eval("id") %>'>
                                                <img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" />
                                            </a>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">
                                        <ItemTemplate>
                                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                            </cc1:ConfirmButtonExtender>
                                            <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete"
                                                CommandArgument='<%# Eval("id") %>' runat="Server"
                                                AlternateText="Delete" ImageUrl="~/admin_icons/delete.gif" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                        <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top" />
                                    </telerik:GridTemplateColumn>

                                </Columns>
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" />
                            <AlternatingItemStyle CssClass="treeView" />
                            <ItemStyle CssClass="treeView" />
                        </telerik:RadGrid>
                        <%--<asp:SqlDataSource ID="DSSuppliers" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT * FROM [Dealers_tbl] order by CompanyName"></asp:SqlDataSource>--%>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"
                            Style="font-weight: bold; font-size: 14px; color: #FF0000; background-color: Black; padding: 5px 5px 5px 5px;"></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>




