<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="ConfirmOrder.aspx.cs" Inherits="ConfirmOrder" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .rbl input[type="radio"] {
            margin-left: 3px;
            margin-right: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="container">

        <section>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div class="heading_mtab1">
                        <div id="breed_karm" align="right" class="cooki_karm"><a href="Default.aspx" class="cooki_karm">Home</a> > <span class="cooki_karmb">Order Summary</span></div>

                        <div class="icondhy"></div>
                        <div class="head_dhydiv">
                            <span class="white_text1">Order Summary</span>
                        </div>
                    </div>

                    <div class="shopping-cart">

                        <div style="float: right; width: 21%; margin: 0px 0 0 0;">
                            <div class="left_bar-bg">
                               

                            </div>


                        </div>

                        <div style="width: 76%;">

                            <div style="margin: 10px 0 5px 20px; font-weight: bold;">
                                <asp:Label ID="lblOrderNo" runat="server"></asp:Label><asp:Label ID="lblDate" runat="server"></asp:Label>
                            </div>


                            <table width="100%" border="0" cellpadding="0" cellspacing="0">


                                <tr>
                                    <td colspan="25">

                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" BorderWidth="0">
                                            <Columns>
                                                <asp:TemplateField>

                                                    <HeaderTemplate>
                                                        <table id="shopping-cart-table" class="data-table cart-table" border="0" style="margin: 0px 0 0 20px;">
                                                            <div style="border-top: 6px #808080 solid; margin-left: 20px;"></div>
                                                            <tr>
                                                                <td width="35"><strong>Sr.</strong></td>
                                                                <td width="145">
                                                                    <div align="center"><strong>Image(s)</strong></div>
                                                                </td>
                                                                <td width="427" align="left">
                                                                    <div style="text-align: left;"><strong>Product Particulars</strong></div>
                                                                </td>
                                                                <td width="100" align="center">
                                                                    <div style="text-align: right;"><strong>Price</strong></div>
                                                                </td>
                                                                <td width="69" align="center">
                                                                    <div style="text-align: center;"><strong>Quantity</strong></div>
                                                                </td>
                                                                <td width="100" align="right">
                                                                    <div style="text-align: right;"><strong>Total</strong></div>
                                                                </td>
                                                            </tr>

                                                        </table>
                                                        <div style="height: 2px;"></div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>

                                                        <table id="shopping-cart-table" class="data-table cart-table-inner" border="0" style="margin: 0px 0 0 20px;">

                                                            <tr>
                                                                <td width="35" class="td-image">
                                                                    <div style="text-align: left;"><%# Eval("RowNumber")%></div>
                                                                </td>
                                                                <td width="145" class="td-image">
                                                                    <div style="text-align: center;">
                                                                        <img src="../ProductsImages/<%# Eval("images") %>" alt="" style="height:100px; width:100px;" />
                                                                    </div>
                                                                </td>
                                                                <td width="427" align="center" class="td-name">
                                                                    <div style="text-align: left;">
                                                                        <asp:Label ID="lblProName" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                                                                    </div>
                                                                </td>
                                                                <td width="100" align="center" class="">
                                                                    <div style="text-align: right;">&#8377; <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:N}") %>'></asp:Label>
                                                                    </div>
                                                                </td>
                                                                <td width="69" align="center">
                                                                    <div style="text-align: center;">
                                                                        <asp:Label ID="txtQ" runat="server" Text='<%# Bind("Quantity") %>' Style="text-align: right;"></asp:Label>
                                                                    </div>
                                                                </td>
                                                                <td width="100" align="center" class="">
                                                                    <div style="text-align: right;">&#8377; <%# Eval("SubTotal1","{0:N}") %></div>
                                                                </td>
                                                            </tr>



                                                        </table>
                                                        <div style="height: 2px;"></div>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                There are currently no items in your shopping cart.
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </td>
                                </tr>

                            </table>

                            <div id="rrt" style="width: 940px;">
                                <div class="discount_coupon2">

                                    <div id="rar" style="margin-top: 15px;">
                                        <div class="billdhy">Sub Total: &#8377;
                                    <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>


                                    <%--  <div id="Div1" style="margin-top: 6px;">
                                <div class="billdhy">Tax (4.25 %) </div>
                                <div class="bill_colon">:</div>
                                <div class="bill_doller">$
                                    <asp:Label ID="lblTaxTotal" runat="server"></asp:Label></div>
                                <div class="clearfix"></div>
                            </div>--%>


                                    <div id="Div2" style="margin-top: 6px;">
                                        <div class="billdhy">Shipping Charges: &#8377; <asp:Label ID="lblShippingTotal" runat="server"></asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <div id="div4" runat="server" style="margin-top: 10px;">
                                        <div style="border-bottom: 1px solid #C8C8C8; margin-bottom: 10px; height: 3px;"></div>
                                        <div class="billdhy2"><span class="bill_totext1">Gross Amount: &#8377;
                                    <asp:Label ID="lblGrossAmount" runat="server"></asp:Label></span>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <div id="divCoupon" runat="server" style="margin-top: 10px;">
                                        <div style="border-bottom: 1px solid #C8C8C8; margin-bottom: 10px; height: 3px;"></div>
                                        <div class="billdhy2">
                                            <span class="bill_totext1">
                                                <asp:Label ID="lblDiscountAmtText" runat="server"></asp:Label></span>
                                        </div>
                                        <div class="bill_doller2">
                                            <span class="bill_totext1">
                                                <asp:Label ID="lblDiscountAmt" runat="server"></asp:Label></span>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>


                                    <div id="Div3" style="margin-top: 10px;">
                                        <div style="border-bottom: 1px solid #C8C8C8; margin-bottom: 10px; height: 3px;"></div>
                                        <div class="billdhy2"><span class="bill_totext">Net Amount : &#8377;
                                    <asp:Label ID="lblTotalAmount" runat="server"></asp:Label></span>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>

                                </div>



                                <div class="discount_coupon">
                                    <div align="left" class="discount_text">Discount Coupon</div>
                                    <div align="left" class="" style="height: 20px; padding: 0 0 0 20px;">
                                        <span class="discount_entertext">Enter your discount coupon code below.</span>
                                    </div>
                                    <div align="left" class="" style="height: 25px; padding: 12px 0 0 20px;">
                                        <asp:TextBox ID="txtCouponCode" runat="server" CssClass="txtBox" Font-Size="Large" MaxLength="20" Width="250px"></asp:TextBox>
                                    </div>

                                    <div align="left" style="height: 45px; padding: 12px 0 0 30px;">
                                        <br />
                                        <asp:Button ID="btnApply" runat="server" Text="Apply Discount Coupon Code" CssClass="myButtondhy" OnClick="btnApply_Click" ValidationGroup="c" />
                                        <div class="clearfix" style="text-align: center; margin-top: 3px;">
                                            <asp:Label ID="lblAlreadyDiscount" runat="server" CssClass="txt_validation" Text="Invalid Coupon Code !"></asp:Label>
                                        </div>
                                    </div>

                                    <div style="float: left; padding-left: 0px; margin-top: 50px;">
                                        <span class="bill_totext" style="margin-bottom: 10px;">Shipping Options </span>
                                        <asp:RadioButtonList ID="rbtnType" CssClass="rbl" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbtnType_SelectedIndexChanged">
                                            <asp:ListItem Selected="True">Standard</asp:ListItem>
                                            <asp:ListItem>Express</asp:ListItem>
                                            <asp:ListItem>Overnight</asp:ListItem>
                                            <asp:ListItem>Saturday</asp:ListItem>
                                        </asp:RadioButtonList>

                                    </div>
                                </div>
                                <div style="float: left; width: 600px; margin: 10px;">
                                    <span style="color: red;">Currently shipping to continental USA & Canada only</span><br />
                                    <span style="font-weight: bold;">Delivery Time :</span><br />
                                    1.

                                     Standard delivery takes 10-12 Business Days<br />
                                    2.
Express delivery takes 5-7 Business Days<br />
                                    3.
Overnight delivery takes 1-2 Business Days<br />
                                    4.
Saturday delivery - will be delivered on Saturady

                                </div>

                                <div class="clearfix"></div>
                                <div style="text-align: right; height: 45px;">
                                    <asp:Button ID="btnChkOut" runat="server" Text="Checkout" CssClass="myButton" OnClick="btnChkOut_Click" />
                                </div>

                            </div>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </section>
    </div>
</asp:Content>



