<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResponseHandling.aspx.cs" Inherits="ResponseHandling" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Performance Racing</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Panel ID="Panel1" runat="server" Visible="false">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="true" Width="700px" CssClass="gridcss" >
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr." >
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex +1 %>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>

                                      <asp:BoundField DataField="product_name" HeaderText="Item Description" SortExpression="product_name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                                      <asp:BoundField DataField="hs_code" HeaderText="HSN" SortExpression="hs_code" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="60px" />
                                      <asp:BoundField DataField="Quantity" HeaderText="Qty" SortExpression="Quantity" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"  ItemStyle-Width="30px" />
                                    <%--  <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />--%>


                                      <asp:TemplateField HeaderText="Unit Price" >
                                        <ItemTemplate>
                                            <%# Eval("price","{0:n0}") %>
                                        </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Right" />
                                        <ItemStyle HorizontalAlign="Right" Width="70px" />
                                    </asp:TemplateField>

                                        <asp:TemplateField HeaderText="CGST" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                                        <ItemTemplate>
                                            <%# Eval("GSTAmt","{0:n}") %><br />
                                          <span style="font-style:italic"><%# Eval("CGST","{0:n}") %>%</span>
                                        </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="75px" />
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="SGST" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                                        <ItemTemplate>
                                            <%# Eval("GSTAmt","{0:n}") %><br />
                                            <span style="font-style:italic"><%# Eval("SGST","{0:n}") %>%</span>
                                        </ItemTemplate>
                                          <ItemStyle HorizontalAlign="Right" Width="75px" />
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="IGST" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                                        <ItemTemplate>
                                            <%# Eval("IGSTAmt","{0:n}") %><br />
                                            <span style="font-style:italic"><%# Eval("IGST","{0:n}") %>%</span>
                                        </ItemTemplate>
                                          <ItemStyle HorizontalAlign="Right" Width="75px" />
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                                        <ItemTemplate>
                                            <%# Eval("SubTotal1","{0:n}") %>
                                        </ItemTemplate>
                                         <ItemStyle HorizontalAlign="Right" Width="100px" />
                                    </asp:TemplateField>                                      



                                </Columns>
                                <HeaderStyle Font-Bold="true" Font-Size="15px" Height="35px" />
                                <FooterStyle Font-Bold="true" />
                                
                            </asp:GridView>
                <asp:SqlDataSource ID="DSViewCart" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>" SelectCommand="sc_GetProductsByCartid2" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="CartID" SessionField="CartID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>


            </asp:Panel>
        </div>

        <asp:Panel ID="Panel2" runat="server" Visible="false">
          <div style="margin: 100px; padding: 50px;">
        <p>           
            Your order has been successfully placed.
            <br />
            We shall process your order and update you with the shippment details.<br />

            <a href="https://performanceracing.in/" >Go to Website</a>
        </p>
    </div>
              </asp:Panel>

       <%-- <div>
             <strong>
            Status: <asp:Label ID="lblStatus" runat="server" ></asp:Label><br />
            Transactin Id: <asp:Label ID="lblTxn" runat="server" ></asp:Label><br />
            Amount: <asp:Label ID="lblAmt" runat="server" ></asp:Label><br />
            Key: <asp:Label ID="lblKey" runat="server" ></asp:Label><br />
             Product Info: <asp:Label ID="lblProduct" runat="server" ></asp:Label><br />
            Customer Name: <asp:Label ID="lblName" runat="server" ></asp:Label><br />
            Customer Email: <asp:Label ID="lblEmail" runat="server" ></asp:Label></strong><br />
           
        </div>--%>
    </form>
</body>
</html>
