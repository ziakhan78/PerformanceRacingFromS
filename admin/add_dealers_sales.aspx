<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_dealers_sales.aspx.cs" Inherits="Admin_add_dealers_sales" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
<%--   <link href="../cart/css/table_cart.css" rel="stylesheet" />--%>
    <link href="../css/bootstrap.css" rel="stylesheet" />

    <style type="text/css">
        .style1 {
            width: 102px;
        }

        .style2 {
            width: 160px;
            text-align: right;
        }

        .auto-style1 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">

                <table style="width: 100%;" border="0" class="txt" align="center" cellpadding="3" cellspacing="5">

                    <tr>
                        <td colspan="2" class="header_title" align="center">
                            <asp:Label ID="lblHeading" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        
                        <td align="right"><span class="auto-style1">*</span> Denotes mandatory fields</td>
                    </tr>

                    <tr>
                       
                        <td valign="top">
                            Select Dealer: <asp:DropDownList ID="ddlCustomers" runat="server" CssClass="txtBox" DataSourceID="SqlDataSource1" DataTextField="CompanyName" DataValueField="id" AppendDataBoundItems="true">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>                             
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [CompanyName] FROM [Dealers_tbl] ORDER BY [CompanyName]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RFVVat" runat="server" ControlToValidate="ddlCustomers" InitialValue="0" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Dealer" ValidationGroup="O"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr><td>&nbsp;</td></tr>

                    <tr>                       

                        <td>
                            Enter Barcode: <asp:TextBox ID="txtSku" runat="server" AutoPostBack="True" CssClass="txtBox"  OnTextChanged="txtSku_TextChanged" TabIndex="0" Width="300px"></asp:TextBox>                            
                        </td>
                    </tr>

                     <tr><td>&nbsp;</td></tr>

                    <tr > 
                        <td class="table-bordered table-responsive" >
                             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="table-bordered table-responsive" >
                            <div>
                                <asp:Label ID="lblOrderNo" runat="server"></asp:Label>
                            </div>

                            <asp:GridView ID="GridView1" Width="100%" CssClass="table-bordered table-responsive" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" BorderWidth="0" OnRowDataBound="GridView1_RowDataBound" ShowFooter="true">
                                <Columns>

                                    <asp:TemplateField HeaderText="Sr." >
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex +1 %>
                                             <asp:Label ID="lblId" runat="server" Text='<%# Eval("RecordID") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Image" >
                                        <ItemTemplate>
                                     <asp:Image ID="img1" runat="server" BorderWidth="0" CssClass="img-responsive" Height="100" Width="100" />
                                                            <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                               </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>

                                      <asp:BoundField DataField="product_name" HeaderText="Product Particulars" SortExpression="product_name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                                      <asp:BoundField DataField="hs_code" HeaderText="HSN" SortExpression="hs_code" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                                     <%-- <asp:BoundField DataField="Quantity" HeaderText="Qty" SortExpression="Quantity" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" />--%>
                                    <%--  <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />--%>

                                      <asp:TemplateField HeaderText="Qty" >
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
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="Unit Price" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:n0}") %>'></asp:Label>
                                        </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Dis" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                                        <ItemTemplate>
                                            <%# Eval("dealer_discount","{0:n}") %>                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                        <asp:TemplateField HeaderText="CGST" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                                        <ItemTemplate>
                                            <%# Eval("GSTAmt","{0:n}") %><br />
                                            <%# Eval("CGST","{0:n}") %>%
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="SGST" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                                        <ItemTemplate>
                                            <%# Eval("GSTAmt","{0:n}") %><br />
                                            <%# Eval("SGST","{0:n}") %>%
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="IGST" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                                        <ItemTemplate>
                                            <%# Eval("IGSTAmt","{0:n}") %><br />
                                            <%# Eval("IGST","{0:n}") %>%
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                                        <ItemTemplate>
                                            <%# Eval("SubTotal1","{0:n}") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                                        <ItemTemplate>

                                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                            </cc1:ConfirmButtonExtender>
                                                            <asp:LinkButton ID="imgDeleteP" CssClass="btn btn-danger" runat="server" CommandArgument='<%# Eval("RecordID") %>' CommandName="Delete">Delete</asp:LinkButton>
                                                 </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--<asp:BoundField DataField="RowNumber" HeaderText="RowNumber" ReadOnly="True" SortExpression="RowNumber" />
                                    <asp:BoundField DataField="RecordID" HeaderText="RecordID" InsertVisible="False" ReadOnly="True" SortExpression="RecordID" />
                                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" />
                                    <asp:BoundField DataField="CartID" HeaderText="CartID" SortExpression="CartID" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                    <asp:BoundField DataField="Cart_Id" HeaderText="Cart_Id" SortExpression="Cart_Id" />
                                    <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" InsertVisible="False" ReadOnly="True" SortExpression="OrderNo" />
                                    <asp:BoundField DataField="Cust_Id" HeaderText="Cust_Id" SortExpression="Cust_Id" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                    <asp:BoundField DataField="OrderFrom" HeaderText="OrderFrom" SortExpression="OrderFrom" />
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
                                    <asp:BoundField DataField="SubTotal1" HeaderText="SubTotal1" ReadOnly="True" SortExpression="SubTotal1" />
                                    <asp:BoundField DataField="images" HeaderText="images" SortExpression="images" />
                                    <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name" />
                                    <asp:BoundField DataField="sku" HeaderText="sku" SortExpression="sku" />
                                    <asp:BoundField DataField="vat" HeaderText="vat" SortExpression="vat" />
                                    <asp:BoundField DataField="VatAmount" HeaderText="VatAmount" ReadOnly="True" SortExpression="VatAmount" />--%>

                                </Columns>
                                 <HeaderStyle Font-Bold="true" />
                                <FooterStyle Font-Bold="true" />
                            </asp:GridView>
                          <%--  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="sc_GetProductsByCartid3" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="cartid" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>--%>
               
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                        </td>
                    </tr>


                    <tr>
                       
                        <td style="text-align:right;">
                            <div class="col-md-4" style="float:right;">

                    <table id="shopping-cart-totals-table" width="100%" style="padding-right:5px;">

                        <tr>                         
                            <td class="text-right">
                                <span class="price"><asp:Label ID="lblSubTotal" runat="server"></asp:Label>
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
                           
                            <td class="text-right">
                                <span class="price"><asp:Label ID="lblDiscountAmtText" runat="server"></asp:Label>&nbsp;<asp:Label ID="lblDiscountAmt" runat="server"></asp:Label></span>    </td>
                        </tr>

                        <tr>
                           
                            <td class="text-right">
                                <strong><span class="price">&nbsp;<asp:Label ID="lblGrandTotal" runat="server"></asp:Label></span>
                                </strong></td>
                        </tr>

                    </table>

                </div>
                        </td>
                    </tr>

                    <tr>
                      
                        <td align="left">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn"
                                OnClick="btnSubmit_Click" ValidationGroup="O" /></td>
                    </tr>

                </table>

            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

