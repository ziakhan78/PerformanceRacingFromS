<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order_summary.aspx.cs" Inherits="cart_order_summary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Summary - Performance Racing</title>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/heroic-features.css" rel="stylesheet" />
    <link href="../css/media_css.css" rel="stylesheet" />
    <link rel="stylesheet" href="../styles/main.css" />
    <link href="../css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/table_cart.css" type="text/css" />

    <link rel="stylesheet" href="../cart/css/table_cart.css" type="text/css" />
    <link href="../css/programmer.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" method="post">

        <div class="container">
            <div class="">
                <div class="box-heading">
                    <h1>Order Summary</h1>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row2">


                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" BorderWidth="0" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <table id="shopping-cart-table" class="data-table cart-table">
                                        <thead>
                                            <tr class="first last">
                                                <th class="td-image" style="width: 25%"><span class="nobr"><strong>Image(s)</strong></span></th>
                                                <th class="td-name" style="width: 35%"><span class="nobr"><strong>Product Name</strong></span></th>
                                                <th class="td-price" style="width: 10%"><span class="nobr"><strong>Unit Price</strong></span></th>
                                                <th class="td-price" style="width: 10%"><span class="nobr"><strong>GST</strong></span></th>
                                                <th class="td-qty" style="width: 10%"><span class="nobr"><strong>Qty</strong></span></th>
                                                <th class="td-price" style="width: 10%"><span class="nobr"><strong>Amount</strong></span></th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>

                                <ItemTemplate>
                                    <table id="shopping-cart-table" class="data-table cart-table">
                                        <tbody>
                                            <tr class="first odd">
                                                <td class="td-image text-center" style="width: 25%">
                                                    <%--   <img src="../ProductsImages/<%# Eval("images") %>" data-srcx2="" alt="">--%>
                                                    <asp:Image ID="img1" runat="server" BorderWidth="0" />
                                                    <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                </td>
                                                <td class="td-name text-left" style="width: 35%">
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

                                                    <span><asp:Label ID="lblHsn" runat="server" Text='<%# Eval("hs_code") %>'></asp:Label></span>
                                                </td>
                                                <td class="td-price text-right" style="width: 10%">
                                                    <i class="fa fa-inr">&nbsp;<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:n}") %>'></asp:Label>
                                                </td>

                                                <td class="td-price text-right" style="width: 10%">
                                                    <i class="fa fa-inr"><%# Eval("IGSTAmt","{0:n}") %><br />
                                                        <span style="font-style: italic;"><%# Eval("IGST","{0:n}") %>%</span>
                                                </td>



                                                <td class="td-qty text-center" style="width: 10%">
                                                    <asp:Label ID="lblQty1" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>

                                                </td>

                                                <td class="td-price text-right" style="width: 10%">
                                                    <i class="fa fa-inr">&nbsp;<%# Eval("SubTotal1","{0:n}") %></td>

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

                <div style="margin-top: 10px; margin-left: 10px;">
                    <div style="float: right;">
                    </div>

                    <div class="clearfix"></div>
                    <br />
                </div>

            </div>
        </div>

        <div class="container">
            <div class="row" style="margin-right: 5px;">
                <div class="col-md-8">
                </div>

                <div class="col-md-4">

                    <div class="cart-block cart-coupon" style="margin-bottom: 0px;">
                        <table id="shopping-cart-totals-table">

                            <tr>
                                <td style="" colspan="1" class="text-right">Total Before Tax:</td>
                                <td style="text-align: right">
                                    <span class="price">
                                        <asp:Label ID="lblSubTotal" runat="server"></asp:Label></span>    </td>
                            </tr>

                            <tr>
                                <td style="" colspan="1" class="text-right">Shipping Charges:</td>
                                <td style="text-align: right">
                                    <span class="price">
                                        <asp:Label ID="lblShippingTotal" runat="server"></asp:Label></span>    </td>
                            </tr>

                            <tr>
                                <td style="" colspan="1" class="text-right">Total Tax Amount:</td>
                                <td style="text-align: right">
                                    <span class="price">
                                        <asp:Label ID="lblTax" runat="server"></asp:Label></span>    </td>
                            </tr>


                            <%--   <tr>
                                <td style="" colspan="1" class="text-right">Gross Amount:</td>
                                <td style="text-align: right">
                                    <span class="price">
                                        <asp:Label ID="lblGrossAmount" runat="server"></asp:Label></span>    </td>
                            </tr>--%>

                            <tr>
                                <td style="" colspan="1" class="text-right">
                                    <asp:Label ID="lblDiscountAmtText" runat="server"></asp:Label>
                                </td>
                                <td style="text-align: right">
                                    <span class="price">
                                        <asp:Label ID="lblDiscountAmt" runat="server"></asp:Label></span>    </td>
                            </tr>

                            <tr>
                                <td style="" colspan="1" class="text-right">
                                    <strong>Total Amount:</strong>
                                </td>
                                <td style="text-align: right">
                                    <strong><span class="price">
                                        <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
                                    </span>
                                    </strong></td>
                            </tr>

                        </table>

                    </div>
                    <div class="text-right">
                        <div style="margin-top: 10px; margin-bottom: 10px; margin-right: 0px; float: right;">
                            <asp:LinkButton ID="btnChkOut" runat="server" CssClass="btn btn-danger" Text="Proceed to Checkout" OnClick="btnChkOut_Click" />
                        </div>
                        <strong><span class="price">
                            <asp:Label ID="lblProduct" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblGrandTotal1" runat="server" Visible="false"></asp:Label>
                        </span>
                        </strong>

                    </div>

                </div>

            </div>


        </div>

        <input type="hidden" runat="server" id="key" name="key" />
        <input type="hidden" runat="server" id="hash" name="hash" />
        <input type="hidden" runat="server" id="txnid" name="txnid" />
        <input type="hidden" runat="server" id="firstName" name="key" />
        <input type="hidden" runat="server" id="lastName" name="key" />
        <input type="hidden" runat="server" id="emailId" name="key" />
        <input type="hidden" runat="server" id="add1" name="key" />
        <input type="hidden" runat="server" id="add2" name="key" />
        <input type="hidden" runat="server" id="city" name="key" />
        <input type="hidden" runat="server" id="pin" name="key" />
        <input type="hidden" runat="server" id="state" name="key" />
        <input type="hidden" runat="server" id="country" name="key" />
        <input type="hidden" runat="server" id="phone" name="key" />




        <%--<table>
        <tr>
          <td><b>Mandatory Parameters</b></td>
        </tr>
        <tr>
          <td>Amount: </td>
          <td>
          <asp:TextBox ID="amount" runat="server"  /></td>
          <td>First Name: </td>
          <td>
           <asp:TextBox ID="firstname" runat="server" /></td>
        </tr>
        <tr>
          <td>Email: </td>
          <td>
           <asp:TextBox ID="email" runat="server" /></td>
          <td>Phone: </td>
          <td>
          <asp:TextBox ID="phone" runat="server" /></td>
        </tr>
        <tr>
          <td>Product Info: </td>
          <td colspan="3">
          <asp:TextBox ID="productinfo" runat="server" /></td>
        </tr>
        <tr>
          <td>Success URI: </td>
          <td colspan="3">
          <asp:TextBox ID="surl" runat="server" /></td>
        </tr>
        <tr>
          <td>Failure URI: </td>
          <td colspan="3">
          <asp:TextBox ID="furl" runat="server" /></td>
        </tr>
        <tr>
          <td><b>Optional Parameters</b></td>
        </tr>
        <tr>
          <td>Last Name: </td>
          <td>
          <asp:TextBox ID="lastname" runat="server" /></td>
          <td>Cancel URI: </td>
          <td>
           <asp:TextBox ID="curl" runat="server" /></td>
         
        </tr>
        <tr>
          <td>Address1: </td>
          <td>
            <asp:TextBox ID="address1" runat="server" /></td>
          <td>Address2: </td>
          <td>
          <asp:TextBox ID="address2" runat="server" /></td>
        </tr>
        <tr>
          <td>City: </td>
          <td>
          <asp:TextBox ID="city" runat="server" /></td>
          <td>State: </td>
          <td>
          <asp:TextBox ID="state" runat="server" /></td>
        </tr>
        <tr>
          <td>Country: </td>
          <td>
          <asp:TextBox ID="country" runat="server" /></td>
          <td>Zipcode: </td>
          <td>
            <asp:TextBox ID="zipcode" runat="server" /></td>
        </tr>
        <tr>
          <td>UDF1: </td>
          <td>
           <asp:TextBox ID="udf1" runat="server" /></td>
          <td>UDF2: </td>
          <td>
           <asp:TextBox ID="udf2" runat="server" /></td>
        </tr>
        <tr>
          <td>UDF3: </td>
          <td>
           <asp:TextBox ID="udf3" runat="server" /></td>
          <td>UDF4: </td>
          <td>
           <asp:TextBox ID="udf4" runat="server" /></td>
        </tr>
        <tr>
          <td>UDF5: </td>
          <td>
           <asp:TextBox ID="udf5" runat="server" /></td>
          <td>PG: </td>
          <td>
           <asp:TextBox ID="pg" runat="server" /></td>
        </tr>
        <tr>
        
            <td colspan="4"></td>
            
        </tr>
      </table>--%>
        <br />


    </form>
</body>
</html>
