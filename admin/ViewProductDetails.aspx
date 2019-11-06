<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewProductDetails.aspx.cs" Inherits="admin_ViewProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
    <title>:: Product Details ::</title>
    <style>
        .style1 {
            width: 550px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <%--  <div style="overflow: auto; height: 600px; width: 720px;">--%>



            <table style="width: 720px;" border="0" class="txt" align="center" cellpadding="0" cellspacing="5">

                <tr>
                    <td colspan="2" class="header_title">View Product Details</td>
                </tr>

                <tr>
                    <td colspan="2" class="header_subtitle">Product Details</td>
                </tr>

                <tr>
                    <td align="right">Category: </td>
                    <td class="style1">
                        <asp:Label ID="lblCategory" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td align="right">Sub Category: </td>
                    <td class="style1">
                        <asp:Label ID="lblSubCategory" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr id="trFitment" runat="server">
                    <td align="right">Fitment: </td>
                    <td class="style1">

                        <asp:Label ID="lblFitment" runat="server"></asp:Label>

                    </td>
                </tr>

                <tr id="trManufacturer" runat="server">
                    <td align="right">Bike Manufacturer: </td>
                    <td class="style1">

                        <asp:Label ID="lblManufacturer" runat="server"></asp:Label>

                    </td>
                </tr>

                <tr id="trModel" runat="server">
                    <td align="right">Model: </td>
                    <td class="style1">

                        <asp:Label ID="lblModel" runat="server"></asp:Label>

                    </td>
                </tr>

                <tr>
                    <td align="right">Brand: </td>
                    <td class="style1">

                        <asp:Label ID="lblBrand" runat="server"></asp:Label>

                    </td>
                </tr>

                <tr>
                    <td align="right">Product Name: </td>
                    <td class="style1">
                        <asp:Label ID="lblProductName" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td align="right">SKU: </td>
                    <td class="style1">

                        <asp:Label ID="lblSku" runat="server"></asp:Label>

                    </td>
                </tr>

                <tr id="trSize" runat="server">
                    <td align="right">Size: </td>
                    <td class="style1">

                        <asp:Label ID="lblSize" runat="server"></asp:Label>

                    </td>
                </tr>

                <tr>
                    <td align="right">Price(&#8377;): </td>
                    <td class="style1">
                        <asp:Label ID="lblPurchasePrice" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td align="right">GST(%): </td>
                    <td class="style1">
                        <asp:Label ID="lblVat" runat="server"></asp:Label>
                    </td>
                </tr>

                <%--<tr>
                    <td colspan="2">
                        <asp:Panel ID="Panel1" runat="server">
                            <table>

                                <tr>
                                    <td align="right">Margin for Dealer(%): </td>
                                    <td class="style1">
                                        <asp:Label ID="lblMarginForDealer" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Margin(&#8377;): </td>
                                    <td class="style1">
                                        <asp:Label ID="lblMargin" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                        </asp:Panel>

                    </td>
                </tr>--%>


                <tr>
                    <td align="right">Margin for Dealer(%): </td>
                    <td class="style1">
                        <asp:Label ID="lblMarginForDealer" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">Dealer Margin(&#8377;): </td>
                    <td class="style1">
                        <asp:Label ID="lblMargin" runat="server"></asp:Label>
                    </td>
                </tr>




                <tr>
                    <td align="right">Colour: </td>
                    <td class="style1">
                        <asp:Label ID="lblColour" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td align="right">Quantity: </td>
                    <td class="style1">
                        <asp:Label ID="lblQuantity" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td align="right">Weight: </td>
                    <td class="style1">
                        <asp:Label ID="lblWeight" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td align="right">Exclusive: </td>
                    <td class="style1">
                        <asp:Label ID="lblExclusive" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td align="right">Stock: </td>
                    <td class="style1">
                        <asp:Label ID="lblStock" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td style="vertical-align: top; text-align: right;">Short Description: </td>
                    <td class="style1" style="vertical-align: top;">
                        <asp:Label ID="lblShortDesc" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td style="vertical-align: top; text-align: right;">Long Description: </td>
                    <td class="style1" style="vertical-align: top;">
                        <asp:Label ID="lblLongDesc" runat="server"></asp:Label>
                    </td>
                </tr>




                <tr>
                    <td colspan="2" align="center"><a href="javascript:self.close()" class="btn">Close</a></td>
                </tr>

            </table>



        </div>
        <%--   </div>--%>
    </form>
</body>
</html>
