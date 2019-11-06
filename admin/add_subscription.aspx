<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_subscription.aspx.cs" Inherits="admin_add_subscription" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }

        .auto-style2 {
            text-align: center;
            color: #FF0000;
        }

        .auto-style3 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <table style="width: 935px" class="txt" cellpadding="3" cellspacing="3">

                <tr>
                    <td align="center" colspan="2" class="header_title">Subscription</td>
                </tr>

                <tr>
                    <td align="left" colspan="2">&nbsp;<telerik:RadButton ID="btnAddNew" runat="server" Skin="Silk" Text="Add Subscription" OnClick="btnAddNew_Click">
                    </telerik:RadButton>
                        &nbsp;<telerik:RadButton ID="btnView" runat="server" Skin="Silk" Text="View Subscription" OnClick="btnView_Click">
                        </telerik:RadButton>
                    </td>
                </tr>


                <tr>
                    <td style="width: 900px;">
                        <asp:Panel ID="PanelAdd" runat="server" GroupingText="Add Subscription">
                            <table style="width: 900px;">
                                <tr>
                                    <td valign="top" align="right" colspan="2">
                                        <span class="auto-style2">* </span>Denotes mandatory fields</td>
                                </tr>
                                <tr>
                                    <td class="RadInputRTL">
                                        <div align="right">
                                            Subscription For :
                                        </div>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="0">1 Month</asp:ListItem>
                                            <asp:ListItem Value="1">3 Months</asp:ListItem>
                                            <asp:ListItem Value="2">6 Months</asp:ListItem>
                                            <asp:ListItem Value="3">1 Year</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>



                                <tr>
                                    <td class="RadInputRTL">Rate (<img src="../admin_icons/rupee.gif" />) :</td>
                                    <td>&nbsp;
                                        <telerik:RadNumericTextBox ID="txtRate" runat="server" MaxLength="5" Width="60px">
                                        </telerik:RadNumericTextBox>
                                    </td>
                                </tr>



                                <tr>
                                    <td class="auto-style1" width="150">&nbsp;</td>
                                    <td class="auto-style3">&nbsp;<asp:Button ID="btnSubmit" runat="server" CssClass="btn" OnClick="btnSubmit_Click1" Text="Submit" ValidationGroup="L" />
                                        &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" OnClick="btnCancel_Click1" Text="Cancel" />
                                    </td>
                                </tr>
                            </table>

                        </asp:Panel>





                    </td>
                </tr>


                <tr>

                    <td style="width: 900px;">
                        <asp:Panel ID="PanelView" runat="server" GroupingText="View Subscription">

                            <table>
                                <tr>
                                    <td style="width: 900px;">

                                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                                            AllowSorting="True" DataSourceID="DSsubscription" GridLines="Vertical" PageSize="20"
                                            Skin="Default">
                                            <HeaderContextMenu EnableAutoScroll="True">
                                            </HeaderContextMenu>


                                            <MasterTableView AutoGenerateColumns="False" CellSpacing="-1" DataSourceID="DSsubscription" DataKeyNames="id">
                                                <RowIndicatorColumn>
                                                    <HeaderStyle Width="20px"></HeaderStyle>
                                                </RowIndicatorColumn>

                                                <ExpandCollapseColumn>
                                                    <HeaderStyle Width="20px"></HeaderStyle>
                                                </ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                                        <ItemTemplate>
                                                            <%# Container.DataSetIndex +1 %>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle HorizontalAlign="Left" />

                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridBoundColumn DataField="subscription_for" HeaderText="Subscriptin For"
                                                        SortExpression="subscription_for" UniqueName="subscription_for">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                    </telerik:GridBoundColumn>


                                                    <telerik:GridBoundColumn DataField="Rate" HeaderText="Rate"
                                                        SortExpression="Rate" UniqueName="Rate">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                    </telerik:GridBoundColumn>




                                                    <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="False" HeaderStyle-Font-Underline="false">

                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgEdit" CommandName="Edit" ToolTip="Edit"
                                                                CommandArgument='<%# Eval("id") %>' runat="Server"
                                                                AlternateText="Edit" ImageUrl="~/admin_icons/edit.gif" />

                                                            <%-- <a href="add_VAT.aspx?id=<%#Eval("id") %>">Edit</a> --%>
                                                        </ItemTemplate>

                                                        <HeaderStyle HorizontalAlign="Center" Width="30" />
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="30" />

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
                                        <asp:SqlDataSource ID="DSsubscription" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                            SelectCommand="SELECT * FROM subscription_tbl"></asp:SqlDataSource>

                                    </td>

                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>


            </table>

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>




