<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="view_stocks.aspx.cs" Inherits="Admin_view_stocks" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" class="txt">

                <tr>
                    <td colspan="3" class="header_title">View Stocks</td>
                </tr>

                
                 <tr>
                        <td class="auto-style1" style="width:130px;" >Category :</td>
                        <td>
                            <asp:DropDownList ID="ddlCat" runat="server" AutoPostBack="True" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged" CssClass="txtBox">
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVcat" runat="server" ControlToValidate="ddlCat" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr id="trSubCategory" runat="server">
                        <td class="auto-style1">Sub Category :</td>

                        <td class="auto-style2">
                            <asp:DropDownList ID="ddlSubcategory" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlSubcategory_SelectedIndexChanged">
                                <asp:ListItem Value="Select" Text="Select">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVsubcat" runat="server" ControlToValidate="ddlSubcategory" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="Select" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <%--   <tr id="trBrand" runat="server">
                        <td class="RadInputRTL" ><span class="auto-style1">* </span>Brand :</td>
                        <td align="left">
                            <asp:DropDownList ID="ddlBrands" runat="server" CssClass="txtBox"  AutoPostBack="True" OnSelectedIndexChanged="ddlBrands_SelectedIndexChanged">
                                <asp:ListItem Text="Select" Value="0">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RFVbrand" runat="server" ControlToValidate="ddlBrands" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="0" ValidationGroup="C"></asp:RequiredFieldValidator>

                        </td>
                    </tr>--%>

                     <tr>
                        <td class="auto-style1" >Products :</td>
                        <td align="left">
                            <asp:DropDownList ID="ddlProducts" runat="server" CssClass="txtBox" AutoPostBack="True" OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged">
                                <asp:ListItem Text="Select" Value="0">Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlProducts" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank !" InitialValue="0" ValidationGroup="C"></asp:RequiredFieldValidator>

                        </td>
                    </tr>

                <tr>
                    <td colspan="3">
                          <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                                Skin="Default" PageSize="25" >
                                <HeaderContextMenu EnableAutoScroll="True">
                                </HeaderContextMenu>
                                <HeaderStyle Font-Bold="True" />

                                <MasterTableView AutoGenerateColumns="False" CellSpacing="-1" >
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn Created="True">
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

                                      

                                        


                                       <%-- <telerik:GridBoundColumn DataField="sku" HeaderText="SKU"
                                            SortExpression="sku" UniqueName="sku">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>--%>



                                        <telerik:GridBoundColumn DataField="cat_name"
                                            HeaderText="Category"
                                            SortExpression="cat_name" UniqueName="cat_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                           
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="subcat_name"
                                            HeaderText="Subcategory"
                                            SortExpression="subcat_name" UniqueName="subcat_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                           
                                        </telerik:GridBoundColumn>

                                        

                                        <telerik:GridBoundColumn DataField="product_name"
                                            HeaderText="Product Name"
                                            SortExpression="product_name" UniqueName="product_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                           
                                        </telerik:GridBoundColumn>

<%--                                        <telerik:GridBoundColumn DataField="brand_name"
                                            HeaderText="Brands"
                                            SortExpression="brand_name" UniqueName="brand_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle Font-Underline="true" />
                                            <ItemStyle VerticalAlign="Top" />
                                        </telerik:GridBoundColumn>--%>
                                     


                                        <telerik:GridTemplateColumn HeaderText="Price" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" SortExpression="price">
                                            <ItemTemplate>
                                                <%# Eval("price", "{0:n0}") %>
                                            </ItemTemplate>
                                            <ItemStyle VerticalAlign="Top" Width="50px" />
                                            <HeaderStyle HorizontalAlign="Right" Width="50px" />

                                        </telerik:GridTemplateColumn>

                                     
                                         <telerik:GridBoundColumn DataField="size" HeaderText="Size" SortExpression="size" UniqueName="size">                                          
                                        </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="color" HeaderText="Color" SortExpression="color" UniqueName="color">                                          
                                        </telerik:GridBoundColumn>

                                          <telerik:GridBoundColumn DataField="added_qty" HeaderText="Added" SortExpression="added_qty" UniqueName="added_qty">                                          
                                        </telerik:GridBoundColumn>

                                          <telerik:GridBoundColumn DataField="sold_qty" HeaderText="Sold" SortExpression="sold_qty" UniqueName="sold_qty">                                          
                                        </telerik:GridBoundColumn>

                                          <telerik:GridBoundColumn DataField="stock_qty" HeaderText="Stock" SortExpression="stock_qty" UniqueName="stock_qty">                                          
                                        </telerik:GridBoundColumn>

                                         <telerik:GridBoundColumn DataField="added_date" AllowFiltering="false" HeaderText="Added Date" SortExpression="added_date" UniqueName="added_date" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}">
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left"  />
                                        <ItemStyle HorizontalAlign="Left"  />
                                    </telerik:GridBoundColumn>


                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                        </EditColumn>
                                    </EditFormSettings>
                                    <ItemStyle CssClass="treeView" />
                                    <AlternatingItemStyle CssClass="treeView" />
                                    <PagerStyle PageSizeControlType="RadComboBox" />
                                </MasterTableView>
                                <PagerStyle PageSizeControlType="RadComboBox" />
                                <FilterMenu EnableImageSprites="False">
                                </FilterMenu>
                            </telerik:RadGrid>
                             
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
