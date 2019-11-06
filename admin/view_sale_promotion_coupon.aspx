<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_sale_promotion_coupon.aspx.cs" Inherits="admin_view_sale_promotion_coupon" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="3" class="header_title">View Sales & Promotion Discounts</td>
                </tr>

                <tr>
                    <td colspan="3">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" DataSourceID="dsPromotionDiscount"
                            AllowSorting="True" PageSize="25" OnItemCommand="RadGrid1_ItemCommand" GridLines="None" CellSpacing="0">
                            <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dsPromotionDiscount">
                                <RowIndicatorColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </RowIndicatorColumn>

                                <ExpandCollapseColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </ExpandCollapseColumn>
                                <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                <Columns>

                               <%--     <telerik:GridBoundColumn DataField="id" HeaderText="id"
                                        SortExpression="id" UniqueName="id" DataType="System.Int32" FilterControlAltText="Filter id column" ReadOnly="True">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="cat_id" DataType="System.Int32" FilterControlAltText="Filter cat_id column" HeaderText="cat_id" SortExpression="cat_id" UniqueName="cat_id">
                                         <ColumnValidationSettings>
                                             <ModelErrorMessage Text="" />
                                         </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="subcat_id" DataType="System.Int32" FilterControlAltText="Filter subcat_id column" HeaderText="subcat_id" SortExpression="subcat_id" UniqueName="subcat_id">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="product_id" FilterControlAltText="Filter product_id column" HeaderText="product_id" SortExpression="product_id" UniqueName="product_id">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>--%>


                                        <telerik:GridTemplateColumn HeaderText="Sr.">
                                        <ItemTemplate>
                                            <%# Container.DataSetIndex +1 %>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                     <telerik:GridBoundColumn DataField="product_name" FilterControlAltText="Filter product_name column" HeaderText="Product Name" SortExpression="product_name" UniqueName="product_name">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="cat_name" FilterControlAltText="Filter cat_name column" HeaderText="Category" SortExpression="cat_name" UniqueName="cat_name">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="subcat_name" FilterControlAltText="Filter subcat_name column" HeaderText="Sub Category" SortExpression="subcat_name" UniqueName="subcat_name">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                   <%--  <telerik:GridBoundColumn DataField="subsubcat_name" FilterControlAltText="Filter subsubcat_name column" HeaderText="Sub Sub Category" SortExpression="subsubcat_name" UniqueName="subsubcat_name">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>--%>
                                   
                                    <telerik:GridBoundColumn DataField="start_date" DataType="System.DateTime" FilterControlAltText="Filter start_date column" HeaderText="Start Date" SortExpression="start_date" UniqueName="start_date" DataFormatString="{0:dd/MM/yyyy}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="end_date" DataType="System.DateTime" FilterControlAltText="Filter end_date column" HeaderText="End Date" SortExpression="end_date" UniqueName="end_date" DataFormatString="{0:dd/MM/yyyy}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                  <%--  <telerik:GridBoundColumn DataField="price_change_mode" FilterControlAltText="Filter price_change_mode column" HeaderText="price_change_mode" SortExpression="price_change_mode" UniqueName="price_change_mode">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>--%>
                                    <telerik:GridBoundColumn DataField="percentage" DataType="System.Decimal" FilterControlAltText="Filter percentage column" HeaderText="Dis.%" SortExpression="percentage" UniqueName="percentage">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                  <%--  <telerik:GridBoundColumn DataField="price" DataType="System.Decimal" FilterControlAltText="Filter price column" HeaderText="Dis.(&#8377;)" SortExpression="price" UniqueName="price">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>--%>
                                    <telerik:GridBoundColumn DataField="description" FilterControlAltText="Filter description column" HeaderText="Description" SortExpression="description" UniqueName="description">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                               <%--     <telerik:GridBoundColumn DataField="added_date" DataType="System.DateTime" FilterControlAltText="Filter added_date column" HeaderText="added_date" SortExpression="added_date" UniqueName="added_date">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCheckBoxColumn DataField="status" DataType="System.Boolean" FilterControlAltText="Filter status column" HeaderText="status" SortExpression="status" UniqueName="status">
                                    </telerik:GridCheckBoxColumn>
                                    <telerik:GridBoundColumn DataField="ipaddress" FilterControlAltText="Filter ipaddress column" HeaderText="ipaddress" SortExpression="ipaddress" UniqueName="ipaddress">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>--%>


                                     <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Top"
                                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <a href='add_sale_promotion_coupon.aspx?id=<%# Eval("id") %>'><img src="../Admin_Icons/edit.gif" alt="Edit" border="0" title="Edit" /> </a>
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
                            <AlternatingItemStyle CssClass="treeView" />
                            <ItemStyle CssClass="treeView" />
                            <PagerStyle PageSizeControlType="RadComboBox" />
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="dsPromotionDiscount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT * FROM [sales_promotion_discount_tbl] order by product_name"></asp:SqlDataSource>
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





