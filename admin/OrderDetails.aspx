<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="admin_OrderDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
            width:1000px;
        }
        .auto-style2 {
            text-align: right;
            width:100px;
        }
        .auto-style4 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table  style="width: 1100px; background-color: #fff; margin:0px; padding:0px;" >
                
                <tr>
                    <td style="padding:10px 0px 10px 0px;" colspan="3" align="center" class="header_subtitle"><center>Invoice Details</center></td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td colspan="3" align="left" class="header_subtitle">Order Details </td>
                </tr>

                <tr>
                    <td valign="top" class="auto-style2">Order No.</td>
                    <td valign="top" >:</td>
                    <td valign="top" class="auto-style1">
                        <asp:Label ID="lblOrderNo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td  valign="top" class="auto-style2">Order Date</td>
                    <td valign="top" >:</td>
                    <td valign="top" class="auto-style1">
                        <asp:Label ID="lblOrderDate" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td  valign="top" class="auto-style2">Order Status</td>
                    <td  valign="top" >:</td>
                    <td valign="top" class="auto-style1">
                        <asp:Label ID="lblOrderStatus" runat="server"></asp:Label>
                    </td>
                </tr>


                <tr>
                  <td colspan="3" align="left" class="header_subtitle">Customer Details </td>
                </tr>




                <tr>
                    <td class="auto-style2">Name</td>
                    <td>
                        <b>:</b></td>
                    <td class="auto-style1">
                        <asp:Label ID="lblName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" valign="top">Address</td>
                    <td>
                        <b>:</b></td>
                    <td valign="top" class="auto-style1">
                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    </td>
                </tr>



                <tr>
                    <td class="auto-style2">Email-Id</td>
                    <td>
                        <b>:</b></td>
                    <td class="auto-style1">
                        <asp:Label ID="lblEmailid" runat="server"></asp:Label>
                    </td>
                </tr>


                <tr>
                    <td class="auto-style2">Pin</td>
                    <td>
                        <b>:</b></td>
                    <td class="auto-style1">
                        <asp:Label ID="lblPin" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Country</td>
                    <td>
                        <b>:</b></td>
                    <td class="auto-style1">
                        <asp:Label ID="lblCountry" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">State</td>
                    <td>
                        <b>:</b></td>
                    <td class="auto-style1">
                        <asp:Label ID="lblState" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">City</td>
                    <td>
                        <b>:</b></td>
                    <td class="auto-style1">
                        <asp:Label ID="lblCity" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Phone Number</td>
                    <td>
                        <b>:</b></td>
                    <td class="auto-style1">
                        <asp:Label ID="lblPhone" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Mobile Number</td>
                    <td>
                        <b>:</b></td>
                    <td class="auto-style1">
                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>

                <tr>
                    <td colspan="3" align="left" class="header_subtitle">Products Details</td>
                </tr>
                <tr>
                    <td align="left" colspan="3">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound" CellPadding="0" CellSpacing="0">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <td style="width: 50px; text-align: left;">Image</td>
                                                <td style="width: 280px; text-align: left;">Track Name</td>
                                                <td style="width: 170px; text-align: left;">Artists</td>
                                                <td style="width: 100px; text-align: left;">Remixers</td>
                                                <td style="width: 180px; text-align: left;">Label</td>
                                                <td style="width: 100px; text-align: left;">Genre</td>
                                                <td style="width: 100px; text-align: left;">Release Date</td>
                                                <td style="width: 50px; text-align: left;">Format</td>
                                                <td style="width: 50px; text-align: left;">Price</td>
                                            </tr>
                                        </table>

                                    </HeaderTemplate>

                                    <ItemTemplate>

                                        <table style="text-align:left">
                                            <tr>
                                                <td style="width: 50px;">
                                                    <img src='../Albums_Cover/<%# Eval("cd_cover") %>' alt="" style="margin-top: 2px;" height="20px" width="20px" /></td>
                                                <td style="width: 280px; text-align: left;">
                                                    <asp:Label ID="lblTrackName" runat="server" Text='<%# Eval("track_name") %>'></asp:Label></td>
                                                <td style="width: 170px; text-align: left;"><%# Eval("name") %></td>
                                                <td style="width: 100px; text-align: left;"><%# Eval("remixers") %></td>
                                                <td style="width: 180px; text-align: left;"><%# Eval("record_label") %></td>
                                                <td style="width: 100px; text-align: left;"><%# Eval("genre") %></td>
                                                <td style="width: 100px; text-align: left;"><%# Eval("release_date","{0:dd-MM-yyyy}") %></td>
                                                <td style="width: 50px; text-align: left;">
                                                    <asp:Label ID="Label2" runat="server" Visible="false" Text='<%# Eval("TrackFormat") %>'></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Visible="false" Text='<%# Eval("RecordID") %>'></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" Visible="false" Text='<%# Eval("mp3_320_cost") %>'></asp:Label>
                                                    <asp:Label ID="Label5" runat="server" Visible="false" Text='<%# Eval("wav_cost") %>'></asp:Label>
                                                    <td style="width: 50px; text-align: center;"><span class="cart_list1">
                                                        <img src="../images/rupee_symbol.png" alt="" /><%# Eval("price","{0:N}") %></span></td>
                                            </tr>
                                        </table>



                                    </ItemTemplate>


                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                There are currently no items in your shopping cart.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <br />
                        <div style="float: right; margin:20px 5px 0px 0px;"><b>Total Amount : <img src="../images/rupee_symbol.png" alt="" /><asp:Label ID="lblTotalAmount" runat="server"></asp:Label></b></div>
                    </td>
                </tr>

               


            </table>
            
        </div>
    </form>
</body>
</html>
