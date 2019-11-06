<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintOrderDetails.aspx.cs" Inherits="admin_PrintOrderDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tax Invoice</title>

    <script type="text/javascript">
        function printpage() {
            //Get the print button and put it into a variable
            var printButton = document.getElementById("printpagebutton");

            //Set the print button visibility to 'hidden' 
            printButton.style.visibility = 'hidden';
            //Print the page content
            window.print()
            //Set the print button to 'visible' again 
            //[Delete this line if you want it to stay hidden after printing]
            //printButton.style.visibility = 'visible';
        }
    </script>
    <style>
        body {
            margin: 0px;
            font-family: Trebuchet MS;
            font-size: 12px;
            color: #000000;           
        }   

            table.gridcss td, th { padding:5px; }
           
       
        
    </style>
    <style type="text/css" media="print">
    @page 
    {
        size: auto;   /* auto is the initial value */
        margin: 0mm;  /* this affects the margin in the printer settings */
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding: 0px; width: 720px; margin-left:20px; ">
            <%-- <div style="text-align:center; width: 720px"><strong>Jewel Frost</strong></div>--%>
            <asp:Panel ID="pnlContents" runat="server">


                <div style="text-align: center; padding-top:20px;">
                    <a href="https://performanceracing.in/">
                        <img src="https://performanceracing.in/mail/invoice_logo.jpg" alt="Performance Racing" border="0" />
                    </a>
                </div>
                <table style="width: 720px">


                    <tr>

                        <td style="text-align: center; font-size: 13px;">
                           
                                Shop No. 7-8, 143/147, Adam Mahal, Tardeo, Mumbai - 400 034. INDIA<br />
                                Tel: +91 22 65879696  /  +91 22 23526038 &nbsp;&nbsp; Cell: +91 9820588118<br />
                            Email: <a href="mailto:sales@performanceracing.in">sales@performanceracing.in</a>&nbsp;&nbsp;Website: <a href="https://performanceracing.in/">https://performanceracing.in</a>

                         

                            <p><strong style="font-size: 15px;">GSTIN No. 27AAIFP9085G1ZQ</strong></p>
                            <p><strong style="font-size: 16px;"><u>Tax Invoice</u></strong></p>
                        </td>
                    </tr>




                    <tr>
                        <td style="width: 720px;">
                            <table style="width: 720px;">
                                <tr>
                                    <td style="width: 35%; vertical-align: top;">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <strong style="font-size: 15px;"><u>Bill To</u></strong>
                                                </td>
                                            </tr>
                                             <tr id="trCompName" runat="server">
                                                <td>
                                                    <asp:Label ID="lblCompName" runat="server" Font-Bold="true"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblBFName" runat="server" Font-Bold="true"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblBAddress1" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblBCity" runat="server" Font-Bold="true"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblBState" runat="server"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblBPhone" runat="server"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblBMobile" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                              <tr>

                                                <td>
                                                   <strong><asp:Label ID="lblStateCode" runat="server"></asp:Label></strong>
                                                </td>
                                            </tr>

                                             <tr id="trGstin" runat="server">

                                                <td>
                                                    <asp:Label ID="lblGstin" runat="server"></asp:Label>
                                                </td>
                                            </tr>

                                        </table>
                                    </td>


                                    <td style="width: 35%; vertical-align: top;">
                                        <table style="width: 100%;" >

                                            <tr>
                                                <td>
                                                    <strong style="font-size: 15px;"><u>Ship To</u></strong>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <asp:Label ID="lblSFName" runat="server" Font-Bold="true"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblSAddress1" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <asp:Label ID="lblSCity" runat="server" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <asp:Label ID="lblSState" runat="server"></asp:Label>
                                                </td>
                                            </tr>


                                            <tr>

                                                <td>
                                                    <asp:Label ID="lblSPhone" runat="server"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td>
                                                    <asp:Label ID="lblSMobile" runat="server"></asp:Label>
                                                </td>
                                            </tr>

                                           

                                        </table>
                                    </td>

                                    <td style="width: 30%; vertical-align: top;">
                                        <table style="width: 100%;">

                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblOrderNo" runat="server" Font-Bold="true"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblOrderDate" runat="server" Font-Bold="true"></asp:Label>
                                                </td>
                                            </tr>                                           

   <tr>
                                                <td valign="top">
                                                    Sold By: <asp:Label ID="lblUser" runat="server" Font-Bold="true"></asp:Label>
                                                </td>
                                            </tr>             

                                              <tr>
                                                <td valign="top">
                                                    Mode: <asp:Label ID="lblMode" runat="server" Font-Bold="true"></asp:Label>
                                                </td>
                                            </tr>             

                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td  style="padding-top:15px; padding-bottom:10px;">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowFooter="true" Width="100%" CssClass="gridcss" >
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr." >
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex +1 %>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>

                                     <%-- <asp:BoundField DataField="product_name" HeaderText="Product Particulars" SortExpression="product_name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />--%>
                                     <asp:TemplateField HeaderText="Item Description" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" >
                                        <ItemTemplate>
                                            <%# Eval("product_name") %><br />
                                           SKU#: <%# Eval("sku") %><br />
                                           <%# Eval("subcat_name") %> - <%# Eval("brand_name") %><br />
                                           <%# Eval("size") %> <%# Eval("color") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                         
                        </td>
                    </tr>
                  

                    <tr>
                        <td>
                            <table class="txt" width="720px" >
                                <tr>
                                    <td class="style10" align="right">Total Before Tax:
                                        <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <%--  <tr id="divCoupon" runat="server">
                                    <td class="style10" align="right">
                                        <asp:Label ID="lblDiscountAmtText" runat="server"></asp:Label>
                                        <asp:Label ID="lblDiscountAmt" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr id="TRGrossAmt" runat="server">
                                    <td class="style10" align="right">Gross Amount: <asp:Label ID="lblGrossAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>--%>

                                <tr>
                                    <td class="style10" align="right">Total Tax Amount:
                                        <asp:Label ID="lblTaxTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="style10" align="right">Shipping:
                                        <asp:Label ID="lblShippingTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                  <tr>
                                    <td class="style10" align="right">Rounded Off: <asp:Label ID="lblRounded" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="style10" align="right"><strong>Total Amount: &#x20B9;<asp:Label ID="lblTotalAmount" runat="server"></asp:Label></strong>
                                    </td>
                                </tr>

                                  <tr>
                                    <td class="style10" ><strong>Total: &#x20B9; <asp:Label ID="lblAmtinWord" runat="server"></asp:Label></strong>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p>
                                For <strong>PERFORMANCE RACING</strong><br /><br />
                                (This is computer generated invoice hence signature not required.)<br /><br />
                                
                                <strong style="font-size: 16px;">Authorized Signatory</strong>
                                

                            </p>                            
                        </td>
                    </tr>

                     <tr>
                        <td style="padding-top:30px;">  
                            <p><strong style="font-size: 13px;">Note: Goods sold will not be taken back</strong></p>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div style="text-align: center; padding-top: 7px;">
                                <%--<asp:Button ID="btnPrint" CssClass="btn btn-primary" runat="server" Text="Print Document" OnClientClick="return PrintPanel();" />--%>

                                <input id="printpagebutton" type="button" value="Print Order" onclick="printpage()" />
                            </div>
                        </td>
                    </tr>

                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
