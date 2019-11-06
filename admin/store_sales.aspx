<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="store_sales.aspx.cs" Inherits="admin_store_sales" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 102px;
        }

        .style2 {
            width: 130px;
            text-align: right;
        }

        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">




    <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

        <tr>
            <td class="header_title" align="center">
                <asp:Label ID="lblHeading" runat="server"></asp:Label></td>
        </tr>

        <tr>

            <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
        </tr>

        <tr>

            <td align="right">

                <%--  <asp:SqlDataSource ID="dsgrid" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="sc_GetProductsByCartid2" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="cartid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
            </td>
        </tr>
        <tr>
            <td>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>


                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" BorderWidth="1px" OnRowDataBound="GridView1_RowDataBound" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr.">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex +1 %>
                                        <asp:Label ID="lblProName" runat="server" Text='<%# Eval("product_name") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("RecordID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>



                                <asp:BoundField DataField="sku" HeaderText="SKU" SortExpression="sku" />
                                <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" />
                                <%-- <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />--%>
                                <asp:TemplateField HeaderText="Price">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:n0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%--    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />--%>

                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlQty" runat="server" Width="60px" AutoPostBack="true" CssClass="textfield" OnSelectedIndexChanged="ddlQty_SelectedIndexChanged">
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="SubTotal1" HeaderText="Sub Total" ReadOnly="True" SortExpression="SubTotal1" />

                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                        </cc1:ConfirmButtonExtender>
                                        <asp:LinkButton ID="imgDeleteP" CssClass="btn btn-danger" runat="server" CommandArgument='<%# Eval("RecordID") %>' CommandName="Delete">Delete</asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- <asp:BoundField DataField="RowNumber" HeaderText="RowNumber" ReadOnly="True" SortExpression="RowNumber" />
                            <asp:BoundField DataField="RecordID" HeaderText="RecordID" InsertVisible="False" ReadOnly="True" SortExpression="RecordID" />
                            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" />
                            <asp:BoundField DataField="CartID" HeaderText="CartID" SortExpression="CartID" />
                           
                            
                            <asp:BoundField DataField="Cart_Id" HeaderText="Cart_Id" SortExpression="Cart_Id" />
                            <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" InsertVisible="False" ReadOnly="True" SortExpression="OrderNo" />
                            <asp:BoundField DataField="Cust_Id" HeaderText="Cust_Id" SortExpression="Cust_Id" />
                            <asp:BoundField DataField="Dealer_Id" HeaderText="Dealer_Id" SortExpression="Dealer_Id" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" SortExpression="SubTotal" />
                            <asp:BoundField DataField="TaxTotal" HeaderText="TaxTotal" SortExpression="TaxTotal" />
                            <asp:BoundField DataField="ShippingTotal" HeaderText="ShippingTotal" SortExpression="ShippingTotal" />
                            <asp:BoundField DataField="CouponDiscount" HeaderText="CouponDiscount" SortExpression="CouponDiscount" />
                            <asp:BoundField DataField="PaymentMethod" HeaderText="PaymentMethod" SortExpression="PaymentMethod" />
                            <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn" SortExpression="CreatedOn" />
                            <asp:BoundField DataField="UpdateOn" HeaderText="UpdateOn" SortExpression="UpdateOn" />
                            <asp:BoundField DataField="TotalWeight" HeaderText="TotalWeight" SortExpression="TotalWeight" />
                            <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
                            <asp:BoundField DataField="IpAddress" HeaderText="IpAddress" SortExpression="IpAddress" />
                            <asp:BoundField DataField="CardType" HeaderText="CardType" SortExpression="CardType" />
                            <asp:BoundField DataField="CardNumber" HeaderText="CardNumber" SortExpression="CardNumber" />
                            <asp:BoundField DataField="images" HeaderText="images" SortExpression="images" />--%>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>

                    </ContentTemplate>
                </asp:UpdatePanel>


                <div style="text-align: center; padding-bottom: 20px;">
                    <b>
                        <asp:Label ID="lblEmptyCart" runat="server"></asp:Label></b><br />
                    <asp:Image ID="imgEmptcart" runat="server" ImageUrl="~/images/emptycart.png" />
                </div>

            </td>
        </tr>


        <tr>
            <td>


                <div id="emptycart" runat="server" class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="coupon_code"></div>
                        </div>

                       

                        <div class="col-md-4" style="float:right;">
                            <div class="cart-collaterals">
                                <div class="cart-block cart-coupon" style="margin-bottom: 35px;">
                                    <table id="shopping-cart-totals-table">
                                        <tfoot>
                                            <tr>
                                                <td style="" class="a-right" colspan="1">
                                                    <strong>Grand Total:</strong>
                                                </td>
                                                <td style="" class="a-right">
                                                    <strong><span class="price">
                                                        <asp:Label ID="lblGrandTotal" runat="server"></asp:Label></span>
                                                    </strong></td>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr>
                                                <td style="" class="a-right" colspan="1">Subtotal:</td>
                                                <td style="" class="a-right">
                                                    <span class="price">
                                                        <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                                                        <asp:Label ID="lblSubTotal1" runat="server" Visible="false"></asp:Label></span>    </td>
                                            </tr>
                                        </tbody>

                                        <tbody>
                                            <tr>
                                                <td style="" class="a-right" colspan="1">Shipping Charges:</td>
                                                <td style="" class="a-right">
                                                    <span class="price">
                                                        <asp:Label ID="lblShippingTotal" runat="server"></asp:Label></span>    </td>
                                            </tr>
                                        </tbody>


                                        <%--   <tbody>
                                <tr>
                                    <td style="" class="a-right" colspan="1">Service Charges:</td>
                                    <td style="" class="a-right">
                                        <span class="price">
                                            <asp:Label ID="lblTax" runat="server"></asp:Label></span>    </td>
                                </tr>
                            </tbody>


                            <tbody>
                                <tr>
                                    <td style="" class="a-right" colspan="1">Gross Amount:</td>
                                    <td style="" class="a-right">
                                        <span class="price">
                                            <asp:Label ID="lblGrossAmount" runat="server"></asp:Label><asp:Label ID="lblGrossAmount1" runat="server" Visible="false"></asp:Label></span>    </td>
                                </tr>
                            </tbody>--%>

                                        <tbody>
                                            <tr>
                                                <td style="" class="a-right" colspan="1">
                                                    <asp:Label ID="lblDiscountAmtText" runat="server"></asp:Label>
                                                </td>
                                                <td style="" class="a-right">
                                                    <span class="price">
                                                        <asp:Label ID="lblDiscountAmt" runat="server"></asp:Label></span>    </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                </div>

            </td>
        </tr>

    </table>


</asp:Content>

