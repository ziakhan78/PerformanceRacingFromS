<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintOrderDetails1.aspx.cs" Inherits="admin_PrintOrderDetails1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Report</title>
    
     <%--<script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=750');
            printWindow.document.write('<html><head><title>Order Details</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>--%>
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
            font-family: Trebuchet MS;
            font-size: 12px;
            color: #000000;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
       <div style="padding: 10px;">
                    <asp:Panel ID="pnlContents" runat="server">
            <table style="width: 720px" >

                <tr>
                    <td style="width: 100%;">
                        <table style="width: 100%;">
                            <tr>
                                <td valign="top" style="width: 350px;">
                                    <asp:Panel GroupingText=" Seller " ID="panel1" runat="server" Width="345px">
                                        <table style="width: 345px;">
                                            <tr>
                                                <td>Shop No. 7-8, 143/147, Adam Mahal, <br />Ratan Tata Colony, Tardeo, <br />Mumbai - 400 034. INDIA                                           
                                            <br />Tel: +91 (22) 65879696  /  23526038
                                            <br />Cell: +91 9820588118

                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td width="10px" style="width: 10px;"></td>
                                <td valign="top" style="width: 350px;">
                                    <asp:Panel GroupingText=" Order Information " ID="panel2" runat="server" Width="345px">
                                        <table style="width: 345px;">
                                            <tr>
                                                <td align="right" class="style4" valign="top">Order No.</td>
                                                <td><b>:</b></td>
                                                <td align="left" valign="top">
                                                    <asp:Label ID="lblOrderNo" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="style4" valign="top">Order Date</td>
                                                <td><b>:</b></td>
                                                <td align="left" valign="top">
                                                    <asp:Label ID="lblOrderDate" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="style4" valign="top">Order Status</td>
                                                <td><b>:</b></td>
                                                <td align="left" valign="top">
                                                    <asp:Label ID="lblOrderStatus" runat="server"></asp:Label>
                                                </td>
                                            </tr>

                                            <%--<tr>
                                        <td align="right" class="style4" valign="top">IP Address</td>
                                       <td><b>:</b></td>
                                        <td align="left" valign="top">
                                            <asp:Label ID="lblip" runat="server"></asp:Label>
                                        </td>
                                    </tr>--%>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>


                    </td>
                </tr>

                <tr>
                    <td width="720px" style="width: 720px;">
                        <b>Customer Information</b></td>
                </tr>
                <tr>
                    <td width="720px" style="width: 720px;">
                        <table width="100%" style="width: 100%;">
                            <tr>
                                <td valign="top" style="width: 345px;">
                                    <asp:Panel GroupingText=" Bill To " ID="panelBill" runat="server" Width="345px">
                                        <table style="width: 345px;">
                                            <tr>
                                                <td class="style7" align="right">Name</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblBFName" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style7" valign="top" align="right">Address</td>
                                                <td><b>:</b></td>
                                                <td valign="top">
                                                    <asp:Label ID="lblBAddress1" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style7" align="right">Zip Code</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblBZip" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style7" align="right">Country</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblBCountry" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style7" align="right">State</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblBState" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style7" align="right">City</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblBCity" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style7" align="right">Phone Number</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblBPhone" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <%--                                                             <tr>
                                                                                                <td class="style7" align="right">
                                                                                                    Fax Number</td>
                                    <td>
                                        <b>:</b></td>
                                    <td>
                                        <asp:Label ID="lblBFax" runat="server"></asp:Label>
                                    </td>
                                </tr>--%>
                                            <tr>
                                                <td class="style7" align="right">Mobile Number</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblBMobile" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style7">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td width="10px" style="width: 10px;"></td>

                                <td valign="top" style="width: 350px;">
                                    <asp:Panel GroupingText=" Ship To " ID="panelShipp" runat="server" Width="345px">
                                        <table style="width: 345px;">
                                            <tr>
                                                <td align="right" class="style12">Name</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblSFName" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" class="style12">Address</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td valign="top">
                                                    <asp:Label ID="lblSAddress1" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="style12">Zip Code</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblSZip" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="style12">Country</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblSCountry" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="style12">State</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblSState" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="style12">City</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblSCity" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="style12">Phone Number</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblSPhone" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <%--  <tr>
                                    <td align="right" class="style12">
                                        Fax Number</td>
                                    <td>
                                        <b>:</b></td>
                                    <td>
                                        <asp:Label ID="lblSFax" runat="server"></asp:Label>
                                    </td>
                                </tr>--%>
                                            <tr>
                                                <td align="right" class="style12">Mobile Number</td>
                                                <td>
                                                    <b>:</b></td>
                                                <td>
                                                    <asp:Label ID="lblSMobile" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>

                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 15px;" class="txt"></td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"
                            Width="100%">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table class="txt" width="100%" style="width: 100%">
                                            <tr>
                                                <td style="width: 5%" align="left" valign="middle">Sr.</td>
                                                <td align="left" valign="top" style="width: 27%">Product Particulars
                                                </td>

                                              
                                                 <td align="right" valign="top" style="width: 10%">HSN
                                                </td>

                                                <td align="right" valign="top" style="width: 7%">Qty
                                                </td>

                                                <td align="right" valign="top" style="width: 10%">Unit Price
                                                </td>

                                            

                                                <td align="right" valign="top" style="width: 15%">CGST
                                                </td>

                                                  <td align="right" valign="top" style="width: 15%">SGST
                                                </td>

                                                <td align="right" valign="top" style="width: 10%">Amount
                                                </td>

                                            </tr>
                                            <tr>
                                                <td height="10" colspan="8" style="width: 100%"></td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table class="txt" style="width: 100%">
                                            <tr>
                                                <td style="width: 5%" align="left" valign="middle">
                                                    <div align="left"><%# Eval("RowNumber")%></div>
                                                </td>
                                                <td align="left" valign="top" style="width: 27%">
                                                    <%# Eval("product_name") %>
                                                </td>

                                                

                                                <td align="right" valign="top" style="width: 10%">
                                                    <asp:Label ID="txtQ" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                                </td>

                                                <td align="right" valign="top" style="width: 7%">$&nbsp;<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price", "{0:N}")%>'></asp:Label>
                                                </td>
                                                 <td align="right" valign="top" style="width: 10%">$&nbsp;<%# Eval("SubTotal", "{0:N}")%></td>
                                              <%--  <td align="right" valign="top" style="width: 8%">$&nbsp;<%# Eval("Discount", "{0:N}")%></td>--%>

                                                 <td align="right" valign="top" style="width: 15%">$&nbsp;<%# Eval("VAT","{0:n0}") %></td>
                                                <td align="right" valign="top" style="width: 15%">$&nbsp;<%# Eval("VAT","{0:n0}") %></td>

                                                <td align="right" valign="top" style="width: 10%">$&nbsp;<%# Eval("SubTotal", "{0:N}")%></td>

                                            </tr>
                                            <tr>
                                                <td height="10" colspan="8" style="width: 100%"></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="right" style="padding-right: 10px;">
                        <table class="txt" width="750">
                            <tr>
                                <td class="style10" align="right">Sub Total</td>
                                <td align="center" class="style11">:</td>
                                <td align="right" valign="top">$<asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                                </td>
                            </tr>

                            <tr id="TRDisAmt" runat="server">
                                <td class="style10" align="right">Coupon Discount</td>
                                <td align="center" class="style11">:</td>
                                <td align="right" valign="top">$<asp:Label ID="lblDiscountAmt" runat="server"></asp:Label>
                                </td>
                            </tr>

                            <tr id="TRGrossAmt" runat="server">
                                <td class="style10" align="right">Gross Amount</td>
                                <td align="center" class="style11">:</td>
                                <td align="right" valign="top">$<asp:Label ID="lblGrossAmount" runat="server"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td class="style10" align="right">Tax</td>
                                <td align="center" class="style11">:</td>
                                <td align="right" valign="top">$<asp:Label ID="lblTax" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style10" align="right">Shipping</td>
                                <td align="center" class="style11">:</td>
                                <td align="right" valign="top">$<asp:Label ID="lblShippingTotal" runat="server"></asp:Label>
                                </td>
                            </tr>




                            <tr>
                                <td class="style10" align="right"><strong>Net Amount</strong></td>
                                <td align="center" class="style11">:</td>
                                <td align="right" valign="top"><strong>$<asp:Label ID="lblTotalAmount" runat="server"></asp:Label></strong>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td>
                         <div style="text-align: center; padding-top: 7px;" class="col-sm-9 col-md-9 col-lg-9">
            <%--<asp:Button ID="btnPrint" CssClass="btn btn-primary" runat="server" Text="Print Document" OnClientClick="return PrintPanel();" />--%>

                           <input id="printpagebutton" type="button" value="Print Order" onclick="printpage()"/>
        </div>
                    </td>
                </tr>
              
            </table>
                        </asp:Panel>
        </div>
    </form>
</body>
</html>
