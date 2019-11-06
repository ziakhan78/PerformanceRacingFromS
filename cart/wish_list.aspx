<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/HomePage.master" AutoEventWireup="true" CodeFile="wish_list.aspx.cs" Inherits="cart_wish_list" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../cart/css/table_cart.css" type="text/css" />
    <link href="../css/programmer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="bs-example">
        <div class="container">
            <div class="row">

                <div class="main_heading_div">
                    <h2>My Wishlist</h2>
                </div>                

            </div>
        </div>
      
        <br /> <br />
    </div>
 

    <div class="container">
        <div class="row">

            <div class="col-lg-12 col-md-12 col-sm-12">

            

                    <div class="table-responsive" style="margin-bottom:20px;">
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" BorderWidth="0" OnRowDataBound="GridView1_RowDataBound">
                            <Columns>
                                <asp:TemplateField>

                                    <HeaderTemplate>

                                        <table id="shopping-cart-table" class="data-table cart-table">
                                            <thead>
                                                <tr class="first last">
                                                    <th class="td-image" style="width:25%; text-align:left;"><span class="nobr"><strong>Image(s)</strong></span></th>
                                                    <th class="td-name" style="width:45%; text-align:left;"><span class="nobr"><strong>Product Name</strong></span></th>
                                                    <th class="td-price" style="width:15%;"><span class="nobr"><strong>Unit Price</strong></span></th> 
                                                    <th class="td-delete" style="width:10%;"><span class="nobr"><strong>Action</strong></span></th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>

                                        <table id="shopping-cart-table" class="data-table cart-table">

                                            <tbody>

                                                <tr class="first odd">
                                                    <td class="td-image text-center" style="width:25%;">
                                                        <asp:Label ID="lblImgPath" runat="server" Text='<%# Eval("images") %>' Visible="false" CssClass="img-responsive"></asp:Label>
                                                      <a href="../product_details.aspx?cid=<%# Eval("cid") %>&pid=<%# Eval("pid") %>" >  <asp:Image ID="img1" runat="server" BorderWidth="0" CssClass="img-responsive" />
                                                        </a>
                                                    </td>

                                                    <td class="td-name text-left" style="width:45%;">
                                                       
                                                         <h2 class="product-name">                                                                
                                                                    <asp:Label ID="lblProName" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>                                                                    
                                                               
                                                            </h2>
                                                            <span>SKU#: <b><i><%# Eval("sku") %></i></b></span><br />
                                                            <span><b><i><%# Eval("subcat_name") %> - <%# Eval("brand_name") %></i></b></span>
                                                           <%-- <span><asp:Label ID="lblSize" runat="server" Text='<%# Eval("size") %>'></asp:Label></span>--%>
                                                             <%--<span><asp:Label ID="lblColor" runat="server" Text='<%# Eval("color") %>'></asp:Label></span>--%>
                                                    </td>

                                                    <td class="a-center td-price" style="width:15%;">
                                                        <i class="fa fa-inr"></i>&nbsp;<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price","{0:n0}") %>'></asp:Label>
                                                    </td>

                                                <%--    <td class="a-center td-qty text-center" style="width:15%;">
                                                        <asp:Label ID="lblQty" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                                    </td>--%>

                                                 

                                                  <%--   <td class="a-center td-delete" style="width:10%; text-align:center;">
                                                        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                        </cc1:ConfirmButtonExtender>
                                                       
                                                        <asp:LinkButton ID="btnAddtoCart" CssClass="btn btn-success" runat="server" CommandArgument='<%# Eval("pid") %>' CommandName="AddtoCart" ToolTip="Add to Bag">Add to Cart</asp:LinkButton>

                                                       
                                                    </td>--%>

                                                    <td class="a-center td-delete" style="width:10%; text-align:center;">
                                                        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                        </cc1:ConfirmButtonExtender>
                                                       
                                                         <asp:LinkButton ID="imgDeleteP" CssClass="addtowish" runat="server" CommandArgument='<%# Eval("wid") %>' CommandName="Delete" ForeColor="White">Delete</asp:LinkButton>

                                                       
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                There are currently no items in your wishlist.
                            </EmptyDataTemplate>
                        </asp:GridView></ContentTemplate>
            </asp:UpdatePanel>
                    
                    </div>
                

        </div>






        <div class="clearfix"></div>

    </div>




</asp:Content>





