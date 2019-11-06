<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="viewcart.aspx.cs" EnableEventValidation="false" Inherits="cart_viewcart" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../cart/css/table_cart.css" type="text/css" />
    <link href="../css/programmer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="bs-example">
        <div class="container">
            <div class="row">

                <div class="main_heading_div">
                    <h2>Viewcart</h2>
                </div>

            </div>
        </div>

        <br />
        <br />
    </div>


    <div class="container">
        <div class="row">

            <div class="col-lg-12 col-md-12 col-sm-12">


                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" BorderWidth="0" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:TemplateField>

                                        <HeaderTemplate>

                                            <table id="shopping-cart-table" class="data-table cart-table">
                                                <thead>
                                                    <tr class="first last">
                                                        <th class="td-image  text-right" ><span class="nobr"><strong>Image(s)</strong></span></th>
                                                        <th class="td-name text-right" ><span class="nobr"><strong>Product Name</strong></span></th>
                                                        <th class="td-price text-right" ><span class="nobr"><strong>Unit Price</strong></span></th>
                                                        <th class="td-price text-right" ><span class="nobr"><strong>GST</strong></span></th>
                                                        <th class="td-qty text-right" ><span class="nobr"><strong>Qty</strong></span></th>
                                                        <th class="td-price text-right" ><span class="nobr"><strong>Subtotal</strong></span></th>
                                                        <th class="td-delete text-right" ><span class="nobr"><strong>Action</strong></span></th>
                                                    </tr>
                                                </thead>

                                            </table>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <table id="shopping-cart-table" class="data-table cart-table">
                                                <tbody>
                                                    <tr class="first odd">

                                                        <td class="td-image text-left" >
                                                            <%-- <img src="../ProductsImages/<%# Eval("images") %>" data-srcx2="" alt="">           --%>
                                                            <asp:Image ID="img1" runat="server" BorderWidth="0" />
                                                            <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                        </td>

                                                        <td class="td-name text-left" >
                                                            <h2 class="product-name">
                                                                <asp:Label ID="lblProName" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                                                                <asp:Label ID="lblId" runat="server" Text='<%# Eval("RecordID") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>' Visible="false"></asp:Label>
                                                            </h2>
                                                            <span>SKU#: <b><i><%# Eval("sku") %></i></b></span><br />
                                                            <span><b><i><%# Eval("subcat_name") %> - <%# Eval("brand_name") %></i></b></span>
                                                            <span>
                                                                <asp:Label ID="lblSize" runat="server" Text='<%# Eval("size") %>'></asp:Label></span>
                                                            <span>
                                                                <asp:Label ID="lblColor" runat="server" Text='<%# Eval("color") %>'></asp:Label></span>
                                                            <span>
                                                                <asp:Label ID="lblHsn" runat="server" Text='<%# Eval("hs_code") %>'></asp:Label></span>
                                                        </td>

                                                        <td class="td-price text-right" >
                                                            <i class="fa fa-inr">
                                                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:n}") %>'></asp:Label>
                                                        </td>

                                                        <td class="td-price text-right" >
                                                            <i class="fa fa-inr"><%# Eval("IGSTAmt","{0:n}") %><br />
                                                                <span style="font-style: italic;"><%# Eval("IGST","{0:n}") %>%</span>
                                                                <%--<asp:Label ID="lblVat" runat="server" Text='<%# Eval("IGSTAmt","{0:n}") %>'></asp:Label>--%>
                                                        </td>

                                                        <td class="td-qty text-center" >
                                                            <asp:Label ID="lblQtyInStock" runat="server" Text='<%# Eval("QtyInStock") %>' Visible="false"></asp:Label>
                                                            <asp:DropDownList ID="ddlQty" runat="server" Width="60px" AutoPostBack="true" CssClass="textfield" OnSelectedIndexChanged="ddlQty_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <%-- <asp:DropDownList ID="ddlQty" runat="server" Width="60px" AutoPostBack="true" CssClass="textfield" OnSelectedIndexChanged="ddlQty_SelectedIndexChanged">
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
                                                            </asp:DropDownList>--%>
                                                            <%-- <asp:TextBox ID="txtQ" runat="server" CssClass="txtBox" Text='<%# Bind("quantity") %>' Width="25px" MaxLength="3" Style="text-align: right; padding-right: 5px;"></asp:TextBox>
                                                        <asp:LinkButton ID="btnUpdateIndividualItem" CssClass="btn btn-danger" runat="server" CommandArgument='<%# Eval("RecordID") %>' CommandName="Update">Update</asp:LinkButton>
                                                            --%>  
                                                        </td>

                                                        <td class="td-price text-right" >
                                                            <i class="fa fa-inr"><%# Eval("SubTotal1","{0:n}") %></td>

                                                        <td class="td-delete text-center">
                                                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                            </cc1:ConfirmButtonExtender>
                                                            <asp:LinkButton ID="imgDeleteP" CssClass="addtowish" runat="server" CommandArgument='<%# Eval("RecordID") %>' CommandName="Delete" ForeColor="White">Delete</asp:LinkButton>
                                                        </td>

                                                    </tr>

                                                </tbody>
                                            </table>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    There are currently no items in your shopping cart.
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>


                <div style="text-align: center;">
                    <b>
                        <asp:Label ID="lblEmptyCart" runat="server"></asp:Label></b><br />
                    <asp:Image ID="imgEmptcart" runat="server" ImageUrl="~/images/emptycart.png" />
                </div>
                <asp:Panel ID="Panel1" runat="server" Visible="false">

                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowFooter="true" Width="100%" CssClass="gridcss" Visible="true">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr.">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex +1 %>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="product_name" HeaderText="Product Particulars" SortExpression="product_name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="hs_code" HeaderText="HSN" SortExpression="hs_code" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="60px" />
                            <asp:BoundField DataField="Quantity" HeaderText="Qty" SortExpression="Quantity" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" ItemStyle-Width="30px" />

                            <asp:TemplateField HeaderText="Unit Price">
                                <ItemTemplate>
                                    <%# Eval("price","{0:n0}") %>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" Width="70px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="CGST" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <%# Eval("GSTAmt","{0:n}") %><br />
                                    <span style="font-style: italic"><%# Eval("CGST","{0:n}") %>%</span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="75px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="SGST" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <%# Eval("GSTAmt","{0:n}") %><br />
                                    <span style="font-style: italic"><%# Eval("SGST","{0:n}") %>%</span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="75px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="IGST" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <%# Eval("IGSTAmt","{0:n}") %><br />
                                    <span style="font-style: italic"><%# Eval("IGST","{0:n}") %>%</span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="75px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <%# Eval("SubTotal1","{0:n}") %>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="100px" />
                            </asp:TemplateField>

                        </Columns>
                        <HeaderStyle Font-Bold="true" Font-Size="15px" Height="35px" />
                        <FooterStyle Font-Bold="true" />

                    </asp:GridView>
                </asp:Panel>



            </div>

        </div>

        <div id="emptycart" runat="server" class="container">
            <div class="row" style="margin-right: 5px;">
                <div class="col-md-8">
                </div>
                <%--   <div class="col-md-4">

                <div class="cart-collaterals">
                    <div class="cart-block cart-coupon" style="margin-bottom: 15px;">
                        <div id="discount-coupon-form" >
                            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnCoupon">                           
                            <div class="discount">
                                <h4>Coupon Code</h4>
                                <div class="discount-form">
                                    <label for="coupon_code">Enter your coupon code.</label>
                                    <input type="hidden" name="remove" id="remove-coupone" value="0">
                                    <div class="input-box">                                        
                                        <asp:TextBox ID="txtCouponCode" runat="server" CssClass="txtBox"></asp:TextBox>
                                    </div>
                                    <div class="buttons-set">
                                        <asp:Label ID="lblAlreadyDiscount" runat="server" CssClass="txt_validation" Text="Invalid Coupon Code !"></asp:Label><br />
                                        <asp:LinkButton ID="btnCoupon" runat="server" CssClass="addtowish" Text="Apply Coupon" OnClick="btnCoupon_Click" />
                                    </div>
                                </div>
                            </div>
                                 </asp:Panel>
                        </div>

                    </div>
                </div>

            </div>--%>

                <div class="col-md-4">

                    <table id="shopping-cart-totals-table">

                        <tr>
                            <td style="" class="text-right" colspan="1">Total Before Tax:</td>
                            <td style="text-align: right">
                                <span class="price">&nbsp;<asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                                    <asp:Label ID="lblSubTotal1" runat="server" Visible="false"></asp:Label></span>    </td>
                        </tr>



                        <%-- <tr>
                            <td style="" class="text-right" colspan="1">Shipping Charges:</td>
                            <td style="text-align: right">
                                <span class="price">&nbsp;<asp:Label ID="lblShippingTotal" runat="server"></asp:Label></span>    </td>
                        </tr>--%>



                        <%-- <tbody>
                                <tr>
                                    <td style="" class="a-right" colspan="1">VAT:</td>
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

                        <tr>
                            <td style="text-align: right" class="a-right">Total Tax Amount:</td>
                            <td style="text-align: right">
                                <span class="price">
                                    <asp:Label ID="lblTax" runat="server"></asp:Label></span>    </td>
                        </tr>


                        <tr>
                            <td style="text-align: right" class="a-right">
                                <asp:Label ID="lblDiscountAmtText" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right">
                                <span class="price">&nbsp;<asp:Label ID="lblDiscountAmt" runat="server"></asp:Label></span>    </td>
                        </tr>

                        <tr>
                            <td style="" class="text-right" colspan="1">
                                <strong>Total Amount:</strong>
                            </td>
                            <td style="text-align: right">
                                <strong><span class="price">&nbsp;<asp:Label ID="lblGrandTotal" runat="server"></asp:Label></span>
                                </strong></td>
                        </tr>

                    </table>

                </div>
                <div style="margin-top: 10px; margin-bottom: 10px; margin-right: 0px; float: right;">
                    <asp:LinkButton ID="btnContShopping" runat="server" CssClass="addtowish" Text="Continue Shopping" OnClick="btnContShopping_Click" />&nbsp;&nbsp;
                   <%-- <asp:LinkButton ID="btnUpdateCart" runat="server" CssClass="addtowish" Text="Update Cart" OnClick="btnUpdateCart_Click" />--%>
                    <asp:LinkButton ID="btnChkOut" runat="server" CssClass="addtowish" Text="Proceed to Checkout" OnClick="btnChkOut_Click" />

                    <asp:LinkButton ID="btnPlaceOrder" runat="server" CssClass="addtowish" Text="Place Order" OnClick="btnPlaceOrder_Click" />
                </div>

            </div>


            <div style="color: red; font-weight: bold; margin: 10px;" class="clearfix">
                *Tax Amount applicable in percentage and amount shall be displayed at the time of Checkout.<br />
                Cost includes free shipping.
            </div>
        </div>

    </div>
</asp:Content>

