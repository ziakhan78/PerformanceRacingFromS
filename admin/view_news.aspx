<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_news.aspx.cs" Inherits="admin_view_news" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">
                <tr>
                    <td align="center" class="header_title">View News</td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" CellSpacing="0" DataSourceID="DSNews" GridLines="None" Skin="Default" OnItemCommand="RadGrid1_ItemCommand">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSNews">
                                <CommandItemSettings ExportToPdfText="Export to PDF" />
                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <Columns>

                                    <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                   

                                    <telerik:GridBoundColumn DataField="start_date" DataType="System.DateTime" FilterControlAltText="Filter start_date column" HeaderText="Date" SortExpression="start_date" UniqueName="start_date" DataFormatString="{0:dd MMM yyyy}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle Width="80px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="end_date" DataType="System.DateTime" FilterControlAltText="Filter end_date column" HeaderText="End Date" SortExpression="end_date" UniqueName="end_date" DataFormatString="{0:dd MMM yyyy}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <ItemStyle Width="80px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="news" FilterControlAltText="Filter news column" HeaderText="News" SortExpression="news" UniqueName="news">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-Font-Underline="false">
                                        <ItemTemplate>
                                            <a href="add_news.aspx?id=<%#Eval("id") %>"><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /></a>
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
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                    </EditColumn>
                                </EditFormSettings>
                                <PagerStyle PageSizeControlType="RadComboBox" />
                            </MasterTableView>
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                            <PagerStyle PageSizeControlType="RadComboBox" />
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="DSNews" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM news_tbl where status='True' ORDER BY [id] desc"></asp:SqlDataSource>


                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>





