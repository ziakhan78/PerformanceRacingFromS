<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_TDS.aspx.cs" Inherits="admin_add_TDS" %>

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


            <table class="txt" style="width: 100%;" align="center" cellpadding="3" cellspacing="5">

                <tr>
                    <td align="center" colspan="2" class="header_title">TDS (Tax Deduction at Source)</td>
                </tr>

                <tr>
                    <td align="left" colspan="2">&nbsp;<telerik:RadButton ID="btnAddNew" runat="server" Skin="Silk" Text="Add New TDS" OnClick="btnAddNew_Click">
                    </telerik:RadButton>
                        &nbsp;<telerik:RadButton ID="btnView" runat="server" Skin="Silk" Text="View TDS" OnClick="btnView_Click">
                        </telerik:RadButton>
                    </td>
                </tr>


                <tr>
                    <td style="width: 100%">
                        <asp:Panel ID="PanelAdd" runat="server" GroupingText="Add New TDS">
                             <table class="txt" style="width: 100%;" align="center" cellpadding="3" cellspacing="5">
                                <tr>
                                    <td valign="top" align="right" colspan="2">
                                        <span class="auto-style2">* </span>Denotes mandatory fields</td>
                                </tr>
                                <tr>
                                    <td class="RadInputRTL">
                                        <div align="right">
                                            <span class="auto-style2">* </span>Accounting Year
                                        </div>
                                    </td>
                                    <td>:
                                        <asp:DropDownList ID="DDLYears" runat="server" CssClass="txtBox" AppendDataBoundItems="true">
                                            <asp:ListItem>Select</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Year" InitialValue="Select" ValidationGroup="t"></asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="CV" runat="server" ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Already Exist" OnServerValidate="CV_ServerValidate" ValidationGroup="t"></asp:CustomValidator>
                                    </td>
                                </tr>



                                <tr>
                                    <td class="RadInputRTL"><span class="auto-style2">* </span>Rate (%)</td>
                                    <td>:
                                        <telerik:RadNumericTextBox ID="txtRate" runat="server" MaxLength="5" Width="60px" CssClass="txtBox" Skin="Silk">
                                        </telerik:RadNumericTextBox>
                                        <asp:RequiredFieldValidator ID="rfvRate" runat="server" ControlToValidate="txtRate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't Be Left Blank" ValidationGroup="t"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>



                                <tr>
                                    <td class="auto-style1" width="150">&nbsp;</td>
                                    <td class="auto-style3">&nbsp;
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn" OnClick="btnSubmit_Click" TabIndex="63" Text="Submit" ValidationGroup="t" />
                                        &nbsp;<asp:Button ID="btncancel" runat="server" CausesValidation="False" CssClass="btn" OnClick="btncancel_Click" TabIndex="64" Text="Cancel" />
                                    </td>
                                </tr>
                            </table>

                        </asp:Panel>





                    </td>
                </tr>


                <tr>

                    <td style="width: 100%">
                        <asp:Panel ID="PanelView" runat="server" GroupingText="View TDS">

                            <table class="txt" style="width: 100%;" align="center" cellpadding="3" cellspacing="5">
                                <tr>
                                    <td >

                                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                                            AllowSorting="True" DataSourceID="DSTDS" GridLines="Vertical" PageSize="20"
                                            Skin="Default" OnItemCommand="RadGrid1_ItemCommand">
                                            <HeaderContextMenu EnableAutoScroll="True">
                                            </HeaderContextMenu>


                                            <MasterTableView AutoGenerateColumns="False" CellSpacing="-1" DataSourceID="DSTDS" DataKeyNames="id">
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

                                                    <telerik:GridBoundColumn DataField="Year" HeaderText="Year"
                                                        SortExpression="Year" UniqueName="Year">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                    </telerik:GridBoundColumn>


                                                    <telerik:GridBoundColumn DataField="Rate" HeaderText="Rate"
                                                        SortExpression="Rate" UniqueName="Rate">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                    </telerik:GridBoundColumn>



                                                    <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-Font-Underline="false">

                                                        <ItemTemplate>
                                                            <a href="add_TDS.aspx?id=<%#Eval("id") %>">Edit</a>
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
                                        <asp:SqlDataSource ID="DSTDS" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                            SelectCommand="SELECT * FROM tds_tbl"></asp:SqlDataSource>

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





