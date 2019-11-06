<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="add_store_order.aspx.cs" Inherits="Admin_add_store_order" %>

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
                            Select Customer: <asp:DropDownList ID="ddlCustomers" runat="server" CssClass="txtBox" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="id" AppendDataBoundItems="true" >
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>                             
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="SELECT [id], [Name] FROM [View_Customers] ORDER BY [Name]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RFVVat" runat="server" ControlToValidate="ddlCustomers" InitialValue="0" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Select Customer" ValidationGroup="O"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                     <tr><td>&nbsp;</td></tr>

                    <tr>                        

                        <td valign="top">
                            Enter Barcode: <asp:TextBox ID="txtSku" runat="server" AutoPostBack="True" CssClass="txtBox"  OnTextChanged="txtSku_TextChanged" TabIndex="0" Width="200px"></asp:TextBox>                            
                        </td>
                    </tr>

                     <tr><td>&nbsp;</td></tr>

                    <tr> 
                        <td>
                             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="table-responsive">
                            <div>
                                <asp:Label ID="lblOrderNo" runat="server"></asp:Label>
                            </div>
                              <asp:GridView ID="GridView1" Width="100%" CssClass="table-bordered table-responsive" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" BorderWidth="0" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:TemplateField>

                                        <HeaderTemplate>

                                            <table id="shopping-cart-table" class=" table table-bordered table-responsive">
                                                <thead>

                                                    <tr class="first last">
                                                        <th class="td-image" style="width: 20%"><span class="nobr"><strong>Image(s)</strong></span></th>
                                                        <th class="td-name" style="width: 22%"><span class="nobr"><strong>Item Description</strong></span></th>
                                                        <th class="td-price" style="width: 8%"><span class="nobr"><strong>Unit Price</strong></span></th>
                                                       <th class="td-price" style="width:8%"><span class="nobr"><strong>CGST</strong></span></th>
                                                         <th class="td-price" style="width:8%"><span class="nobr"><strong>SGST</strong></span></th>
                                                         <th class="td-price" style="width:8%"><span class="nobr"><strong>IGST</strong></span></th>
                                                        <th class="td-qty" style="width: 8%"><span class="nobr"><strong>Qty</strong></span></th>
                                                        <th class="td-price" style="width: 8%"><span class="nobr"><strong>Subtotal</strong></span></th>
                                                        <th class="td-delete" style="width: 10%"><span class="nobr"><strong>Action</strong></span></th>
                                                    </tr>
                                                </thead>

                                            </table>
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <table id="shopping-cart-table" class="table table-bordered table-responsive">


                                                <tbody>

                                                    <tr class="first odd">

                                                        <td class="td-image text-left" style="width: 20%">
                                                            <%-- <img src="../ProductsImages/<%# Eval("images") %>" data-srcx2="" alt="">           --%>
                                                            <asp:Image ID="img1" runat="server" BorderWidth="0" CssClass="img-responsive" />
                                                            <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false"></asp:Label>
                                                        </td>

                                                        <td class="td-name text-left" style="width: 22%">
                                                            <h5 class="product-name">
                                                               
                                                                    <asp:Label ID="lblProName" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                                                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("RecordID") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>' Visible="false"></asp:Label>
                                                               
                                                            </h5>
                                                            <span>Product Code : <%# Eval("sku") %></span>
                                                        </td>

                                                        <td class="td-price text-right" style="width: 8%">
                                                            <i class="fa fa-inr">&nbsp;<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:n0}") %>'></asp:Label>
                                                        </td>

                                                        <td class="td-price text-right" style="width:8%">
                                                       <%# Eval("GSTAmt","{0:n}") %><br />
                                                            <span style="font-style:italic;"> <%# Eval("CGST","{0:n}") %>%</span>
                                                            </td>

                                                         <td class="td-price text-right" style="width:8%">
                                                    <%# Eval("GSTAmt","{0:n}") %><br />
                                                            <span style="font-style:italic;"> <%# Eval("SGST","{0:n}") %>%</span>
                                                            </td>

                                                         <td class="td-price text-right" style="width:8%">
                                                       <%# Eval("IGSTAmt","{0:n}") %><br />
                                                            <span style="font-style:italic;"> <%# Eval("IGST","{0:n}") %>%</span>
                                                            </td>

                                                        <td class="td-qty text-center" style="width: 8%">
                                                            <asp:DropDownList ID="ddlQty" runat="server" AutoPostBack="true" CssClass="textfield" OnSelectedIndexChanged="ddlQty_SelectedIndexChanged">
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
                                                            <%-- <asp:TextBox ID="txtQ" runat="server" CssClass="txtBox" Text='<%# Bind("quantity") %>' Width="25px" MaxLength="3" Style="text-align: right; padding-right: 5px;"></asp:TextBox>
                                                        <asp:LinkButton ID="btnUpdateIndividualItem" CssClass="btn btn-danger" runat="server" CommandArgument='<%# Eval("RecordID") %>' CommandName="Update">Update</asp:LinkButton>
                                                            --%>      </td>

                                                        <td class="td-price text-right" style="width: 8%">
                                                            <i class="fa fa-inr">&nbsp;<%# Eval("SubTotal1","{0:n0}") %></td>

                                                        <td class="td-delete text-center" style="width: 10%">
                                                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                            </cc1:ConfirmButtonExtender>
                                                            <asp:LinkButton ID="imgDeleteP" CssClass="btn btn-danger" runat="server" CommandArgument='<%# Eval("RecordID") %>' CommandName="Delete">Delete</asp:LinkButton>
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
                        </td>
                    </tr>

                    <tr>
                    <td style="text-align:right;">
                            <div class="col-md-4" style="float:right;">

                    <table id="shopping-cart-totals-table" width="100%" style="padding-right:5px;">

                        <tr>                         
                            <td style="text-align: right">
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
                           
                            <td style="text-align: right">
                                <span class="price"><asp:Label ID="lblDiscountAmtText" runat="server"></asp:Label>&nbsp;<asp:Label ID="lblDiscountAmt" runat="server"></asp:Label></span>    </td>
                        </tr>

                        <tr>
                           
                            <td style="text-align: right">
                                <strong><span class="price"><asp:Label ID="lblGrandTotal" runat="server"></asp:Label></span>
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

