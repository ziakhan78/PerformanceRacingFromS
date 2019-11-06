<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_costing_tax_master.aspx.cs" Inherits="admin_view_costing_tax_master" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">

                <tr>
                    <td align="center" class="header_title">View Costing & Tax Master</td>
                </tr>

                 <tr>
                    <td colspan="3">
                         <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" DataSourceID="DSDollor"
                            AllowSorting="True" Skin="Default" PageSize="100" OnItemCommand="RadGrid1_ItemCommand" GridLines="None">
                            <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSDollor">
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

           

                                    <telerik:GridBoundColumn DataField="BasicCustomDuty" HeaderText="Basic Custom Duty"
                                        SortExpression="BasicCustomDuty" UniqueName="BasicCustomDuty">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                      <telerik:GridBoundColumn DataField="CVD" HeaderText="CVD"
                                        SortExpression="CVD" UniqueName="CVD">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="SAD" HeaderText="SAD"
                                        SortExpression="SAD" UniqueName="SAD">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn DataField="CustomCess" HeaderText="Custom Cess"
                                        SortExpression="CustomCess" UniqueName="CustomCess">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="FrieghtCHA" HeaderText="Frieght CHA"
                                        SortExpression="FrieghtCHA" UniqueName="FrieghtCHA">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                      <telerik:GridBoundColumn DataField="Octroi" HeaderText="Octroi"
                                        SortExpression="Octroi" UniqueName="Octroi">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                      <telerik:GridBoundColumn DataField="VAT" HeaderText="GST"
                                        SortExpression="VAT" UniqueName="VAT">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                      <telerik:GridBoundColumn DataField="MarginForDealer" HeaderText="Margin For Dealer"
                                        SortExpression="MarginForDealer" UniqueName="MarginForDealer">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="Margin" HeaderText="Margin"
                                        SortExpression="Margin" UniqueName="Margin">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>
		


                                     <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_costing_tax_master.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /> </a>
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
                        <asp:SqlDataSource ID="DSDollor" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT * FROM [costing_tax_master_tbl] "></asp:SqlDataSource>
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




