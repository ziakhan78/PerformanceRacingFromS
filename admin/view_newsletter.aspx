<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_newsletter.aspx.cs" Inherits="admin_view_newsletter" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">
                <tr>
                    <td align="center" colspan="2" class="header_title">View Newsletter Subscriptions</td>
                </tr>

                <!-- search and sort start -->


                <!-- search and sort end -->
                <tr>
                    <td colspan="2">

                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" Culture="en-IN" Skin="Default" PageSize="25" DataSourceID="DSnewsletter" GridLines="None" OnItemCommand="RadGrid1_ItemCommand">
                            <MasterTableView DataKeyNames="id" DataSourceID="DSnewsletter">
                                <CommandItemSettings ExportToPdfText="Export to PDF" />
                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True" Created="True">
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <Columns>

                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="35px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <%-- <telerik:GridTemplateColumn HeaderText="Name" SortExpression="fname">
                                        <ItemTemplate>
                                            <%# Eval("fname") %> <%# Eval("lname") %>
                                        </ItemTemplate>
                                        <ItemStyle Width="250px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>--%>

                                    <telerik:GridBoundColumn DataField="fname" FilterControlAltText="Filter fname column" HeaderText="First Name" SortExpression="fname" UniqueName="fname">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="lname" FilterControlAltText="Filter lname column" HeaderText="Last Name" SortExpression="lname" UniqueName="lname">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="emailid" FilterControlAltText="Filter emailid column" HeaderText="Email-Id" SortExpression="emailid" UniqueName="emailid">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="status" FilterControlAltText="Filter status column" HeaderText="Status" SortExpression="status" UniqueName="status">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle Width="100px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridTemplateColumn HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>

                                            <asp:DropDownList ID="chkActive" runat="server" AutoPostBack="true" CssClass="txt" OnSelectedIndexChanged="chkActive_SelectedIndexChanged">
                                                <asp:ListItem>Select</asp:ListItem>
                                                <asp:ListItem>Subscribed</asp:ListItem>
                                                <asp:ListItem>Unsubscribe</asp:ListItem>
                                            </asp:DropDownList>

                                        </ItemTemplate>
                                       <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="60px"></ItemStyle>
                                    </telerik:GridTemplateColumn>


                                    <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_newsletter.aspx?id=<%# Eval("id") %>'>
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
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                    </EditColumn>
                                </EditFormSettings>
                                <PagerStyle PageSizeControlType="RadComboBox" />
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" />
                            <PagerStyle PageSizeControlType="RadComboBox" />
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>
                        </telerik:RadGrid>

                        <asp:SqlDataSource ID="DSnewsletter" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [newsletter_tbl] ORDER BY [fname], [lname]"></asp:SqlDataSource>

                    </td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

