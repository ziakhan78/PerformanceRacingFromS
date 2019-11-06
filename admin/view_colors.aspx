<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_colors.aspx.cs" Inherits="Admin_view_colors" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="3" class="header_title">View Colours</td>
                </tr>

                 <!-- search and sort Start -->

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
                                            <asp:ListItem Selected="True" Value="0">Colour Name</asp:ListItem>
                                        </asp:RadioButtonList>

                                    </td>
                                </tr>



                                <tr>
                                    <td valign="top" align="left">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="txtBox" Width="300px"></asp:TextBox>

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
                    <td colspan="3">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" 
                            AllowSorting="True" Skin="Default" PageSize="25" OnItemCommand="RadGrid1_ItemCommand" GridLines="None" OnItemDataBound="RadGrid1_ItemDataBound" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged" OnSortCommand="RadGrid1_SortCommand">
                            <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" >
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

                                    <telerik:GridBoundColumn DataField="color_name" HeaderText="Colour Name"
                                        SortExpression="color_name" UniqueName="color_name">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="hex_code" HeaderText="Hex Code"
                                        SortExpression="hex_code" UniqueName="hex_code">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>


                                     <telerik:GridTemplateColumn HeaderText="Colour">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCode" runat="server" Height="20px" Width="20px" Text='<%# Eval("hex_code") %>' Visible="false" ></asp:Label>
                                           <asp:Label ID="lblColorCode" runat="server" Height="20px" Width="20px" ></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                     <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_colors.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /> </a>
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
                       <%-- <asp:SqlDataSource ID="DSColor" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT * FROM [color_master_tbl] order by color_name"></asp:SqlDataSource>--%>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false"
                            Style="font-weight: bold; font-size: 14px; color: #FF0000; background-color: Black; padding: 5px 5px 5px 5px;"></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
