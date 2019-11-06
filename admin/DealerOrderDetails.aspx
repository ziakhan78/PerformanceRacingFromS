<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminM.master" AutoEventWireup="true" CodeFile="DealerOrderDetails.aspx.cs" Inherits="admin_DealerOrderDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <style type="text/css">
        .style6 {
            width: 25px;
            font-weight: bold;
        }

        .style7 {
            width: 95px;
        }

        .style8 {
            width: 540px;
            font-weight: bold;
        }

        .style10 {
            width: 700px;
        }

        .style11 {
            width: 5px;
            font-weight: bold;
        }

        .style12 {
            width: 102px;
        }
        .auto-style1 {
            width: 700px;
            height: 17px;
        }
        .auto-style2 {
            width: 5px;
            font-weight: bold;
            height: 17px;
        }
        .auto-style3 {
            height: 17px;
        }
    </style>
    <table class="txt1" style="width: 100%" align="left">
        <tr>
            <td width="100%">
                <table width="100%">
                    <tr>

                        <td width="100%" style="float: right; width: 100%">
                            <asp:Button ID="btnBack" runat="server" CssClass="btn" OnClick="btnBack_Click1" Text="Back to Order List" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="920px" style="width: 920px;">
                <table width="100%" style="width: 100%;">
                    <tr>
                        <td valign="top" width="430px" style="width: 430px;">
                            <asp:Panel GroupingText=" Seller " ID="panel1" runat="server" Width="425px">
                                <table width="425px" style="width: 425px;">
                                    <tr>
                                        <td>
                                            Shop No. 7-8, 143/147, Adam Mahal, <br />Ratan Tata Colony, Tardeo, <br />Mumbai - 400 034. INDIA
                                           
                                           <br />Tel: +91 (22) 65879696  /  23526038
                                            <br />Cell: +91 9820588118

                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                        <td width="20px" style="width: 20px;"></td>
                        <td valign="top" width="430px" style="width: 430px;">
                            <asp:Panel GroupingText=" Order Information " ID="panel2" runat="server" Width="425px">
                                <table width="425px" style="width: 425px;">
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

                                    <tr>
                                        <td align="right" class="style4" valign="top">IP Address</td>
                                       <td><b>:</b></td>
                                        <td align="left" valign="top">
                                            <asp:Label ID="lblip" runat="server"></asp:Label>
                                        </td>
                                    </tr>

                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>


            </td>
        </tr>

        <tr>
            <td width="920px" style="width: 920px;">
                <b>Dealers Information</b></td>
        </tr>
        <tr>
            <td width="920px" style="width: 920px;">
                <table width="100%" style="width: 100%;">
                    <tr>
                        <td width="430px" valign="top" style="width: 430px;">
                            <asp:Panel GroupingText=" Bill To " ID="panelBill" runat="server" Width="425px">
                                <table width="425px" style="width: 425px;">

                                      <tr>
                                        <td class="style7" align="right">Company Name</td>
                                        <td>
                                            <b>:</b></td>
                                        <td>
                                            <asp:Label ID="lblCompany" runat="server"></asp:Label>
                                        </td>
                                    </tr>

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
                                        <td valign="top"><b>:</b></td>
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
                        <td width="20px" style="width: 20px;"></td>

                        <td width="430px" valign="top" style="width: 430px;">
                            <asp:Panel GroupingText=" Ship To " ID="panelShipp" runat="server" Width="425px">
                                <table width="425px" style="width: 425px;">
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
                                        <td valign="top">
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
                                        <td width="40" align="left" valign="middle">Sr.</td>
                                        <td align="left" valign="top" width="100px" style="width: 100px;">Product Code
                                        </td>
                                        <td align="left" valign="top" width="240px" style="width: 240px;">Product Particulars
                                        </td>
                                        <td align="right" valign="top" width="150px" style="width: 150px;">Price
                                        </td>
                                        <td align="right" valign="top" width="150px" style="width: 150px;">Quantity
                                        </td>
                                        <td align="right" valign="top" width="150px" style="width: 150px;">Total
                                        </td>

                                    </tr>
                                   
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table class="txt" width="810" style="width: 100%">
                                    <tr>
                                        <td width="40" align="left" valign="middle">
                                            <div align="left"><%# Eval("RowNumber")%></div>
                                        </td>
                                         <td align="left" valign="top" width="100px" style="width: 100px;">
                                            <%# Eval("sku") %>
                                        </td>

                                        <td align="left" valign="top" width="240px" style="width: 240px;">
                                            <%# Eval("product_name") %>
                                        </td>
                                        <td align="right" valign="top" width="150px" style="width: 150px;">&#8377;&nbsp;<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price", "{0:N0}")%>'></asp:Label>
                                        </td>
                                        <td align="right" valign="top" width="150px" style="width: 150px;">
                                            <asp:Label ID="txtQ" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                        </td>
                                        <td align="right" valign="top" width="150px" style="width: 150px;">&#8377;&nbsp;<%# Eval("SubTotal1", "{0:N0}")%></td>

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
                <table class="txt" width="810">
                    <tr>
                        <td class="style10" align="right">Sub Total</td>
                        <td align="center" class="style11">:</td>
                        <td align="right" valign="top"><asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" align="right">Tax</td>
                        <td align="center" class="auto-style2">:</td>
                        <td align="right" valign="top" class="auto-style3"><asp:Label ID="lblTax" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style10" align="right">Shipping</td>
                        <td align="center" class="style11">:</td>
                        <td align="right" valign="top"><asp:Label ID="lblShippingTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td class="style8" align="right"><strong>Gross Amount</strong></td>
                        <td align="center" class="style11">:</td>
                        <td align="right" valign="top"><strong><asp:Label ID="lblGrossAmount" runat="server"></asp:Label></strong>
                        </td>
                    </tr>

                     <tr id="TRDisAmt" runat="server">
                        <td class="style8" align="right"><strong>Discount Amount</strong></td>
                        <td align="center" class="style11">:</td>
                        <td align="right" valign="top"><strong><asp:Label ID="lblDiscountAmt" runat="server"></asp:Label></strong>
                        </td>
                    </tr>

                    <tr>
                        <td class="style8" align="right"><strong>Net Amount</strong></td>
                        <td align="center" class="style11">:</td>
                        <td align="right" valign="top"><strong><asp:Label ID="lblTotalAmount" runat="server"></asp:Label></strong>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
        </tr>
        <%--    <tr>
            <td style="width:810px;text-align:left;" > <asp:Panel GroupingText="Special Instructions" ID="panel3" runat="server" Width="810px" >
            <asp:Label ID="lblSpeInstruction" runat="server"></asp:Label>
                            
         </asp:Panel></td>
        </tr>--%>
    </table>
</asp:Content>

